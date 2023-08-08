define(['dojo/_base/declare',
        'dojo/_base/lang',
        './_WidgetBase',
        './_TemplatedMixin',
        'dojo/dom-construct',
        'dojo/query',
        'dojo/dom-class',
        'dojo/dom-style',
        "dojo/on",
        "./Button",
        "./ThemeManager",
        "./registry",
        "dojo/_base/array",
        "dojo/i18n!../nls/language"

],
function (declare, lang, _WidgetBase, _TemplatedMixin, domConstruct, query, domClass, domStyle, on, Button, ThemeManager, registry, array, language) {
    return declare('jdash.ui.DashletStylesList', [_WidgetBase, _TemplatedMixin], {

        templateString: '<div></div>',
        baseClass: 'd-styles-list',


        postCreate: function () {
            var self = this;



            var createStyles = function (themeId) {


                var theme = ThemeManager.themes[themeId];
                domConstruct.empty(self.domNode);
                var styles = theme.styles;

                function createBtn(sid, themeStyle) {
                    var style = sid ? styles[sid]: null;
                    var div = style ? domConstruct.create("a", { style: { backgroundColor: style.color }, title: style.title }, self.domNode) :
                        domConstruct.create("a", { "class": "usetheme", style: { backgroundColor: styles[ThemeManager.currentStyleId].color } , title: language.UseDashboardTheme }, self.domNode);
                    if (themeStyle)
                        div["_setThemeStyle"] = themeStyle;
                    div["themeStyleId"] = sid;
                    domClass.add(div, 'selectStyleCommand');
                    on(div, "click", function () {
                        if (self.context) {
                            if (this["_setThemeStyle"]) {
                                self.context.paneConfig.set("disableTheming", false);
                                self.context.paneConfig.remove("themeStyleId");
                            } else {
                                self.context.paneConfig.set("disableTheming", true);
                                self.context.paneConfig.set("themeStyleId", this["themeStyleId"]);
                            }
                        }
                    });

                }

                createBtn(null, true);
                for (var sid in styles) {
                    createBtn(sid);
                }
            }


            createStyles(ThemeManager.currentThemeId);

            this.subscribe("jdash/theme/changed", function (event) {
                createStyles(ThemeManager.currentThemeId);
            });


            this.inherited(arguments);
        },

        destroyRecursive: function () {
            //this.destroyDomWidgets(this.domNode);
            this.inherited(arguments);

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
            var originalDisable = this.originalDisable = this.context.pane.get("disableTheming");
            var originalStyleId = this.originalTheme = this.context.pane.get("themeStyleId");
            var self = this;

            this.subscribe("jdash/dashlet/editor/canceled", function (event) {
                if (event.sender.dashletContext == self.context) {
                    self.context.paneConfig.set("disableTheming", originalDisable);
                    if (originalDisable)
                        self.context.paneConfig.set("themeStyleId", originalStyleId);
                    else self.context.paneConfig.remove("themeStyleId");
                }
            });
        }


    });
});
