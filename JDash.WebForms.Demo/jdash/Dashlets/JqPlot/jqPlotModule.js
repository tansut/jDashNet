
define(["require"], function (require) {
    return function (params) {

        var context = this.context = params.context;
        var domNode = this.domNode =  document.createElement("div");
        this.preset = params.preset;
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

        lang = context.fn.lang;

        this.dashletNode.setAttribute("id", "plot_" + this.context.pane.id);
        this.toolTip = document.createElement("div");
        this.jplotPath = require.toUrl("./resources/JqPlot/jquery.jqplot.min.js");
        
        this.jplotCssPath = require.toUrl("./resources/JqPlot/jqPlot.css");
        this.canvasTextRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.canvasTextRenderer.min.js");
        this.canvasAxisTickRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.canvasAxisTickRenderer.min.js");
        this.categoryAxisRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.categoryAxisRenderer.min.js");
        this.barRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.barRenderer.min.js");
        this.pieRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.pieRenderer.min.js");
        this.bubbleRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.bubbleRenderer.min.js");
        this.dateAxisRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.dateAxisRenderer.min.js");
        this.ohlcRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.ohlcRenderer.min.js");
        this.highlighterPath = require.toUrl("./resources/JqPlot/plugins/jqplot.highlighter.min.js");
        this.BezierCurveRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.BezierCurveRenderer.min.js");
        this.blockRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.blockRenderer.min.js");
        this.canvasOverlayPath = require.toUrl("./resources/JqPlot/plugins/jqplot.canvasOverlay.min.js");
        this.donutRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.donutRenderer.min.js");
        this.funnelRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.funnelRenderer.min.js");
        this.logAxisRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.logAxisRenderer.min.js");
        this.mekkoRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.mekkoRenderer.min.js");
        this.meterGaugeRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.meterGaugeRenderer.min.js");
        this.pointLabelsPath = require.toUrl("./resources/JqPlot/plugins/jqplot.pointLabels.min.js");
        this.pyramidAxisRenderersPath = require.toUrl("./resources/JqPlot/plugins/jqplot.pyramidAxisRenderer.min.js");
        this.pyramidGridRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.pyramidGridRenderer.min.js");
        this.pyramidRendererPath = require.toUrl("./resources/JqPlot/plugins/jqplot.pyramidRenderer.min.js");


        var self = this;

        this.context.loadResource(this.jplotCssPath, "css");
        
        this.startup = function () {
            var self = this;
            require([self.jplotPath], function () {

                self.context.subscribe("jdash/layout/dnd/dropped", function (event) {
                    if (self.context.pane == event.args.pane) {
                        self.refresh();
                    }
                });

                setTimeout(lang.hitch(self, self.renderChart));
            });
        }

        this.getDefaultChart = function () {

        }

        this.context.config.watch("chartConfig", function (name, oldVal, newVal) {
            self.dashletNode.innerHTML = "";
            self.renderChart();
            
        });

        this.updateChars = function () {

        }



        this.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
            if (event.sender == self.context) {
                setTimeout(lang.hitch(self, self.renderChart), 150);
                setTimeout(lang.hitch(self, self._reTuneLayout), 200);
            }
        });

        this.context.subscribe('klt/viewport/resized', function (event) {

            self.renderChart();
            self._reTuneLayout();
        });

        this._reTuneLayout = function () {
            this.dashletNode.parentElement.style.height = this.dashletNode.style.height;
        }


        this._getRequiredPaths = function () {
            var paths = [this.canvasTextRendererPath, this.canvasOverlayPath, this.pointLabelsPath];
            if (!self.context.config.chartConfig && !this.configData) {
                paths.push(this.barRendererPath);
                paths.push(this.canvasAxisTickRendererPath);
                paths.push(this.categoryAxisRendererPath);
                return paths;
            }

            var configString = this.configData || JSON.stringify(this.context.config.chartConfig.config);
            if (configString.indexOf("CategoryAxisRenderer") > -1)
                paths.push(this.categoryAxisRendererPath);
            if (configString.indexOf("PieRenderer") > -1)
                paths.push(this.pieRendererPath);
            if (configString.indexOf("BarRenderer") > -1)
                paths.push(this.barRendererPath);
            if (configString.indexOf("BubbleRenderer") > -1)
                paths.push(this.bubbleRendererPath);
            if (configString.indexOf("CanvasAxisTickRenderer") > -1)
                paths.push(this.canvasAxisTickRendererPath);
            if (configString.indexOf("DateAxisRenderer") > -1)
                paths.push(this.dateAxisRendererPath);
            if (configString.indexOf("OhlcRenderer") > -1)
                paths.push(this.ohlcRendererPath);
            if (configString.indexOf("Highlighter") > -1)
                paths.push(this.highlighterPath);
            if (configString.indexOf("BezierCurveRenderer") > -1)
                paths.push(this.BezierCurveRendererPath);
            if (configString.indexOf("BlockRenderer") > -1)
                paths.push(this.blockRendererPath);
            if (configString.indexOf("DonutRenderer") > -1)
                paths.push(this.donutRendererPath);
            if (configString.indexOf("FunnelRenderer") > -1)
                paths.push(this.funnelRendererPath);
            if (configString.indexOf("LogAxisRenderer") > -1)
                paths.push(this.logAxisRendererPath);
            if (configString.indexOf("MekkoRenderer") > -1)
                paths.push(this.mekkoRendererPath);
            if (configString.indexOf("MeterGaugeRenderer") > -1)
                paths.push(this.meterGaugeRendererPath);
            if (configString.indexOf("MeterGaugeRenderer") > -1)
                paths.push(this.meterGaugeRendererPath);
            if (configString.indexOf("PyramidAxisRenderer") > -1)
                paths.push(this.pyramidAxisRenderersPath);
            if (configString.indexOf("PyramidGridRenderer") > -1)
                paths.push(this.pyramidGridRendererPath);
            if (configString.indexOf("PyramidRenderer") > -1)
                paths.push(this.pyramidRendererPath);

            return paths;
        }
        this.bind = function (config) {
            this.configData = config;
            var s = JSON.stringify(config);            
            this.renderChart();
        }
        this._clearStringfy= function (stringfy) {
            while (stringfy.indexOf("\"#") > -1 || stringfy.indexOf("#\"") > -1)
                stringfy = stringfy.replace("\"#", "").replace("#\"", "");
            return stringfy;
        }
        this.renderChart = function (type) {
            if (!$.jqplot) return;

            this.dashletNode.innerHTML = "";
            var self = this;
            require(self._getRequiredPaths(), function () {
                if(self.configData)
                    self.context.config.chartConfig = eval('(' + self._clearStringfy(self.configData)+ ')')[0];

                var configData = !self.context.config.chartConfig ? self.getDefaultConfig() : self.context.config;

                    var data = configData.chartConfig.data;
                    var settings = configData.chartConfig.config;

                    var size = self.context.pane.getDashletSize();
                    var height = "300px";
                    if (size.h > 0)
                        height = size.h + "px";
                    context.fn.domStyle.set(self.dashletNode, "height", height);
                    self.plot = $.jqplot(self.dashletNode.id, data, settings);
            });

        }
        this.refresh = function (redrawOnly, newHeight) {
            this.plot.destroy();
            this.renderChart();
        }
        this.destroyRecursive = function () {
            this.plot.destroy();
            
        }

        this.getDefaultConfig = function () {
            return defaultConfig = {
                chartConfig:
                    {
                        config: {
                            title: 'Bar Chart',
                            series: [{ renderer: $.jqplot.BarRenderer }],
                            axesDefaults: {
                                tickRenderer: $.jqplot.CanvasAxisTickRenderer,
                                tickOptions: {
                                    angle: -30,
                                    fontSize: '10pt'
                                }
                            },
                            axes: {
                                xaxis: {
                                    renderer: $.jqplot.CategoryAxisRenderer
                                }
                            }
                        },
                        data: [[['Cup Holder Pinion Bob', 7], ['Generic Fog Lamp', 9], ['HDTV Receiver', 15],
                        ['8 Track Control Module', 12], [' Sludge Pump Fourier Modulator', 3],
                        ['Transcender/Spice Rack', 6], ['Hair Spray Danger Indicator', 18]]]
                    }
            }
        }

    }
});
