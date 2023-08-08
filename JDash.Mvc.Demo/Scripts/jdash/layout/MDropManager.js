define(["dojo/_base/kernel",
	"dojo/_base/declare",
	"dojo/on",
	"dojo/has",
	"dojo/_base/window",
	"dojo/_base/array",
	"dojo/_base/sniff",
	"dojo/_base/lang",
	"dojo/query",
	"dojo/topic", // topic.publish()
	"dojo/dom-class",
	"dojo/dom-geometry",
	"dojo/dom-construct",
	"dojo/dom-attr",
	"dojo/NodeList-traverse",
	"../ui/registry",
	"../ui/_WidgetBase",
	"jdash/layout/MMoveable",
	   '../model/DashletPositionModel',
	         "../core/DesignMode",
             //"./OverDropMode",             
             "./VerticalDropMode",
             "./DropIndicator"

], function (dojo, declare, on, has, win, array, sniff, lang, query, topic, domClass, geom, domConstruct, domAttr, domTraverse, registry, _Widget, Moveable, DashletPosition, DesignMode, VeriticalDropMode, DropIndicator) {
    var am = declare(
		"jdash.layout.MDropManager",
		null,
	{
	    // summary:
	    //		Drag And Drop manager

	    // autoRefresh: Boolean
	    //		Enable the refresh of registered areas on drag start.
	    autoRefresh: true,


	    // areaClass: String
	    //		CSS class enabled an area if areaClass is defined
	    areaClass: "dndArea",

	    // dragHandleClass: String
	    //		CSS class enabled a drag handle.
	    dragHandleClass: "dragHandle",

	    constructor: function () {
	        // summary:
	        //		Constructor of AreaManager class.
	        //		Initialize arrays, connects and subscribes.

	        //console.log("dojox.mdnd.AreaManager ::: constructor");
	        this._dropMode = new VeriticalDropMode();
	        this._dropIndicator = new DropIndicator();
	        this._areaList = [];
	        var self = this;
	        this.resizeHandler = on(dojo.global, "resize", function () {
	            self._dropMode.updateAreas(self._areaList);
	        });

	        this._oldIndexArea = this._currentIndexArea = this._oldDropIndex = this._currentDropIndex = this._sourceIndexArea = this._sourceDropIndex = -1;
	    },



	    init: function () {
	        // summary:
	        //		Initialize the manager by calling the registerByClass method

	        //console.log("dojox.mdnd.AreaManager ::: init");
	        this.registerByClass();
	    },

	    registerByNode: function (/*DOMNode*/area, /*Boolean*/notInitAreas) {
	        // summary:
	        //		To register Dnd Area : insert the DndArea using the specific sort of dropMode.
	        // area:
	        //		a DOM node corresponding to the Dnd Area
	        // notInitAreas:
	        //		if false or undefined, init the areas.

	        //console.log("dojox.mdnd.AreaManager ::: registerByNode", area);
	        var index = this._getIndexArea(area);
	        if (area && index == -1) {
	            var acceptType = area.getAttribute("accept");
	            var accept = (acceptType) ? acceptType.split(/\s*,\s*/) : ["text"];
	            var obj = {
	                'node': area,
	                'items': [],
	                'coords': {},
	                'margin': null,
	                'accept': accept,
	                'initItems': false
	            };
	            array.forEach(this._getChildren(area), function (item) {
	                this._setMarginArea(obj, item);
	                obj.items.push(this._addMoveableItem(item));
	            }, this);
	            this._areaList = this._dropMode.addArea(this._areaList, obj);
	            if (!notInitAreas) {
	                this._dropMode.updateAreas(this._areaList);
	            }
	            topic.publish("/dojox/mdnd/manager/register", area);
	        }
	    },

	    registerByClass: function () {
	        // summary:
	        //		Register all Dnd Areas identified by the attribute areaClass :
	        //		insert Dnd Areas using the specific sort of dropMode.

	        //console.log("dojox.mdnd.AreaManager ::: registerByClass");
	        query('.' + this.areaClass).forEach(function (area) {
	            this.registerByNode(area, true);
	        }, this);
	        this._dropMode.updateAreas(this._areaList);
	    },

	    unregister: function (/*DOMNode*/area) {
	        // summary:
	        //		Unregister a D&D Area and its children into the AreaManager.
	        // area:
	        //		A node corresponding to the D&D Area.
	        // returns:
	        //		True if the area is found and unregistered.

	        //console.log("dojox.mdnd.AreaManager ::: unregister");
	        var index = this._getIndexArea(area);
	        if (index != -1) {
	            array.forEach(this._areaList[index].items, function (item) {
	                this._deleteMoveableItem(item);
	            }, this);
	            this._areaList.splice(index, 1);
	            // refresh target area
	            this._dropMode.updateAreas(this._areaList);
	            return true; // Boolean
	        }
	        return false; // Boolean
	    },
	    _getWidgetByDragItem: function (node, _children) {
	        var children = _children || this.context.getAllChildrenOnBody();
	        for (var i = 0; i < children.length; i++) {
	            if (children[i].domNode == node)
	                return children[i];
	        }
	    },

	    publishDragStarted: function () {
	        if (this._dndStartingParams != null) {
	            var self = this;
	            this.context._publishForLayout("dnd/dragStarted",
			 {
			     pane: self._dndStartingParams.widget,
			     position: self._dndStartingParams.position
			 }).then(function () {
			 }, function () {

			 });
	        }
	    },
	    getHoverNodeInfo: function (coords, size) {
	        var self = this;
	        var info = null;
	        var children = this.context.getAllChildrenOnBody();
	        var widget = this._getWidgetByDragItem(self._dragItem.item.node, children);
	        var target = this.context.getLayoutInfo(self._areaList[self._currentIndexArea].node);
	        if (target != null) {
	            var source = this.context.getLayoutInfo(self._areaList[self._sourceIndexArea].node);
	            var pos = this.calculateCurrentDropIndex(coords, size);
	            if (pos == -1) {
	                if (self._areaList[self._currentIndexArea].node.children.length == 0)
	                    pos = 0;
	                else
	                    pos = self._areaList[self._currentIndexArea].node.children.length - 1;
	            }
	            var newPosition = new DashletPosition();
	            newPosition.set('section', self.context.getSectionByZoneId(target.zone));
	            newPosition.set('zone', target.zone);
	            newPosition.set('pos', pos);

	            info = { widget: widget, position: newPosition, target: target };
	        }

	        return info;
	    },
	    validateDragStaring: function (node, mouseEvent) {
	        if (this.context.getMaximizeRoot() == node.parentNode) return;
	      
	        var isButton = false;
	        var prnts = query(mouseEvent.target).parents();
	        array.some(prnts, function (node) {
	            if (domClass.contains(node, "d-dashlet-commands")) {
	                isButton = true;
	                return false;
	            }
	        });
	        if (isButton) return;

	        var widget = this._getWidgetByDragItem(node, this.context.getChildrenByNode(node.parentNode));
	        if (!widget.get("enableContentDrag")) {
	            var validDrag = (mouseEvent.target == widget.context.pane.getHeaderNode());
	            query('*', widget.context.pane.getHeaderNode()).forEach(function (_node, index, arr) {
	                if (mouseEvent.target == _node) validDrag = true;
	            });
	            if (!validDrag) return;
	        }
	        var allow = widget.allowMove();
	        if (!allow)
	            return;
	        var parentPos = this.context.getLayoutInfo(node.parentNode);
	        if (!parentPos) parentPos = node.sourceNode;
	        var oldPosition = new DashletPosition();
	        var pos = this.context._getDomPosition(node);
	        oldPosition.set('section', parentPos.section);
	        oldPosition.set('zone', parentPos.zone);
	        oldPosition.set('pos', pos);
	        this._dndStartingParams = { position: oldPosition, widget: widget };



	        return this.context._publishForLayout("dnd/dragStarting",
			  {
			      pane: widget,
			      position: oldPosition
			  }).then(function () {

			      return true;
			  }, function () {
			      return false;
			  });
	    },

	    _addMoveableItem: function (/*DOMNode*/node) {
	        // summary:
	        //		Create a draggable item with a DOM node.
	        // node:
	        //		A child of the D&D Area.
	        // returns:
	        //		The draggable item.
	        // tags:
	        //		protected

	        //console.log("dojox.mdnd.AreaManager ::: _addMoveableItem");
	        var self = this;
	        node.setAttribute("tabIndex", "0");
	        var moveable = new Moveable(node, { skip: true });
	        moveable.manager = this;
	        // add a css style :
	        domClass.add(node, "dragHandle");
	        var type = node.getAttribute("dndType");
	        var item = {
	            'item': moveable,
	            'type': type ? type.split(/\s*,\s*/) : ["text"],
	            'handlers': [on(moveable, "MoveStart", function (mover, e) {
	                var movGeom = geom.getContentBox(mover.node);
	                var movPos = geom.position(mover.node);
	                if (has("ie")) {
	                    self.onDragStart(mover.node, { x: movPos.x + document.body.scrollLeft, y: movPos.y + document.documentElement.scrollTop }, { w: movGeom.w, h: movGeom.h });
	                } else
	                    self.onDragStart(mover.node, { x: movPos.x + window.scrollX, y: movPos.y + window.scrollY }, { w: movGeom.w, h: movGeom.h });
	            })]
	        }
	        // connect to the uninitialize method of dijit._Widget to delete a moveable before a destruct
	        if (registry && registry.byNode) {
	            var widget = registry.byNode(node);
	            if (widget) {
	                item.type = widget.dndType ? widget.dndType.split(/\s*,\s*/) : ["text"];
	                item.handlers.push(
						on(widget, "uninitialize", function () {
						    this.removeDragItem(node.parentNode, moveable.node);
						})
					);
	            }
	        }
	        return item; // Object
	    },

	    _deleteMoveableItem: function (/*Object*/ objItem) {
	        // summary:
	        //		Delete the Moveable object associated with a node.
	        // item:
	        //		A moveable Object.
	        // tags:
	        //		protected

	        //console.log("dojox.mdnd.AreaManager ::: _deleteMoveableItem", objItem);
	        // disconnect the handle
	        array.forEach(objItem.handlers, function (handler) {
	            handler.remove();
	        });
	        // delete css style :
	        var node = objItem.item.node,
				handle = this._searchDragHandle(node);
	        domClass.remove(handle || node, "dragHandle");
	        // call destroy of Moveable class
	        objItem.item.destroy();
	    },

	    _getIndexArea: function (/*DOMNode*/area) {
	        // summary:
	        //		Get the index of an area.
	        // area:
	        //		A moveable Object.
	        // returns:
	        //		area index or -1
	        // tags:
	        //		protected

	        //console.log("dojox.mdnd.AreaManager ::: _getIndexArea");
	        if (area) {
	            for (var i = 0; i < this._areaList.length; i++) {
	                if (this._areaList[i].node === area) {
	                    return i;	// Integer
	                }
	            }
	        }
	        return -1;	// Integer
	    },

	    _searchDragHandle: function (/*DOMNode*/node) {
	        // summary:
	        //		Return the node which contains the first specific CSS class handle.
	        // node:
	        //		A child of the D&D Area.
	        // returns:
	        //		The drag handle node.
	        // tags:
	        //		protected

	        //console.log("dojox.mdnd.AreaManager ::: _searchDragHandle");
	        if (node) {
	            var cssArray = this.dragHandleClass.split(' '),
					length = cssArray.length,
					queryCss = "";
	            array.forEach(cssArray, function (css, i) {
	                queryCss += "." + css;
	                if (i != length - 1) {
	                    queryCss += ", ";
	                }
	            });
	            return query(queryCss, node)[0]; // DomNode
	        }
	    },

	    addDragItem: function (/*DOMNode*/area, /*DOMNode*/node, /*Integer*/index, /*Boolean*/notCheckParent) {
	        // summary:
	        //		To add an item programmatically.
	        // area:
	        //		a node corresponding to the D&D Area
	        // node:
	        //		the node which has to be treated.
	        // index:
	        //		the place in the area
	        // noCheckParent:
	        //		if true, doesn't check if node has a parent.
	        // returns:
	        //		True if the node has been inserted else false.

	        //console.log("dojox.mdnd.AreaManager ::: addDragItem");
	        var add = true;
	        if (!notCheckParent) {
	            add = area && node && (node.parentNode === null || (node.parentNode && node.parentNode.nodeType !== 1));
	        }
	        if (add) {
	            var indexArea = this._getIndexArea(area);
	            if (indexArea !== -1) {
	                var item = this._addMoveableItem(node),
						items = this._areaList[indexArea].items;
	                if (0 <= index && index < items.length) {
	                    var firstListChild = items.slice(0, index),
							lastListChild = items.slice(index, items.length);
	                    firstListChild[firstListChild.length] = item;
	                    this._areaList[indexArea].items = firstListChild.concat(lastListChild);
	                    area.insertBefore(node, items[index].item.node);
	                }
	                else {
	                    this._areaList[indexArea].items.push(item);
	                    if (node.AvatarNode) {
	                        domConstruct.place(node, node.copiedNode, "before");
	                        domConstruct.destroy(node.copiedNode);
	                        delete node.copiedNode;
	                    }
	                    else area.appendChild(node);
	                }
	                this._setMarginArea(this._areaList[indexArea], node);
	                this._areaList[indexArea].initItems = false;
	                return true;	// Boolean
	            }
	        }
	        return false;	// Boolean
	    },

	    removeDragItem: function (/*DOMNode*/area, /*DOMNode*/node, noNodeRemove) {
	        // summary:
	        //		Delete a moveable item programmatically. The node is removed from the area.
	        // area:
	        //		A node corresponding to the DndArea.
	        // node:
	        //		The node which has to be treated.
	        // returns:
	        //		the removed node

	        //console.log("dojox.mdnd.AreaManager ::: removeDragItem");
	        var index = this._getIndexArea(area);
	        if (area && index !== -1) {
	            var items = this._areaList[index].items;
	            for (var j = 0; j < items.length; j++) {
	                if (items[j].item.node === node) {
	                    this._deleteMoveableItem(items[j]);
	                    // delete item of the array
	                    items.splice(j, 1);
	                    return noNodeRemove ? node: area.removeChild(node); // Object
	                }
	            }
	        }
	        return null;
	    },
	    calculateCurrentDropIndex: function (coords, size) {

	        this.__oldDropIndex = this._currentDropIndex;
	        var area = this._areaList[this._currentIndexArea];
	        if (!area.initItems) {
	            this._dropMode.initItems(area);
	        }
	        this.__currentDropIndex = this._dropMode.getDropIndex(area, coords);
	        if (!(this.__currentIndexArea === this.__oldIndexArea && this.__oldDropIndex === this.__currentDropIndex)) {
	            return;
	        }
	        return this.__currentDropIndex;
	    },
	    addMoveableItem: function (node) {
	        var area = node.parentNode;
	        var indexArea = this._getIndexArea(area);
	        if (indexArea !== -1) {
	            var index = 0;
	            for (var i = 0; i < area.children.length; i++) {
	                if (area.children[i] == node) {
	                    index = i;
	                    break;
	                }
	            }
	            var item = this._addMoveableItem(node),
					items = this._areaList[indexArea].items;
	            if (0 <= index && index < area.children.length) {
	                var firstListChild = items.slice(0, index),
						lastListChild = items.slice(index, items.length);
	                firstListChild[firstListChild.length] = item;
	                this._areaList[indexArea].items = firstListChild.concat(lastListChild);
	            }
	            else
	                this._areaList[indexArea].items.push(item);

	            this._setMarginArea(this._areaList[indexArea], node);
	            this._areaList[indexArea].initItems = false;
	            return true;
	        }
	        return false;
	    },
	    removeMoveableItem: function (node) {

	        var index = this._getIndexArea(node.parentNode);
	        if (index !== -1) {
	            var items = this._areaList[index].items;
	            for (var j = 0; j < items.length; j++) {
	                if (items[j].item.node === node) {
	                    this._deleteMoveableItem(items[j]);
	                    items.splice(j, 1);
	                }
	            }
	        }
	    },
	    _getChildren: function (/*DOMNode*/area) {
	        // summary:
	        //		Get the children of a D&D area.
	        // area:
	        //		A DnD area.
	        // returns:
	        //		The children of a DnD area
	        // tags:
	        //		protected

	        //console.log("dojox.mdnd.AreaManager ::: _getChildren");
	        var children = [];
	        array.forEach(area.childNodes, function (child) {
	            // delete \n
	            if (child.nodeType == 1) {
	                if (registry && registry.byNode) {
	                    var widget = registry.byNode(child);
	                    if (widget) {
	                        if (!widget.dragRestriction) {
	                            children.push(child);
	                        }
	                    }
	                    else {
	                        children.push(child);
	                    }
	                }
	                else {
	                    children.push(child);
	                }
	            }
	        });
	        return children;	//Array
	    },

	    _setMarginArea: function (/*Object*/area,/*DOMNode*/node) {
	        // summary:
	        //		Set the value of margin in the data type of areaManager
	        //		only when the margin has never been computed.
	        // area:
	        //		The object of a D&D Area.
	        // node:
	        //		The node which contains margins
	        // tags:
	        //		protected

	        //console.log("dojox.mdnd.AreaManager ::: _setMarginArea");
	        if (area && area.margin === null && node) {
	            area.margin = geom.getMarginExtents(node);
	        }
	    },

	    findCurrentIndexArea: function (/*Object*/coords, /*Object*/size) {
	        // summary:
	        //		find the nearest target area according to coordinates.
	        //		Coordinates are representing by an object : for example, {'x':10,'y':10}
	        // coords:
	        //		an object encapsulating X and Y position
	        // size:
	        //		an object encapsulating the area size
	        // returns:
	        //		an index of area

	        //console.log("dojox.mdnd.AreaManager ::: findCurrentIndexArea");
	        this._oldIndexArea = this._currentIndexArea;
	        this._currentIndexArea = this._dropMode.getTargetArea(this._areaList, coords, this._currentIndexArea);
	        if (this._currentIndexArea != this._oldIndexArea) {
	            if (this._oldIndexArea != -1) {
	                this.onDragExit(coords, size);
	            }
	            if (this._currentIndexArea != -1) {
	                this.onDragEnter(coords, size);
	            }
	        }
	        return this._currentIndexArea;	//Integer
	    },

	    _isAccepted: function (/*Array*/ type, /*Array*/ accept) {
	        // summary:
	        //		True if user can drop widget on this node.
	        // type:
	        //		Array containing item type
	        // accept:
	        //		Array containing types	        
	        this._accept = false;
	        for (var i = 0; i < accept.length; ++i) {
	            for (var j = 0; j < type.length; ++j) {
	                if (type[j] == accept[i]) {
	                    this._accept = true;
	                    break;
	                }
	            }
	        }
	    },

	    onDragStart: function (/*DOMNode*/node, /*Object*/coords, /*Object*/size) {
	        // summary:
	        //		Initialize the drag (see dojox.mdnd.Moveable.initOffsetDrag())
	        // node:
	        //		The node which is about to be dragged
	        // coords:
	        //		an object encapsulating X and Y position
	        // size:
	        //		an object encapsulating width and height values
	        // tags:
	        //		callback

	        //console.log("dojox.mdnd.AreaManager ::: onDragStart");

	        if (node.AvatarNode) {
	            var copy = lang.clone(node);
	            node.copiedNode = copy;
	            domConstruct.place(copy, node, "after");
	        }

	        if (this.autoRefresh) {
	            this._dropMode.updateAreas(this._areaList);
	        }
	        var self = this;
	        // Create the cover :
	        var _html = (has("webkit")) ? dojo.body() : dojo.body().parentNode;
	        if (!this._cover) {
	            this._cover = domConstruct.create('div', {
	                'class': "dndCover"
	            });

	            this._cover2 = lang.clone(this._cover);
	            domClass.add(this._cover2, "dndCover2");
	        }
	        var h = _html.scrollHeight + "px";
	        this._cover.style.height = this._cover2.style.height = h;
	        domClass.add(this._cover, this.context.dashboardView.themeInfo.themeClasses);
	        dojo.body().appendChild(this._cover);
	        dojo.body().appendChild(this._cover2);

	        this._dragStartHandler = on(node.ownerDocument, "dragstart", dojo.stopEvent);
	        // to know the source
	        var parentSource = (node.sourceNode && domClass.contains(node.sourceNode, this.areaClass)) ? node.sourceNode : node.parentNode;
	        this._sourceIndexArea = this._lastValidIndexArea = this._currentIndexArea = this._getIndexArea(parentSource);
	        // delete the dragItem into the source area
	        var sourceArea = this._areaList[this._sourceIndexArea];
	        var children = sourceArea.items;
	        for (var i = 0; i < children.length; i++) {
	            if (children[i] && children[i].item.node == node) {
	                this._dragItem = children[i];
	                this._dragItem.handlers.push(on(this._dragItem.item, "Move", function (mover, leftTop, e) {
	                    var movGeom = geom.getMarginBox(mover.node);
	                    self.onDrag(mover.node, { x: leftTop.l, y: leftTop.t }, size, { x: e.clientX, y: e.clientY });
	                }));
	                this._dragItem.handlers.push(on(this._dragItem.item, "MoveStop", function (mover) {
	                    self.onDrop(mover.node);
	                }));
	                children.splice(i, 1);
	                this._currentDropIndex = this._sourceDropIndex = i;
	                break;
	            }
	        }
	        var nodeRef = null;
	        if (this._sourceDropIndex !== sourceArea.items.length) {
	            nodeRef = sourceArea.items[this._sourceDropIndex].item.node;
	        }
	        // IE7 OPTIMIZATION
	        if (has("ie") > 7) {
	            // connect these events on the cover
	            this._eventsIE7 = [
					on(this._cover, "mouseover", dojo.stopEvent),
					on(this._cover, "mouseout", dojo.stopEvent),
					on(this._cover, "mouseenter", dojo.stopEvent),
					on(this._cover, "mouseleave", dojo.stopEvent)
	            ];
	        }

	        var s = node.style;
	        s.left = coords.x + "px";
	        s.top = coords.y + "px";
	        // attach the node to the cover
	        if (s.position == "relative" || s.position == "") {
	            s.position = "absolute"; // enforcing the absolute mode
	        }
	        node.style.width = size.w + "px";
	        node.sourceNode = node.parentNode;
	        this._cover.appendChild(node);
	        if (sourceArea.node.isModulesContainer != true)
	            this._dropIndicator.place(sourceArea.node, nodeRef, size);
	        // add a style to place the _dragNode in foreground
	        domClass.add(node, "dragNode");
	        // A dragged node is always draggable in this source area.
	        this._accept = true;
	        topic.publish("/dojox/mdnd/drag/start", node, sourceArea, this._sourceDropIndex);
	        if (!node.AvatarNode && this.context.get("dragOpacity"))
	            node.style.opacity = this.context.get("dragOpacity");

	        if (node.AvatarNode) this._dropIndicator.node.style.display = "none";
	    },

	    onDragEnter: function (/*Object*/coords, /*Object*/size) {
	        // summary:
	        //		Optionally called by the getTargetArea method of TargetFinder class.
	        // coords:
	        //		coordinates of the dragged Node.
	        // size:
	        //		size of the dragged Node.
	        // tags:
	        //		callback

	        //console.log("dojox.mdnd.AreaManager ::: onDragEnter", coords, size);
	        if (this._currentIndexArea === this._sourceIndexArea) {
	            this._accept = true;
	        }
	        else {
	            if (typeof this._currentIndexArea != "undefined")
	                this._isAccepted(this._dragItem.type, this._areaList[this._currentIndexArea].accept);
	        }
	    },

	    onDragExit: function (/*Object*/coords, /*Object*/size) {
	        // summary:
	        //		Optionally called by the getTargetArea method of TargetFinder class.
	        // coords:
	        //		coordinates of the dragged Node.
	        // size:
	        //		size of the dragged Node.
	        // tags:
	        //		callback

	        //console.log("dojox.mdnd.AreaManager ::: onDragExit");
	        this._accept = false;
	    },
	    onDrag: function (node, coords, size, mousePosition) {

	        var coordinates = this._dropMode.getDragPoint(coords, size, mousePosition);

	        if (has("ie")) {
	            coordinates.x += document.body.scrollLeft;
	            coordinates.y += document.documentElement.scrollTop;

	        } else {
	            coordinates.x += window.scrollX;
	            coordinates.y += window.scrollY;
	        }
	        this.findCurrentIndexArea(coordinates, size);
	        var target = this._areaList[this._currentIndexArea];
	        if (!target || !domClass.contains(target.node, this.areaClass))
	            return;

	        if (node.AvatarNode) {

	            if (!this.context.getDashboard()._hasDesignMode(DesignMode.dashboard))
	                return;
	            this.placeDropIndicator(coordinates, size);
	            return;
	        }
	        if (this._currentIndexArea !== -1 && this._accept) {
	            var self = this;
	            var _args = arguments;

	            var parentPos = this.context.getLayoutInfo(this._areaList[this._currentIndexArea].node);

	            var widget = this._getWidgetByDragItem(node, this.context.getChildrenByNode(node.parentNode));
	            if (parentPos != null) {
	                var newPosition = new DashletPosition();
	                var pos = this.context._getDomPosition(node);
	                newPosition.set('section', parentPos.section);
	                newPosition.set('zone', parentPos.zone);
	                newPosition.set('pos', pos);
	                var result = this.context._publishForLayout("dnd/dropping",
						 {
						     pane: widget,
						     position: this._dndStartingParams.position,
						     newPosition: newPosition
						 }).then(function () {
						     self.placeDropIndicator(coordinates, size);
						 }, function () {
						     console.warn("Dropping cancelled");
						 });
	            } else {
	                self._onDrag(node, coords, size, mousePosition);
	            }

	        }
	    },
	    _onDrag: function (/*DOMNode*/node, /*Object*/coords, /*Object*/size, /*Object*/mousePosition) {
	        // summary:
	        //		Occurs when the dojo.dnd.Moveable.onDrag is fired.
	        //		Search the nearest target area and called the placeDropIndicator
	        // node:
	        //		The node which is dragged
	        // coords:
	        //		an object encapsulating X and Y position
	        // size:
	        //		an object encapsulating width and height values
	        // mousePosition:
	        //		coordinates of mouse
	        // tags:
	        //		callback

	        //console.log("dojox.mdnd.AreaManager ::: onDrag", node, ",", coords,size);
	        var coordinates = this._dropMode.getDragPoint(coords, size, mousePosition);
	        if (has("ie")) {
	            coordinates.x += document.body.scrollLeft;
	            coordinates.y += document.documentElement.scrollTop;
	        } else {
	            coordinates.x += window.scrollX;
	            coordinates.y += window.scrollY;
	        }
	        this.findCurrentIndexArea(coordinates, size);
	        if (this._currentIndexArea !== -1 && this._accept) {

	            this.placeDropIndicator(coordinates, size);
	        }




	    },

	    placeDropIndicator: function (/*Object*/coords, /*Object*/size) {
	        // summary:
	        //		Search the right place to insert the dropIndicator and display the dropIndicator.
	        // coords:
	        //		an object encapsulating X and Y position
	        // size:
	        //		an object encapsulating width and height values
	        // returns:
	        //		the current drop index

	        //console.log("dojox.mdnd.AreaManager ::: placeDropIndicator");
	        //keep old drop Index           
	        this._oldDropIndex = this._currentDropIndex;
	        // calculate all children marker (see VerticalDropMode.initItems())
	        var area = this._areaList[this._currentIndexArea];
	        if (!area) return this._currentDropIndex;
	        if (!area.initItems) {
	            this._dropMode.initItems(area);
	        }
	        //get the index where the drop has to be placed.
	        this._currentDropIndex = this._dropMode.getDropIndex(area, coords);
	        if (!(this._currentIndexArea === this._oldIndexArea && this._oldDropIndex === this._currentDropIndex)) {
	            this._placeDropIndicator(size);
	        }
	        this._dropIndicator.node.style.display = (area.node.hideDropIndicator) ? "none" : "block";
	        return this._currentDropIndex;	//Integer
	    },

	    _placeDropIndicator: function (/*Object*/size) {
	        // summary:
	        //		place the dropIndicator
	        // size:
	        //		an object encapsulating width and height values
	        // tags:
	        //		protected

	        var oldArea = this._areaList[this._lastValidIndexArea];
	        var currentArea = this._areaList[this._currentIndexArea];
	        if (currentArea.node.isModulesContainer) return;
	        //refresh the previous area after moving out the drop indicator
	        this._dropMode.refreshItems(oldArea, this._oldDropIndex, size, false);
	        // place dropIndicator
	        var node = null;
	        if (this._currentDropIndex != -1) {
	            node = currentArea.items[this._currentDropIndex].item.node;
	        }
	        this._dropIndicator.place(currentArea.node, node);
	        this._lastValidIndexArea = this._currentIndexArea;
	        //refresh the current area after placing the drop indicator
	        this._dropMode.refreshItems(currentArea, this._currentDropIndex, size, true);
	    },

	    onDropCancel: function () {
	        // summary:
	        //		Cancel the drop.
	        //		The dragNode returns into the source.
	        // tags:
	        //		callback

	        //console.log("dojox.mdnd.AreaManager ::: onDropCancel");
	        if (!this._accept) {
	            var index = this._getIndexArea(this._dropIndicator.node.parentNode);
	            if (index != -1) {
	                this._currentIndexArea = index;
	            }
	            else {
	                // case if the dropIndicator is in the area which has been unregistered during the drag.
	                // chose by default the first area.
	                this._currentIndexArea = 0;
	            }
	        }
	    },

	    onDrop: function (node) {
	        this._onDrop(node);
	        node.sourceNode = node.parentNode;
	        var self = this;
	        domAttr.set(node, "style", node.initialStyle ? node.initialStyle : "");
	        if (node.AvatarNode) return;
	        var widget = this._getWidgetByDragItem(node, this.context.getChildrenByNode(node.parentNode));
	        var pos = this.context._getDomPosition(node);
	        var target = this.context.getLayoutInfo(node.parentNode);
	        var newPosition = new DashletPosition();
	        newPosition.set('section', this.context.getSectionByZoneId(target.zone));
	        newPosition.set('zone', target.zone);
	        newPosition.set('pos', pos);
	        var oldPosition = this._dndStartingParams.position;
	        var result = this.context._publishForLayout("dnd/dropped",
						 {
						     pane: widget,
						     oldPosition: oldPosition,
						     newPosition: newPosition
						 }).then(function () {
						     //self.placeDropIndicator(coordinates, size);
						 }, function () {
						 });

	    },

	    _onDrop: function (/*DOMNode*/node) {
	        // summary:
	        //		Drop the dragged item where the dropIndicator is displayed.
	        // node:
	        //		The node which is about to be dropped
	        // tags:
	        //		callback

	        //console.log("dojox.mdnd.AreaManager ::: onDrop");
	        //dropCancel
	        this.onDropCancel();
	        var targetArea = this._areaList[this._currentIndexArea];
	        domClass.remove(node, "dragNode");
	        var dashboardPos = geom.position(this.context.dashboardView.domNode);
	        var dashletPos = geom.position(node);
	        node.droppedPosition = { l: dashletPos.x - dashboardPos.x, t: dashletPos.y - dashboardPos.y }
	        var style = node.style;
	        style.position = "relative";
	        style.left = "0";
	        style.top = "0";
	        style.width = "auto";
	        if (targetArea.node == this._dropIndicator.node.parentNode) {
	            targetArea.node.insertBefore(node, this._dropIndicator.node);
	        }
	        else {
	            // case if the dropIndicator is in the area which has been unregistered during the drag.
	            targetArea.node.appendChild(node);
	            this._currentDropIndex = targetArea.items.length;
	        }
	        // add child into the new target area.
	        var indexChild = this._currentDropIndex;
	        if (indexChild == -1) {
	            indexChild = targetArea.items.length;
	        }
	        var children = targetArea.items;
	        var firstListArea = children.slice(0, indexChild);
	        var lastListArea = children.slice(indexChild, children.length);
	        firstListArea[firstListArea.length] = this._dragItem;
	        targetArea.items = firstListArea.concat(lastListArea);

	        this._setMarginArea(targetArea, node);
	        array.forEach(this._areaList, function (obj) {
	            obj.initItems = false;
	        });
	        // disconnect onDrop handler
	        this._dragItem.handlers.pop().remove();
	        this._dragItem.handlers.pop().remove();

	        this._resetAfterDrop();
	        // remove the cover
	        if (this._cover) {
	            dojo.body().removeChild(this._cover);
	            dojo.body().removeChild(this._cover2);
	        }
	        node.style.width = "";
	        topic.publish("/dojox/mdnd/drop", node, targetArea, indexChild);
	    },

	    _resetAfterDrop: function () {
	        // summary:
	        //		reset manager properties after dropping an item
	        // tags:
	        //		protected

	        this._accept = false;
	        this._dragItem = null;
	        this._currentDropIndex = -1;
	        this._currentIndexArea = -1;
	        this._oldDropIndex = -1;
	        this._sourceIndexArea = -1;
	        this._sourceDropIndex = -1;
	        this._dropIndicator.remove();
	        if (this._dragStartHandler) {
	            this._dragStartHandler.remove();
	        }
	        if (has("ie") > 7) {
	            array.forEach(this._eventsIE7, function (evt) {
	                evt.remove();
	            });
	        }
	    },

	    destroy: function () {
	        // summary:
	        //		Destroy the component.

	        //console.log("dojox.mdnd.AreaManager ::: destroy");
	        //see implementation of unregister()
	        while (this._areaList.length > 0) {
	            if (!this.unregister(this._areaList[0].node)) {
	                throw new Error("Error while destroying AreaManager");
	            }
	        }
	        this.resizeHandler.remove();
	        this._dropIndicator.destroy();
	        this._dropMode.destroy();
	        if (jdash.layout.autoScroll) {
	            jdash.layout.autoScroll.destroy();
	        }
	        if (this.refreshListener) {
	            this.refreshListener.remove();
	        }
	        // destroy the cover
	        if (this._cover) {
	            domConstruct.destroy(this._cover);
	            domConstruct.destroy(this._cover2);
	            delete this._cover;
	            delete this._cover2;
	        }
	    }
	});

    if (_Widget) {
        //	Add a new property to widget
        lang.extend(_Widget, {
            // dndType: String
            //		Defines a type of widget.
            dndType: "text"
        });
    }

    jdash.layout._mDropManager = null;
    jdash.layout.mDropManager = function () {
        // summary:
        //		Returns the current areaManager, creates one if it is not created yet.
        if (!jdash.layout._mDropManager) {
            jdash.layout._mDropManager = new jdash.layout.MDropManager();
        }
        return jdash.layout._mDropManager;	// Object
    };
    return am;
});