define(["require"],
	function (require) {
		return function (params) {
			this.context = params.context;
			this.domNode = document.createElement("div");
			this.editorNode = document.createElement("textarea");
			this.editorNode.style.height = "500px";
			this.editorNode.style.fontFamily = "Courier";
			this.domNode.appendChild(this.editorNode);

			this.startup = function () {
				var self = this;

				if (self.context.config.has("content")) {
					self.editorNode.innerHTML = self.context.config.get("content");
				}

				self.context.subscribe("jdash/dashlet/editor/validating", function (event) {
					if (event.sender = this) {
						var content = self.editorNode.value;
						this.config.set("content", content);
					}
				});
			}
		}
	});