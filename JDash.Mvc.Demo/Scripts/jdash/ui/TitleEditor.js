define(['dojo/_base/declare',
        'dojo/_base/lang',
        './_WidgetBase',
        './_TemplatedMixin',
        'dojo/dom-construct',
        'dojo/query',
        'dojo/dom-class',
        'dojo/dom-style',
        "dojo/on",
        "klt/core/messageBus"

],
function (declare, lang, _WidgetBase, _TemplatedMixin, domConstruct, query, domClass, domStyle, on, bus) {
    return declare('jdash.ui.TitleEditor', [_WidgetBase, _TemplatedMixin], {

        templateString: '<input type="text" />',

        postCreate: function () {
        
            var self = this;

            this.domNode.onchange = this.domNode.onkeyup = function () {
                if (self.value != this.value) {
                    self.skipDomUpdate = true;
                    self.set("value", this.value);
                    if (self.context)
                        self.context.set("title", this.value);
                }
            };

            this.inherited(arguments);
        },

        _setValueAttr: function (value) {
            if(!this.skipDomUpdate)
                this.domNode.value = value == null ? "" : value;
            this.skipDomUpdate = false;
        },

        _setDashletIdAttr: function (val) {
            if (!this.context && this.dashboard) {
                var self = this;
                this._set("dashletId", val);

                this.subscribe("jdash/dashboard/dashletCreated", function (event) {
                    if (self.dashboard == event.sender &&
                        event.args.result.context.model.id == self.dashletId)
                        self.set("context", event.args.result.context);
                });
            }
        },

        _setContextAttr: function (value) {
            this._set("context", value);
            var originalValue = this.originalValue = this.context.get("title");
            this.set("value", originalValue);
            var self = this;

            this.subscribe("jdash/dashlet/editor/canceled", function (event) {
                if (event.sender.dashletContext == self.context) {
                    self.context.set("title", originalValue);
                }
            });
        }


    });
});
