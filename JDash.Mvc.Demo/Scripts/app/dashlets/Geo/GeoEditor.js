
define(["dojo/on"], (function (on) {
	return function (params) {

		this.context = params.context;
		this.domNode = document.createElement("div");

		this.selectList = document.createElement("select");
		this.domNode.appendChild(this.selectList);

		this.startup = function () {

			var self = this; 

			$(self.selectList).append(
					$('<option></option>').val("Population").html("Population"),
					$('<option></option>').val("Temperature").html("Average Annual Temparature"),
					$('<option></option>').val("Area").html("Area")
				);

			on(self.selectList, "change", function (event) {
				self.selectCity();
			});

			this.selectCity = function () {

				var data;

				switch (self.selectList.value) {
					case "Population":
						data = [
							['Country', 'Popularity'],
							['Japan', 127799000],
							['Turkey', 74724269],
							['United States', 314071000],
							['China', 1339724852],
							['Australia', 7617930],
							['Madagascar', 21926221]
						];
						break;
					case "Temperature":
						data = [
							['Country', 'Temp(°C)'],
							['Germany', 12],
							['Thailand', 11],
							['Singapore', 27],
							['Russia', -5.5],
							['Peru', 22],
							['South Africa',22 ]
						];
						break;
					case "Area":
						data = [
							['Country', 'Area(km²)'],
							['China', 9640821],
							['Egypt', 1002450],
							['Brazil', 8514877],
							['Spain', 505992],
							['Canada', 9984670],
							['Finland',338424]
						];
						break;

				}
				self.context.config.set("geoMapCountry", data);
				return data;
			}

			self.context.subscribe("jdash/dashlet/editor/validating", function (event) {
				if (event.sender == this) {
					var geoMapCountry = self.selectCity();
					this.config.set("geoMapCountry", geoMapCountry, true);
				}
			});

			this.getData = function (data) {
				return data;
			}
		}

	}
})
);
