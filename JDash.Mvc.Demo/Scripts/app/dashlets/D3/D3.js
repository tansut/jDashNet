define([
    "require",
    "dojo/_base/lang"],
    function (require, lang) {
    return function (params) {

        params.context.pane.containerNode.parentNode.style.padding = "0 0 0 0";
        params.context.pane.containerNode.parentNode.style.overflow = "hidden";
        this.context = params.context;
        this.domNode = document.createElement("div");
        
        this.context.loadResource(require.toUrl("./resources/d3.css"), "css");

        this.startup = function () {
            var self = this;
            var D3Path = require.toUrl("./resources/D3.v2.min.js");
            var D3LayoutPath = require.toUrl("./resources/d3.layout.js");
            require([D3Path], function () {
                require([D3LayoutPath], function () {
                    self.renderSample();
                });
            });

            this.context.subscribe("jdash/layout/dnd/dropped", function (event) {
                if (self.context.pane == event.args.pane) {
                    self.renderSample();
                }
            });

        }

        this.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
            if (event.sender == self.context) {
                setTimeout(lang.hitch(self, self.renderSample), 250);
            }
        });
        this.context.subscribe('klt/viewport/resized', function (event) {
            setTimeout(lang.hitch(self, self.renderSample), 250);
        });
        this.clearClassList = function () {

            if (this.domNode.classList) {
                while (this.domNode.classList.length > 0) {
                    this.domNode.classList.remove(this.domNode.classList[0]);
                }
            } else
                this.domNode.className = "";

        }


        this.addClass = function (classToAdd) {
            if (this.domNode.classList) {
                this.domNode.classList.add(classToAdd);
            } else
                this.domNode.className += " " + classToAdd;
        }

        this.renderSample = function () {            
            var sampleID = !this.context.config.chartConfig ? 1 : parseInt(this.context.config.chartConfig.selectedPreset);
            this.domNode.innerHTML = "";
            var self = this;
            this.clearClassList();
            this.addClass("d3");
            switch (sampleID) {
                case 1:////////////////////////////////////////////////////////////////
                    self.addClass("s1");

                    function gear(d) {
                        var n = d.teeth,
                            r2 = Math.abs(d.radius),
                            r0 = r2 - 8,
                            r1 = r2 + 8,
                            r3 = d.ring ? (r3 = r0, r0 = r1, r1 = r3, r2 + 20) : 20,
                            da = Math.PI / n,
                            a0 = -Math.PI / 2 + (d.ring ? Math.PI / n : 0),
                            i = -1,
                            path = ["M", r0 * Math.cos(a0), ",", r0 * Math.sin(a0)];
                        while (++i < n) path.push(
                            "A", r0, ",", r0, " 0 0,1 ", r0 * Math.cos(a0 += da), ",", r0 * Math.sin(a0),
                            "L", r2 * Math.cos(a0), ",", r2 * Math.sin(a0),
                            "L", r1 * Math.cos(a0 += da / 3), ",", r1 * Math.sin(a0),
                            "A", r1, ",", r1, " 0 0,1 ", r1 * Math.cos(a0 += da / 3), ",", r1 * Math.sin(a0),
                            "L", r2 * Math.cos(a0 += da / 3), ",", r2 * Math.sin(a0),
                            "L", r0 * Math.cos(a0), ",", r0 * Math.sin(a0));
                        path.push("M0,", -r3, "A", r3, ",", r3, " 0 0,0 0,", r3, "A", r3, ",", r3, " 0 0,0 0,", -r3, "Z");
                        return path.join("");
                    }

                    d3.timer(function () {
                        var angle = (Date.now() - start) * speed,
                            transform = function (d) { return "rotate(" + angle / d.radius + ")"; };
                        svg.selectAll(".gear").attr("transform", transform);
                        svg.attr("transform", transform); // fixed ring
                    });

                    var w = this.domNode.offsetWidth,
                        h = Math.round(this.domNode.offsetWidth / 1.6),
                        r = Math.round(h / 10),
                        x = Math.sin(2 * Math.PI / 3),
                        y = Math.cos(2 * Math.PI / 3),
                        speed = 4,
                        start = Date.now();


                    var svg = d3.select(self.domNode).insert("svg:svg", "form")
                        .attr("width", w)
                        .attr("height", h)
                      .append("svg:g")
                        .attr("transform", "translate(" + w / 2 + "," + h / 2 + ")scale(.9)")
                      .append("svg:g")
                        .data([{ radius: r * 5 }]);

                    svg.append("svg:g")
                        .attr("class", "ring")
                        .data([{ teeth: 80, radius: -r * 5, ring: true }])
                      .append("svg:path")
                        .attr("class", "gear")
                        .attr("d", gear);

                    var sun = svg.append("svg:g")
                        .attr("class", "sun")
                        .data([{ teeth: 16, radius: r }])
                      .append("svg:g")
                        .attr("class", "gear");

                    sun.append("svg:path")
                        .attr("d", gear);

                    sun.append("svg:text")
                        .attr("x", r / 2 + 6)
                        .attr("dy", ".31em")
                        .attr("text-anchor", "middle")
                        .text("D3");

                    var planet1 = svg.append("svg:g")
                        .attr("class", "planet")
                        .attr("transform", "translate(0,-" + r * 3 + ")")
                        .data([{ teeth: 32, radius: -r * 2 }])
                      .append("svg:g")
                        .attr("class", "gear");

                    planet1.append("svg:path")
                        .attr("d", gear);

                    planet1.append("svg:text")
                        .attr("x", -r)
                        .attr("dy", ".31em")
                        .attr("text-anchor", "middle")
                        .attr("transform", "rotate(45)")
                        .text("CSS");

                    var planet2 = svg.append("svg:g")
                        .attr("class", "planet")
                        .attr("transform", "translate(" + -r * 3 * x + "," + -r * 3 * y + ")")
                        .data([{ teeth: 32, radius: -r * 2 }])
                      .append("svg:g")
                        .attr("class", "gear");

                    planet2.append("svg:path")
                        .attr("d", gear);

                    planet2.append("svg:text")
                        .attr("x", -r)
                        .attr("dy", ".31em")
                        .attr("text-anchor", "middle")
                        .attr("transform", "rotate(45)")
                        .text("HTML");

                    var planet3 = svg.append("svg:g")
                        .attr("class", "planet")
                        .attr("transform", "translate(" + r * 3 * x + "," + -r * 3 * y + ")")
                        .data([{ teeth: 32, radius: -r * 2 }])
                      .append("svg:g")
                        .attr("class", "gear");

                    planet3.append("svg:path")
                        .attr("d", gear);

                    planet3.append("svg:text")
                        .attr("x", -r)
                        .attr("dy", ".31em")
                        .attr("text-anchor", "middle")
                        .attr("transform", "rotate(45)")
                        .text("SVG");

                    d3.selectAll("input[name=reference]")
                        .data([r * 5, Infinity, -r])
                        .on("change", function (d) { svg.data([{ radius: d }]); });

                    d3.selectAll("input[name=speed]")
                        .on("change", function () { speed = +this.value; });


                    this._fixMaximize();
                    break;
                case 2:////////////////////////////////////////////////////////////////
                    self.addClass("s2");
                    var flowerPath = require.toUrl("./resources/flowers.json");
                    d3.json(flowerPath, function (flower) {

                        var padding = 19.5,
                            size = Math.round((self.domNode.offsetWidth / 4) - padding / 4),
                            n = flower.traits.length;

                        var x = {}, y = {};
                        flower.traits.forEach(function (trait) {
                            var value = function (d) { return d[trait]; },
                                domain = [d3.min(flower.values, value), d3.max(flower.values, value)],
                                range = [padding / 2, size - padding / 2];
                            x[trait] = d3.scale.linear()
                            .domain(domain)
                            .range(range);

                            y[trait] = d3.scale.linear()
                            .domain(domain)
                            .range(range.slice().reverse());
                        });

                        var axis = d3.svg.axis()
                            .ticks(5)
                            .tickSize(size * n);

                        var brush = d3.svg.brush()
                            .on("brushstart", brushstart)
                            .on("brush", brush)
                            .on("brushend", brushend);

                        var svg = d3.select(self.domNode).append("svg")
                            .attr("width", size * n + padding)
                            .attr("height", size * n + padding);

                        svg.selectAll("g.x.axis")
                            .data(flower.traits)
                          .enter().append("g")
                            .attr("class", "x axis")
                            .attr("transform", function (d, i) { return "translate(" + i * size + ",0)"; })
                            .each(function (d) { d3.select(this).call(axis.scale(x[d]).orient("bottom")); });

                        svg.selectAll("g.y.axis")
                            .data(flower.traits)
                          .enter().append("g")
                            .attr("class", "y axis")
                            .attr("transform", function (d, i) { return "translate(0," + i * size + ")"; })
                            .each(function (d) { d3.select(this).call(axis.scale(y[d]).orient("right")); });

                        var cell = svg.selectAll("g.cell")
                            .data(cross(flower.traits, flower.traits))
                          .enter().append("g")
                            .attr("class", "cell")
                            .attr("transform", function (d) { return "translate(" + d.i * size + "," + d.j * size + ")"; })
                            .each(plot);

                        cell.filter(function (d) { return d.i == d.j; }).append("text")
                            .attr("x", padding)
                            .attr("y", padding)
                            .attr("dy", ".71em")
                            .text(function (d) { return d.x; });

                        function plot(p) {
                            var cell = d3.select(this);

                            cell.append("rect")
                                .attr("class", "frame")
                                .attr("x", padding / 2)
                                .attr("y", padding / 2)
                                .attr("width", size - padding)
                                .attr("height", size - padding);

                            cell.selectAll("circle")
                                .data(flower.values)
                              .enter().append("circle")
                                .attr("class", function (d) { return d.species; })
                                .attr("cx", function (d) { return x[p.x](d[p.x]); })
                                .attr("cy", function (d) { return y[p.y](d[p.y]); })
                                .attr("r", 3);

                            cell.call(brush.x(x[p.x]).y(y[p.y]));
                        }

                        function brushstart(p) {
                            if (brush.data !== p) {
                                cell.call(brush.clear());
                                brush.x(x[p.x]).y(y[p.y]).data = p;
                            }
                        }

                        function brush(p) {
                            var e = brush.extent();
                            svg.selectAll("circle").attr("class", function (d) {
                                return e[0][0] <= d[p.x] && d[p.x] <= e[1][0]
                                    && e[0][1] <= d[p.y] && d[p.y] <= e[1][1]
                                    ? d.species : null;
                            });
                        }

                        function brushend() {
                            if (brush.empty()) svg.selectAll("circle").attr("class", function (d) {
                                return d.species;
                            });
                        }

                        function cross(a, b) {
                            var c = [], n = a.length, m = b.length, i, j;
                            for (i = -1; ++i < n;) for (j = -1; ++j < m;) c.push({ x: a[i], i: i, y: b[j], j: j });
                            return c;
                        }
                        self._fixMaximize();
                    });
                    break;
                case 3:////////////////////////////////////////////////////////////////
                    var d3GeoPath = require.toUrl("./resources/d3.geo.js");
                    this.context.loadResource(require.toUrl("./resources/colorbrewer.css"), "css");
                    var self = this;
                    require([d3GeoPath], function () {
                        var dataPath = require.toUrl("./resources/unemployment.json");
                        var countryDataPath = require.toUrl("./resources/us-counties.json");
                        var stateDataPath = require.toUrl("./resources/us-states.json");
                        var path = d3.geo.path()
                            .projection(d3.geo.albersUsa()
                            .scale(Math.round(self.domNode.offsetWidth * 1.09))
                            .translate([Math.round(self.domNode.offsetWidth * 0.53), Math.round(self.domNode.offsetWidth * 0.29)]));

                        var svg = d3.select(self.domNode).append("svg:svg")
                            .attr("class", "Blues")
                            .attr("width", Math.round(self.domNode.offsetWidth))
                            .attr("height", Math.round(self.domNode.offsetWidth / 1.6));

                        var counties = svg.append("svg:g")
                            .attr("id", "counties");

                        var states = svg.append("svg:g")
                            .attr("id", "states");

                        d3.json(dataPath, function (data) {
                            var pad = d3.format("05d"),
                                quantize = d3.scale.quantile().domain([0, 15]).range(d3.range(9));

                            d3.json(countryDataPath, function (json) {
                                counties.selectAll("path")
                                    .data(json.features)
                                  .enter().append("svg:path")
                                    .attr("class", function (d) { return "q" + quantize(data[pad(d.id)]) + "-9"; })
                                    .attr("d", path)
                                  .append("svg:title")
                                    .text(function (d) { return d.properties.name + ": " + data[pad(d.id)] + "%"; });
                            });
                        });

                        d3.json(stateDataPath, function (json) {
                            states.selectAll("path")
                                .data(json.features)
                              .enter().append("svg:path")
                                .attr("d", path);
                            self._fixMaximize();
                        });

                        var classOptions = ["YlGn", "YlGnBu", "GnBu", "BuGn", "PuBuGn", "PuBu", "BuPu", "RdPu", "PuRd", "OrRd", "YlOrRd", "YlOrBr", "Purples", "Blues", "Greens", "Oranges", "Reds", "Greys"];
                        var lbl = document.createElement("i");
                        lbl.innerHTML = " Theme: ";
                        self.domNode.appendChild(lbl);
                        var classSelector = document.createElement("select");
                        classSelector.style.width = "75px";
                        for (var i = 0; i < classOptions.length; i++) {
                            var classOption = document.createElement("option");
                            classOption.innerHTML = classOptions[i];
                            classOption.value = classOptions[i];
                            classSelector.appendChild(classOption);
                        }
                        self.domNode.appendChild(classSelector);

                        d3.select(classSelector).on("change", function () {
                            d3.selectAll("svg").attr("class", this.value);
                        });
                        
                    });
                    break;
                case 4:////////////////////////////////////////////////////////////////
                    self.addClass("s4");
                    function brushstart() {
                        svg.classed("selecting", true);
                    }

                    function brushmove() {

                        var e = d3.event.target.extent();
                        circle.classed("selected", function (d) {
                            return e[0][0] <= d[0] && d[0] <= e[1][0]
                                && e[0][1] <= d[1] && d[1] <= e[1][1];
                        });
                    }

                    function brushend() {
                        svg.classed("selecting", !d3.event.target.empty());
                    }

                    var random = d3.random.normal(.5, .1),
                   data = d3.range(800).map(function () { return [random(), random()]; });

                    var margin = { top: 10, right: 10, bottom: 20, left: 40 },
                        width = self.domNode.offsetWidth - margin.right - margin.left,
                        height = Math.round(self.domNode.offsetWidth * 0.58) - margin.top - margin.bottom;

                    var x = d3.scale.linear()
                        .range([0, width]);

                    var y = d3.scale.linear()
                        .range([height, 0]);

                    var svg = d3.select(this.domNode).append("svg")
                        .attr("width", width + margin.right + margin.left)
                        .attr("height", height + margin.top + margin.bottom)
                      .append("g")
                        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

                    svg.append("g")
                        .attr("class", "x axis")
                        .attr("transform", "translate(0," + height + ")")
                        .call(d3.svg.axis().scale(x).orient("bottom"));

                    svg.append("g")
                        .attr("class", "y axis")
                        .call(d3.svg.axis().scale(y).orient("left"));

                    var circle = svg.append("g").selectAll("circle")
                        .data(data)
                      .enter().append("circle")
                        .attr("transform", function (d) { return "translate(" + x(d[0]) + "," + y(d[1]) + ")"; })
                        .attr("r", 3.5);

                    svg.append("g")
                        .attr("class", "brush")
                        .call(d3.svg.brush().x(x).y(y)
                        .on("brushstart", brushstart)
                        .on("brush", brushmove)
                        .on("brushend", brushend));


                    self._fixMaximize();
                    break;
                case 5:
                    self.addClass("s5");
                    var dataPath = require.toUrl("./resources/sp500.csv");
                    var height = self.domNode.offsetWidth*0.22,
                        height2 = 25,
                        margin = { top: 2, right: 2, bottom: 95, left: 40 },
                        margin2 = { top: height+35, right: 2, bottom: 10, left: 40 },
                        width = self.domNode.offsetWidth - margin.left - margin.right;

                    function brush() {
                        var startDate = x.domain()[0].getFullYear() + "-" + (x.domain()[0].getMonth() + 1) + "-" + x.domain()[0].getDate();
                        var endDate = x.domain()[1].getFullYear() + "-" + (x.domain()[1].getMonth() + 1) + "-" + x.domain()[1].getDate();
                        self.context._publishToDashlet('jdash/dashlet/Messaging', "D3 chart  says:Selected Range is from " + startDate + " to " + endDate);
                        x.domain(brush.empty() ? x2.domain() : brush.extent());
                        focus.select("path").attr("d", area);
                        focus.select(".x.axis").call(xAxis);
                    }


                    //   height = self.domNode.offsetWidth * 0.52 - margin.top - margin.bottom,
                    
                    var formatDate = d3.time.format("%b %Y");

                    var x = d3.time.scale()
                        .range([0, width]);

                    var x2 = d3.time.scale()
                        .range([0, width]);

                    var y = d3.scale.linear()
                        .range([height, 0]);

                    var y2 = d3.scale.linear()
                        .range([height2, 0]);

                    var xAxis = d3.svg.axis().scale(x).orient("bottom"),
                        xAxis2 = d3.svg.axis().scale(x2).orient("bottom"),
                        yAxis = d3.svg.axis().scale(y).orient("left");

                    var brush = d3.svg.brush()
                        .x(x2)
                        .on("brush", brush);

                    var area = d3.svg.area()
                        .interpolate("monotone")
                        .x(function (d) { return x(d.date); })
                        .y0(height)
                        .y1(function (d) { return y(d.price); });

                    var area2 = d3.svg.area()
                        .interpolate("monotone")
                        .x(function (d) { return x2(d.date); })
                        .y0(height2)
                        .y1(function (d) { return y2(d.price); });

                    var svg = d3.select(self.domNode).append("svg")
                        .attr("width", width + margin.left + margin.right)
                        .attr("height", height + margin.top + margin.bottom);

                    svg.append("defs").append("clipPath")
                        .attr("id", "clip")
                      .append("rect")
                        .attr("width", width)
                        .attr("height", height);

                    var focus = svg.append("g")
                        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

                    var context = svg.append("g")
                        .attr("transform", "translate(" + margin2.left + "," + margin2.top + ")");

                    d3.csv(dataPath, function (data) {

                        data.forEach(function (d) {
                            d.date = formatDate.parse(d.date);
                            d.price = +d.price;
                        });

                        x.domain(d3.extent(data.map(function (d) { return d.date; })));
                        y.domain([0, d3.max(data.map(function (d) { return d.price; }))]);
                        x2.domain(x.domain());
                        y2.domain(y.domain());

                        focus.append("path")
                            .data([data])
                            .attr("clip-path", "url(#clip)")
                            .attr("d", area);

                        focus.append("g")
                            .attr("class", "x axis")
                            .attr("transform", "translate(0," + height + ")")
                            .call(xAxis);

                        focus.append("g")
                            .attr("class", "y axis")
                            .call(yAxis);

                        context.append("path")
                            .data([data])
                            .attr("d", area2);

                        context.append("g")
                            .attr("class", "x axis")
                            .attr("transform", "translate(0," + height2 + ")")
                            .call(xAxis2);

                        context.append("g")
                            .attr("class", "x brush")
                            .call(brush)
                          .selectAll("rect")
                            .attr("y", -6)
                            .attr("height", height2 + 7);
                        self._fixMaximize();
                    });

                    break;
                case 6:
                    self.addClass("s5");
                    var dataPath = require.toUrl("./resources/flare.json");
                    var w = self.domNode.offsetWidth,
                        h = self.domNode.offsetWidth*0.83,
                        i = 0,
                        barHeight = 20,
                        barWidth = w * .8,
                        duration = 400,
                        root;

                    var tree = d3.layout.tree()
                        .size([h, 100]);

                    var diagonal = d3.svg.diagonal()
                        .projection(function (d) { return [d.y, d.x]; });

                    var vis = d3.select(self.domNode).append("svg:svg")
                        .attr("width", w)
                        .attr("height", h)
                      .append("svg:g")
                        .attr("transform", "translate(20,30)");

                    d3.json(dataPath, function (json) {
                        json.x0 = 0;
                        json.y0 = 0;
                        update(root = json);
                        self._fixMaximize();
                    });

                    function update(source) {
                        
                        var nodes = tree.nodes(root);
                        
                        nodes.forEach(function (n, i) {
                            n.x = i * barHeight;
                        });
                        
                        var node = vis.selectAll("g.node")
                            .data(nodes, function (d) { return d.id || (d.id = ++i); });

                        var nodeEnter = node.enter().append("svg:g")
                            .attr("class", "node")
                            .attr("transform", function (d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
                            .style("opacity", 1e-6);
                        
                        nodeEnter.append("svg:rect")
                            .attr("y", -barHeight / 2)
                            .attr("height", barHeight)
                            .attr("width", barWidth)
                            .style("fill", color)
                            .on("click", click);

                        nodeEnter.append("svg:text")
                            .attr("dy", 3.5)
                            .attr("dx", 5.5)
                            .text(function (d) { return d.name; });
                       
                        nodeEnter.transition()
                            .duration(duration)
                            .attr("transform", function (d) { return "translate(" + d.y + "," + d.x + ")"; })
                            .style("opacity", 1);

                        node.transition()
                            .duration(duration)
                            .attr("transform", function (d) { return "translate(" + d.y + "," + d.x + ")"; })
                            .style("opacity", 1)
                          .select("rect")
                            .style("fill", color);
                       
                        node.exit().transition()
                            .duration(duration)
                            .attr("transform", function (d) { return "translate(" + source.y + "," + source.x + ")"; })
                            .style("opacity", 1e-6)
                            .remove();
                        
                        var link = vis.selectAll("path.link")
                            .data(tree.links(nodes), function (d) { return d.target.id; });

                        
                        link.enter().insert("svg:path", "g")
                            .attr("class", "link")
                            .attr("d", function (d) {
                                var o = { x: source.x0, y: source.y0 };
                                return diagonal({ source: o, target: o });
                            })
                          .transition()
                            .duration(duration)
                            .attr("d", diagonal);
                        
                        link.transition()
                            .duration(duration)
                            .attr("d", diagonal);
                       
                        link.exit().transition()
                            .duration(duration)
                            .attr("d", function (d) {
                                var o = { x: source.x, y: source.y };
                                return diagonal({ source: o, target: o });
                            })
                            .remove();
                        
                        nodes.forEach(function (d) {
                            d.x0 = d.x;
                            d.y0 = d.y;
                        });
                    }
                    
                    function click(d) {
                        if (d.children) {
                            d._children = d.children;
                            d.children = null;
                        } else {
                            d.children = d._children;
                            d._children = null;
                        }
                        update(d);
                    }

                    function color(d) {
                        return d._children ? "#3182bd" : d.children ? "#c6dbef" : "#fd8d3c";
                    }

                    break;
                default:

            }

        }
        

        this._fixMaximize=function(){
            if (this.context.pane.visualState == "maximize")
                this.domNode.parentNode.style.height = this.domNode.offsetHeight + "px";
        }

        var self = this;
        this.context.config.watch("chartConfig", function (name, oldVal, newVal) {
         
            setTimeout(lang.hitch(self, self.renderSample));
        });

    }
});

