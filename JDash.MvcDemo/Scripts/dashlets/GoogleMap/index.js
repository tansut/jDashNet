define(["./GoogleMapLoader!", "klt/core/Deferred"], function (foo, Deferred) {
    var mapLibraryLoadDefer = new Deferred();
    var map;

    return {
        initialize: function (context, viewNode) {
            this.showMap(context, viewNode);

            this.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
                if (event.sender == this && self.map) {
                    google.maps.event.trigger(self.map, "resize");
                }
            });

        },
        showMap: function (context, viewNode) {
            var size = context.pane.getDashletSize();
            var height = "300px";
            if (size.h > 0)
                height = size.h + "px";
            context.fn.domStyle.set(viewNode, "height", height);
            var geocoder = new google.maps.Geocoder();
            var myLatlng = new google.maps.LatLng(39.916759, 32.799683);
            var myOptions = {
                zoom: 13,
                center: myLatlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
            }
            var map = self.map = new google.maps.Map(viewNode, myOptions);

            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map
            });
        }

    }
});
