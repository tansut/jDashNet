define(['dojo/_base/declare',
			'dojo/_base/lang',
			'./_WidgetBase',
			'dojo/on',
			'dojo/dom-construct',
			'dojo/query',
			'dojo/dom-class',
			'dojo/dom-style',
            'dojo/_base/Deferred',
            'dojo/_base/array',
            'dojo/json',
            'require',
            "dojo/dom-geometry",
            "dojo/has",
            "./Viewport",
            "klt/core/messageBus"
],
	function (declare, lang, _WidgetBase, on, domConstruct, query, domClass, domStyle, Deferred, array, Json,
              require, domGeom, has, Viewport, bus) {
	    return declare('jdash.ui.OverlayMixin', null, {

	        overlayNode: null,

            overlayClass: "d-mask",

	        destroyRecorsive: function () {
	            this.hideOverlay();
	            this.inherited(arguments);
	        },

	        hideOverlay: function () {
	            if (this.overlayNode) {
	                //document.body.removeChild(this.overlayNode);
	                domConstruct.destroy(this.overlayNode);
	            }
	            this.overlayNode = null;
	            if (this.resizeHandler)
	                this.resizeHandler.remove();
	        },

	        overlayVisible: function () {
	            return this.overlayNode != null;
	        },

	        resizeOverlay: function (node) {
	            if (!this.overlayVisible())
	                return;
	            var computedStyle = domStyle.getComputedStyle(node);
	            var output = domGeom.getMarginBox(node, computedStyle);
	            domGeom.setMarginBox(this.overlayNode, output);
	        },

	        setOverlayDefer: function (defer) {
	            this.showOverlay();
	            var self = this;
	            defer.then(function () {
	                self.hideOverlay();
	            }, function () {
	                self.hideOverlay();
	            });
	        },

	        showOverlay: function (node) {

	            if (this.overlayVisible())
	                return;

	            var node = node || this.domNode;

	            this.overlayNode = domConstruct.create("div");
	            domClass.add(this.overlayNode, this.overlayClass);
	            this.resizeOverlay(node);
	            domConstruct.place(this.overlayNode, node, 0);
	            var self = this;
	            if (!this.resizeHandler) {
	                this.resizeHandler = bus.subscribe("klt/viewport/resized", function () {
	                    self.resizeOverlay(node);
	                });
	            }
	        }
	    });
	});