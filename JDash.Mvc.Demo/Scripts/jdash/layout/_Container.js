﻿define([
	"dojo/_base/array", // array.forEach array.indexOf
	"dojo/_base/declare", // declare
	"dojo/dom-construct" // domConstruct.place
], function (array, declare, domConstruct) {

    // module:
    //		dijit/_Container

    return declare("jdash._Container", null, {
        // summary:
        //		Mixin for widgets that contain HTML and/or a set of widget children.

        buildRendering: function () {
            this.inherited(arguments);
            if (!this.containerNode) {
                // all widgets with descendants must set containerNode
                this.containerNode = this.domNode;
            }
        },

        addChild: function (/*dijit/_WidgetBase*/ widget, /*int?*/ insertIndex) {
            // summary:
            //		Makes the given widget a child of this widget.
            // description:
            //		Inserts specified child widget's dom node as a child of this widget's
            //		container node, and possibly does other processing (such as layout).

            // I want to just call domConstruct.place(widget.domNode, this.containerNode, insertIndex), but the counting
            // is thrown off by text nodes and comment nodes that show up when constructed by markup.
            // In the future consider stripping those nodes on construction, either in the parser or this widget code.
            var refNode = this.containerNode;
            if (insertIndex > 0) {
                // Old-school way to get nth child; dojo.query would be easier but _Container was weened from dojo.query
                // in #10087 to minimize download size.   Not sure if that's still and issue with new smaller dojo/query.
                refNode = refNode.firstChild;
                while (insertIndex > 0) {
                    if (refNode.nodeType == 1) { insertIndex--; }
                    refNode = refNode.nextSibling;
                }
                if (refNode) {
                    insertIndex = "before";
                } else {
                    // to support addChild(child, n-1) where there are n children (should add child at end)
                    refNode = this.containerNode;
                    insertIndex = "last";
                }
            }

            domConstruct.place(widget.domNode, refNode, insertIndex);

            // If I've been started but the child widget hasn't been started,
            // start it now.  Make sure to do this after widget has been
            // inserted into the DOM tree, so it can see that it's being controlled by me,
            // so it doesn't try to size itself.
            if (this._started && !widget._started) {
                widget.startup();
            }
        },

        removeChild: function (/*Widget|int*/ widget) {
            // summary:
            //		Removes the passed widget instance from this widget but does
            //		not destroy it.  You can also pass in an integer indicating
            //		the index within the container to remove (ie, removeChild(5) removes the sixth widget).

            if (typeof widget == "number") {
                widget = this.getChildren()[widget];
            }

            if (widget) {
                var node = widget.domNode;
                if (node && node.parentNode) {
                    node.parentNode.removeChild(node); // detach but don't destroy
                }
            }
        },

        hasChildren: function () {
            // summary:
            //		Returns true if widget has child widgets, i.e. if this.containerNode contains widgets.
            return this.getChildren().length > 0;	// Boolean
        },


        getIndexOfChild: function (/*dijit/_WidgetBase*/ child) {
            // summary:
            //		Gets the index of the child in this container or -1 if not found
            return array.indexOf(this.getChildren(), child);	// int
        }
    });
});
