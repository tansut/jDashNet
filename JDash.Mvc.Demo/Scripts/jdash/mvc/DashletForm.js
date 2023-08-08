define(["jdash/core/declare",
        "./DashletBase",
        "dojo/dom-construct",
        "dojo/query",
        "jdash/core/Deferred",
        "jdash/core/bus",
        "dojo/dom-attr",
        "dojo/json",
        "dojo/dom-form",
             "dojo/request/xhr"
], function (declare, DashletBase, domConstruct, query, Deferred, bus, attr, json, domForm, xhr) {


    window.jdash = window.jdash || {};

    window.jdash.ajaxFormComplete = window.jdash.ajaxFormComplete || function () {
        var args = [];
        args.push("jdash/mvc/ajaxFormXhrCompleted");
        args.push(bus.createEvent(this, Array.prototype.slice.call(arguments, 0)));
        bus.publish.apply(bus, args);
    };

    window.jdash.ajaxFormSuccess = window.jdash.ajaxFormSuccess || function () {
        var args = [];
        args.push("jdash/mvc/ajaxFormXhrSuccess");
        args.push(bus.createEvent(this, Array.prototype.slice.call(arguments, 0)));
        bus.publish.apply(bus, args);
    };

    function getFunction(code, argNames) {
        var fn = window, parts = (code || "").split(".");
        while (fn && parts.length) {
            fn = fn[parts.shift()];
        }
        if (typeof (fn) === "function") {
            return fn;
        }
        argNames.push(code);
        return Function.constructor.apply(null, argNames);
    }

    return declare(null, {
        make: function (form, options) {
            form.action = options.url;

            this.dashletPropertiesNode = domConstruct.toDom("<input type='hidden' name='DashletProperties' id='DashletProperties'  style='display:none !important' />");
            domConstruct.place(this.dashletPropertiesNode, form, "last");

            this.submitNode = domConstruct.toDom("<input type='submit' value='SaveDashlet' style='display:none !important' />");
            domConstruct.place(this.submitNode, form, "last");


            var saveSubmit = form.onsubmit;
            var self = this;

            if (attr.get(form, "data-ajax") == "true") {
                this.saveDataAjaxComplete = attr.get(form, "data-ajax-complete");
                this.saveDataAjaxSuccess = attr.get(form, "data-ajax-success");
                attr.set(form, "data-ajax-complete", "jdash.ajaxFormComplete");
                attr.set(form, "data-ajax-success", "jdash.ajaxFormSuccess");

                this.ajaxFormHandler = bus.subscribe("jdash/mvc/ajaxFormXhrCompleted", function (evt) {
                    if (self.saveDataAjaxComplete) {
                        var fn = getFunction(self.saveDataAjaxComplete, ["xhr", "status"]);
                        fn.apply(evt.sender, evt.args)
                    }
                    if (self.submitDefer && evt.args[1] != "success")
                        self.submitDefer.reject();
                })

                this.ajaxFormHandler = bus.subscribe("jdash/mvc/ajaxFormXhrSuccess", function (evt) {
                    if (self.saveDataAjaxSuccess) {
                        var fn = getFunction(self.saveDataAjaxSuccess, ["data", "status", "xhr"]);
                        fn.apply(evt.sender, evt.args)
                    }
                    if (self.submitDefer && evt.args[1] == "success")
                        self.submitDefer.resolve(bus.createEvent(evt.sender, { response: evt.args[2], data: evt.args[0] }));
                })
            }

            this.form.onsubmit = function (evt) {
                var continueSubmit = true;
                if (saveSubmit) {
                    continueSubmit = saveSubmit();
                }
                evt = evt || window.event;
                if (continueSubmit == false) {
                    if (evt) {
                        evt.preventDefault();
                    }
                    self.submitDefer && self.submitDefer.reject();
                    return;
                }
                if (evt.defaultPrevented == true)
                    self.submitDefer && self.submitDefer.reject();
                else;
            }
        },

        click: function (node) {
            if (document.createEvent) {
                var evt = document.createEvent('MouseEvents');
                evt.initEvent('click', true, false);
                node.dispatchEvent(evt);
            } else if (document.createEventObject) {
                node.fireEvent('onclick');
            } else if (typeof node.onclick == 'function') {
                node.onclick();
            }
        },

        submit: function (dashletProps) {
            if (dashletProps)
                this.dashletPropertiesNode.value = json.stringify(dashletProps);
            
            var self = this;
            this.submitDefer = new Deferred();
            if ($ && $.validator && $.validator.unobtrusive) {
                setTimeout(function () {
                    self.click(self.submitNode);
                });
            } else {
                var formValues = domForm.toObject(this.form);
                xhr(this.form.action, { method: 'POST', data: formValues }).response.then(function (response) {
                    self.submitDefer.resolve(bus.createEvent(this, { response: response, data: response.data }));
                }, function(err) {
                    self.submitDefer.reject(err);
                });

                
            }
            return this.submitDefer;
        },

        constructor: function (form, options) {
            this.form = form;
            this.options = options;
            this.make(this.form, this.options);
        },

        destroyRecursive: function () {
            if (this.ajaxFormHandler)
                this.ajaxFormHandler.remove();
        }
    })
})