define(['dojo/_base/declare',
        'dojo/_base/lang',
        './_WidgetBase',
        './_TemplatedMixin',
        'dojo/dom-construct',
        'dojo/query',
        'dojo/dom-class',
        'dojo/dom-style',
        "dojo/on",
        "klt/core/messageBus",
        "./registry"

],
function (declare, lang, _WidgetBase, _TemplatedMixin, domConstruct, query, domClass, domStyle, on, bus, registry) {
    return declare('jdash.ui.DashletPropertyEditor', [_WidgetBase, _TemplatedMixin], {

        templateString: '<input type="text" />',

        propertyName: '',

        objectName: '',

        callObject: function (scope, method, params) {
            var f = lang.getObject(method, false, scope);
            var parts = method.split('.');
            if (parts.length > 1) {
                for (var i = 0; i < parts.length - 1; i++) {
                    scope = scope[parts[i]];
                }
            }
            try {
                return f.apply(scope, params);
            } catch (e) {
                throw e;
            }
        },

        _setProperty: function (value) {
            this.callObject(this.context, !this.objectName || this.objectName == "" ? "set" : this.objectName + ".set", [this.propertyName, value]);
        },

        _getProperty: function () {
            return this.callObject(this.context, !this.objectName || this.objectName == "" ? "get" : this.objectName + ".get", [this.propertyName]);
        },

        postCreate: function () {
            var self = this;

            this.domNode.onchange = this.domNode.onkeyup = function () {
                if (self.value != this.value) {
                    self.skipDomUpdate = true;
                    self.set("value", this.value);
                    if (self.context)
                        self._setProperty(this.value);
                }
            };

            this.inherited(arguments);
        },

        _setValueAttr: function (value) {
            if (!this.skipDomUpdate)
                this.domNode.value =  value == null ? "": value;
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
            var originalValue = this.originalValue = this._getProperty();
            this.set("value", originalValue);
            var self = this;

            this.subscribe("jdash/dashlet/editor/canceled", function (event) {
                if (event.sender.dashletContext == self.context) {
                    self._setProperty(originalValue);
                }
            });
        }


    });
});
