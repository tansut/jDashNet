define(["./_WidgetBase", "dojo/_base/declare", "dojo/when", "./registry", "../model/DashletModel", "dojo/_base/lang"], function (widgetbase, declare, when, registry, DashletModel, lang) {
    return declare("jdash.ui.DashboardLoadLink", [widgetbase], {
        postCreate: function () {
            this.on("click", lang.hitch(this, "click"));
            this.inherited(arguments);
        },


        click: function () {
            var dashboardView = registry.byId(this.dashboardView);
            dashboardView.load(this.dashboardId);
        }
    });
})