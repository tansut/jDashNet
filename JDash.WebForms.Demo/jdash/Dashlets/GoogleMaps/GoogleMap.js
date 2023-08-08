define(["JDash/Dashlets/GoogleMapLoader!", "klt/core/Deferred"], function (foo, Deferred) {
    var mapLibraryLoadDefer = new Deferred();
    var googleDashletClass = function (params, node) {
        var context = this.context = params.context;
        var domNode = this.domNode = node || document.createElement("div");

        var dashletNode = this.dashletNode = document.createElement("div");
        domNode.appendChild(dashletNode);
        //context.fn.domStyle.set(dashletNode, "height", "350px");

        this._handleDomUpdate = function (newNode, insideOnly) {
            if (!insideOnly)
                domNode = this.domNode = newNode;
            domNode.appendChild(dashletNode);
        }

        this._handleDomUpdating = function () {
            this.domNode.removeChild(this.dashletNode);
        }


        var self = this;

        

        this.startup = function () {
           
            this.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
                if (event.sender == this && self.map) {
                    google.maps.event.trigger(self.map, "resize");
                }
            });

            this.context.subscribe("jdash/layout/dnd/dropped", function (event) {
                if (self.context.pane == event.args.pane && self.map) {
                    var size = self.context.pane.getDashletSize();
                    google.maps.event.trigger(self.map, "resize");
                }
            });

            self.showMap();

            
        }

        this.destroyRecursive = function () {
            context.fn.domConstruct.destroy(dashletNode);
        }

        this.showMap = function () {
            var size = context.pane.getDashletSize();
            var height = "300px";
            if (size.h > 0)
                height = size.h + "px";
            context.fn.domStyle.set(dashletNode, "height", height);
            var geocoder = new google.maps.Geocoder();
            var myLatlng = new google.maps.LatLng(39.916759, 32.799683);
            var myOptions = {
                zoom: 13,
                center: myLatlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
            }
            var map = self.map = new google.maps.Map(dashletNode, myOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map
            });
        }
    }

    function mapLibraryLoaded() {
        mapLibraryLoadDefer.resolve();
        delete mapLibraryLoadDefer;
    }

    //setTimeout(function () {
    //    if (typeof(google.maps) == "undefined")
    //        google.load("maps", "3", { "callback": mapLibraryLoaded, other_params: "sensor=true" });
    //});

    return googleDashletClass;
});