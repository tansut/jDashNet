define(["./_WidgetBase", "dojo/_base/declare"], function(widgetbase, declare) {
    return declare("jdash.ui.DashboardTitle", [widgetbase], {
        buildRendering: function () {
            this.inherited(arguments);
            this.initialContent && (this.domNode.innerHTML = this.initialContent);
            
        },

        postCreate: function () {
            var self = this;
            this.subscribe("jdash/dashboard/loading/completed", function(event) {
                if (event.sender.id == self.dashboardView)
                    self.domNode.innerHTML = event.args.model.title;
            })

            this.subscribe("jdash/dashboard/unloaded", function (event) {
                if (event.sender.id == self.dashboardView)
                    if (self.initialContent)
                        self.domNode.innerHTML = self.initialContent;
                    else self.domNode.innerHTML = "";
            })

            this.inherited(arguments);
        }
    });
} )