define(['dojo/_base/declare', 'dojo/_base/lang', "../ui/ThemeManager",
    "dojo/dom-class", "./registry", "dojo/_base/array", "dojo/topic"],
    function (declare, lang, ThemeManager, domClass, registry, array, topic) {
        var themeMixin = declare(null, {

            getThemeNode: function () {
                return this._themeNode ? this[this._themeNode] : this.domNode;
            },

            _clearCurrentTheme: function () {
                var node = this.getThemeNode();
                if (node && this.themeInfo && this.themeInfo.themeClasses) {
                    domClass.remove(node, this.themeInfo.themeClasses);
                }

                delete this.themeInfo;
            },

            _getThemeStyleIdAttr: function () {
                var themeInfo = this.get("themeInfo");
                return themeInfo ? themeInfo.themeStyleId : null;
            },

            _setThemeStyleIdAttr: function (value) {
                var themeInfo = this.get("themeInfo");
                if (!themeInfo) {
                    if (value) {
                        themeInfo = { themeStyleId: value };
                        this.set("themeInfo", themeInfo);
                    } else this.set("themeInfo", {});
                } else {
                    if (value)
                        themeInfo.themeStyleId = value;
                    else delete themeInfo.themeStyleId;
                    this.set("themeInfo", themeInfo);
                }
            },


            _compileThemeTemplate: function (themeInfo, themeProps, themeStyleProps) {
                var themeClasses = "";
                var themeTemplate = this.themeTemplate;

                var themeId = themeInfo.themeId ? themeInfo.themeId : ThemeManager.currentThemeId;
                var styleId = themeInfo.themeStyleId ? themeInfo.themeStyleId : ThemeManager.currentStyleId;

                if (themeTemplate.template)
                    themeClasses = lang.replace(themeTemplate.template, lang.mixin({ themeId: themeId }, themeProps));

                if (themeTemplate.styleTemplate)
                    themeClasses = themeClasses + " " + lang.replace(themeTemplate.styleTemplate, lang.mixin({ themeStyleId: styleId }, themeStyleProps));

                return themeClasses;
            },

            _setTheme: function (themeInfo) {
                var node = this.getThemeNode();

                if (!this.themeTemplate || !themeInfo || !node)
                    return;

                var themeClasses = this._compileThemeTemplate(themeInfo);

                this.themeInfo = {
                    themeClasses: themeClasses
                }

                if (themeInfo.themeId)
                    lang.mixin(this.themeInfo, { themeId: themeInfo.themeId });

                if (themeInfo.themeStyleId)
                    lang.mixin(this.themeInfo, { themeStyleId: themeInfo.themeStyleId });

                if (themeClasses != "") {
                    domClass.add(node, themeClasses);
                }

                return themeInfo;
            },



            setTheme: function (themeInfo) {
                this._changingTheme = true;
                try {

                    this._clearCurrentTheme();
                    var children = registry.findWidgets(this.getThemeNode());

                    array.forEach(children, function (child) {
                        if (child.setTheme &&
                            this.disableTheming)
                            child.setTheme(themeInfo);
                    }, this);

                    this._setTheme(themeInfo);

                } catch (e) {
                }


                finally {
                    delete this._changingTheme;
                }

            },

            buildRendering: function () {
                this.inherited(arguments);
            },


            postCreate: function () {
                this.inherited(arguments);
                this._manageAutoTheme();
            },



            _manageAutoTheme: function (noThemeSet) {
                try {
                    var value = this.disableTheming;
                    if (this._themeWatch) {
                        this._themeWatch.remove();
                        delete this._themeWatch;
                    }
                    if (!value) {
                        var self = this;
                        this._themeWatch = topic.subscribe("jdash/theme/changed", function (event) {
                            self.setTheme({ themeStyleId: ThemeManager.currentStyleId });
                        });
                        if (!noThemeSet)
                            self.setTheme({ themeStyleId: ThemeManager.currentStyleId });
                    } else if (!noThemeSet) this.setTheme(this.themeInfo);
                } catch (e) {
                }

            },

            _setThemeInfoAttr: function (value) {
                if (this._started)
                    this.setTheme(value);
                else this._set("themeInfo", value);
            },

            _setDisableThemingAttr: function (value) {

                try {
                    this._set("disableTheming", value);

                    var children = registry.findWidgets(this.getThemeNode());

                    array.forEach(children, function (child) {
                        if (child.setTheme) {
                            child.set("disableTheming", value);
                        }
                    }, this);



                    this._manageAutoTheme(!this._started);
                } catch (e) {
                }

            },

            destroyRecursive: function () {
                if (this._themeWatch)
                    this._themeWatch.remove();
                this.inherited(arguments);

            }
        });

        return themeMixin;
    });