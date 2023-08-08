
define(function () {
	return function (params) {

		this.context = params.context;

		var form = document.createElement("form");
		var row = document.createElement("p");
		this.googleApiKeyTextbox = document.createElement("input");
		this.googleApiKeyTextbox.type = "text";
		this.googleApiKeyTextbox.placeholder = "API Key";

		row.appendChild(this.googleApiKeyTextbox);
		form.appendChild(row);
		this.domNode = form;

		this.googleApiKeyTextbox.value = this.context.config.get("googleApiKey");

		var self = this;

		self.context.subscribe("jdash/dashlet/editor/validating",
		function (event) {
			if (event.sender == this) {
				this.config.set("googleApiKey", self.googleApiKeyTextbox.value, true);
			}
		});
	}
});
