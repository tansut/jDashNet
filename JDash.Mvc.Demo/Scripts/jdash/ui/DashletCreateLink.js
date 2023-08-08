define(["./_WidgetBase", "dojo/_base/declare", "dojo/when", "./registry", "../model/DashletModel", "dojo/_base/lang"], function (widgetbase, declare, when, registry, DashletModel, lang) {
    return declare("jdash.ui.DashletCreateLink", [widgetbase], {

        postCreate: function () {
            // todo , prevent rebind
            this.on("click", lang.hitch(this, "click"));
            this.inherited(arguments);
        },


        click: function () {
            var dashboardView = registry.byId(this.dashboardView);
            var module = dashboardView.provider.getDashletModule(this.moduleId);
            when(module,
                function (module) {
                    var dashlet = new DashletModel({ module: module });
                    when(dashboardView.createDashlet(dashlet), function () { }, function (err) { console.log(err) });
                }, function (err) {
                    console.log(err)
                });
        }
    });
})