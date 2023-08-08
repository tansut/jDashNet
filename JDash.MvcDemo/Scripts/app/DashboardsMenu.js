(function () {
    var moduleClass = function (node, options) {
        
        options = options || {};

        var openAt = options.id ? $("[data-dashboard-id=" + options.id + "]", node).index() : 0;

        $(node).appendTo(options && (options.parent || "body"));
        var self = this;
        $(".cmd-destroy", node).on("click", function () { self.destroy() });

        var modal = $(node).modal();

        $("button", node).on("click", function () {
            var id = $(".ff-active", node).attr("data-dashboard-id");
            options.onload && options.onload.apply(self, [id]);
        });

        $(node).on('hidden.bs.modal', function () {
            self.destroy(true);
        })
        
        setTimeout(function () {
            $(".sb-container", node).swatchbook({
                // number of degrees that is between each item
                angleInc: 30,
                neighbor: 15,
                // if it should be closed by default
                initclosed: false,
                // index of the element that when clicked, triggers the open/close function
                // by default there is no such element
                closeIdx: 11,
                openAt: openAt
            });

        });

        this.hide = function() {
            $(node).modal("hide");
        }

        this.destroy = function (auto) {
                
            $(node).data('modal', null);
            $(node).remove();
        }
    }

    moduleClass.create = function (cb, options) {
        $.ajax({
            type: "GET",
            url: "/Dashboard/DashboardsMenu",
            cache: false,
            success: function (content) {
                var node = $(content).get(0);
                var module = new moduleClass(node, options);
                cb && cb.apply(this, [module]);
            },
            fail: function (err) {
                cb && cb.apply(this, [null, err]);
            }
        });
    }

    window.app = window.app || {};
    window.app.DashboardsMenu = window.app.DashboardsMenu || moduleClass;

})()