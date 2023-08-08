define(['dojo/_base/declare',
        'dojo/_base/lang',
        "klt/core/messageBus",
        "klt/core/ResourceManager",
        "require",
        "klt/core/CookieManager",
        "dojo/Deferred",
        "klt/core/when",
        "dojo/dom-class",
        "dojo/_base/window"
    ],
    function(declare, lang, bus, ResourceManager, require, CookieManager, Deferred, when, domClass, win) {
        var themeManagerClass = declare(ResourceManager, {

            constructor: function() {
                this.themes = {};
                this.CookieManager = new CookieManager();
            },

            getThemes: function() {
                return this.themes;
            },

            saveToCookie: function() {
                this.CookieManager.set("_kltDashboardTheme", this.currentThemeId, {
                    expires: 10
                });
                this.CookieManager.set("_kltDashboardStyle", this.currentStyleId, {
                    expires: 10
                });
            },

            persistedInCookie: function() {
                return this.CookieManager.get("_kltDashboardTheme") != null;
            },

            loadFromCookie: function() {
                var theme = this.CookieManager.get("_kltDashboardTheme");
                var style = this.CookieManager.get("_kltDashboardStyle");
                if (theme)
                    return this.select(theme, style);
            },

            clearCookie: function() {
                this.CookieManager.remove("_kltDashboardTheme");
                this.CookieManager.remove("_kltDashboardStyle");
            },

            currentTheme: function() {
                if (this.themes && this.currentThemeId)
                    return this.themes[this.currentThemeId];
                else return null;
            },

            currentStyle: function() {
                var theme = this.currentTheme();
                if (theme && this.currentStyleId)
                    return theme.styles[this.currentStyleId];
                else return null;
            },

            register: function(id, props) {
                if (!this.themes[id]) {
                    this.themes[id] = props;
                }
            },

            builtinTheme: {
                css: require.toUrl("../resources/themes/default/main.css"),
                styles: {
                    a: {
                        title: "Black",
                        color: "#242424"
                    },

                    b: {
                        title: "Blue",
                        color: "#5B92C1"
                    },


                    c: {
                        title: "Default",
                        color: "#E3E3E3"
                    },

                    d: {
                        title: "LightGray",
                        color: "#bbb"
                    },

                    e: {
                        title: "Gray",
                        color: "#b3b3b3"
                    },

                    f: {
                        title: "Yellow",
                        color: "#fadb4e"
                    }
                },
                defaultStyle: "c"
            },

            flatTheme: {
                css: require.toUrl("../resources/themes/flat/main.css"),
                styles: {
                    w: {
                        title: "White",
                        color: "#ddd"
                    },

                    b: {
                        title: "Black",
                        color: "#000"
                    }
                },
                defaultStyle: "w"
            },


            _loadInitResources: function() {
                return this.inherited(arguments);
            },

            _init: function (initArgs) {
                initArgs = initArgs || {};
                this.register("default", this.builtinTheme);
                this.register("flat", this.flatTheme);
                var themeId = initArgs.theme ? initArgs.theme : "flat";
                var themeData = this.themes[themeId];
                var styleId = initArgs.style ? initArgs.style : (themeData ? themeData.defaultStyle : 'c');
                if (initArgs.loadFromCookie && this.persistedInCookie()) {
                    return this.loadFromCookie();
                } else {
                    return this.select(themeId, styleId);
                }
            },

            _unloadCurrentTheme: function() {
                var currentTheme = this.currentTheme();
                if (currentTheme)
                    this.unload(currentTheme.css, "css");
                if (this.currentStyleId) {
                    var currentStyle = currentTheme.styles[this.currentStyleId];
                    if (currentStyle && currentStyle.css)
                        this.unload(currentStyle.css, "css");
                }
                delete this.currentThemeId;
                delete this.currentStyleId;
            },

            _loadTheme: function(id, styleId) {
                var theme = this.themes[id];
                var defer = new Deferred();
                if (!theme) {
                    id = "default";
                    theme = this.themes[id];
                }
                if (theme) {
                    var self = this;
                    this.load(theme.css, "css", function() {
                        if (!styleId)
                            styleId = theme.defaultStyle;

                        if (!styleId && theme.styles) {
                            for (var sid in theme.styles) {
                                styleId = sid;
                            }
                        }
                        if (styleId) {
                            var style = theme.styles[styleId];
                            if (!style) {
                                styleId = theme.defaultStyle;
                                style = theme.styles[styleId];
                            }
                            if (style && style.css)
                                self.load(style.css, "css");
                            self.currentStyleId = styleId;
                        } else delete self.currentStyleId;

                        self.currentThemeId = id;
                        defer.resolve();
                    });
                } else {
                    defer.reject(new Error('no such theme'));
                }

                return defer;
            },

            select: function( /* String */ id, /*String?*/ style, /*Function*/ cb, persist) {
                var result = new Deferred();
                var oldTheme = this.currentThemeId;
                var oldStyle = this.currentStyleId;
                if (oldTheme != id) {
                    this._unloadCurrentTheme();
                    result = this._loadTheme(id, style, cb);
                } else if (oldStyle != style) {
                    this.currentStyleId = style;
                    result.resolve();
                } else {
                    result.resolve();
                }

                var self = this;

                when(result, function() {
                    if (persist)
                        self.saveToCookie();
                    var body = win.body();
                    var oldClass = "j-theme-" + oldTheme + " " + "j-style-" + oldStyle;
                    var newClass = "j-theme-" + self.currentThemeId + " " + "j-style-" + self.currentStyleId;
                    if (domClass.contains(body, oldClass))
                        domClass.remove(body, oldClass);
                    domClass.add(body, newClass);
                    cb && cb.apply(this);
                    bus.publish("jdash/theme/changed", {
                        oldTheme: oldTheme,
                        oldStyle: oldStyle,
                        newTheme: self.currentThemeId,
                        newStyle: self.currentStyleId
                    });
                }, function(err) {
                    cb && cb.apply(this, [err]);
                });

                return result || this.themes[this.currentThemeId];
            }
        });
        
        var instance = new themeManagerClass();
        lang.setObject("jdash.ui.ThemeManager", instance);
        return instance;
    });