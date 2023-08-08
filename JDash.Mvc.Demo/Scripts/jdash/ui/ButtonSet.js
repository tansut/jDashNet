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
        "./Button"

],
function (declare, lang, _WidgetBase, _TemplatedMixin, domClass, domStyle, domConstruct, _ThemeMixin, array, domAttr, Button) {
    return declare("jdash.ui.ButtonSet", [_WidgetBase], {

        _handleCommand: function(command) {
            if (this.handler)
                this.handler(command);
        },

        _createButton: function(command) {
            var btn = new Button(command.ui);
            btn.startup();
            btn.placeAt(this.domNode);
            command.uiControl = btn;
            btn.command = command;
            btn.on("Click", lang.hitch(this, lang.partial(this._handleCommand, { command: command })));
            return btn;
        },

        createButton: function(command) {
            
        },

        buildRendering: function () {
            this.inherited(arguments);
            var commands = this.commands;
            array.forEach(commands, function (command) {
                this.createButton(command);
            }, this);
        },

        destroyRecursive: function () {
            array.forEach(this.commands, function(cmd) {
                if (cmd.uiControl)
                    cmd.uiControl.destroyRecursive();
            });
            this.inherited(arguments);
        }
    })
});