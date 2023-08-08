define(["./templates",
        "./scripts/Chart.min.js"],
        function (templates) {
            return {
                chartType: function () {
                    return this.context.config.get("model") ?
                        this.context.config.get("model").ChartType : "Line";
                },

                chartData: function () {
                    return this.context.config.get("model") ?
                        this.$json.parse(this.context.config.get("model").ChartData) : templates["Line"];
                },

                refresh: function () {
                    this.$construct(this.context, 'refresh');
                },

                setChartSize: function (canvas) {
                    size = this.context.getDashletSize();
                    this.$style.set(this.domNode, "height", Math.max(size.h, 300) + "px");
                    canvas.width = size.w;
                    canvas.height = Math.max(size.h, 300);
                },

                drawChart: function () {
                    var canvas = this.$get("canvas");
                    this.setChartSize(canvas);
                    var ctx = canvas.getContext("2d");
                    var type = this.chartType();
                    var data = this.chartData();
                    var chartObj = new Chart(ctx);
                    this.chart = chartObj[type].apply(chartObj, [data]);
                },

                resize: function (event) {
                    this.drawChart();
                },


                initialize: function (context, viewNode) {
                    this.drawChart();
                }
            }
        }
)