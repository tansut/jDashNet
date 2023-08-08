define([
	"dojo/_base/lang", // lang.mixin
	"../ui/_WidgetBase",
	"./_Container",
	"../ui/Viewport",
	"dojo/_base/declare", // declare
	"dojo/dom-class", // domClass.add domClass.remove
	"dojo/dom-geometry", // domGeometry.marginBox
	"dojo/dom-style" // domStyle.getComputedStyle
], function (lang, _WidgetBase, _Container, Viewport,
	declare, domClass, domGeometry, domStyle) {

    return declare("jdash._LayoutWidget", [_WidgetBase, _Container], {
        isLayoutContainer: true,

        buildRendering: function () {
            this.inherited(arguments);
            //domClass.add(this.domNode, "dijitContainer");
        },

        startup: function () {

            if (this._started) { return; }

            this.inherited(arguments);

            var parent = this.getParent && this.getParent();
            if (!(parent && parent.isLayoutContainer)) {
                this.resize();

                this.own(Viewport.on("resize", lang.hitch(this, "resize")));
            }
        },

        resize: function (changeSize, resultSize) {

            var node = this.domNode;

            if (changeSize) {
                domGeometry.setMarginBox(node, changeSize);
            }

            var mb = resultSize || {};
            lang.mixin(mb, changeSize || {});	// changeSize overrides resultSize
            if (!("h" in mb) || !("w" in mb)) {
                mb = lang.mixin(domGeometry.getMarginBox(node), mb);	// just use domGeometry.marginBox() to fill in missing values
            }

            var cs = domStyle.getComputedStyle(node);
            var me = domGeometry.getMarginExtents(node, cs);
            var be = domGeometry.getBorderExtents(node, cs);
            var bb = (this._borderBox = {
                w: mb.w - (me.w + be.w),
                h: mb.h - (me.h + be.h)
            });
            var pe = domGeometry.getPadExtents(node, cs);
            this._contentBox = {
                l: domStyle.toPixelValue(node, cs.paddingLeft),
                t: domStyle.toPixelValue(node, cs.paddingTop),
                w: bb.w - pe.w,
                h: bb.h - pe.h
            };

            this.layout();
        },

        layout: function () {
        },

        _setupChild: function (/*dijit/_WidgetBase*/child) {
            //var cls = this.baseClass + "-child "
			//	+ (child.baseClass ? this.baseClass + "-" + child.baseClass : "");
            //domClass.add(child.domNode, cls);
        },

        addChild: function (/*dijit/_WidgetBase*/ child, /*Integer?*/ insertIndex) {
            // Overrides _Container.addChild() to call _setupChild()
            this.inherited(arguments);
            if (this._started) {
                this._setupChild(child);
            }
        },

        removeChild: function (/*dijit/_WidgetBase*/ child) {
            // Overrides _Container.removeChild() to remove class added by _setupChild()
            //var cls = this.baseClass + "-child"
			//		+ (child.baseClass ?
			//			" " + this.baseClass + "-" + child.baseClass : "");
            //domClass.remove(child.domNode, cls);

            this.inherited(arguments);
        }
    });
});
