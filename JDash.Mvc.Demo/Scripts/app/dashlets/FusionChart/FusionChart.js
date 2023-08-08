define([
    "require"
    , "dojo/_base/lang"

], function (require, lang) {
    return function (params) {
    
        params.context.pane.containerNode.parentNode.style.padding = "0 0 0 0";
        this.context = params.context;
        this.domNode = document.createElement("div");
        this.domNode.id = "fc_"+this.context.pane.domNode.id;
        this.fusionChartPath = require.toUrl("./resources/fc/FusionCharts.js");
        this.sampleXMLDataPath = require.toUrl("./resources/fc/Data.xml");
        this.startup = function () {
            var self = this;
            require([self.fusionChartPath], function () {
                setTimeout(lang.hitch(self, self.renderChart));
            });
        }
        var self = this;

        this.renderChart = function () {
            
            
            var configData = !this.context.config.chartConfig ? this.getDefaultConfig() : this.context.config;
            if (!this.context.config.chartConfig) {
                var data = configData.chartConfig.data;
                var settings = configData.chartConfig.config;
            } else {
                var data = eval('(' + configData.chartConfig.data + ')');
                var settings = eval('(' + configData.chartConfig.config + ')');
            }

            FusionCharts.setCurrentRenderer('javascript');
           this.fc = new FusionCharts(settings);
            this.fc.setJSONData(data);
            this.fc.render(this.domNode.id);            
        }
        this.refresh = function (redrawOnly, newHeight) {
            this.fc.dispose();
            this.renderChart();
        }

        this.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
            if (event.sender == self.context) {
                setTimeout(lang.hitch(self, self.refresh), 50);
            }
        });
        this.context.config.watch("chartConfig", function (name, oldVal, newVal) {
            self.domNode.innerHTML = "";
            self.renderChart();

        });

        this.destroyRecursive =function () {
            this.fc.dispose();
        }
        this.getDefaultConfig = function () {
            return defaultConfig = {
                chartConfig:
                    {
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

    }
});
