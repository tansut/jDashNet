
define(["dojo/on","dojo/date/locale"],
	function (on,locale) {
		return function (params) {
			this.context = params.context;
			this.domNode = document.createElement("div");
			this.buttonNode = document.createElement("button");

			this.buttonNode.innerHTML = "Publish";

			this.domNode.appendChild(this.buttonNode);

			this.startup = function () {

				var self = this;

				on(self.domNode, "click", function (event) {			
					self.context.setBusy();
					var myDate = new Date();					
					var message = "Message command was published from dashlet id =" + "'" + self.context.id + "'" + " at " + myDate.toLocaleString();
					self.context.publish('jdash/dashlet/Messaging', message);
				});
			}
		}
	});