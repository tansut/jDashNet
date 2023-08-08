define(['dojo/_base/declare',
		'dojo/_base/lang',
		"dojo/promise/all"
],
	function (declare, lang, all) {
		return declare([], {
			busyDelay: 500,

			progress: function (msg) {

			},

			setBusy: function (promise, message) {
				var self = this;
				if (!lang.isObject(promise)) {
					message = promise;
					promise = null;
				} 

				if (promise) {
				    self.setBusy(message);
					promise.then(function () {
						self.clearBusy();
					}, function () {
						self.clearBusy();
					}, function (msg) {
						self.progress(msg);
					});
				} else {
				    delete self._busyCleared;
					setTimeout(function () {
						if (!self._busyCleared) {
							if (!self.get("busy"))
								self.set("busy", true);
							self.progress(message);
						}						
					}, this.busyDelay);
				}
			},

			clearBusy: function () {
			    this.set("busy", false);
			    var self = this;
			    self._busyCleared = true;				
			}
		});
	});