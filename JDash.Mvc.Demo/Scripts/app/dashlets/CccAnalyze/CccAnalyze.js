define([
    "require"
    , "dojo/_base/lang"

], function (require, lang) {
    return function (params) {

        params.context.pane.containerNode.parentNode.style.padding = "0 0 0 0";
        this.context = params.context;
        this.domNode = document.createElement("div");
        this.domNode.id = "ccc_" + this.context.pane.domNode.id;
        this.cccChartPath = require.toUrl("./resources/ccc.js");
        this.startup = function () {
            var self = this;
            require([self.cccChartPath], function () {
                setTimeout(lang.hitch(self, self.renderChart));
            });
        }
        var self = this;
        this.renderChart = function () {


            //      if (!this.context.config.chartConfig) {
            //          var data = configData.chartConfig.data;
            var settings = this.context.config;

            //      var configData = this.context.config;
            this.context.dashboard.provider.callMethod('Analyze/Create', [{ mdx: settings.mdx, connectionName: settings.connection }], 'add').then(function (result) {
                self.processData({ data: result });
                var size = self.context.pane.getBodySize();
                var options = lang.mixin({
                    canvas: self.domNode.id,
                    width: size.w < 300 ? 300 : size.w,
                    height: size.h < 300 ? 300 : size.h,
                    yAxisSize: 70,
                    orientation: 'vertical',
                    stacked: false,
                    animate: false,
                    showValues: false,
                    legend: true,
                    legendPosition: "top",
                    legendAlign: "right",
                    colors: ["#B40010", "#CCC8B4", "#DDB965", "#72839D", "#1D2D40"],
                    type: 'BarChart'
                }, self.options);

                

                if (options.type == "HeatGridChart") {
                    options = lang.mixin({
                        canvas: self.id,
                        width: size.w,
                        height: size.h,
                        animate: false,
                        clickable: false,
                        orientation: "horizontal",
                        showValues: false,
                        showXScale: true,
                        xAxisPosition: "bottom",
                        showYScale: true,
                        panelSizeRatio: 0.8,
                        yAxisPosition: "left",
                        yAxisSize: 150,
                        minColor: "#FEDFE1",
                        maxColor: "#F11929",
                        extensionPoints: {
                            xAxisLabel_textAngle: -(Math.PI / 2),
                            xAxisLabel_textAlign: "right",
                            xAxisLabel_bottom: 10
                        }
                    }, self.options);
                }

                options.type = self.context.config.chart;

                if (self.data.resultset.length > 5) {
                    options.extensionPoints = {
                        xAxisLabel_textAngle: -(Math.PI / 2),
                        xAxisLabel_textAlign: "right",
                        xAxisLabel_bottom: 10
                    };

                    options.xAxisSize = 100;
                }

                self.chart = new pvc[options.type](options);

                self.chart.setData(self.data, {
                    crosstabMode: true,
                    seriesInRows: false
                });

                try {
                    self.chart.render();
                } catch (e) {
                    alert("Could not render chart");
                }
            });

            //  }


        }
        this.refresh = function (redrawOnly, newHeight) {
            this.domNode.innerHTML = "";
            this.renderChart();
        }

        this.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
            if (event.sender == self.context) {
                setTimeout(lang.hitch(self, self.refresh), 50);
            }
        });
        this.context.config.watch("chart", function (name, oldVal, newVal) {
            self.refresh();

        });

        this.destroyRecursive = function () {
            this.domNode.innerHTML = "";
        }

        this.processData = function (args) {
            this.data = {};
            this.data.resultset = [];
            this.data.metadata = [];
            this.data.height = 0;
            this.data.width = 0;

            if (args.data.Cellset && args.data.Cellset.length > 0) {

                var lowest_level = 0;

                for (var row = 0; row < args.data.Cellset.length; row++) {
                    if (args.data.Cellset[row][0].Type == "ROW_HEADER_HEADER") {
                        this.data.metadata = [];
                        for (var field = 0; field < args.data.Cellset[row].length; field++) {
                            if (args.data.Cellset[row][field].Type == "ROW_HEADER_HEADER") {
                                this.data.metadata.shift();
                                lowest_level = field;
                            }

                            this.data.metadata.push({
                                colIndex: field,
                                colType: typeof (args.data.Cellset[row + 1][field].Value) !== "number" &&
                                    isNaN(args.data.Cellset[row + 1][field].Value
                                    .replace(/[^a-zA-Z 0-9.]+/g, '')) ? "String" : "Numeric",
                                colName: args.data.Cellset[row][field].Value
                            });
                        }
                    } else if (args.data.Cellset[row][0].Value !== "null" && args.data.Cellset[row][0].Value !== "") {
                        var record = [];
                        this.data.width = args.data.Cellset[row].length;
                        for (var col = lowest_level; col < args.data.Cellset[row].length; col++) {
                            var value = args.data.Cellset[row][col].Value;
                            if (args.data.Cellset[row][col].Properties.raw && args.data.Cellset[row][col].Properties.raw !== "null") {
                                value = parseFloat(args.data.Cellset[row][col].Properties.raw);
                            } else if (typeof (args.data.Cellset[row][col].Value) !== "number" &&
                                parseFloat(args.data.Cellset[row][col].Value.replace(/[^a-zA-Z 0-9.]+/g, ''))) {
                                value = parseFloat(args.data.Cellset[row][col].Value.replace(/[^a-zA-Z 0-9.]+/g, ''));
                            }
                            if (col == lowest_level) {
                                value += " [" + row + "]";
                            }
                            record.push(value);
                        }
                        this.data.resultset.push(record);
                    }
                }
                this.data.height = this.data.resultset.length;
            } else {
                this.domNode.innerHTML = "";
            }
        }

    }
});
