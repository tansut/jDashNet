define(["require", "klt/core/Deferred", "klt/core/when"], function (require, Deferred, when) {
    return function (params, node) {
        
        var libraryLoad = this.libraryLoad = new Deferred();

        var context = this.context = params.context;
        var domNode = this.domNode = node || document.createElement("div");
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
        var self = this;

        this.startup = function () {
            var D3Path = require.toUrl("./resources/D3.v3.min.js");
            var D3LayoutPath = require.toUrl("./resources/d3.layout.js");
            require([D3Path], function () {
                require([D3LayoutPath], function () {
                    self.libraryLoad.resolve();
                });
            });
        }


        this.context.subscribe("jdash/layout/dnd/dropped", function (event) {
            if (event.sender == self.context) {
                self.renderSample();
            }
        });

        this.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
            if (event.sender == self.context) {
                self.renderSample();
            }
        });
        this.context.subscribe('klt/viewport/resized', function (event) {

            self.renderSample();
        });

        this.clearClassList = function () {
            this.dashletNode.className = "";
            this.addClass("d3");
        }


        this.addClass = function (classToAdd) {
            this.context.fn.domClass.add(this.dashletNode, classToAdd);
        }

        this.renderSample = function (initialSample) {

            when(this.libraryLoad, function() {
                if (!self.sampleID)
                    self.sampleID = !self.context.config.preset ? "SVG Wheels" : self.context.config.preset;
                if (initialSample) self.sampleID = initialSample;
                self.dashletNode.innerHTML = "";

                var size = self.context.pane.getDashletSize();
                if (size.h <= 0)
                    size.h = 350;
                self.clearClassList();
                switch (self.sampleID) {
                    case "SVG Wheels":////////////////////////////////////////////////////////////////
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

                    

                        var w = size.w,
                            h = size.h,
                            r = Math.round(h / 10),
                            x = Math.sin(2 * Math.PI / 3),
                            y = Math.cos(2 * Math.PI / 3),
                            speed = 4,
                            start = Date.now();


                        var svg = d3.select(self.dashletNode).insert("svg:svg", "form")
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
                            .on("change", function () { speed = +self.value; });


                    
                        break;
                    case "Multiple Chart Selection":////////////////////////////////////////////////////////////////
                        self.addClass("s2");
                        var flowerPath = require.toUrl("./resources/flowers.js");
                        d3.json(flowerPath, function (flower) {

                            var padding = 19.5,
                                size = Math.round((self.dashletNode.offsetWidth / 4) - padding / 4),
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

                            var svg = d3.select(self.dashletNode).append("svg")
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
                        
                        });
                        break;
                    case "USA Unemployment Chart":////////////////////////////////////////////////////////////////
                        var d3GeoPath = require.toUrl("./resources/d3.geo.js");
                        self.context.loadResource(require.toUrl("./resources/colorbrewer.css"), "css");
                        require([d3GeoPath], function () {
                            var dataPath = require.toUrl("./resources/unemployment.js");
                            var countryDataPath = require.toUrl("./resources/us-counties.js");
                            var stateDataPath = require.toUrl("./resources/us-states.js");
                            var path = d3.geo.path()
                                .projection(d3.geo.albersUsa()
                                .scale(Math.round(self.dashletNode.offsetWidth * 1.09))
                                .translate([Math.round(self.dashletNode.offsetWidth * 0.53), Math.round(self.dashletNode.offsetWidth * 0.29)]));

                            var svg = d3.select(self.dashletNode).append("svg:svg")
                                .attr("class", "Blues")
                                .attr("width", Math.round(self.dashletNode.offsetWidth))
                                .attr("height", Math.round(self.dashletNode.offsetWidth / 1.6));

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
                            
                            });

                            var classOptions = ["YlGn", "YlGnBu", "GnBu", "BuGn", "PuBuGn", "PuBu", "BuPu", "RdPu", "PuRd", "OrRd", "YlOrRd", "YlOrBr", "Purples", "Blues", "Greens", "Oranges", "Reds", "Greys"];
                            var lbl = document.createElement("i");
                            lbl.innerHTML = " Theme: ";
                            self.dashletNode.appendChild(lbl);
                            var classSelector = document.createElement("select");
                            classSelector.style.width = "75px";
                            for (var i = 0; i < classOptions.length; i++) {
                                var classOption = document.createElement("option");
                                classOption.innerHTML = classOptions[i];
                                classOption.value = classOptions[i];
                                classSelector.appendChild(classOption);
                            }
                            self.dashletNode.appendChild(classSelector);

                            d3.select(classSelector).on("change", function () {
                                d3.selectAll("svg").attr("class", self.value);
                            });

                        });
                        break;
                    case "Chart Brushing":////////////////////////////////////////////////////////////////
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
                            width = self.dashletNode.offsetWidth - margin.right - margin.left,
                            height = Math.round(self.dashletNode.offsetWidth * 0.58) - margin.top - margin.bottom;

                        var x = d3.scale.linear()
                            .range([0, width]);

                        var y = d3.scale.linear()
                            .range([height, 0]);

                        var svg = d3.select(self.dashletNode).append("svg")
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


                    
                        break;
                    case "Chart Zooming":
                        self.addClass("s5");
                        var dataPath = require.toUrl("./resources/sp500.csv");
                        var height = self.dashletNode.offsetWidth * 0.22,
                            height2 = 25,
                            margin = { top: 2, right: 2, bottom: 95, left: 40 },
                            margin2 = { top: height + 35, right: 2, bottom: 10, left: 40 },
                            width = self.dashletNode.offsetWidth - margin.left - margin.right;

                        function brush() {
                            var startDate = x.domain()[0].getFullYear() + "-" + (x.domain()[0].getMonth() + 1) + "-" + x.domain()[0].getDate();
                            var endDate = x.domain()[1].getFullYear() + "-" + (x.domain()[1].getMonth() + 1) + "-" + x.domain()[1].getDate();
                            self.context._publishToDashlet('jdash/dashlet/Messaging', "D3 chart  says:Selected Range is from " + startDate + " to " + endDate);
                            x.domain(brush.empty() ? x2.domain() : brush.extent());
                            focus.select("path").attr("d", area);
                            focus.select(".x.axis").call(xAxis);
                        }


                        //   height = self.dashletNode.offsetWidth * 0.52 - margin.top - margin.bottom,

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

                        var svg = d3.select(self.dashletNode).append("svg")
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
                        
                        });

                        break;
                    case "Intented Tree":
                        self.addClass("s5");
                        var dataPath = require.toUrl("./resources/flare.js");
                        var w = self.dashletNode.offsetWidth,
                            h = self.dashletNode.offsetWidth * 0.83,
                            i = 0,
                            barHeight = 20,
                            barWidth = w * .8,
                            duration = 400,
                            root;

                        var tree = d3.layout.tree()
                            .size([h, 100]);

                        var diagonal = d3.svg.diagonal()
                            .projection(function (d) { return [d.y, d.x]; });

                        var vis = d3.select(self.dashletNode).append("svg:svg")
                            .attr("width", w)
                            .attr("height", h)
                          .append("svg:g")
                            .attr("transform", "translate(20,30)");

                        d3.json(dataPath, function (json) {
                            json.x0 = 0;
                            json.y0 = 0;
                            update(root = json);
                        
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

                    case "Particles":
                        var w = self.dashletNode.offsetWidth,
                            h = self.dashletNode.offsetWidth,
                            z = d3.scale.category20c(),
                            i = 0;

                        var width = self.dashletNode.offsetWidth,
                            height = self.dashletNode.offsetWidth;

                        var fill = d3.scale.category20();

                        var force = d3.layout.force()
                            .size([width, height])
                            .nodes([{}]) // initialize with a single node
                            .linkDistance(30)
                            .charge(-60)
                            .on("tick", tick);

                        var svg = d3.select(self.dashletNode).append("svg")
                            .attr("width", width)
                            .attr("height", height)
                            .on("mousemove", mousemove)
                            .on("mousedown", mousedown);

                        svg.append("rect")
                            .attr("width", width)
                            .attr("height", height);

                        var nodes = force.nodes(),
                            links = force.links(),
                            node = svg.selectAll(".node"),
                            link = svg.selectAll(".link");

                        var cursor = svg.append("circle")
                            .attr("r", 30)
                            .attr("transform", "translate(-100,-100)")
                            .attr("class", "cursor");

                        restart();

                        function mousemove() {
                            cursor.attr("transform", "translate(" + d3.mouse(this) + ")");
                        }

                        function mousedown() {
                            var point = d3.mouse(this),
                                node = { x: point[0], y: point[1] },
                                n = nodes.push(node);

                            // add links to any nearby nodes
                            nodes.forEach(function (target) {
                                var x = target.x - node.x,
                                    y = target.y - node.y;
                                if (Math.sqrt(x * x + y * y) < 30) {
                                    links.push({ source: node, target: target });
                                }
                            });

                            restart();
                        }

                        function tick() {
                            link.attr("x1", function (d) { return d.source.x; })
                                .attr("y1", function (d) { return d.source.y; })
                                .attr("x2", function (d) { return d.target.x; })
                                .attr("y2", function (d) { return d.target.y; });

                            node.attr("cx", function (d) { return d.x; })
                                .attr("cy", function (d) { return d.y; });
                        }

                        function restart() {
                            link = link.data(links);

                            link.enter().insert("line", ".node")
                                .attr("class", "link");

                            node = node.data(nodes);

                            node.enter().insert("circle", ".cursor")
                                .attr("class", "node")
                                .attr("r", 5)
                                .call(force.drag);

                            force.start();
                        }
                        break;    
                    default:

                }
            });

            




        }
    }
});


