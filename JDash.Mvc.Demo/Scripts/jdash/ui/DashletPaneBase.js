define([
	"dojo/Stateful",
	"dojo/_base/array",
	"dojo/_base/declare",
	"dojo/dom",
	"dojo/dom-attr",
	"dojo/dom-class",
	"dojo/dom-geometry",
	"dojo/_base/event",
	"dojo/fx",
	"dojo/_base/kernel",
	"dojo/keys",
        "./_WidgetBase",
        "./_TemplatedMixin",
        "./_WidgetsInTemplateMixin",
	"../layout/_Container",

	"klt/core/messageBus",
	"dojo/on",
	"dojo/dom-construct",
	"dojo/query",
	"dojo/dom-style",
	"dojo/Deferred",
	"dojo/when",
	"require",
	"./_ThemeMixin",
	"dojo/_base/lang",
	"dojo/request/xhr",
	"dojo/promise/all",
	"../core/CommandType",
	"../core/CommandName",
	"../core/DashletCommand",
	"jdash/ui/Button",
	"./registry",
	"../core/DesignMode",
	"./Menu",
	"./MenuItem",
    "./PaneButtons"

], function (Stateful, array, declare, dom, domAttr, domClass, domGeometry, event, fxUtils, kernel, keys, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixin, _Container, bus,
			on, domConstruct, query, domStyle, Deferred, when, require, _ThemeMixin,
			lang, xhr, all, CommandType, CommandName, DashletCommand, Button, registry, DesignMode, Menu, MenuItem, PaneButtons) {

    return declare("klt.dashlet.ui.DashletPaneBase", [_WidgetBase, _Container, _TemplatedMixin, _WidgetsInTemplateMixin, _ThemeMixin], {

        // iconClass: String
        //      Specifies the css class name of pane icon.
        // iconBoxHidden: Boolean
        //      Specifies if the iconbox of pane is hidden.
        // iconBusyClass: String
        //      Specifies the css class to be set for the icon when dashlet is busy. Defaults to ui-icon-busy       
        // iconBoxCommandName: String         
        // bodyBusyClass: String
        //      Specifies the css class to be set for the pane body when dashlet is busy.   
        // autoHideHeader: Boolean
        //      If set true, specifies if the header of dashlet is only displayed when mouse is over the pane.
        // noHeader: Boolean
        //      If set true, specifies header node is hidden.
        // editState: String
        //      Specifies current edit state of the dashlet. If set to "edit", dashlet editor is displayed.
        // editState: String
        //      Specifies current visual state of the dashlet. Possible values are maximize, expand and collapse. Set to a known value to change the visual state of the dashlet.
        // readonly: Boolean
        //      Specifies if pane is read-only. A read-only dashlet is not editable nor draggable.
        // disableEdit: Boolean
        //      Specifies if editing of dashlet is disabled. If editing is disabled, edit dashlet command is hidden automatically.
        // disableMaximize: Boolean
        //      Specifies if maximization of dashlet is disabled. If maximization is disabled, maximize dashlet command is hidden automatically.
        // disableRemove: Boolean
        //      Specifies if removing dashlet is disabled. If removing is disabled, remove dashlet command is hidden automatically.
        // disableMove: Boolean
        //      Specifies if moving of dashlet is disabled.
        // disableCollapse: Boolean
        //      Specifies if collapsing of dashlet is disabled. If collapsing is disabled, collapse command is hidden automatically.


        themeTemplate: {
            template: "dashlet-{themeId}",
            styleTemplate: "dashlet-{themeStyleId}"
        },

        getDashletSize: function () {
            var node = this.containerNode;
            var computedStyle = domStyle.getComputedStyle(node);
            var cs = domGeometry.getContentBox(node, computedStyle);
            //var be = domGeometry.getPadBorderExtents(node, computedStyle);
            //var w = cs.w > be.r ? cs.w - be.r : 0;
            //var h = cs.h > be.b ? cs.h - be.b : 0;

            return {
                w: cs.w,
                h: cs.h
            }
        },

        getContentSize: function () {
            // summary:
            //      Returns an object which has w and h properties for width and hight of body node.
            var node = this.getContentNode();
            var computedStyle = domStyle.getComputedStyle(node);
            var output = domGeometry.getContentBox(node, computedStyle);
            return output;
        },

        getContentNode: function () {
            // summary:
            //      Returns domNode object for pane body container.
            return this.dashletContent;
        },

        getHeaderNode: function () {
            // summary:
            //      Returns domNode object for pane header container.
            return this.dashletHeader;
        },


        getTitleNode: function () {
            // summary:
            //      Returns domNode object for pane title.
            return this.dashletTitle;
        },

        getEditorContainerNode: function () {
            // summary:
            //      Returns domNode object for dashlet editor container.
                return this.dashletEditorContainer;
        },

        _setCssClassAttr: function (value) {
            if (this.cssClass)
                domClass.remove(this.domNode, this.cssClass);
            this._set("cssClass", value);
            if (this.cssClass)
                domClass.add(this.domNode, this.cssClass);
        },

        _setTitleAttr: { node: "dashletTitle", type: "innerText" },

        _setTooltipAttr: { node: "titleBox", type: "attribute", attribute: "title" },


        _setIconClassAttr: function (value) {
            this._set("iconClass", value);
            if (this.iconBox)
                this.iconBox.set("iconClass", value);
        },

        _setIconBoxHiddenAttr: function (value) {
            this._set("iconBoxHidden", value);
            if (this.iconBox)
                this.iconBox.set("hidden", value);
        },

        _getIconBoxHiddenAttr: function () {
            return this.iconBoxHidden;
        },

        _getIconClassAttr: function () {
            return this.iconClass;
        },

        _setHeightAttr: function (value) {
            if (lang.isString(value))
                domStyle.set(this.containerNode, "height", value);
            else if (typeof value == "number")
                domStyle.set(this.containerNode, "height", value + "px");
            else
                domStyle.remove(this.containerNode, "height");
        },


        animationDuration: 500,

        _setAutoHideHeaderAttr: function (value) {
            this._set("autoHideHeader", value);
            if (value) {
                this.hideHeader();
            } else {
                this.showHeader();
            }
        },

        _setEditStateAttr: function (editState, animate) {
            var self = this;

            var stateArgs = {
                state: editState
            }

            if (this.get("editState") != editState)
                return self.context._publishToDashlet("editStateChanging", stateArgs).then(function (args) {
                    if (editState == "edit") {
                        return when(self.openEditor(), function () {
                            self._set("editState", editState);
                            self.context._publishToDashlet("editStateChanged", stateArgs);
                        });
                    } else {
                        self._set("editState", editState);
                        self.context._publishToDashlet("editStateChanged", stateArgs);
                    }
                });
        },

        _setVisualStateAttr: function (visualState, animate) {
            var self = this;

            var stateArgs = {
                state: visualState
            }

            if (this.get("visualState") != visualState)
                return self.context._publishToDashlet("visualStateChanging", stateArgs).then(function (args) {

                    if (self.get("visualState") == 'maximize' && (visualState == "restore")) {
                        self.context.dashboard.layout.minimizeDashlet(self);
                        self._set("visualState", visualState);
                    }

                    else if (visualState == "restore" || visualState == "collapse") {
                        self._set("visualState", visualState);

                        array.forEach([self._wipeIn, self._wipeOut], function (animation) {
                            if (animation && animation.status() == "playing") {
                                animation.stop();
                            }
                        });

                        if (animate) {
                            var anim = self[visualState == "restore" ? "_wipeIn" : "_wipeOut"];
                            anim.play();
                        } else {
                            self.dashletContent.style.display = visualState == "restore" ? "" : "none";
                        }

                        if (self._started) {
                            if (visualState == "restore") {
                                self._onShow();
                            } else {
                                self.onHide();
                            }
                        }
                    } else if (visualState == "maximize") {
                        self.context.dashboard.layout.maximizeDashlet(self);
                        self._set("visualState", visualState);
                    }
                    self.context._publishToDashlet("visualStateChanged", stateArgs);
                    self._setPaneConfigValue("visualState", visualState);
                });

        },


        showHeader: function () {
            // summary:
            //      Shows pane header if it’s hidden.
            if (!this.get("noHeader")) {
                domStyle.set(this.dashletHeader, 'display', 'block');
                domClass.remove(this.domNode, "noHeader");
                delete this._headerHidden;
            }
        },

        hideHeader: function () {
            // summary:
            //      Hides pane header.
            if (!this._headerHidden) {
                domStyle.set(this.dashletHeader, 'display', 'none');
                domClass.add(this.domNode, "noHeader");
                this._headerHidden = true;
            }
        },





        _setTheme: function () {
            var themeInfo = this.inherited(arguments);
            if (themeInfo)
                this.context._publishToDashlet("themeChanged", themeInfo);
        },


        _manageHeadersAfterStartup: function () {
            var noHeader = this.get("noHeader") || this.get("autoHideHeader");
            if (noHeader)
                this.hideHeader();

        },





        _setReadonlyAttr: function (value) {
            this._set("readonly", value);
        },

        _setDisableEditAttr: function (value) {
            this._set("disableEdit", value);
        },

        _setDisableMaximizeAttr: function (value) {
            this._set("disableMaximize", value);
        },

        _setDisableRemoveAttr: function (value) {
            this._set("disableRemove", value);
        },

        _setDisableMoveAttr: function (value) {
            this._set("disableMove", value);
        },

        _setDisableCollapseAttr: function (value) {

            canCollapse = !value;

            this.titleBox.setAttribute("role", canCollapse ? "button" : "heading");
            if (canCollapse) {
                this.titleBox.setAttribute("aria-controls", this.id + "_pane");
                domAttr.set(this.titleBox, "tabIndex", this.tabIndex);
            } else {
                domAttr.remove(this.titleBox, "tabIndex");
            }

            this._set("disableCollapse", value);

        },

        _setNoHeaderAttr: function (value) {
            this._set('noHeader', value);
            if (value)
                this.hideHeader();
            else
                this.showHeader();
        },


        _setContentAttr: function (content) {
            if (!(this.visualState == "restore" || this.visualState == "maximize") || !this._wipeOut || this._wipeOut.status() == "playing") {
                this.inherited(arguments);
            } else {
                if (this._wipeIn && this._wipeIn.status() == "playing") {
                    this._wipeIn.stop();
                }

                domGeometry.setMarginBox(this.dashletContent, { h: domGeometry.getMarginBox(this.dashletContent).h });

                this.inherited(arguments);

                if (this._wipeIn) {
                    this._wipeIn.play();
                } else {
                    this.dashletContent.style.display = "";
                }
            }
        },

        _setContextAttr: function (value) {
            this._set("context", value);
        },

        _setBusyAttr: function (value) {
            this._set('busy', value);
            if (value) {
                domClass.add(this.domNode, "d-busy");
            } else {
                domClass.remove(this.domNode, "d-busy");
            }
        },

        _doDashletError: function (err) {
            domStyle.set(this.containerNode, "color", "red");
            this.showBody();
            this.showDashletContainer();
            var errDiv = domConstruct.create("div", { innerHTML: err.message });
            domConstruct.place(errDiv, this.containerNode);
        },

        _setPaneConfigValue: function (name, value) {
            this.context.paneConfig._isPaneSetting = true;
            this.context.paneConfig.set(name, value);
        },


        _setTitle: function (message) {
            this.dashletTitle.innerHTML = message;
        },



        realignMask: function () {
            if (this.mask)
                this.mask.show(this.domNode, true);
        },

        openEditor: function () {
            // summary:
            //      Opens  dashlet editor box
            var loadResult = this.context.openEditor(null, this.getEditorContainerNode());
            return loadResult;

        },

        allowMove: function () {
            var allow = !this.get("readonly") && !this.get("disableMove");
            if (allow)
                allow = this.context.dashboard._hasDesignMode(DesignMode.dashboard);
            return allow;
        },

        allowEdit: function () {
            return !this.get("readonly") && !this.get("disableEdit")
        },

        allowRemove: function () {
            return !this.get("readonly") && !this.get("disableRemove")
        },

        toggleCollapse: function () {
            // summary:
            //      Toggles collapse.
            if (this.context.paneConfig.get("disableCollapse"))
                return;
            var viewMode = this.get("visualState");
            switch (viewMode) {
                case "restore": {
                    this._setVisualStateAttr("collapse", true);
                    break;
                }
                case "collapse": {
                    this._setVisualStateAttr("restore", true);
                    break;
                }
                default:
            }
        },


        hideBody: function () {
            // summary:
            //    Hides pane body.
            this.set("bodyHidden", true);
            domStyle.set(this.dashletContent, "display", "none");
        },



        showBody: function () {
            // summary:
            //    Shows pane body if it's hidden.
            this.set("bodyHidden", null);
            domStyle.set(this.dashletContent, "display", "block");
        },

        processCommand: function (args, event) {

            var command = args.command;

            //switch (command.name) {
            //    case CommandName.menu: {
            //        this._onOptionsClick(command);
            //        event.stopPropagation();
            //        break;
            //    }
            //}

            return this.context.processCommand(command);
        },


        _onMaximizeClick: function (sender) {
            if (this.get('visualState') == "maximize") {
                this.set('visualState', 'restore');
            }
            else {
                this.set('visualState', 'maximize');
            }
            sender.cancelBubble = true;
        },

        _onOptionsClick: function (command) {
            var self = this;
            if (!self.commandsMenu) {
                self.commandsMenu = new Menu({ target: command.uiControl.domNode });

                self.commandsMenu.on("Cancel", function () {
                    self.commandsMenu.destroyRecursive();
                    delete self.commandsMenu;
                });

                this._prepareCommandsMenu();
                self.commandsMenu.startup();
            }
            self.commandsMenu.show();
        },

        _setCommandByDesignMode: function (cmd) {
            if (cmd.designMode) {
                var visible = this.context.dashboard._hasDesignMode(cmd.designMode);
                if (visible)
                    delete cmd.__designModeConflict;
                else cmd.__designModeConflict = true;
            }
        },


        _updateDesignMode: function () {
            var commands = this.context.getPaneCommands();
            var designMode = this.context.dashboard.get("designMode");
            array.forEach(commands, function (cmd) {
                this._setCommandByDesignMode(cmd, designMode);
                if (cmd.uiControl) {
                    if (!cmd.hidden && cmd.designMode)
                        cmd.uiControl.set("hidden", cmd.__designModeConflict);
                }
            }, this);
            var editable = this.context.dashboard._hasDesignMode(DesignMode.dashlets);
            if (!editable)
                this.context.closeEditor();
        },

        //_prepareCommandsMenu: function () {
        //	var self = this;
        //	var commands = this.context.getPaneCommands();

        //	array.forEach(commands, function (item) {
        //		if (item.location == "menu" || item.type == CommandType.seperator) {
        //			this._setCommandByDesignMode(item);
        //			if (!item.__designModeConflict)
        //				self.addMenuCommand(item);
        //		}
        //	}, this);
        //},

        //_createHeaderCommand: function (command, controlGroup) {
        //	if (this.dashletCommands) {
        //	    var btn = new Button(command.ui);
        //	    btn.startup();
        //	    btn.placeAt(this.dashletCommands);
        //		command.uiControl = btn;
        //		btn.command = command;
        //		btn.on("Click", lang.hitch(this, lang.partial(this.processCommand, { command: command })));
        //		return btn;
        //	}
        //},

        //removeCommand: function (cmd) {
        //	if (cmd.uiControl) {
        //		if (lang.isFunction(cmd.uiControl.destroyRecursive))
        //			cmd.uiControl.destroyRecursive();
        //	}
        //},

        createCommands: function (commands) {
            this._buttonSet = new PaneButtons({
                commands: commands,
                handler: lang.hitch(this, this.processCommand),
                context: this.context
            }, this.dashletCommands);
            this._buttonSet.startup();
        },

        //addCommand: function (item) {
        //	var self = this;

        //	var manageState = function (stateCmd, state) {
        //		var commands = self.context.getPaneCommands();
        //		var newStateCommands = stateCmd.states[state];
        //		array.forEach(commands, function (item) {
        //			if (item.type == "visualState") {
        //				var cmdExists = newStateCommands.indexOf(item.name) < 0;
        //				if (item.uiControl && lang.isFunction(item.uiControl.set))
        //					item.uiControl.set("hidden", cmdExists);
        //				lang.setObject("ui.hidden", cmdExists, item);
        //				item.hidden = cmdExists;
        //			}
        //		}, this);
        //	}


        //	if (item.location == "header" || item.location == "footer") {
        //		self._createHeaderCommand(item);
        //	} else if (item.name == CommandName.visualState && item.type == "builtIn") {
        //		var stateCmd = item;

        //		this.context.subscribeToDashlet("visualStateChanged", function (event) {
        //			if (event.sender == this)
        //				manageState(stateCmd, event.args.state);
        //		});

        //		manageState(stateCmd, this.get("visualState"));

        //	}
        //},

        //addMenuCommand: function (command) {
        //	if (command.ui && command.ui.hidden)
        //		return;

        //	if (command.type == CommandType.seperator)
        //		return;

        //	var self = this;

        //	var menuItem = null;

        //	var commandProps = command.ui || {};
        //	if (!commandProps.label)
        //		commandProps.label = command.label || command.name;

        //	lang.mixin(commandProps, {
        //		pane: this,
        //		command: command,
        //		onClick: lang.hitch(this, lang.partial(self.processCommand, { command: command }))

        //	});
        //	menuItem = new MenuItem(commandProps);
        //	this.commandsMenu.addChild(menuItem);
        //},

        buildRendering: function () {
            this.inherited(arguments);
        },

        destroyRecursive: function () {
            try {
                if (this.commandsMenu)
                    this.commandsMenu.destroyRecursive();
                if (this.context.dashlet &&
					lang.isFunction(this.context.dashlet.destroyRecursive)) {
                    this.context.dashlet.destroyRecursive.apply(this.context.dashlet);
                } else if (this.context.dashlet &&
					lang.isFunction(this.context.dashlet.destroy)) {
                    this.context.dashlet.destroy.apply(this.context.dashlet);
                }
                if (this._buttonSet)
                    this._buttonSet.destroyRecursive();
                this.inherited(arguments);
            } catch (e) {
                throw e;
            }
        },

        postscript: function (args) {
            var args = args || {};
            if (typeof (args.iconClass) == "undefined")
                args.iconClass = "d-icon-star";
            if (typeof (args.iconBusyClass) == "undefined")
                args.iconBusyClass = "d-icon-busy";
            if (typeof (args.visualState) == "undefined")
                args.visualState = "restore";

            this.inherited(arguments, [args]);

        },


        postCreate: function () {
            var self = this;

            //var bodyBox = this.dashletContent, wipeNode = bodyBox;

            //this._wipeIn = fxUtils.wipeIn({
            //	node: wipeNode,
            //	duration: this.animationDuration,
            //	beforeBegin: function () {
            //		bodyBox.style.display = "";
            //	}
            //});

            //this._wipeOut = fxUtils.wipeOut({
            //	node: wipeNode,
            //	duration: this.animationDuration,
            //	onEnd: function (node) {
            //		node.style.display = "none";
            //	}
            //});

            delete this.context.paneConfig._isPaneSetting;
            this.inherited(arguments);
        },

        _initialized: function () {
        }

    });
});
