define(["dojo/dom-construct",
     "dojo/_base/lang",
     "dojo/dom-attr",
     "dojo/query",
     "dojo/on",
     "dojo/json",
     "dojo/_base/array",
    "dojo/_base/window"], function (domConstruct, lang, domAttr, query, on, json, array, win) {
        var linker = {

            createControl: function (clazz, params, node, options) {
                for (var k in params) {
                    paramValue = params[k];
                    if (options.paramsReplace) {
                        var foundVal = options.paramsReplace[k];
                        if (typeof (foundVal) != "undefined")
                            paramValue = params[k] = foundVal;
                    }
                }
                var widget = new clazz(params, node);
                return widget;
            },

            link: function (node, options) {
                node = node || win.body();
                options = options || {};
                var jnodes = query('[data-jdash-type]', node);
                var self = this;
                var controls = [];

                jnodes.forEach(function (node) {
                    var clazzName = domAttr.get(node, "data-jdash-type");
                    var clazz = lang.getObject(clazzName);
                    if (clazz) {
                        var params = json.parse(domAttr.get(node, "data-jdash-params"));

                        try {
                            var ctrl = linker.createControl(clazz, params, node, options);
                            controls.push(ctrl);
                        } catch (e) {
                            console.log("error creating " + clazzName + " " + e);
                        }
                        
                        domAttr.remove(node, "data-jdash-type");
                        domAttr.remove(node, "data-jdash-params");
                    } else console.log(clazzName + " does not seem valid");
                });

                array.forEach(controls, function (control) {
                    if (lang.isFunction(control.startup))
                        try {
                            control.startup();
                        } catch (e) {
                            console.log("error starting control " + e);
                        }
                }, this);
                return controls;

            }
        }
        lang.setObject("jdash.ui.linker", linker);
        return linker;
    })