
define([
    "require",
     "dojo/_base/lang",
    "dojox/charting/axis2d/Default",
     "dojox/charting/Chart",
    "dojox/charting/widget/Legend",
     "dojox/charting/themes/Claro"
], function (require, lang, Default, Chart, Legend, Claro) {
    return function (params) {

        params.context.pane.containerNode.parentNode.style.padding = "0 0 0 0";
        params.context.pane.containerNode.parentNode.style.overflow = "hidden";
        this.context = params.context;
        this.domNode = document.createElement("div");
        this.chartNode = document.createElement("div");
        this.LegendNode = document.createElement("div");
        this.chartNode.setAttribute("id", "dc_" + this.context.pane.id);
        this.LegendNode.setAttribute("id", "dcl_" + this.context.pane.id);
        this.domNode.appendChild(this.chartNode);
        this.domNode.appendChild(this.LegendNode);
        this.context.loadResource(require.toUrl("./resources/dojoChart.css"));
        var self = this;

        this.startup = function () {
            var self = this;
            this.context.subscribe("jdash/layout/dnd/dropped", function (event) {
                if (self.context.pane == event.args.pane) {
                    self.refresh();
                }
            });
           
            setTimeout(lang.hitch(self, self.renderChart));
        }

        this.getDefaultChart = function () {

        }

        this.context.config.watch("chartConfig", function (name, oldVal, newVal) {
            setTimeout(lang.hitch(self, self.renderChart));
   
        });

        this.updateChars = function () {

        }
        this.refresh = function (redrawOnly, newHeight) {
            this.clearCharts();
            this.renderChart();
        }

        this.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
            if (event.sender == self.context) {
                setTimeout(lang.hitch(self, self.renderChart),250);
            }
        });

        this.context.subscribe('klt/viewport/resized', function (event) {
                setTimeout(lang.hitch(self, self.renderChart), 250);            
        });

        this.clearCharts=function(){
            if (this.chart) {
                this.chart.destroy();
                this.chart = null;
            }
            if (this.legend) {
                this.legend.destroyRecursive();
                this.legend = null;
            }
        }



        this.renderChart = function (type) {
            
            var presetId = !this.context.config.chartConfig ? 1 : parseInt(this.context.config.chartConfig.selectedPreset);
       
            this.chartNode.style.paddingLeft = "0";
            this.clearCharts();
            
            this.chartNode.innerHTML = "";
            this.chartContainer = document.createElement("div");
            this.chartContainer.style.width = "100%";
            this.chartContainer.style.height = "100%";
            this.chartNode.appendChild(this.chartContainer);

            this.legendContainer = document.createElement("div");
            this.legendContainer.style.width = "100%";
            this.legendContainer.style.height = "100%";
            this.LegendNode.appendChild(this.legendContainer);
            self.chartNode.style.height = "";
            switch (presetId) {
                case 0:
                    require(["dojox/charting/action2d/Tooltip",
                            "dojox/charting/action2d/MoveSlice",
                            "dojox/charting/plot2d/Pie"], function (ToolTip, MoveSlice) {

                                var chartData = [{
                                    y: 12.1,
                                    text: "China"
                                }, {
                                    y: 9.52,
                                    text: "India"
                                }, {
                                    y: 3.01,
                                    text: "USA"
                                }, {
                                    y: 2.06,
                                    text: "Indonesia"
                                }, {
                                    y: 1.63,
                                    text: "Brazil"
                                }, {
                                    y: 1.48,
                                    text: "Russian"
                                }, {
                                    y: 1.29,
                                    text: "Pakistan"
                                }, {
                                    y: 1.25,
                                    text: "Japan"
                                }];

                                self.chart = new Chart(self.chartContainer);
                                self.chart.setTheme(Claro);
                                self.chart.addPlot("default", {
                                    type: "Pie",
                                    markers: true,
                                    labelOffset: -20
                                });
                                self.chart.addAxis("x");
                                self.chart.addAxis("y", { min: 5000, max: 30000, vertical: true, fixLower: "major", fixUpper: "major" });
                                self.chart.addSeries("Monthly Sales - 2010", dojo.map(chartData, function (item) {
                                    return { y: item.y, text: item.text + "(" + item.y + ")" };
                                }));
                                //  var tip = new ToolTip(self.chart, "default");
                                var mag = new MoveSlice(self.chart, "default");
                                self.chart.render();

                            });
                    break;
                case 1:
                    require(["dojox/charting/action2d/Highlight", "dojox/charting/plot2d/Columns", "dojox/charting/themes/MiamiNice"], function (Highlight,Columns, MiamiNice) {
                        var chartData = [10000, 9200, 11811, 12000, 7662, 13887, 14200, 12222, 12000, 10009, 11288, 12099];
                        self.chart = new Chart(self.chartContainer);
                        self.chart.setTheme(MiamiNice);
                        self.chart.addPlot("default", {
                            type: "Columns",
                            markers: true,
                            gap: 5
                        });
                        self.chart.addAxis("x", {
                            labels: [{ value: 1, text: "Jan" }, { value: 2, text: "Feb" },
                                { value: 3, text: "Mar" }, { value: 4, text: "Apr" },
                                { value: 5, text: "May" }, { value: 6, text: "Jun" },
                                { value: 7, text: "Jul" }, { value: 8, text: "Aug" },
                                { value: 9, text: "Sep" }, { value: 10, text: "Oct" },
                                { value: 11, text: "Nov" }, { value: 12, text: "Dec" }]
                        });
                        self.chart.addAxis("y", { vertical: true, fixLower: "major", fixUpper: "major" });
                        self.chart.addSeries("Monthly Sales", chartData);
                        new dojox.charting.action2d.Highlight(self.chart, "default");
                        self.chart.render();

                    });
                    break;
                case 2:
                    require(["dojox/charting/widget/SelectableLegend", "dojox/charting/plot2d/Spider", "dojox/charting/themes/PlotKit/blue"], function (SelectableLegend) {
                        self.chart = new Chart(self.chartContainer);
                        self.chart.setTheme(dojox.charting.themes.PlotKit.blue);
                        self.chart.addPlot("default", {
                            type: "Spider",
                            labelOffset: -10,
                            divisions: 7,
                            axisColor: "lightgray",
                            spiderColor: "silver",
                            seriesFillAlpha: 0.2,
                            spiderOrigin: 0.16,
                            markerSize: 3,
                            precision: 0,
                            spiderType: "polygon"
                        });
                        self.chart.addSeries("China", { data: { "GDP": 2, "area": 6, "population": 2000, "inflation": 15, "growth": 12 } }, { fill: "blue" });
                        self.chart.addSeries("France", { data: { "GDP": 6, "area": 15, "population": 500, "inflation": 5, "growth": 6 } }, { fill: "red" });
                        self.chart.addSeries("USA", { data: { "GDP": 3, "area": 20, "population": 1500, "inflation": 10, "growth": 3 } }, { fill: "green" });
                        self.chart.addSeries("Japan", { data: { "GDP": 4, "area": 2, "population": 1000, "inflation": 20, "growth": 2 } }, { fill: "yellow" });
                        self.chart.addSeries("Canada", { data: { "GDP": 1, "area": 18, "population": 300, "inflation": 3, "growth": 15 } }, { fill: "purple" });
                        self.chart.render();
                        self.legend = new SelectableLegend({ chart: self.chart, horizontal: true }, self.legendContainer);
                    });
                    break;
                case 3:
                    require(["dijit/form/Button", "dojox/gauges/GlossyCircularGauge"], function (Button, GlossyCircularGauge) {
                        
                        self.chart = new GlossyCircularGauge({
                            background: [255, 255, 255, 0],
                            title: 'Value',
                            width: self.chartContainer.offsetWidth,
                            value: 72,
                            height: 300
                        }, self.chartContainer);
                        self.chart.startup();
                    });
                    break;
                case 4:
                    require(["dojo/ready", "dojo/dom", "dojox/treemap/TreeMap",
                        "dojo/store/Memory", "dojox/color/MeanColorModel", "dojo/_base/Color"],
                        function (ready, dom, TreeMap, Memory, MeanColorModel, Color) {
                            self.chartNode.style.height = "500px";
                            var dataStore = new Memory({
                                idProperty: "label", data:
                                        [
                                            { label: "France", sales: 500, profit: 50, region: "EU" },
                                            { label: "Germany", sales: 450, profit: 48, region: "EU" },
                                            { label: "UK", sales: 700, profit: 60, region: "EU" },
                                            { label: "USA", sales: 2000, profit: 250, region: "America" },
                                            { label: "Canada", sales: 600, profit: 30, region: "America" },
                                            { label: "Brazil", sales: 450, profit: 30, region: "America" },
                                            { label: "China", sales: 500, profit: 40, region: "Asia" },
                                            { label: "Japan", sales: 900, profit: 100, region: "Asia" }
                                        ]
                            });
                            var colorModel = new MeanColorModel(new Color(Color.named.red), new Color(Color.named.green));

                            self.chart = new TreeMap({
                                store: dataStore,
                                areaAttr: "sales", colorAttr: "profit", groupAttrs: ["region"],
                                colorModel: colorModel
                            }, self.chartContainer);

                        }
                    );
                    break;

            }


        }

        this.destroyRecursive = function () {
            this.clearCharts();
        }

    }
});

