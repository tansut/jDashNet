define(['dojo/_base/declare',
        'dojo/_base/lang',
        'dojo/text!./templates/Button.htm',
        './_WidgetBase',
        './_TemplatedMixin',
        'dojo/dom-class',
        'dojo/dom-style',
        'dojo/dom-construct',
        "./_ThemeMixin",
        "dojo/_base/array",
        "dojo/dom-attr",
        "klt/core/WfPatch"

],
function (declare, lang, template, _WidgetBase, _TemplatedMixin,
         domClass, domStyle, domConstruct, _ThemeMixin, array, domAttr, WfPatch) {
    return declare("jdash.ui.Button", [_WidgetBase, _TemplatedMixin], {


        templateString: WfPatch.patch(template) ,

        _onClick: function (e) {

            if (this.disabled) {
                e.stopPropagation();
                e.preventDefault();
                return false;
            }
            if (this.onClick(e) === false) {
                e.preventDefault();
            }
            cancelled = e.defaultPrevented;

            return !cancelled;
        },

        onClick: function () {

            return true;
        },

        _setLabelAttr: { node: "labelNode", type: "innerHTML" },

        _setHiddenAttr: function (value) {
            var current = domStyle.get(this.domNode, "display");
            if ((current == "inline-block" || current == "block") && !value) {
            }
            else {
                domStyle.set(this.domNode, "display", value ? "none" : "");
            }
        },

        _setHrefAttr: function (value) {
            if (value)
                domAttr.set(this.domNode, "href", value);
            else domAttr.remove(this.domNode, "href");
        },


        _getHiddenAttr: function (value) {
            var current = domStyle.get(this.domNode, "display");
            return current == "none" ? true : false;
        },





        hideLabel: false,



        _setIconClassAttr: function (value) {
            var currentClass = this.get("iconClass");
            if (currentClass) {
                domClass.remove(this.iconNode, currentClass);
            }
            if (value) {
                domClass.add(this.iconNode, value);
            } else {
                domStyle.set(this.iconNode, "display", "none");
            }
            this._set("iconClass", value);
        },


        _setHideLabelAttr: function (val) {
            if (this.containerNode) {
                domClass.toggle(this.containerNode, "d-displayNone", val);
            }
            this._set("hideLabel", val);
            this.set("iconClass", this.get("iconClass"));
        }
    });
});
