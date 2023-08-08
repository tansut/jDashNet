define(["require"],
	function (require) {
		return function (params) {
			this.context = params.context;
			this.domNode = document.createElement("div");
			this.domNode.style.fontFamily = "Courier";
			this.set = function (name, value) {
				if (name = "content") {
					this.domNode.innerHTML = value;
				}
			}

			this.startup = function () {
				if (!this.context.config.has("content"))
					this.domNode.innerHTML = "Welcome";
				else
					this.set("content", this.context.config.get("content"));
			}
		}

	});