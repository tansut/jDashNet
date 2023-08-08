define(["jdash/core/declare",
        "./DashletBase",
        "dojo/dom-construct",
        "jdash/core/Deferred",
        "./DashletForm",
        "jdash/core/when"
], function (declare, DashletBase, domConstruct, Deferred, DashletForm, when) {
    return declare(DashletBase, {

        $viewUrl: function () {
            var url = this.$controller + "/editor/" + this.$dashletId;
            return url;
        },


        $context: function () {
            return this.context.dashletContext;
        },

        destroyRecursive: function () {
            this.inherited(arguments);
            if (this.$dashletForm)
                this.$dashletForm.destroyRecursive();
        },

        $bindForm: function (form) {
            this.$dashletForm = new DashletForm(form, {
                url: this.$controller + "/save/" + this.$dashletId
            });
        },

        validate: function () {
            return true;
        },

        $dashletProps: function () {
            var context = this.$context();

            var result = {

                title: context.title,

                paneConfig: {
                    disableTheming: context.paneConfig.disableTheming,
                    themeStyleId: context.paneConfig.themeStyleId
                }
            }



            if (typeof (context.paneConfig.cssClass) != 'undefined') {
                result["paneConfig"] = result["paneConfig"] || {};
                result["paneConfig"].cssClass = context.paneConfig.cssClass;
            }
            return result;
        },

        $submitForm: function () {
            if (this.$dashletForm)
                return this.$dashletForm.submit(this.$dashletProps());
            else {
                var url = this.$controller + "/save/" + this.$dashletId;
                var options = {
                    data: {
                        DashletProperties: this.$dashletProps()
                    },
                    method: 'POST'
                }
                return this.$xhr(url, options);
            }
        },

        $handleSubmitResult: function (event) {
            if (this.$dashletForm) {
                var contentType = event.args.response.getResponseHeader ? (event.args.response.getResponseHeader("Content-Type") || "text/html") : (event.args.response.getHeader("Content-Type") || "text/html");
                if (contentType.indexOf("application/json") != -1) {
                    var config = event.args.data && event.args.data.config;
                    if (config)
                        for (var p in config) {
                            this.$context().config.set(p, config[p]);
                        }
                }
            }
            this.$context().dashletInstance.$construct('edit');
        },

        $closeEditor: function (event) {
            var self = this;
            event.args.discardProvider = true;

            var defer = when(self.validate(event), function (result) {
                if (result == false) {
                    defer.reject()
                } else {
                    return self.$submitForm();
                }
            });

            var result = when(defer, function (submitEvent) {
                    return when(self.$handleSubmitResult(submitEvent), function () {
                        
                    })
            });

            if (result) {
                this.$context().setBusy(result);
                event.nextDefer = result;
            }
            return result;
        },

        $init: function (htmlString) {
            this.inherited(arguments);
            var form = this.$form;
            if (form) {
                this.$bindForm(form);
            }
            var self = this;
            this.context.subscribe("jdash/dashlet/editor/validating", function (event) {
                if (event.sender == this) self.$closeEditor(event);
            });
        }
    })
})