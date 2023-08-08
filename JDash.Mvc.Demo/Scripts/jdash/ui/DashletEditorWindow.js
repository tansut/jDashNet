define([
    "dojo/i18n!../nls/language",
    'dojo/_base/declare',
    'dojo/_base/lang',
     "./_WidgetBase",
     "./_TemplatedMixin",
     "./_WidgetsInTemplateMixin",
    'dojo/query',
    'dojo/dom-construct',
    'dojo/dom-geometry',
    'dojo/dom-style',
    'klt/core/_DynamicViewHolderMixin',
	'dojo/text!./templates/DashletEditorWindow.htm',
    'jdash/ui/Button',
    'klt/core/Deferred',
    'klt/core/when',
    "./_ThemeMixin",
    "../layout/_Container",
    "dojo/window",
    "klt/core/WfPatch",
    "./DashletEditView",
    "./Viewport",
    "dojo/_base/fx"

],
function (language, declare, lang, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixin, query, domConstruct,
domGeo, domStyle, _DynamicViewHolderMixin, template, Button, Deferred, when, _ThemeMixin, _Container, winUtils, WfPatch, DashletEditView, Viewport,fx) {
    return declare([DashletEditView], {

        _setCaptionAttr: function(val) {
            this._set("caption", val);
            this.windowtitle.innerHTML = val;
        },

        buildRendering: function () {            
            this.inherited(arguments);

            var self = this;
            this.own(this.viewParams.context.dashletContext.model.watch("title", function(name, oldval, val) {
                self.set("caption", val);
            }));            
        },

        postCreate: function () {
            this.overlay = domConstruct.create("div", { "class": "d-overlay" });
            domConstruct.place(this.overlay, window.document.body);
            var self = this;
            this.own(Viewport.on("resize", function () {
                self._ready();
            }));
            this.inherited(arguments);
        },

        _getTemplateString: function () {
            return WfPatch.patch(template)
        },

        destroyRecursive: function () {
            domConstruct.destroy(this.overlay);
            this.inherited(arguments);
        },


        _ready: function() {
            var node = this.domNode,
					viewport = winUtils.getBox(this.ownerDocument),
					p = this._relativePosition,
					bb = p ? null : domGeo.position(node),
					l = Math.floor(viewport.l + (p ? p.x : (viewport.w - bb.w) / 2)),
					t = Math.floor(viewport.t + (p ? p.y : (viewport.h - bb.h) / 2))
            ;
            domStyle.set(node, {
                left: l + "px"
            });
            this.inherited(arguments);
        }
    });
});