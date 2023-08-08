define(['dojo/_base/declare',
        'dojo/_base/lang',
        './_WidgetBase',
        './_TemplatedMixin',
        './_WidgetsInTemplateMixin',
        'dojo/dom-class',
        'dojo/dom-style',
        'dojo/dom-construct',
        './_ThemeMixin',
         "dojo/dom-geometry",
         "dojo/on",
         "dojo/topic",
         "dojo/query",
         "./registry",
         "dojo/_base/array"
],
function (declare, lang, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixin,
         domClass, domStyle, domConstruct, _ThemeMixin, domGeom, on, topic, query, registry, array) {
    return declare('jdash.ui.Menu', [_WidgetBase, _TemplatedMixin, _ThemeMixin], {

        templateString: "<div></div>",

        baseClass: "d-dashleMenu",

        onCancel: function () {
            this.hide();
        },


        postCreate: function () {

            var self = this;
            this.own(on(document, "click", function () {
                self.emit("Cancel");
            }));

            this.subscribe("jdash/dashlet/menu/opened", function (sender) {
                if (sender != self) self.emit("Cancel");
            });

            this.inherited(arguments);



        },

        addChild: function (menuItem) {

            menuItem.menu = this;
            domConstruct.place(menuItem.domNode, this.domNode, "last");

        },

        hide: function () {
            this.domNode.style.display = "none";
        },

        destroyRecursive: function () {
            var widgets = registry.findWidgets(this.domNode);
            if (widgets) {
                array.forEach(widgets, function (widget) {
                    try {
                        if (!widget._destroyed) {
                            if (widget.destroyRecursive) {
                                widget.destroyRecursive();
                            } else if (widget.destroy) {
                                widget.destroy();
                            }
                        }
                    } catch (e) {
                    }
                });
            }

            this.inherited(arguments);
        },

        show: function () {
            if (this.domNode.hasChildNodes()) {
                this.domNode.style.display = "block";
                this.arrangePosition();
                topic.publish("jdash/dashlet/menu/opened", this);
            } else
                this.hide();
        },

        startup: function () {
            domConstruct.place(this.domNode, query("body")[0], "last");
            this.arrangePosition();
        },

        arrangePosition: function () {
            var pos = domGeom.position(this.domNode);
            var targetPos = domGeom.position(this.target);
            var dompos = this._getPosition();
            this.domNode.style.left = dompos.left + "px";
            this.domNode.style.top = (dompos.top + targetPos.h) + "px";
        }
        ,
        _getPosition: function () {
            var elem = this.target, box;

            try {
                box = elem.getBoundingClientRect();
            } catch (e) { return { top: 0, left: 0 } }

            var doc = elem.ownerDocument,
                docElem = document;
            var div = document.createElement("div");
            var supportBoxModel = div.offsetWidth === 2;
            var body = doc.body,
                win = window,
                clientTop = docElem.clientTop || body.clientTop || 0,
                clientLeft = docElem.clientLeft || body.clientLeft || 0,
                scrollTop = win.pageYOffset || supportBoxModel && docElem.scrollTop || body.scrollTop,
                scrollLeft = win.pageXOffset || supportBoxModel && docElem.scrollLeft || body.scrollLeft,
                top = box.top + scrollTop - clientTop,
                left = box.left + scrollLeft - clientLeft;


            return { top: top, left: left };
        }
    });
});
