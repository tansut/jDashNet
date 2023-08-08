{
    JQPPresets: [
		{
		    chartConfig:
				{
				    config: {
				        title: 'New Year Expectations',
				        series: [{ renderer: "#$.jqplot.BarRenderer#" }],
				        axesDefaults: {
				            tickRenderer: "#$.jqplot.CanvasAxisTickRenderer#",
				            tickOptions: {
				                angle: -30,
				                fontSize: '10pt'
				            }
				        },
				        axes: {
				            xaxis: {
				                renderer: "#$.jqplot.CategoryAxisRenderer#"
				            }
				        }
				    },
				    data: [[['Cup Holder Pinion Bob', 7], ['Generic Fog Lamp', 9], ['HDTV Receiver', 15],
					['8 Track Control Module', 12], [' Sludge Pump Fourier Modulator', 3],
					['Transcender/Spice Rack', 6], ['Hair Spray Danger Indicator', 18]]]
				}
		},
		{
		    chartConfig:
				{
				    config: {
				        title: 'Target Sales',
				        series: [{ renderer: "#$.jqplot.BarRenderer#" }, { xaxis: 'x2axis', yaxis: 'y2axis' }],
				        axesDefaults: {
				            tickRenderer: "#$.jqplot.CanvasAxisTickRenderer#",
				            tickOptions: {
				                angle: 30
				            }
				        },
				        axes: {
				            xaxis: {
				                renderer: "#$.jqplot.CategoryAxisRenderer#"
				            },
				            x2axis: {
				                renderer: "#$.jqplot.CategoryAxisRenderer#"
				            },
				            yaxis: {
				                autoscale: true
				            },
				            y2axis: {
				                autoscale: true
				            }
				        }
				    },
				    data: [[['Cup Holder Pinion Bob', 7], ['Generic Fog Lamp', 9], ['HDTV Receiver', 15],
							['8 Track Control Module', 12], [' Sludge Pump Fourier Modulator', 3],
							['Transcender/Spice Rack', 6], ['Hair Spray Danger Indicator', 18]],
							[['Nickle', 28], ['Aluminum', 13], ['Xenon', 54], ['Silver', 47],
							['Sulfer', 16], ['Silicon', 14], ['Vanadium', 23]]]
				}
		},
		{
		    chartConfig:
				{

				    config: {
				        title: 'Marketing Activities',
				        seriesDefaults: {
				            renderer: "#jQuery.jqplot.PieRenderer#",
				            rendererOptions: {
				                showDataLabels: true
				            }
				        },
				        legend: { show: true, location: 'e' }
				    },
				    data: [[
					['Heavy Industry', 12], ['Retail', 9], ['Light Industry', 14],
					['Out of home', 16], ['Commuting', 7], ['Orientation', 9]
				    ]]
				}
		},
		{
		    chartConfig:
				{
				    config: {
				        title: 'Student Counts',
				        seriesDefaults: {
				            renderer: "#$.jqplot.DonutRenderer#",
				            rendererOptions: {
				                sliceMargin: 3,
				                startAngle: -90,
				                showDataLabels: true,
				                dataLabels: 'value'
				            }
				        }
				    },
				    data: [[['a', 6], ['b', 8], ['c', 14], ['d', 20]], [['a', 8], ['b', 12], ['c', 6], ['d', 9]]]
				}
		},
	{
	    chartConfig:
			{
			    config: {
			        title: 'Car Compare',
			        seriesDefaults: {
			            renderer: "#$.jqplot.BubbleRenderer#",
			            rendererOptions: {
			                bubbleGradients: true
			            },
			            shadow: true
			        }
			    },
			    data: [[[11, 123, 1236, "Acura"], [45, 92, 1067, "Alfa Romeo"],
					[24, 104, 1176, "AM General"], [50, 23, 610, "Aston Martin Lagonda"],
					[18, 17, 539, "Audi"], [7, 89, 864, "BMW"], [2, 13, 1026, "Bugatti"]]]
			}
	},
    	{
    	    chartConfig:
                {
                    config: {
                        title: 'Daily Power Request',
                        seriesDefaults: {
                            renderer: "#$.jqplot.MeterGaugeRenderer#",
                            rendererOptions: {
                                min: 100,
                                max: 500,
                                intervals: [200, 300, 400, 500],
                                intervalColors: [' #66cc66', ' #93b75f', ' #E7E658', ' #cc6666']
                            }
                        }
                    },
                    data: [[322]]
                }
    	}
        ,
            	{
            	    chartConfig:
                        {
                            config: {
                                title: 'Average Network Speed',
                                seriesDefaults: {
                                    renderer: "#$.jqplot.MeterGaugeRenderer#",
                                    rendererOptions: {
                                        label: 'MB/s',
                                    }
                                }
                            },
                            data: [[322]]
                        }
            	},
                {
                    chartConfig:
                        {
                            config: {
                                title: 'Available Resources',
                                seriesDefaults: {
                                    renderer: "#$.jqplot.MeterGaugeRenderer#",
                                    rendererOptions: {
                                        label: 'Tons',
                                        min: 0,
                                        max: 100,
                                        needleThickness:1,
                                        ringColor: 'Black',
                                        labelPosition:'bottom',
                                        intervals: [10, 100],
                                        intervalColors: [' #FF3300',' #66cc66']
                                    }
                                }
                            },
                            data: [[15]]
                        }
                }

    ]
}