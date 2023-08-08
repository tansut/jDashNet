{
    JQPPresets: [
		{
		    chartConfig:
                {
                    config: {
                        type: 'Column3D',
                        width: '100%',
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
		},
		{
		    chartConfig:
                {
                    config: {
                        type: 'Pie3D',
                        width: '100%',
                        height: '300',
                        debugMode: false
                    },
                    data: {
                        "chart":
                        {
                            "caption": "Age Range",
                            "xAxisName": "Week",
                            "yAxisName": "Sales",
                            "numberPrefix": "%"
                        },
                        "data":
                        [
                                { "label": "15-18", "value": "15" },
                                { "label": "18-25", "value": "35" },
                                { "label": "25-30", "value": "30" },
                                { "label": "30+", "value": "20" }
                        ]
                    }
                }
		},
		{
		    chartConfig:
                {
                    config: {
                        type: 'Bubble',
                        width: '100%',
                        height: '300',
                        debugMode: false
                    },
                    data: {
                        "chart": {
                            "caption": "Service And Stickiness",
                            "palette": "3",
                            "numberprefix": "$",
                            "is3d": "1",
                            "xaxismaxvalue": "100",
                            "showplotborder": "0",
                            "xaxisname": "Stickiness",
                            "yaxisname": "Cost Per Service",
                            "chartrightmargin": "30"
                        },
                        "categories": [{
                            "category": [{
                                "label": "0%",
                                "x": "0"
                            },
                              {
                                  "label": "20%",
                                  "x": "20",
                                  "showverticalline": "1"
                              },
                              {
                                  "label": "40%",
                                  "x": "40",
                                  "showverticalline": "1"
                              },
                              {
                                  "label": "60%",
                                  "x": "60",
                                  "showverticalline": "1"
                              },
                              {
                                  "label": "80%",
                                  "x": "80",
                                  "showverticalline": "1"
                              },
                              {
                                  "label": "100%",
                                  "x": "100",
                                  "showverticalline": "1"
                              }
                            ]
                        }
                        ],
                        "dataset": [{
                            "showvalues": "0",
                            "data": [{
                                "x": "30",
                                "y": "1.3",
                                "z": "116",
                                "name": "Traders"
                            },
                              {
                                  "x": "32",
                                  "y": "3.5",
                                  "z": "99",
                                  "name": "Farmers"
                              },
                              {
                                  "x": "8",
                                  "y": "2.1",
                                  "z": "33",
                                  "name": "Individuals"
                              },
                              {
                                  "x": "62",
                                  "y": "2.5",
                                  "z": "72",
                                  "name": "Medium Business Houses"
                              },
                              {
                                  "x": "78",
                                  "y": "2.3",
                                  "z": "55",
                                  "name": "Corporate Group A"
                              },
                              {
                                  "x": "75",
                                  "y": "1.4",
                                  "z": "58",
                                  "name": "Corporate Group C"
                              },
                              {
                                  "x": "68",
                                  "y": "3.7",
                                  "z": "80",
                                  "name": "HNW Individuals"
                              },
                              {
                                  "x": "50",
                                  "y": "2.1",
                                  "z": "105",
                                  "name": "Small Business Houses"
                              }
                            ]
                        }
                        ],
                        "trendlines": {
                            "line": [{
                                "startvalue": "2.5",
                                "istrendzone": "0",
                                "displayvalue": "Median Cost",
                                "color": "0372AB"
                            }
                            ]
                        },
                        "vtrendlines": {
                            "line": [{
                                "startvalue": "0",
                                "endvalue": "60",
                                "istrendzone": "1",
                                "displayvalue": "Potential Wins",
                                "color": "663333",
                                "alpha": "10"
                            },
                              {
                                  "startvalue": "60",
                                  "endvalue": "100",
                                  "istrendzone": "1",
                                  "displayvalue": "Cash Cows",
                                  "color": "990099",
                                  "alpha": "5"
                              }
                            ]
                        }
                    }
                }
		},
        {
            chartConfig:
                {
                    config: {
                        type: 'Column2D',
                        width: '100%',
                        height: '300',
                        debugMode: false
                    },
                    data: {
                        "chart": {
                            "caption": "Monthly Sales Summary",
                            "subcaption": "For the year 2006", "xaxisname": "Month",
                            "yaxisname": "Sales", "numberprefix": "$"
                        },
                        "data": [
                          { "label": "January", "value": "17400" },
                          { "label": "February", "value": "19800" },
                          { "label": "March", "value": "21800" },
                          { "label": "April", "value": "23800" },
                          { "label": "May", "value": "29600" },
                          { "label": "June", "value": "27600" },
                          { "vline": "true", "color": "FF5904", "thickness": "2" },
                          { "label": "July", "value": "31800" },
                          { "label": "August", "value": "39700" },
                          { "label": "September", "value": "37800" },
                          { "label": "October", "value": "21900" },
                          { "label": "November", "value": "32900" },
                          { "label": "December", "value": "39800" }
                        ],

                        "trendlines": {
                            "line": [
                              {
                                  "startvalue": "22000", "color": "00cc00",
                                  "displayvalue": "Average"
                              }
                            ]
                        },

                        "styles": {
                            "definition": [
                              {
                                  "name": "CanvasAnim",
                                  "type": "animation",
                                  "param": "_xScale",
                                  "start": "0",
                                  "duration": "1"
                              }
                            ],
                            "application": [
                              {
                                  "toobject": "Canvas",
                                  "styles": "CanvasAnim"
                              }
                            ]
                        }
                    }
                }
        },
                {
                    chartConfig:
                        {
                            config: {
                                type: 'Doughnut3D',
                                width: '100%',
                                height: '300',
                                debugMode: false
                            },
                            data: {
                                "chart": {
                                    "yaxisname": "Sales Figure",
                                    "caption": "Top 5 Sales Person",
                                    "numberprefix": "$",
                                    "useroundedges": "1",
                                    "bgcolor": "FFFFFF,FFFFFF",
                                    "showborder": "0",
                                    "basefontsize": "11"
                                },
                                "data": [{
                                    "label": "Alex",
                                    "value": "25000"
                                },
                                  {
                                      "label": "Mark",
                                      "value": "35000"
                                  },
                                  {
                                      "label": "David",
                                      "value": "42300",
                                      "displayvalue": "Yearly best, $42.3K"
                                  },
                                  {
                                      "label": "Graham",
                                      "value": "35300"
                                  },
                                  {
                                      "label": "John",
                                      "value": "31300"
                                  }
                                ]
                            }
                        }
                }
,
                {
                    chartConfig:
                        {
                            config: {
                                type: 'Cylinder',
                                width: '100%',
                                height: '650',
                                debugMode: false
                            },
                            data: { "chart": { "palette": "3", "caption": "Total Fuel Supply", "lowerlimit": "0", "upperlimit": "4000", "numbersuffix": " ltrs.", "bgcolor": "FFFFFF" }, "value": "2578" }
                        }
                }


    ]
}