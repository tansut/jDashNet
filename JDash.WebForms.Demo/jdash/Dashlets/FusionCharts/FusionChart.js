define([
    "require"
], function (require) {
    return function (params, node) {
        this.context = params.context;
        var domNode = this.domNode = node || document.createElement("div");
        var dashletNode = this.dashletNode = document.createElement("div");
        domNode.appendChild(dashletNode);

        this._handleDomUpdate = function (newNode, insideOnly) {
            if (!insideOnly)
                domNode = this.domNode = newNode;
            domNode.appendChild(dashletNode);
        }

        this._handleDomUpdating = function () {
            this.domNode.removeChild(this.dashletNode);
        }

        this.dashletNode.id = "fc_" + this.context.pane.domNode.id;
        this.fusionChartPath = require.toUrl("./resources/fc/FusionCharts.js");
        this.sampleXMLDataPath = require.toUrl("./resources/fc/Data.xml");
        var self = this;

  

        this.renderChart = function (initialConfig) {
            require([self.fusionChartPath], function () {
                var configData = self.getDefaultConfig();
                if (initialConfig) {
                    configData = initialConfig.chartConfig;
                    self.defaultConfig = configData;
                }
                var data = configData.data;
                var settings = configData.config;

                var size = self.context.pane.getDashletSize();
                var height = "300px";
                if (size.h > 0)
                    height = size.h + "px";
                self.context.fn.domStyle.set(self.dashletNode, "height", height);

                FusionCharts.setCurrentRenderer('javascript');
                self.fc = new FusionCharts(settings);
                self.fc.setJSONData(data);
                self.fc.render(self.dashletNode.id);
            });
        }

        this.refresh = function (redrawOnly, newHeight) {

            self.renderChart();
        }

        this.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
            if (event.sender == self.context) {
                setTimeout(self.renderChart, 500);
            }
        });

        this.context.config.watch("chartConfig", function (name, oldVal, newVal) {
            self.dashletNode.innerHTML = "";
            setTimeout(self.renderChart, 500);

        });

        this.destroyRecursive = function () {
            self.fc.dispose();
        }
        this.getDefaultConfig = function () {
            return self.defaultConfig || {

                config: {
                    type: 'Column3D',
                    width: "100%",
                    height: '300',
                    debugMode: false
                },
                data: {
                    "chart":
                    {
                        "caption": "Weekly Sales Summary",
                        "xAxisName": "Week",
                        "yAxisName": "Sales",
                        "numberPrefix": "$"
                    },
                    "data":
                    [
                            { "label": "Week 1", "value": "14400" },
                            { "label": "Week 2", "value": "19600" },
                            { "label": "Week 3", "value": "24000" },
                            { "label": "Week 4", "value": "15700" }
                    ]
                }

            }
        }

    }
});
