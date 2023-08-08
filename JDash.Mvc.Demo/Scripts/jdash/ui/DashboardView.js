define(["dojo/i18n!../nls/language",
		"dojo/_base/declare",
		"dojo/_base/lang",
		"./_WidgetBase",
		"./_TemplatedMixin",
		"./_WidgetsInTemplateMixin",
		"dojo/text!./templates/Dashboard.htm",
		"../layout/LayoutManager",
		"./registry",
		"dojo/_base/array",
		"../layout/_Layout",
		"dojo/dom-construct",
		"dojo/dom-style",
		"./DashletPane",
		"dojo/Deferred",
		"dojo/on",
		"../core/DashletContext",
		"../provider/JsonRest/JsonRestProvider",
		"../provider/Manager",
		"dojo/json",
		"dojo/promise/all",
		"klt/core/when",
		"klt/core/messageBus",
		"../layout/AbsoluteLayout",
		"../layout/GridLayout",
		"../core/DesignMode",
		"./ThemeManager",
		"./_ThemeMixin",
		"dojo/dom-class",
		"dojo/dom-geometry",
		"dojo/dom-attr",
		"./Viewport",
		"klt/core/Dictionary",
		"../layout/Section",
		 "../layout/MMoveable",
		"klt/core/WfPatch", "dojo/query",
		"dojo/_base/fx",
		"./OverlayMixin",
        "dojo/has",
		"dojo/dom-form",
        "./animation"
],

	function (language, declare, lang, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn, template, LayoutManager,
		registry, array, _Layout, domConstruct, domStyle, DashletPane, Deferred, on, DashletContext,
		JsonRest, GlobalProviderManager, Json,
		all, when, bus, AbsoluteLayout, GridLayout, DesignMode,
		ThemeManager, _ThemeMixin, domClass, domGeom, domAttr, Viewport, Dictionary, Section,
        MMoveable, WfPatch, domQuery, fx, OverlayMixin, has, domForm, anim) {

	    var dashboard = declare("jdash.ui.DashboardView", [_WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn, _ThemeMixin, OverlayMixin], {

	        animate: true,

	        animations: {
	            'dashlet-added': 'tada',
	            'dashlet-dropped': 'swing',
	            'dashlet-removed': 'bounceOutDown',
	            'dashlet-saved': 'pulse',
                'dashboard-loaded': 'bounceInLeft'
	        },


	        themeTemplate: {
	            template: "dashboard-{themeId}",
	            styleTemplate: "dashboard-{themeStyleId}"
	        },

	        templateString: WfPatch.patch(template),

	        postscript: function (args) {
	            args = args || {};
	            var self = this;
	            if (!args.provider) {
	                args.provider = GlobalProviderManager.getInstance();
	            }
	            if (!args.designMode)
	                args.designMode = DesignMode.none;

	            if (!args.animationDuration)
	                args.animationDuration = 500;




	            this.inherited(arguments);
	        },

	        _publish: function (topic, args) {
	            var self = this;
	            var event = { sender: this, args: args || {} };
	            return bus.publish("jdash/dashboard/" + topic, event);
	        },

	        postCreate: function () {
	            this.inherited(arguments);
	            if (has("touch")) {
	                domClass.add(this.domNode, 'd-touch');
	            }
	        },

	        contextReady: function (dashletid) {
	            var context = this.getContext(dashletid);
	            var self = this;
	            if (context == null) {
	                var defer = new Deferred();
	                var subs = bus.subscribe("jdash/dashboard/dashletCreated", function (event) {
	                    if (event.sender == self && event.args.result.context.model.id == dashletid) {
	                        subs.remove();
	                        defer.resolve(event.args.result.context);
	                    }
	                })
	                return defer;
	            } else return context;
	        },

	        _setDesignModeAttr: function (value) {
	            var self = this;
	            return this._publish("designMode/changing", { designMode: value }).then(function (event) {
	                value = event.args.designMode || value;
	                self._set("designMode", value);
	                self._publish("designMode/changed", event.args);
	            });
	        },


	        getContext: function (id) {
	            var dashletList = this.dashletList || [];
	            for (var i in dashletList) {
	                var context = dashletList[i].context;
	                if (context && context.model.id == id)
	                    return context;
	            }
	            return null;
	        },


	        _createDashlet4Context: function (context, arrange) {
	            var paneResult = context._initializePane();
	            var self = this;
	            var result = new Deferred();

	            when(paneResult, function (paneInstance) {
	                self.layout.addChild(paneInstance, context.model.position, arrange);
	                setTimeout(function () {
	                    when(context._initializeDashlet(), function () {

	                        var createResult = {
	                            context: context
	                        };
	                        self.dashletList = self.dashletList || [];
	                        self.dashletList.push(createResult);

	                        self._publish("dashletCreated", { result: createResult });

	                        result.resolve(createResult);
	                    }, function (err) {
	                        result.reject(err);
	                        throw err;
	                    })
	                });

	            }, function (err) {
	                result.reject(err);
	                throw err;
	            });

	            return result;
	        },

	        _checkSingleInstance: function (module) {
	            var moduleExists = false;
	            if (module.config.getDefault("singleInstance", false)) {
	                dojo.some(this.dashletList, function (item) {
	                    if (item.context.module.id == module.id) moduleExists = true;
	                    if (moduleExists) return false;
	                });
	            }
	            return moduleExists;
	        },

	        _createDashlet: function (module, model, arrange) {

	            var self = this;

	            function createDashlet(module) {
	                if (self._checkSingleInstance(module)) return null;
	                var context = self._createDashletContext(module, model);
	                var dashletData = self._createDashlet4Context(context, arrange);
	                return dashletData;
	            }

	            if (module == null) {
	                var defer = this.provider.getDashletModule(model.moduleId);
	                return when(defer, function (module) {
	                    return createDashlet(module);
	                });
	            } else {
	                return createDashlet(module);
	            }
	        },

	        _setLayout: function () {
	            if (!this.layout) {
	                var widgets = registry.findWidgets(this.containerNode);

	                var layout = null;

	                for (var i = 0; i < widgets.length; i++) {
	                    if (widgets[i] instanceof _Layout) {
	                        layout = widgets[i];
	                        break;
	                    }
	                }
	                this._set('layout', layout);
	                this.layout.placeAt(this.containerNode);
	            }
	            if (!this.layout)
	                throw new Error('Dashboard Layout should be set either by declaratively or by using layout attribute');
	        },

	        _createLayout: function (layoutArgs) {
	            var layoutInfo = LayoutManager.get(layoutArgs.type);
	            var args = lang.mixin({ dashboardView: this }, layoutArgs);

	            var newLayout = new layoutInfo.Class(args);


	            return newLayout;
	        },

	        _createInitialDashlets: function (dashlets, handler) {
	            var dashletPromises = [];

	            var self = this;
	            dashlets = this.layout._sortInitialDashlets(dashlets);

	            array.forEach(dashlets, function (dashlet) {
	                var dashletInfo = null;
	                try {
	                    dashletInfo = self._createDashlet(dashlet.module, dashlet, false);
	                } catch (e) {
	                    console.log("Error creating dashlet " + e.message);
	                }
	                if (dashletInfo != undefined)
	                    dashletPromises.push(dashletInfo);
	            }, this);

	            return {
	                deferList: dashletPromises
	            };
	        },
	        _setModelAttr: function (value) {
	            this._set("model", value);
	            value._provider = this.provider;
	        },

	        _doError: function (e) {
	            alert(e.message);
	            throw e;
	        },

	        _removeDashlet: function (context) {
	            var self = this, pane = context.pane;

	            function removeIt() {
	                return when(self.layout.removeDashlet(pane), function () {
	                    var itemsToDestroy = array.filter(self.dashletList, function (item) {
	                        var destroy = item.context.pane == pane;
	                        return destroy;
	                    });
	                    array.forEach(itemsToDestroy, function (item) {
	                        var index = self.dashletList.indexOf(item);
	                        self.dashletList.splice(index, 1);
	                    });
	                });
	            }

	            var defer = new Deferred();

	            var animationResult = this.animateAction(pane.domNode, 'dashlet-removed', function (e) {
	                when(removeIt(), function () {
	                    
	                    defer.resolve();
	                }, function (err) { defer.reject(); });
	                return defer;
	            })

	            if (!animationResult)
	                return removeIt();
	            else return defer;
	        },


	        _destroyDashlets: function () {
	            if (this.dashletList) {
	                array.forEach(this.dashletList, function (item) {
	                    item.context.destroy();
	                }, this);
	                delete this.dashletList;
	            }
	        },

	        _hasDesignMode: function (modes) {
	            var designMode = this.designMode;
	            var result = designMode == DesignMode.full;

	            if (!result) {
	                array.forEach(arguments, function (item) {
	                    if (item == designMode) {
	                        result = true;
	                        return;
	                    }
	                }, this);
	            }
	            return result;
	        },

	        _validateDesignMode: function () {
	            var result = this._hasDesignMode.apply(this, arguments);

	            if (!result)
	                this._doError(new Error("Invalid dashboard design mode"));
	        },

	        _createDashletContext: function (module, model) {
	            model = model || {};

	            var pos = this.layout.getPositionInfo(model.position).dashPos;
	            model.set("position", pos);

	            var contextParams = {};

	            lang.mixin(contextParams, {
	                dashboard: this,
	                module: module,
	                model: model
	            });

	            var context = new DashletContext(contextParams);
	            this._publish("dashletContextCreated", { context: context });
	            return context;
	        },

	        createDashlet: function (/*object|string*/model) {
	            // summary:
	            //      Creates a dashlet inside DashboardView.
	            this._validateDesignMode(DesignMode.dashboard, DesignMode.dashboard);



	            model._provider = this.provider;
	            model.set("dashboardId", this.dashboardId);
	            var self = this;

	            var result = new Deferred();

	            when(model.getModule(), function (module) {
	                if (self._checkSingleInstance(module)) return null;

	                var pos = self.layout.getPositionInfo(model.position).dashPos;

	                model.set("position", pos);
	                if (typeof (model.title) == 'undefined')
	                    model.set("title", module.title);
	                var newPositions = self.layout.fixPositions(pos);
	                self.provider.createDashlet(model, newPositions).then(function (model) {
	                    when(self._createDashlet(module, model), function (createResult) {
	                        result.resolve(createResult);
	                        self._publish("newDashlet", { result: createResult });
	                    }, function (err) {
	                        result.reject(err);
	                        throw err;
	                    });
	                }, function (err) {
	                    result.reject(err);
	                    throw err;
	                });
	            }, function (err) {
	                result.reject(err);
	                throw err;
	            });

	            return result;

	        },



	        unload: function () {
	            // summary:
	            //      Unloads dashboard.
	            if (this.isLoaded()) {
	                this._destroyDashlets();
	                this.unRegisterModuleNodes();
	                if (this.layout && this.layout instanceof _Layout) {
	                    this.layout.destroyRecursive();
	                }
	                delete this.layout;
	                delete this.dashboardId;
	                delete this.model;
	                this._hideDomNode();
	                this._publish("unloaded");
	            }
	        },

	        isLoaded: function () {
	            // summary:
	            //      Checks if dashboard is loaded.
	            return typeof this.model != "undefined";
	        },
	        save: function () {
	            // summary:
	            //      Saves dashboard model changes.
	            return this.provider.saveDashboard(this.model);
	        },

	        unRegisterModuleNode: function (/*object*/ domNode, x) {
	            this._modulesNodes = this._modulesNodes || [];

	            if (typeof x == "undefined" || x == true) {
	                for (var i = 0; i < this._modulesNodes.length; i++) {
	                    if (this._modulesNodes[i].moduleNode == domNode) {
	                        this._modulesNodes.splice(i, 1);
	                        break;
	                    }
	                }
	            }
	            if (this.layout)
	                this.layout.unRegisterModuleNode(domNode);
	            domNode.isDNDRegistered = false;
	        },

	        registerModuleNode: function (moduleNode, module, autoAdded) {
	            this._modulesNodes = this._modulesNodes || [];
	            var self = this;
	            var module;
	            if (!lang.isObject(module)) {
	                var moduleInfo = { moduleNode: moduleNode, moduleId: module, auto: autoAdded ? true : false };
	                self._modulesNodes.push(moduleInfo);
	                if (self.layout)
	                    self.layout.registerModuleNode(moduleInfo);
	            } else {
	                var moduleInfo = { moduleNode: moduleNode, module: module, auto: autoAdded ? true : false };
	                this._modulesNodes.push(moduleInfo);
	                //if (this.layout)
	                //	this.layout.registerModuleNode(moduleInfo);
	            }
	        },

	        unRegisterModuleNodes: function () {
	            this._modulesNodes = this._modulesNodes || [];
	            var i = 0;
	            while (this._modulesNodes.length) {
	                var node = this._modulesNodes.pop();

	                if (this.layout)
	                    this.layout.unRegisterModuleNode(node);

	                //this.unRegisterModuleNode(node.moduleNode, node.auto);
	            }
	        },

	        registerDomModuleNodes: function () {
	            var moduleNodes = domQuery("[data-jdash-moduleid]");
	            array.forEach(moduleNodes, function (node) {
	                var moduleId = domAttr.get(node, "data-jdash-moduleid");
	                this.registerModuleNode(node, moduleId, true);
	            }, this);
	        },


	        removeModuleNode: function (/*object*/node) {
	            // summary:
	            //      Removes dom node of a module.
	            this.layout.removeModuleNode(node);
	        },

	        clearModuleNodes: function () {

	        },

	        getModuleNodes: function () {
	            // summary:
	            //      Gets all module node information objects.
	            return this._modulesNodes || [];
	        },

	        _hideDomNode: function () {
	            domStyle.set(this.domNode, "opacity", "0");
	        },

	        _showDomNode: function () {
	            domStyle.set(this.domNode, "opacity", "");
	            //fx.fadeIn({
	            //    node: this.domNode,
	            //    duration: this.animationDuration
	            //}).play();
	        },



	        buildRendering: function () {
	            this.inherited(arguments);
	            this._hideDomNode();
	        },



	        startup: function () {
	            // summary:
	            //      Initialize dashboard.
	            this.inherited(arguments);
	            var self = this;
	            this.bindEvents();
	            //this.subscribe("jdash/theme/changed", function (event) {
	            //	var currentTheme = ThemeManager.currentThemeId;
	            //	if (event.oldTheme != currentTheme) {
	            //		self.reload()
	            //	}
	            //});
	        },

	        reload: function () {
	            // summary:
	            //     Reloads dashboard if dashboard model is loaded.
	            if (this.isLoaded()) {
	                var model = this.model;
	                this.unload();
	                this.load(model.id);
	            }
	        },


	        changeLayout: function (newLayout) {
	            var self = this;
	            var children = this.layout.getChildren();
	            var newPos = [];
	            var positionList = {};
	            array.forEach(children, function (child) {
	                var pos = self.layout._getChildNewPredefinedPosition(newLayout, child, positionList);
	                if (!positionList[pos.section]) positionList[pos.section] = {}
	                if (!positionList[pos.section][pos.zone]) positionList[pos.section][pos.zone] = {};
	                if (!positionList[pos.section][pos.zone].count)
	                    positionList[pos.section][pos.zone]["count"] = 1;
	                else positionList[pos.section][pos.zone].count++;
	                newPos.push({
	                    id: child.context.id,
	                    position: self.layout.serializedDashletPos(pos)
	                });
	            });
	            var layoutInfo = LayoutManager.get(this.layout.type);
	            var dicLayout = new Dictionary();
	            var sections = Object.keys(newLayout.sections);
	            array.forEach(sections, function (sectionKey) {
	                var sectionZones = newLayout.sections[sectionKey].zones;
	                var clone = lang.clone(newLayout.sections[sectionKey]);
	                delete clone.zones;
	                dicLayout.add(sectionKey, new Section(clone));
	                var zones = Object.keys(sectionZones);
	                array.forEach(zones, function (zoneKey) {
	                    dicLayout.item(sectionKey).addZone(zoneKey, sectionZones[zoneKey]);
	                });
	            });
	            this.model.layout["sections"] = dicLayout.serialized();
	            var self = this;
	            if (lang.isFunction(this.provider.changeDashboardLayout)) {
	                when(this.provider.changeDashboardLayout(this.model.layout, newPos.length > 0 ? newPos : null), function () {
	                    self.reload();
	                }, function (err) {
	                    throw err;
	                });
	            } else
	                when(this.save(), function () {
	                    if (newPos.length > 0) when(self.provider.updateDashletPositions(newPos), function () {
	                        self.reload();
	                    }, function (err) {
	                        throw err;
	                    });
	                    else self.reload();
	                });
	        },


	        changePredefinedLayout: function (/*int*/ id) {
	            // summary:
	            //     Changes layout to a specific preset.
	            // id:
	            //      Predefined layout id
	            if (this.layout) {

	                var layouts = this.layout.getPredefinedLayouts();
	                var newLayout = layouts[id - 1];
	                this.changeLayout(newLayout);
	            }


	        },


	        bindEvents: function () {
	            var self = this;
	            this.subscribe("jdash/dashboard/newDashlet", function (event) {
	                if (event.sender == self) {
	                    var pane = event.args.result.context.pane;
	                    self.animateAction(pane.domNode, "dashlet-added");
	                }
	            });

	            this.subscribe("jdash/layout/dnd/dropped", function (event) {
	                var pane = event.args.pane;
	                if (event.sender == self.layout) {
	                    self.animateAction(pane.domNode, "dashlet-dropped");
	                }
	            });

	            this.subscribe("jdash/dashlet/editor/saved", function (event) {
	                var pane = event.sender.dashletContext.pane;
	                if (event.sender.dashletContext.dashboard == self && event.args.action == "save") {
	                    self.animateAction(pane.domNode, "dashlet-saved");
	                }
	            });

	            this.subscribe("jdash/dashboard/loading/completed", function (event) {
	                if (event.sender == this) {
	                    self.animateAction(this.containerNode, "dashboard-loaded");
	                }
	            });
	            
	        },

	        animateAction: function (node, event, cb) {

	            var css = this.animations[event];

	            if (css) {
	                if (!cb) {
	                    var defer = new Deferred();
	                    anim.css(node, css, function (e) {
	                        defer.resolve(e);
	                    });
	                    return defer;
	                } else {
	                    anim.css(node, css, cb);
	                    return true;
	                }

	            } else return null;

	            //var self = this;
	            //if (this.isLoaded()) {
	            //    setTimeout(function () {
	            //        domClass.add(node, event);
	            //        setTimeout(function () {
	            //            domClass.remove(node, event);
	            //        }, self.animationDuration);
	            //    }, 10);
	            //}
	        },


	        load: function (/*object|string*/ model,/*boolean*/ waitForStartup) {
	            // summary:
	            //     Loads dashboard by an id or a dashboard model.
	            // model:
	            //      Dashboard model object or id string.
	            // waitForStartup:
	            //      Wait startup method to resolve deferred.

	            if (typeof model == 'undefined')
	                throw new Error('Should have id or model value');


	            if (!this._started)
	                this.startup();

	            if (this.isLoaded())
	                this.unload();

	            var query = model;
	            var self = this;

	            if (lang.isString(model))
	                query = this.provider.getDashboard(model)

	            var instance = null;

	            var loadDefer = new Deferred();

	            this._publish("loading/started", { defer: loadDefer });

	            when(ThemeManager.init(), function () {
	                var result = when(query, function (result) {
	                    instance = result;
	                    loadDefer.progress(language.StartingDashboardLoad);
	                    if (self.isLoaded())
	                        self.unload();
	                    self.set("model", result);

	                    var layout = self._createLayout(result.layout);
	                    self.set('layout', layout);
	                    layout.placeAt(self.containerNode);
	                    layout.startup();
	                    self._publish("layout/created", { layout: layout, dashboard: self });

	                    self.registerDomModuleNodes();
	                    array.forEach(self._modulesNode, function (item) {
	                        self.layout.registerModuleNode(item);
	                        self.layout.initilizeModuleNodes(self.getModuleNodes());
	                    }, this);
	                    self._moduleNodesRegistered = true;

	                    self.dashboardId = result.id;
	                    loadDefer.progress(language.RetreivingDashlets);
	                    return self.provider.getDashletsOfDashboard(self.dashboardId, true);
	                }, function (err) {
	                    loadDefer.reject(err);
	                    throw err;
	                });

	                var result2 = when(result, function (dashlets) {
	                    loadDefer.progress(language.CreatingDashlets);

	                    var createResult = self._createInitialDashlets(dashlets);

	                    var dashletCreateDefers = all(createResult.deferList);

	                    return when(dashletCreateDefers, function (createResult) {
	                        loadDefer.progress(language.DashletsCreated);
	                        var startupDefers = array.map(createResult,
								function (item) { return item.startupDefer });
	                        loadDefer.progress(language.StartingDashlets);

	                        var dashletStartups = all(startupDefers);

	                        dashletStartups.then(function (startupResult) {
	                            if (waitForStartup) {
	                                loadDefer.progress(language.DashletsStarted);
	                                loadDefer.resolve(instance);
	                            }
	                        }, function (err) {
	                            if (waitForStartup) {
	                                loadDefer.reject(err);
	                            }
	                        });

	                        if (waitForStartup) {
	                        } else loadDefer.resolve(instance);

	                    }, function (err) {
	                        loadDefer.reject(err);
	                        throw err;
	                    });
	                }, function (err) {
	                    loadDefer.reject(err);
	                    throw err;
	                });
	            }, function (err) {
	                loadDefer.reject(err);
	                throw err;
	            });


	            loadDefer.then(function () {	                
	                self._publish("loading/completed", { model: self.model });
	                self._showDomNode();
	            },
				function (err) {
				    console.log(err);
				    self._showDomNode();
				});

	            return loadDefer;
	        },
	        when: when,

	        removeDashlet: function (/*Object*/context) {
	            // summary:
	            //      Removes a dashlet from DashboardView.
	            return context.remove();
	        },

	        destroyRecursive: function () {
	            // summary:
	            //      Destroys dashboard context.
	            this.unload();
	            this.inherited(arguments);
	        }


	    });

	    Viewport.on("resize", function () {
	        bus.publish("klt/viewport/resized");
	    });

	    return dashboard;
	});