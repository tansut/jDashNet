define([
	"dojo/_base/array", "dojo/_base/declare", "dojo/_base/event", "dojo/_base/lang", "dojo/query", "dojo/NodeList-traverse",
	"dojo/dom", "dojo/dom-class", "dojo/Evented", "dojo/on", "dojo/topic", "dojo/touch", "dojo/dnd/common", "dojo/dnd/Mover", "dojo/_base/window",
    "../ui/registry"
], function (array, declare, event, lang, query, domTraverse, dom, domClass, Evented, on, topic, touch, dnd, Mover, win, registry) {

    var Moveable = declare("jdash.layout.AbsoluteMoveable", [Evented], {
        // object attributes (for markup)
        handle: "",
        delay: 0,
        skip: false,

        constructor: function (node, params) {
            // summary:
            //		an object, which makes a node moveable
            // node: Node
            //		a node (or node's id) to be moved
            // params: Moveable.__MoveableArgs?
            //		optional parameters
            this.node = dom.byId(node);
            if (!params) { params = {}; }
            this.handle = params.handle ? dom.byId(params.handle) : null;
            if (!this.handle) { this.handle = this.node; }
            this.delay = params.delay > 0 ? params.delay : 0;
            this.skip = params.skip;
            this.mover = params.mover ? params.mover : Mover;
            this.events = [
                on(this.handle, touch.press, lang.hitch(this, "onMouseDown")),
                // cancel text selection and text dragging
                on(this.handle, "dragstart", lang.hitch(this, "onSelectStart")),
                on(this.handle, "selectstart", lang.hitch(this, "onSelectStart"))
            ];
        },

        // markup methods
        markupFactory: function (params, node, Ctor) {
            return new Ctor(node, params);
        },

        // methods
        destroy: function () {
            // summary:
            //		stops watching for possible move, deletes all references, so the object can be garbage-collected
            array.forEach(this.events, function (handle) { handle.remove(); });
            this.events = this.node = this.handle = null;
        },

        // mouse event processors
        onMouseDown: function (e) {
            // summary:
            //		event processor for onmousedown/ontouchstart, creates a Mover for the node
            // e: Event
            //		mouse/touch event       
        
                var self = this;
                var formElement = " textarea input select option ".indexOf(" " + e.target.tagName.toLowerCase() + " ") >= 0;
                if (formElement) { return; }
                if (!this.context.dndEnabled) return;
                if (this.stricky) return;
                if (!this.child.context.pane.allowMove())
                    return;
                var isButton = false;
                var prnts = query(e.target).parents();
                array.some(prnts, function (node) {
                    if (domClass.contains(node, "d-controlgroup") || domClass.contains(node, "d-btn")) {
                        isButton = true;
                        return false;
                    }
                });
                if (isButton) return;
                this.context._publishForLayout("dnd/MoveStarting", { e: e, moveable: this }).then
                (function () {
                    if (self.delay) {
                        self.events.push(
                            on(self.handle, touch.move, lang.hitch(self, "onMouseMove")),
                            on(self.handle, touch.release, lang.hitch(self, "onMouseUp"))
                        );
                        self._lastX = e.pageX;
                        self._lastY = e.pageY;
                    } else {
                        self.onDragDetected(e);
                    }
                }, function () {
                });
                event.stop(e);
            
        },
        onMouseMove: function (e) {
            // summary:
            //		event processor for onmousemove/ontouchmove, used only for delayed drags
            // e: Event
            //		mouse/touch event
            if (Math.abs(e.pageX - this._lastX) > this.delay || Math.abs(e.pageY - this._lastY) > this.delay) {
                this.onMouseUp(e);
                this.onDragDetected(e);
            }
            event.stop(e);
        },
        onMouseUp: function (e) {
            // summary:
            //		event processor for onmouseup, used only for delayed drags
            // e: Event
            //		mouse event
            for (var i = 0; i < 2; ++i) {
                this.events.pop().remove();
            }
            event.stop(e);
        },
        onSelectStart: function (e) {
            // summary:
            //		event processor for onselectevent and ondragevent
            // e: Event
            //		mouse event
            if (!this.skip || !dnd.isFormElement(e)) {
                event.stop(e);
            }
        },

        // local events
        onDragDetected: function (/*Event*/ e) {
            // summary:
            //		called when the drag is detected;
            //		responsible for creation of the mover
            new this.mover(this.node, e, this);
        },
        onMoveStart: function (/*Mover*/ mover) {
            // summary:
            //		called before every move operation
            topic.publish("/dnd/move/start", mover);
            domClass.add(win.body(), "dojoMove");
            domClass.add(this.node, "dojoMoveItem");
        },
        onMoveStop: function (/*Mover*/ mover) {
            // summary:
            //		called after every move operation
            topic.publish("/dnd/move/stop", mover);
            domClass.remove(win.body(), "dojoMove");
            domClass.remove(this.node, "dojoMoveItem");
        },
        onFirstMove: function (/*===== mover, e =====*/) {
            // summary:
            //		called during the very first move notification;
            //		can be used to initialize coordinates, can be overwritten.
            // mover: Mover
            // e: Event

            // default implementation does nothing
        },
        onMove: function (mover, leftTop /*=====, e =====*/) {
            // summary:
            //		called during every move notification;
            //		should actually move the node; can be overwritten.
            // mover: Mover
            // leftTop: Object
            // e: Event
            this.onMoving(mover, leftTop);
            var s = mover.node.style;
            s.left = leftTop.l + "px";
            s.top = leftTop.t + "px";
            this.onMoved(mover, leftTop);
        },
        onMoving: function (/*===== mover, leftTop =====*/) {
            // summary:
            //		called before every incremental move; can be overwritten.
            // mover: Mover
            // leftTop: Object

            // default implementation does nothing
        },
        onMoved: function (/*===== mover, leftTop =====*/) {
            // summary:
            //		called after every incremental move; can be overwritten.
            // mover: Mover
            // leftTop: Object

            // default implementation does nothing
        }
    });

    /*=====
    Moveable.__MoveableArgs = declare([], {
        // handle: Node||String
        //		A node (or node's id), which is used as a mouse handle.
        //		If omitted, the node itself is used as a handle.
        handle: null,
    
        // delay: Number
        //		delay move by this number of pixels
        delay: 0,
    
        // skip: Boolean
        //		skip move of form elements
        skip: false,
    
        // mover: Object
        //		a constructor of custom Mover
        mover: dnd.Mover
    });
    =====*/

    return Moveable;
});
