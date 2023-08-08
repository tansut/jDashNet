
define(["require"],
	function (require) {

		return function (params) {

			this.context = params.context;
			this.domNode = document.createElement("div");

			this.context.domStyle.set(this.context.pane.getBodyNode(), "padding", "0");

			this.set = function (name, value) {
				if (name == "geoMapCountry") {
					this.reDraw(value);
				}
			}

			this.refresh = function (redrawOnly) {
				if (redrawOnly) {
					this.domNode.parentElement.style.width = this.domNode.style.width;
					this.domNode.parentElement.style.height = this.domNode.style.height;
					var size = this.context.pane.getBodySize();
					this.context.domStyle.set(this.domNode, "display", "");
					this.getDraw(data);
				} else this.getDraw(data);

			}

			this.reDraw = function (value) {
				var data = google.visualization.arrayToDataTable(value);
				var size = this.context.pane.getBodySize();

				var options = {
					'width': size.w,
					'height': size.h
				};

				options['dataMode'] = 'regions';

				var container = this.domNode;
				var geomap = new google.visualization.GeoMap(container);
				geomap.draw(data, options);
			}

			this.getDraw = function () {
				if (!this.context.config.has("geoMapCountry")) {
					data = google.visualization.arrayToDataTable([
						['Country', 'Popularity'],
						['Japan', 127799000],
						['Turkey', 74724269],
						['United States', 314071000],
						['China', 1339724852],
						['Australia', 7617930],
						['Madagascar', 21926221]
					]);
				} 
				else {
					var geoMapCountry = this.context.config.get("geoMapCountry");
					data = google.visualization.arrayToDataTable(geoMapCountry);
				}
				var size = this.context.pane.getBodySize();

				var options = {
					'width': size.w,
					'height': size.h
				};

				options['dataMode'] = 'regions';

				var container = this.domNode;
				var geomap = new google.visualization.GeoMap(container);
				geomap.draw(data, options);
			}

			this.startup = function () {
				var self = this;

				var script = "http://www.google.com/jsapi";
				require([script], function (script) {
					google.load("visualization", "1", { "callback": getDrawMap, other_params: "sensor=false", 'packages': ['geomap'] })
				});

				function getDrawMap() {
					self.getDraw();
				}

				var reDrawChart = function () {
					self.refresh(true);
				}

				this.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
					if (event.sender == this) {
						setTimeout(reDrawChart, 50);
					}
				});

				this.context.subscribe('jdash/dashlet/visualStateChanging', function (event) {
					if (event.sender == this) {
						self.context.domStyle.set(self.domNode, "display", "none");
					}
				});

				this.context.subscribe('klt/viewport/resized', function (event) {
						setTimeout(reDrawChart, 50);
				});


				this.context.subscribe("jdash/layout/dnd/dropped", function (event) {
				    if (event.sender == this) {
				        setTimeout(reDrawChart, 50);
				    }
				});

			}
		}
	})



