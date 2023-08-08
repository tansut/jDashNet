define([
    "dojo/i18n!../nls/language",
    'dojo/_base/declare',
    'dojo/_base/lang',
     "./_WidgetBase",
     "./_TemplatedMixin",
     "./_WidgetsInTemplateMixin",
    'dojo/query',
    'dojo/dom-construct',
    "dojo/dom-class",
    'dojo/dom-geometry',
    'dojo/dom-style',
    'klt/core/_DynamicViewHolderMixin',
	'dojo/text!./templates/DashletEditView.htm',
    'jdash/ui/Button',
    'klt/core/Deferred',
    'klt/core/when',
    "./_ThemeMixin",
    "../layout/_Container",
    "klt/core/WfPatch",
     "dojo/_base/fx"

],
function (language, declare, lang, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixin, query, domConstruct, domClass,
domGeo, domStyle, _DynamicViewHolderMixin, template, Button, Deferred, when, _ThemeMixin, _Container, WfPatch, fx) {
    return declare('jdash.ui.DashletEditView', [_WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixin, _DynamicViewHolderMixin, _Container], {

        

        _getTemplateString: function() {
            return WfPatch.patch(template)
        },

        _ready: function () {
            fx.fadeIn({ duration:150, node: this.domNode }).play();
        },

        buildRendering: function() {
            this.inherited(arguments);
            domStyle.set(this.domNode, "opacity", "0");
            var model = this.viewParams.context.dashletContext.model.module.config.editor;
            if (model.paneConfig) {
                var css = model.paneConfig.cssClass;
                if (css)
                    domClass.add(this.containerNode, css);
                if (model.paneConfig.width)
                    domStyle.set(this.containerNode, { width: model.paneConfig.width });
                if (model.paneConfig.height)
                    domStyle.set(this.containerNode, { height: model.paneConfig.height });
            }
        },

        postscript: function (args) {            
            args = args || {};
            args.templateString = this._getTemplateString();
            this.inherited(arguments);

            this.saveBtn.set("label", language.Save);
            this.applyBtn.set("label", language.Apply);
            this.cancelBtn.set("label", language.Cancel);
        },


        _onSave: function () {
            if (lang.isFunction(this.onSave))
                this.onSave.apply(this);
        },

        _onCancel: function () {
            if (lang.isFunction(this.onCancel))
                this.onCancel.apply(this);
        },

        _onApply: function () {
            if (lang.isFunction(this.onApply))
                this.onApply.apply(this);
        },

        destroyRecursive: function () {

            if (this.initialNode) {
                domStyle.set(this.initialNode, "display", "none");
                domConstruct.empty(this.initialNode);
            }
            this.inherited(arguments);
        },

        getBodyNode: function () {
            return this.editorContent;
        },

        loadView: function (noStart) {
            var self = this;
            if (typeof this.editorConstructor != "undefined") {
                when(this._createModuleInstance(this.editorConstructor), function (instance) {
                    self.setView(instance, noStart);
                });
                
            } else this.inherited(arguments);
        },

        _createModuleInstance: function (obj) {
            function callConstructor(constructor, context) {
                return new constructor(context);
                var factoryFunction = constructor.bind.apply(constructor, arguments);
                return factoryFunction();
            }

            var args = Array.prototype.slice.call(arguments, 1);
            if (lang.isFunction(obj))
                return callConstructor(obj, this.viewParams.context);
            else {
                return obj.createDefer.apply(obj, [this.viewParams]);
            }
        },



        startup: function()
        {
            this.inherited(arguments);

            var loadDefer = this.refresh(true);
            var self = this;
            when(loadDefer, function (editor) {
                try {
                    if (!lang.isFunction(editor.startup))
                        editor.startup = function () { };
                    self.addChild(editor);
                    self._ready();
                } catch (e) {
                    console.log(e);
                }

            }, function (err) {
            });
            return loadDefer;
        }
    });
});