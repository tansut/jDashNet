define(["require"], function (require) {
    return function (params) {
        this.context = params.context;
        this.domNode = document.createElement("div");
        this.domNode.align = "center";
        this.defaultChartData = function () {
            return {
                chart: {

                },

                title: {

                    text: 'Market shares for a website'

                },

                plotOptions: {

                    pie: {

                        allowPointSelect: true,

                        cursor: 'pointer',

                        dataLabels: {

                            enabled: true,

                            color: '#000000',

                            connectorColor: '#000000',

                            formatter: function () {

                                return '<b>' + this.point.name + '</b>: ' + this.percentage + ' %';

                            }

                        }

                    }

                },

                series: [{

                    type: 'pie',

                    name: 'Browser share',

                    data: [

                        ['Firefox', 45.0],

                        ['IE', 26.8],

                        {

                            name: 'Chrome',

                            y: 12.8,

                            sliced: true,

                            selected: true

                        },

                        ['Safari', 8.5],

                        ['Opera', 6.2],

                        ['Others', 0.7]

                    ]

                }]
            }
        },


        this.refresh = function (redrawOnly, newHeight) {
            if (redrawOnly && this.chart) {
                var size = this.context.pane.getDashletSize();
                this.domNode.parentElement.style.height = this.domNode.style.height;
                this.chart.setSize(size.w == 0 ? 300 : size.w, size.h == 0 ? 300 : newHeight, false);
                this.context.domStyle.set(this.domNode, "display", "");
                this.createChart();
            } else this.createChart();
        }

        this.createChart = function (initialData) {

            var self = this;

                        if (self.chart) {
                self.chart.destroy();
                delete self.chart;
            }

            self.context.domStyle.set(self.domNode, "display", "");

            var size = self.context.pane.getDashletSize();
            //if (size.h == 0)
            //    size.h = size.w;
            var config = self.context.config.get("chartData");
            var chartData = initialData || config;

            try {
                chartData = (chartData ? eval("(" + chartData + ")") : null);
            } catch (e) {
                chartData = null;
            }

            if (!chartData) {
                chartData = self.defaultChartData();
                self.context.config["chartData"] = JSON.stringify(chartData);
            }

            var chart = chartData.chart || {};

            chartData.chart = self.context.lang.mixin(chart, {
                renderTo: self.domNode,
                height: size.h == 0 ? 300 : size.h,
                width: size.w == 0 ? 300 : size.w,
                reflow: false
            });


            try {
                self.chart = new Highcharts.Chart(chartData);
            } catch (e) {
            }

        },

        this.destroyRecursive = function () {
            this.context.unloadResource(require.toUrl("./resources/dashlet.css"));
            if (this.chart) {
                this.chart.destroy();
                delete this.chart;
            }
        }

        this.set = function (name, value) {
            if (name == "chartData") {
                this.createChart(value);
            }
        }

        this.startup = function () {
            var self = this;

            this.context.setBusy("Loading chart library");
            this.context.loadResource(require.toUrl("./resources/dashlet.css"));
            var path = require.toUrl("./resources/highcharts.js");

            require([path], function () {

                if (!self.constructor.defaultOptions)
                    self.constructor.defaultOptions = Highcharts.getOptions();

                self.createChart();
                self.context.clearBusy();

            }, function () {
                self.context.clearBusy();
            });


            this.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
                if (event.sender == this) {
                    var newHeight = event.args.height;
                    setTimeout(self.refresh(true, newHeight), 50);
                }
            });

            this.context.subscribe('jdash/dashlet/visualStateChanging', function (event) {
                if (event.sender == this) {
                    var size = self.context.pane.getDashletSize();
                    event.args.height = size.h;
                    self.context.domStyle.set(self.domNode, "display", "none");
                }
            });

            this.context.subscribe('klt/viewport/resized', function (event) {
                var size = self.context.pane.getDashletSize();
                self.refresh(true, size.h);
            });

            this.context.subscribe("jdash/layout/dnd/dropped", function (event) {
                if (self.context.pane == event.args.pane) {
                    var size = self.context.pane.getDashletSize();
                    self.refresh(true, size.h);
                }
            });

        }
    }
});