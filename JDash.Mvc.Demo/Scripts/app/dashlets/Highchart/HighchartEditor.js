define(["require", "jdash/ui/TitleEditor",
        "jdash/ui/DashletStylesList", "dojo/_base/xhr", "dojo/on", "dojo/json"],
		function (require, TitleEditor, DashletStylesList, xhr, on, json) {
			return function (params) {
				this.context = params.context;
				this.domNode = document.createElement("div");

				var form = document.createElement("form");

				var row1 = document.createElement("p");
				var titleNode = document.createElement("span");
				row1.appendChild(titleNode);
				form.appendChild(row1);

				var row2 = document.createElement("p");
				var styleNode = document.createElement("span");
				row2.appendChild(styleNode);
				form.appendChild(row2);

				this.dashletTitle = new TitleEditor({ context: this.context.dashletContext }, titleNode);
				this.dashletStyles = new DashletStylesList({ context: this.context.dashletContext }, styleNode);

				var row5 = document.createElement("p");
				var state = this.stateList = document.createElement("div");

				row5.appendChild(state);
				form.appendChild(row5);

				var row3 = document.createElement("p");
				var label = document.createElement("span");
				label.innerHTML = "Presets";
				row3.appendChild(label);
				form.appendChild(row3);

				var cb = this.presetList = document.createElement("select");
				var cbRow = document.createElement("p");
				cbRow.appendChild(cb);
				form.appendChild(cbRow);

				var labelRow = document.createElement("p");
				var label = document.createElement("span");
				label.innerHTML = "Chart Data";
				labelRow.appendChild(label);
				form.appendChild(labelRow);

				var textBox = this.chartDataTextbox = document.createElement("textarea");
				this.context.dashletContext.domStyle.set(textBox, "font-family", "Courier");
				this.context.dashletContext.domStyle.set(textBox, "height", "200px");
				this.context.dashletContext.domStyle.set(textBox, "overflow", "auto");

				var textBoxRow = document.createElement("p");
				textBoxRow.appendChild(textBox);
				form.appendChild(textBoxRow);
				this.domNode.appendChild(form);

				if (this.context.config.has("chartData"))
					this.chartDataTextbox.value = this.context.config.get("chartData");


				this.destroyRecursive = function () {
					this.dashletTitle.destroyRecursive();
					this.dashletStyles.destroyRecursive();
				}

				this.startup = function () {

					this.dashletTitle.startup();
					this.dashletStyles.startup();

					var self = this;

					xhr.get({
						url: "./Scripts/app/dashlets/Highchart/resources/presets.txt", handleAs: "json",
						load: function (data) {
							loadData(data);
						}
					});

					function loadData(data) {

						for (var i = 0; i < data.highChart.length; i++) {

							$(self.presetList).append(
									$('<option></option>').val(i).html(data.highChart[i].title.text)
								);						
						}

						on(self.presetList, "change", function (event) {
							var value = self.presetList.value;
							self.chartDataTextbox.value = json.stringify(data.highChart[value]);
							self.context.config.set("chartData", self.chartDataTextbox.value);
						});
					}

					this.context.subscribe("jdash/dashlet/editor/validating", function (event) {
						if (event.sender == this) {
							this.config.set("chartData", self.chartDataTextbox.value, true);
						}
					});
				}
			}
		});