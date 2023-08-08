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
    function(declare, lang, _WidgetBase, _TemplatedMixin, domConstruct, query, domClass, domStyle, on, Button, ThemeManager, registry, array, language) {
        return declare('jdash.ui.ThemeStylesList', [_WidgetBase, _TemplatedMixin], {

            templateString: '<div></div>',
            baseClass: 'd-styles-list',

            _setThemeIdAttr: function(val) {
                this._set("themeId", val);
                //if (this._started)
                //    this._createStylesUi();
            },

            _createUI: function(themeId) {
                var theme = ThemeManager.themes[themeId];
                
                domConstruct.empty(this.domNode);
                var styles = theme.styles;
                this._lastThemeId = themeId;
                var self = this;

                function createBtn(themeId, styleId) {
                    var style = sid ? styles[sid] : null;
                    var div = domConstruct.create("a", {
                        style: {
                            backgroundColor: style.color
                        },
                        title: style.title
                    }, self.domNode);
                    div["themeId"] = themeId;
                    div["styleId"] = styleId;
                    on(div, "click", function() {
                        var styleId = this["styleId"];
                        var themeId = this["themeId"];
                        ThemeManager.select(themeId, styleId, function() {

                        }, self.persistSelection);
                    });
                }

                for (var sid in styles) {
                    createBtn(themeId, sid);
                }
            },

            //_createStylesUi: function() {
            //    var self = this;
            //    createStyles(this.get("themeId") || ThemeManager.currentThemeId);
            //},

            startup: function() {
                // summary:
                //      Initialize dashboard.
                if (ThemeManager.initCompleted())
                    this._createUI(ThemeManager.currentThemeId);
                var self = this;
                this.subscribe("jdash/theme/changed", function(event) {
                    var currentTheme = ThemeManager.currentThemeId;
                    if (self._lastThemeId != currentTheme) {
                        self._createUI(currentTheme);
                    }
                });
                this.inherited(arguments);
            },

            postCreate: function() {
                //this._createStylesUi();
                this.inherited(arguments);
            }
        });
    });