define(['dojo/_base/declare',
        'dojo/_base/lang',
        './_WidgetBase',
        './_TemplatedMixin',
        'dojo/dom-class',
        'dojo/dom-style',
        'dojo/dom-construct',
        "./_ThemeMixin",
        "dojo/_base/array",
        "dojo/dom-attr",
        "./ButtonSet",
        "../core/CommandName",
	    "../core/DashletCommand"
],
function (declare, lang, _WidgetBase, _TemplatedMixin,
         domClass, domStyle, domConstruct, _ThemeMixin, array, domAttr, ButtonSet, CommandName) {
    return declare('jdash.ui.PaneButtons', [ButtonSet], {

        createButton: function (command) {
            var self = this;

            var manageState = function (stateCmd, state) {
                var commands = self.context.getPaneCommands();
                var newStateCommands = stateCmd.states[state];
                array.forEach(commands, function (item) {
                    if (item.type == "visualState") {
                        var cmdExists = newStateCommands.indexOf(item.name) < 0;
                        if (item.uiControl && lang.isFunction(item.uiControl.set))
                            item.uiControl.set("hidden", cmdExists);
                        lang.setObject("ui.hidden", cmdExists, item);
                        item.hidden = cmdExists;
                    }
                }, this);
            }

            if (command.name != CommandName.visualState) {
                var btn = this._createButton(command);
                domClass.remove(btn.domNode, 'd-btn');
                domClass.remove(btn.domNode, 'd-btn-default');
                command.uiControl = btn;
                
            }

            if (command.name == CommandName.visualState && command.type == "builtIn") {
                var stateCmd = command;

                this.context.subscribeToDashlet("visualStateChanged", function (event) {
                    if (event.sender == this)
                        manageState(stateCmd, event.args.state);
                });

                manageState(stateCmd, this.context.pane.get("visualState"));
            }
        }
    })
});