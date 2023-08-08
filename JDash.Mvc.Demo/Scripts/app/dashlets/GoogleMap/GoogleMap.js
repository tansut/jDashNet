
define(["require", "dojo/on"],
	function (require, on) {

		return function (params) {

			this.context = params.context;
			this.domNode = document.createElement("div");
			var txtSearch = this.searchTextBox = document.createElement("input");
			var divMap = this.divMap = document.createElement("div");

			divMap.style.height = "500px";

			this.domNode.appendChild(txtSearch);
			this.domNode.appendChild(divMap);

			this.context.domStyle.set(this.context.pane.getBodyNode(), "padding", "0");

			txtSearch.value = "Ankara";

			this.startup = function () {
				var self = this;

				var script = "http://www.google.com/jsapi";
				require([script], function (script) {
					google.load("maps", "3", { "callback": loadMap, other_params: "sensor=true" })
				});

				on(self.searchTextBox, "keypress", function (event) {;
					if (event.which == 13) {
						getAddress();
					}
				});

				function loadMap() {
					var geocoder = new google.maps.Geocoder();
					loadLatLng(39.916759, 32.799683);
				}

				function getAddress() {
					var addressSearch = self.searchTextBox;
					var gcReq = { address: addressSearch.value };
					var geocoder = new google.maps.Geocoder();
					geocoder.geocode(gcReq, function (results, status) {
						var latitude = results[0].geometry.location.lat();
						var longitude = results[0].geometry.location.lng();

						loadLatLng(latitude, longitude);
					});
				}

				function loadLatLng(lat, lng) {
					var myLatlng = new google.maps.LatLng(lat, lng);
					var myOptions = {
						zoom: 13,
						center: myLatlng,
						mapTypeId: google.maps.MapTypeId.ROADMAP,
					}
					var map = new google.maps.Map(self.divMap, myOptions);

					var marker = new google.maps.Marker({
						position: myLatlng,
						map: map
					});
				}

				this.context.subscribe('klt/viewport/resized', function (event) {
				    
				        setTimeout(getAddress, 50);
				    
				});

				this.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
				    if (event.sender == self.context) {
				        setTimeout(getAddress, 50);
				    }
				});
			}
		}
	})



