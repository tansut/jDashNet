define(
	function () {
		return function (params) {

			this.context = params.context;
			this.domNode = document.createElement("div");

			this.startup = function () {
				var self = this;

				self.context.subscribe('jdash/dashlet/Messaging', function (message) {
					self.domNode.innerHTML +=  message.args + "</br>";
				});
			}
		}
	});