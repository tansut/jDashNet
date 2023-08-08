define(["require", "klt/core/Deferred",  "../../Resource/JavaScript/hcThemes/gray",
"../../Resource/JavaScript/hcThemes/green", "../../Resource/JavaScript/hcThemes/blue", "../../Resource/JavaScript/hcThemes/default"],
function (require, Deferred, grayTheme, greenTheme, blueTheme, defaultTheme) {
    return function (params, node) {
        var context = this.context = params.context;
        var domNode = this.domNode = node || document.createElement("div");

        var dashletNode = this.dashletNode = document.createElement("div");
        domNode.appendChild(dashletNode);

        var libDefer = new Deferred();

        this._handleDomUpdate = function (newNode, insideOnly) {
            if (!insideOnly)
                domNode = this.domNode = newNode;
            domNode.appendChild(dashletNode);
        }

        this._handleDomUpdating = function () {
            this.domNode.removeChild(this.dashletNode);
        }


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
                this.chart.setSize(size.w == 0 ? 300 : size.w, size.h == 0 ? 400 : newHeight, false);
                this.context.fn.domStyle.set(this.dashletNode, "display", "");
                this.createChart();
            } else this.createChart();
        }


        this.setOptions = function (value) {
            this.context.config.set("preset", value.data);
            this.context.config.set("theme", value.theme);
            this.createChart();
        }

        this.createChart = function () {
            var self = this;
            libDefer.then(function () {
                if (self.chart) {
                    self.chart.destroy();
                    delete self.chart;
                }

                var size = self.context.pane.getDashletSize();

                var config = self.context.config.get("preset");
                var chartData = config;

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

                chartData.chart = self.context.fn.lang.mixin(chart, {
                    renderTo: self.dashletNode,
                    height: size.h == 0 ? 400 : size.h,
                    width: size.w == 0 ? 300 : size.w,
                    reflow: false
                });


                var theme = self.context.config["theme"];
                try {
                    theme = eval("(" + theme + "Theme)");
                    
                } catch (e){
                    theme = defaultTheme;
                }
                Highcharts.setOptions(theme);
                self.chart = new Highcharts.Chart(chartData);
            });
        },

        this.destroyRecursive = function () {
            if (this.chart) {
                this.chart.destroy();
                delete this.chart;
            }
        }



        this.getNow = function () {
            var now = new Date();

            return {
                hours: now.getHours() + now.getMinutes() / 60,
                minutes: now.getMinutes() * 12 / 60 + now.getSeconds() * 12 / 3600,
                seconds: now.getSeconds() * 12 / 60
            };
        };

        this.startup = function () {
            var self = this;

            this.context.setBusy("Loading chart library");

            var path = require.toUrl("../../Resource/JavaScript/highcharts.js");
            var jqpath = require.toUrl("../../Resource/JavaScript/jquery.js");



            function buildChart() {
                if (!self.constructor.defaultOptions)
                    self.constructor.defaultOptions = Highcharts.getOptions();

                libDefer.resolve();
                self.createChart();
                self.context.clearBusy();
            }

            if (typeof jQuery != "undefined") {
                require([path], function () {
                    buildChart();

                }, function () {
                    self.context.clearBusy();
                });
            } else

                require([jqpath], function () {
                    require([path], function () {
                        buildChart();

                    }, function () {
                        self.context.clearBusy();
                    });

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
                    self.context.fn.domStyle.set(self.dashletNode, "display", "none");
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
            
            this.publishEvent = function (event) {
                self.context.publish('jdash/layout/changed',event);
            }
        }
    }
});


