define(["dojo/_base/declare",
        "dojo/_base/lang",
        "dojo/i18n!../nls/language",
        "dojo/json",
        "dojo/Stateful",
        "dojo/_base/array",
        "../model/ConfigModel",
        "../model/DashletModuleModel",
        "../model/DashletModel",
        "klt/core/sync",
        "../ui/DashletPane",
        "klt/core/messageBusMixin",
        "dojo/Deferred",
        "require",
        "dojo/dom-construct",
        "dojo/dom-style",
        "../ui/DashletEditView",
        "dojo/when",
        "dojo/promise/all",
        "../ui/_busyMixin",
        "./CommandType",
        "./CommandName",
        "./DashletCommand",
        "dojo/request/xhr",
        "./DashletEditorContext",
        "./DesignMode",
        "../ui/ThemeManager",
        "dojo/has",
        "dojo/dom-class",
        "dojo/dom-attr",
        "dojo/query",
        "../ui/Viewport",
        "dojo/dom-geometry",
        "dojo/dom-form",
        "../ui/DashletEditorWindow"],
    function (declare, lang, language, Json, Stateful,
        array, ConfigModel, DashletModuleModel, DashletModel, sync, DashletPane, MessageBusMixin, Deferred, require, domConstruct,
        domStyle, DashletEditView, when, all, BusyMixin, CommandType, CommandName,
        DashletCommand, xhr, DashletEditorContext, DesignMode,
        ThemeManager, has, domClass, domAttr, query, Viewport, domGeom, formDom, DashletEditorWindow) {
        var DashletContext = declare('jdash.core.DashletContext', [Stateful, BusyMixin, MessageBusMixin], {

            fn: {
                domStyle: domStyle,
                domClass: domClass,
                domAtt: domAttr,
                domGeom: domGeom,
                query: query,
                viewport: Viewport,
                Deferred: Deferred,
                when: when,
                lang: lang,
                ThemeManager: ThemeManager,
                all: all,
                domConstruct: domConstruct
            },

            constructor: function () {
                this.themeManager = ThemeManager;
                var self = this;
                this.subscribe("jdash/dashboard/designMode/changed", function (event) {
                    if (event.sender == this.dashboard) {
                        self._updateDesignMode();
                    }
                });

                this.subscribe("jdash/dashboard/newDashlet", function (event) {
                    if (event.args.result.context == this && this.module.config.get("autoEdit") == true) {
                        setTimeout(function () {
                            self.openEditor();
                        });
                    }
                });
            },

            getDashletSize: function() {
                return this.pane.getDashletSize.apply(this.pane, arguments);
            },

            reloadModel: function() {
                var id = this.model.id;
                var self = this;
                return when(this.dashboard.provider.getDashlet(id), function (model) {
                    var pos = self.dashboard.layout.getPositionInfo(model.position).dashPos;
                    model.set("position", pos);
                    self.set("model", model);
                });
            },

            _updateDesignMode: function () {
                this.pane._updateDesignMode();
            },



            _publishToDashlet: function (topic, args) {
                var self = this;
                var event = { sender: this, args: args || {} };
                return this.publish("jdash/dashlet/" + topic, event);
            },

            _publishToDashletEditor: function (topic, args) {
                return this.editorContext.publish("jdash/dashlet/editor/" + topic, args);
            },

            _createPaneConfig: function (paneConfig) {
                var baseConfig = lang.getObject("jdash.defaults.dashlet.paneConfig", true);
                baseConfig = lang.clone(baseConfig);

                var dashboardOverrides = lang.getObject("defaults.dashlet.paneConfig", false, this.dashboard);
                if (dashboardOverrides)
                    lang.mixin(baseConfig, lang.clone(dashboardOverrides));

                var moduleConfig = this.module.paneConfig.toPlainObject();
                for (var p in moduleConfig) {
                    var config = moduleConfig[p];
                    baseConfig[p] = lang.clone(moduleConfig[p]);
                }

                lang.mixin(baseConfig, paneConfig);
                lang.mixin(baseConfig, { id: "p" + this.model.id, context: this });
                return baseConfig;
            },

            _initializeDashlet: function () {
                var self = this;

                var createDashletResult = self._createDashlet();
                var doneDefer = new Deferred();


                when(createDashletResult, function (dashletInstance) {
                    self.dashlet = dashletInstance;

                    if (!lang.isFunction(dashletInstance.startup))
                        dashletInstance.startup = function () { };

                    //self._broadcastBufferedTopics();

                    when(self._createPaneCommands(), function () {
                        self._updateDesignMode();
                        self.pane._initialized();
                        try {
                            //console.log("Adding " + dashletInstance.context.model.title + " inside pane");
                            self.pane.addChild(dashletInstance);
                            //console.log("dashlet " + dashletInstance.context.model.title + " added inside pane");
                            dashletInstance._started = true;
                        } catch (e) {
                            console.log("Error adding/starting child dashlet. " + e.message);
                        }


                        self.config.validateCallback = function (name, value) {
                            if (lang.isFunction(self.dashlet.set)) {
                                var dashletResult = self.dashlet.set.apply(self.dashlet, [name, value]);
                                return dashletResult;
                            }
                        }

                        doneDefer.resolve();

                    }, function (err) {
                        doneDefer.reject(err);
                    });

                }, function (err) {
                    when(self._createPaneCommands(), function () {
                        self._updateDesignMode();
                        self.pane._initialized();
                    });
                    self._publishToDashlet("error", { error: err });
                    doneDefer.reject(err);
                });

                return doneDefer;
            },


            _createModuleInstance: function (obj, config) {
                function callConstructor(constructor, context) {
                    return new constructor(context);
                    //var factoryFunction = constructor.bind.apply(constructor, [context]);
                    //return factoryFunction();
                }

                var args = Array.prototype.slice.call(arguments, 1);
                if (lang.isFunction(obj))
                    return callConstructor.apply(null, [obj, this]);
                else {
                    return obj.createDefer.apply(obj, [this]);
                }
            },

            _initializePane: function () {
                var paneConfig = this.paneConfig.toPlainObject();
                paneConfig = this._createPaneConfig(paneConfig);
                var currentTheme = this.themeManager.currentTheme();

                var paneClass;

                if (paneConfig.modulePath)
                    paneClass = paneConfig.modulePath;
                else if (currentTheme && currentTheme.paneModule)
                    paneClass = currentTheme.paneModule;

                if (lang.isString(paneClass)) {
                    var path = paneClass;
                    paneClass = new Deferred();
                    require([path], function (Class) {
                        paneClass.resolve(Class);
                    }, function (err) {
                        paneClass.reject(err);
                    });
                } else paneClass = DashletPane;

                var self = this;

                var doneDefer = new Deferred();

                when(paneClass, function (Class) {
                    var paneInstance = new Class(paneConfig);
                    self.set("pane", paneInstance);
                    doneDefer.resolve(paneInstance);

                }, function (err) {
                    self._publishToDashlet("error", { error: err });
                    doneDefer.reject(err);
                });

                return doneDefer;
            },



            _createDashletConfig: function () {
                var result = this.model.config.toPlainObject();
                lang.mixin(result, { context: this });
                return result;
            },

            _createDashlet: function () {
                var self = this;
                var config = this._createDashletConfig();
                this._dashletCreateDefer = new Deferred();


                if (typeof this.module.dashletConstructor != "undefined") {
                    when(this._createModuleInstance(this.module.dashletConstructor, config), function (instance) {
                        self.dashletInstance = instance;
                        self._dashletCreateDefer.resolve(instance);
                    }, function (e) {
                        self.error = e;
                        self._dashletCreateDefer.reject(self.error);
                    })

                } else {
                    var path = this.module.path;
                    require([path], function (dashletClass) {
                        var instance = new dashletClass(config);
                        self.dashletInstance = instance;
                        self._dashletCreateDefer.resolve(instance);
                    }, function (e) {
                        self.error = e;
                        self._dashletCreateDefer.reject(self.error);
                    });
                }

                return this._dashletCreateDefer;
            },

            _modelSetter: function (value) {
                this.model = value;
                this.model.set("module", this.module);
                sync(this.model, "title", this, "title");
                sync(this.model, "id", this, "id");
                sync(this.model, "config", this, "config");
                sync(this.model, "paneConfig", this, "paneConfig");
            },

            _paneSetter: function (value) {
                this.pane = value;
                var self = this;
                this.paneConfig.watch(function (name, OldVal, newVal) {
                    if (!self.paneConfig._isPaneSetting)
                        self.pane.set(name, newVal);
                    else delete self.paneConfig._isPaneSetting;
                });

                sync(this, "title", this.pane, "title");
                sync(this, "visualState", this.pane, "visualState");
                sync(this, "editState", this.pane, "editState");
                sync(this, "busy", this.pane, "busy");
            },

            _createPaneCommands: function () {
                var commands = this.getPaneCommands();

                var self = this;

                when(commands, function (commands) {
                    self.pane.createCommands(commands);
                });

                return commands;
            },

            _dashletSetter: function (value) {

            },


            dashletCreationDone: function () {
                return this._dashletCreateDefer &&
                this._dashletCreateDefer.isFulfilled();
            },


            subscribe: function (topic, method) {
                return this.inherited(arguments);
            },

            subscribeToDashlet: function (topic, method) {
                topic = "jdash/dashlet/" + topic;
                return this.subscribe(topic, method);
            },

            subscribeToEditor: function (topic, method) {
                topic = "jdash/dashlet/editor/" + topic;
                return this.subscribe(topic, method);
            },

            loadResource: function (href, type, callback) {
                return this.themeManager.loadChecked(href, type, callback);
            },

            unloadResource: function (href, type) {
                return this.themeManager.unloadChecked(href, type);
            },

            _getPaneCommandIndex: function (commandName) {
                var commands = this.getPaneCommands();
                var result = -1, index = 0;
                array.forEach(commands, function (cmd) {
                    if (cmd.name == commandName) {
                        result = index;
                    }
                    index++;
                }, this);

                return result;
            },

            getPaneCommand: function (commandName) {
                var index = this._getPaneCommandIndex(commandName);
                if (index > -1)
                    return this.paneCommands[index];
            },

            removePaneCommand: function (commandName) {
                var index = this._getPaneCommandIndex(commandName);
                if (index > -1) {
                } else throw new Error("Invalid command name");
                var cmd = this.paneCommands[index];
                this.paneCommands.splice(index, 1);
                this.pane.removeCommand(cmd);
            },

            addPaneCommand: function (command) {
                var commands = this.getPaneCommands();
                commands.push(command);
                this.pane.addCommand(command);
            },

            getPaneCommands: function () {
                if (!this.paneCommands) {

                    var self = this;

                    var commands = [];

                    if (typeof this.module.config.get("editor") != "undefined") {
                        commands.push(DashletCommand.edit);
                    }

                    var removeCommand = null, maximizeCommand = null;

                    var builtinCommands = this.module.paneConfig.get("builtInCommands")
                    if (builtinCommands) {
                        var knownCommands = [CommandName.refresh, CommandName.restore, CommandName.maximize, CommandName.remove, CommandName.clone];
                        array.forEach(knownCommands, function (cmd) {
                            var commandIdx = builtinCommands.indexOf(cmd);
                            if (commandIdx >= 0) {
                                var cmdName = builtinCommands[commandIdx];
                                if (DashletCommand[cmdName]) {
                                    commands.push(DashletCommand[cmdName]);
                                    if (cmdName == CommandName.remove)
                                        removeCommand = DashletCommand[cmdName];
                                    if (cmdName == CommandName.maximize)
                                        maximizeCommand = DashletCommand[cmdName];
                                }
                            }
                        }, this);
                    }

                    array.forEach(this.module.paneConfig.get("customCommands"), function (cmd) {
                        commands.push(cmd);
                    }, this);

                    if (maximizeCommand) {
                        var idx = commands.indexOf(maximizeCommand);
                        commands.splice(idx, 1);
                        commands.push(maximizeCommand);
                    }

                    if (removeCommand) {
                        var idx = commands.indexOf(removeCommand);
                        commands.splice(idx, 1);
                        commands.push(removeCommand);
                    }

                    commands.push(DashletCommand.visualState);

                    var thisPaneCommands = lang.clone(commands);

                    var defer = new Deferred();

                    this._publishToDashlet("command/prepare", { commands: thisPaneCommands }).then(function (event) {
                        self.paneCommands = event.args.commands;
                        defer.resolve(self.paneCommands);
                    }, function () {
                        defer.resolve();
                    });

                    return defer;
                }
                return this.paneCommands;
            },

            cloneDashlet: function() {
                var sourceCopy = lang.clone(this.model.serialized());
                delete sourceCopy.id;
                var model = new DashletModel(sourceCopy);
                model.module = this.model.module;
                return this.dashboard.createDashlet(model);
            },

            _processCommand: function (command) {
                var self = this;
                return self._publishToDashlet("command/executing", { command: command }).then(function (result) {
                    var command = result.args.command;
                    var commandResult = { command: command };
                    var executeDefer = null;
                    switch (command.type) {
                        case CommandType.ajax:
                            {
                                var options = command.options || {};
                                executeDefer = xhr(commandArgs.url, options).then(function (response) {

                                    lang.mixin(commandResult, { result: response });

                                }, function (err) {
                                    lang.mixin(commandResult, { error: err });

                                });
                                break;
                            }
                        case CommandType.url:
                            {
                                var target = command.target || "_blank";
                                lang.mixin(commandResult, { result: window.open(command.href, target) });
                            }
                        case CommandType.visualState:
                            {
                                executeDefer = self.pane._setVisualStateAttr(command.visualState || command.name, true);
                            }
                        case CommandType.builtIn:
                            {
                                switch (command.name) {
                                    case CommandName.remove: {
                                        executeDefer = self.remove();
                                        break;
                                    }
                                    case CommandName.edit: {
                                        executeDefer = self.pane._setEditStateAttr(command.name, true);
                                        break;
                                    }
                                    case CommandName.clone: {
                                        executeDefer = self.cloneDashlet();
                                        break;
                                    }
                                    case CommandName.refresh: {
                                        executeDefer = lang.isFunction(self.dashlet.refresh) ? self.dashlet.refresh.apply(self.dashlet) : null;
                                        break;
                                    }
                                    default:
                                }
                            }

                        default:
                            {

                            }
                    }
                    return when(executeDefer, function () {
                        return self._publishToDashlet("command/executed", { command: command, result: commandResult });
                    });
                });
            },

            processCommand: function (command) {
                var self = this;
                if (command.confirm) {
                    var message = command.confirmMessage || language.ConfirmMessage;
                    var title = command.confirmTitle || language.ConfirmTitle;
                    var answer = confirm(message, title);
                    if (!answer) {
                        return self._publishToDashlet("commandCancelled", command);
                    } else {
                        self._processCommand(command);
                    }

                } else self._processCommand(command);
            },



            destroy: function () {
                if (this.editorContext)
                    this.editorContext.destroy();
                this.pane.destroyRecursive();
                this.inherited(arguments);
            },

            remove: function () {
                var self = this;
                return when(this.dashboard._removeDashlet(this), function () {
                    self.destroy();
                }, function (err) {
                });
            },

            save: function () {
                var provider = this.getProvider();
                return provider.saveDashlet(this.model);
            },


            progress: function (msg) {
                if (msg)
                    this.pane._setTitle(msg);
            },

            clearBusy: function () {
                this.inherited(arguments);
                this.pane._setTitle(this.get("title"));
            },


            getProvider: function () {
                return this.dashboard.provider;
            },



            closeEditor: function (closeAction) {
                var self = this;
                closeAction = closeAction || "cancel";

                function destroyEditor() {
                    self.editorContext.destroy(closeAction);
                    delete self.editorContext;
                }

                var applyOrSave = function (save, allowCloseResult, evt) {
                    return when(allowCloseResult, function (allowClose) {

                        var saveToProviderFn = (evt && evt.args && evt.args.discardProvider) ? function () { } : self.save;

                        if ((allowClose != false)) {
                            return when(saveToProviderFn.apply(self), function () {
                                self.config.endUpdate();
                                self._publishToDashletEditor("saved", { action: closeAction});
                                if (save == "save") {
									destroyEditor();
									return self.set("editState", "none");
								}
                            }, function (err) {
                            });
                        } 
                    }, function (err) {

                    });
                }

                if (this.editorContext) {

                    if (closeAction == "cancel") {
                        return this._publishToDashletEditor("canceling").then(function () {
                            var stateChange = self.set("editState", "none");
                            return when(stateChange, function () {
                                self.config.cancelUpdate();
                                self._publishToDashletEditor("canceled");
                                destroyEditor();
                            });

                        });
                    } else {
                        return this._publishToDashletEditor("validating", { action: closeAction }).then(function (event) {
                            return applyOrSave(closeAction, null, event);
                        });
                    }
                }
            },

            openEditor: function (params, node) {

                if (this.editorContext)
                    return this.editorContext;

                if (!this.dashboard._hasDesignMode(DesignMode.dashlets))
                    return false;

                var self = this;

                var editorSettings = this.module.config.get("editor");

                if (typeof editorSettings != "undefined") {

                    params = params || {};
                    node = node || this.pane.getEditorContainerNode();

                    var path = editorSettings.path;

                    var editView = null;

                    var newDom = domConstruct.create("div");
                    domConstruct.place(newDom, node);

                    var editorContext = this.editorContext = new DashletEditorContext({ dashletContext: self, config: self.config, initialNode: node });
                    var startSignal = new Deferred();

                    function runEditor(clazz, params) {
                        editView = new clazz(params, newDom);


                        editView.onCancel = function () {
                            self.closeEditor("cancel");
                        }

                        editView.onSave = function () {
                            self.closeEditor("save");
                        };

                        editView.onApply = function () {
                            self.closeEditor("apply");
                        };
                        editorContext.set("editView", editView);
                        this.setBusy(startSignal);

                        domStyle.set(node, "display", "block");

                        when(lang.isFunction(editView.startup) ? editView.startup() : null, function (startupResult) {
                            startSignal.resolve(editorContext);
                            self.config.beginUpdate();

                        }, function (err) {
                            startSignal.reject(err);
                        });
                    }

                    var editorParams = {
                        caption: this.title,
                        viewPath: path,
                        editorConstructor: this.module.editorConstructor,
                        viewParams: { context: editorContext }
                    }

                    if (lang.isFunction(editorSettings.paneConstructor))
                        runEditor.apply(this, [editorSettings.paneConstructor, editorParams]);
                    else if (editorSettings.panePath != null) {
                        require([editorSettings.panePath], function (clazz) {
                            runEditor.apply(self, [clazz, editorParams]);
                        })
                    } else {
                        if (editorSettings.useWindow)
                            runEditor.apply(this, [DashletEditorWindow, editorParams]);
                        else runEditor.apply(this, [DashletEditView, editorParams]);
                    }

                    return startSignal;

                }
            },

            hideHeader: function () {
                this.pane.hideHeader();
            },

            showHeader: function () {
                this.pane.showHeader();
            },


            hideBody: function () {
                this.pane.hideBody();
            },

            showBody: function () {
                this.pane.showBody();
            }
        });


        return DashletContext;
    });