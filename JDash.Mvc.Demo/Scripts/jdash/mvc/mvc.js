define(["require",
        "dojo/i18n!jdash/nls/language",
        "jdash/core/declare",
        "jdash/ui/DashboardView",
        "jdash/ui/Button",
        "dojo/dom",
        "dojo/query",
        "dojo/NodeList-traverse",
        "jdash/ui/registry",
        "jdash/model/DashletModel",
        "jdash/model/DashboardModel",
        "jdash/model/DashletModuleModel",
        "dojo/_base/lang",
        "dojo/_base/array",
        "dojo/dom-attr",
        "dojo/Deferred",
        "dojo/json",
        "klt/core/when",
        "dojo/dom-class",
        "dojo/dom-construct",
        "jdash/ui/ThemeManager",
         "jdash/layout/LayoutManager",
         "jdash/ui/DashletStylesList",
         "jdash/ui/ThemeStylesList",
         "jdash/ui/TitleEditor",
         "dojo/_base/fx",
         "dojo/dom-style",
         "jdash/ui/DashletPane",
         "jdash/ui/DashletEditView",
         "jdash/ui/DashletPropertyEditor",
         "jdash/core/DashletContext",
         "dojo/promise/all",
         "dojo/Stateful",
         "jdash/init",
         "jdash/provider/JsonRest/JsonRestProvider",
         "jdash/provider/Manager",
         "dojo/request/xhr",
         "dojo/dom-form",
         "./Dashlet",
         "./DashletEditor",
         "jdash/ui/linker",
        "klt/domReady!"],
function (require, language, declare, DashboardView, Button, dom, query, traverse, registry, DashletModel, DashboardModel, DashletModuleModel, lang, array, attr, Deferred,
    json, when, domClass, domConstruct, ThemeManager, LayoutManager, DashletStylesList, ThemeStylesList, DashletTitleEditor, fx, domStyle, DashletPane,
    DashletEditView, DashletPropertyEditor, DashletContext, all, Stateful, init, JsonRestProvider,
    Manager, xhr, domForm, Dashlet, DashletEditor, Linker) {

    var initDefer = new Deferred();

    var MsMvcDashletModuleModel = declare(DashletModuleModel, {

        dashletConstructor: function (context) {            
            var createDefer = function () {
                var defer = new Deferred();
                if (context.model.module.path != "[MVCDefault]") {
                    require([context.model.module.path], function (module) {                        
                        var instance = lang.isFunction(module) ? new module(context): new declare(Dashlet, module)(context);
                        defer.resolve(instance);
                    }, function (err) {
                        defer.reject(err);
                    })
                } else {
                    var instance = new Dashlet(context);
                    defer.resolve(instance);
                }
                return defer;
            }

            return new createDefer();
        },

        editorConstructor: function (context) {
            var createDefer = function () {
                var defer = new Deferred();
                var path = (context.dashletContext.model.module.config.editor && context.dashletContext.model.module.config.editor.path) || "[MVCDefault]";
                if (path != "[MVCDefault]") {
                    require([path], function (module) {
                        var instance = lang.isFunction(module) ? new module(context) : new declare(DashletEditor, module)(context);
                        defer.resolve(instance);
                    }, function (err) {
                        defer.reject(err);
                    })
                } else {
                    var instance = new DashletEditor(context);
                    defer.resolve(instance);
                }
                return defer;
            }

            return new createDefer();
        }
    })

    var MvcProvider = declare("JDash.MvcProvider", JsonRestProvider, {
	
		virtualPath: '',
		
        getDashletModuleClass: function () {
            return MsMvcDashletModuleModel;
        }
    })

    

    //window.JDashMvc = window.JDashMvc || {};



    return {

        query: query,

        attr: attr,

        DashletModel: DashletModel,

        when: when,

        emptyFn: function () {

        },

        clientInitDone: function () {
            return initDefer;
        },

        createUiControl: function (clazz, props, node) {
            if (!lang.isFunction(clazz))
                clazz = lang.getObject(clazz);
            var ctrl = new clazz(props, node);
            ctrl.startup();
        },

        getCmp: function (id) {
            var widget = registry.byId(id);
            if (!widget)
                console.log("WARN: Cannot find Widget using id:" + id);
            return widget;
        },

        ThemeManager: ThemeManager,

        Linker: Linker,

        initClient: function (props) {
            lang.mixin(ThemeManager.knownResourcePaths, props.resourceOverrides);
            if (props.customThemes)
                for (var themeId in props.customThemes)
                    ThemeManager.register(props.customThemes[themeId].Key, props.customThemes[themeId].Value);
            Manager.register("MvcProvider", MvcProvider, true, props.provider);
            var initResult = ThemeManager.init(props.themeManager);
            when(initResult, function () {
                initDefer.resolve();
            }, function (err) {
                initDefer.reject();
            })
        }
    }
})