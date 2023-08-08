(function () {

    function DashboardModule(node, options) {
        var self = this;

        options = options || {};
        $("body").append(node);
        var modal = $(node).modal();
        $('.colorselector', node).colorselector('setColor', $(".colorIdText", node).val());
        $(".colorselector", node).change(function () {
            $(".colorIdText", node).val($(this).val());
        });
        $(".d-layout-predefined", node).on("click", function () {
            var layoutId = $(this).attr('data-layoutid');
            if (layoutId) {
                var hidden = $(".ctlSelectedLayout", node).val(layoutId);
                $('.d-layout-predefined', node).removeClass("selected");
                $(this).addClass("selected");
            }
        });
        $(".ctlCustomGroupCheckbox", node).on("click", function () {
            if ($(this).attr('checked')) {
                $('.ctlGroups', node).hide();
                $('.customGroupIsVisible', node).show();
            } else {
                $('.ctlGroups', node).show();
                $('.customGroupIsVisible', node).hide();
            }
        });
        var form = $("form", node).get(0);

        var rootUrl = "../../Dashboard/Index/";

        window.DashboardEditModuleSuccessHandler = function (result) {
            if (self.validateForm()) {
                self.hide();
                if (options.handler) {
                    options.handler.apply(this, [result.id]);
                }
            }
        }
        this.validateForm = function () {
            return self.validateDashboardForm();
        }
        $("form").submit(function () {
            return self.validateForm();
        });



        $(node).on('hidden.bs.modal', function () {
            self.destroy();
        })

        this.show = function () {
            $(node).modal("show");
        }

        this.setTitle = function (val) {
            $(".modal-title", node).text(val);
        }

        this.hide = function () {
            $(node).modal("hide");
        }

        this.destroy = function () {
            $(node).data('modal', null);
            $(node).remove();
        }

        this.validateDashboardForm = function () {
            var title = $('.ctlDashboardTitle');
            if (title.val() == "") {
                self.showDashboardError("Not optional: title");
                return false;
            }
            return true;
        }

        this.showDashboardError = function (message) {
            var messageControl = $(".ctlErrorAlertMessage");
            debugger;
            messageControl.text(message);
            $(".ctlErrorAlert").removeClass('hide');
        }
    }

    DashboardModule.create = function (id, cb, options) {
        $.ajax({
            type: "GET",
            url: "/Dashboard/DashboardEditModule",
            data: { id: id },
            cache: false,
            success: function (content) {
                var node = $(content).get(0);
                var module = new DashboardModule(node, options);
                cb.apply(this, [module]);
            },
            fail: function (err) {
                cb.apply(this, [null, err]);
            }
        });
    }

    DashboardModule.delete = function (id, cb, options) {

        if (confirm("Confirm ?")) {

            $.ajax({
                type: "POST",
                url: "/Dashboard/DeleteDashboard",
                data: { id: id },
                cache: false,
                success: function (content) {
                    cb.apply(this, []);
                },
                fail: function (err) {
                    cb.apply(this, [null, err]);
                }
            });
        }
    }
    window.app = window.app || {};
    window.app.DashboardModule = window.app.DashboardModule || DashboardModule;

})()