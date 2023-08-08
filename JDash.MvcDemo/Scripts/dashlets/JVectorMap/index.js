define(["require", "./scripts/jvectormap.min.js"], function (require) {
    var pluginCss = "./Content/Css/jquery-jvectormap-1.2.2.css";
    return {
        setSize: function (node) {
            size = this.context.getDashletSize();
            this.$style.set(node, "height", Math.max(size.h, 300) + "px");
            this.$style.set(node, "width", Math.max(size.w, 300) + "px");
        },



        draw: function () {
            var self = this;

            var map = (this.context.config.get("model") && this.context.config.get("model").MapId) || "world-mill-en";
            var mapPath = require.toUrl("./maps/" + map + ".js");

            require([mapPath], function () {
                if (self.map)
                    self.map.remove();

                var mapNode = document.createElement('div');
                self.setSize(mapNode);
                self.domNode.appendChild(mapNode);

                self.map = $(mapNode).vectorMap({
                    map: map.replace(new RegExp('-', 'g'), '_'),
                    backgroundColor: 'transparent',
                    regionStyle: {
                        initial: {
                            fill: '#96bbcd'
                        }
                    }
                });
            })
        },

        resize: function () {
            this.draw();
        },


        initialize: function () {
            var self = this;
            this.context.loadResource(pluginCss, 'css', function () {
                self.draw();
            })
        },

        destroyRecursive: function () {
            this.context.unloadResource(pluginCss);
        }
    }
})