define(["JDash/Dashlets/GoogleMapLoader!"], function (foo) {

    var googleDashletClass = function (params, node) {
        var context = this.context = params.context;
        var domNode = this.domNode = node || document.createElement("div");

        var dashletNode = this.dashletNode = document.createElement("div");
        domNode.appendChild(dashletNode);

               
        this.mapContainer = document.createElement("div");
        this.context.fn.domClass.add(this.mapContainer, "mapContainer");
        dashletNode.appendChild(this.mapContainer);

        this.mask = document.createElement("div");
        this.context.fn.domClass.add(this.mask, "lightbox");
        this.mask.innerHTML = '<div class="msg"><center>Mouse over the map to view  </center></div>';

        this.dashletNode.appendChild(this.mask);

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
        var timer, unlock;
        this.destroyRecursive = function () {
            clearInterval(timer);
            context.fn.domConstruct.destroy(dashletNode);
        }
   
        this.showMap = function () {
            var size = context.pane.getDashletSize();
            var height = "300px";
            if (size.h > 0)
                height = size.h + "px";
            context.fn.domStyle.set(dashletNode, "height", height);

                         timer = setInterval(function () {
                            animateBarometric();
                            animateChevrons();
                            animateDashed();
                            animateDotted();
                            animateTracks();
                        }, 20);

                        var geocoder = new google.maps.Geocoder();
                        var myLatlng = new google.maps.LatLng(39.916759, 32.799683);
                        var myOptions = {
                            zoom: 1,
                            center: new google.maps.LatLng(0, 0),
                            mapTypeId: google.maps.MapTypeId.SATELLITE,
                            mapTypeControl: true,
                            backgroundColor: 'white',
                            zoomControl: false,
                            streetViewControl: false,
                            panControl: false,
                            styles: [
                              {
                                  stylers: [
                                    { visibility: "off" }
                                  ]
                              }, {
                                  featureType: "water",
                                  stylers: [
                                    { visibility: "on" }
                                  ]
                              }, {
                                  featureType: "administrative.province",
                                  elementType: "geometry",
                                  stylers: [
                                    { visibility: "on" }
                                  ]
                              }, {
                                  featureType: "administrative.country",
                                  elementType: "geometry",
                                  stylers: [
                                    { visibility: "on" }
                                  ]
                              }, {
                                  featureType: "water",
                                  elementType: "labels",
                                  stylers: [
                                    { visibility: "off" }
                                  ]
                              }
                            ]
                        };
                        self.mask.onmouseover = start;
                        var map = self.map = new google.maps.Map(self.mapContainer, myOptions);
                        dotted = new google.maps.Polyline({
                            path: [
                              new google.maps.LatLng(45, -80),
                              new google.maps.LatLng(-45, 80)
                            ],
                            geodesic: true,
                            strokeOpacity: 0.0,
                            icons: [{
                                icon: {
                                    path: 'M 2,-5 2,5 3.5, 2',
                                    strokeOpacity: 1,
                                },
                                offset: '50%'
                            }, {
                                icon: {
                                    path: 'M -2,5 -2,-5 -3.5,-2',
                                    strokeOpacity: 1,
                                },
                                offset: '50%'
                            }, {
                                icon: {
                                    path: 'M -.5,-.5 .5,-.5, .5,.5 -.5,.5',
                                    fillOpacity: 1,
                                    fillColor: 'blue'
                                },
                                repeat: '6px'
                            }],
                            map: map,
                        });

                      var   tracks = new google.maps.Polyline({
                            path: [
                              new google.maps.LatLng(50, -80),
                              new google.maps.LatLng(-40, 80)
                            ],
                            geodesic: true,
                            strokeOpacity: 1.0,
                            strokeWeight: 1.0,
                            icons: [{
                                icon: {
                                    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
                                    strokeColor: 'black',
                                    strokeOpacity: 1.0,
                                    strokeWeight: 1.0,
                                    fillColor: 'yellow',
                                    fillOpacity: 1.0,
                                    scale: 4
                                },
                                repeat: '10%',
                                offset: '5%'
                            }],
                            map: map,
                        });

                     var   dashed = new google.maps.Polyline({
                            path: [
                              new google.maps.LatLng(40, -80),
                              new google.maps.LatLng(-50, 80)
                            ],
                            geodesic: true,
                            strokeOpacity: 0.0,
                            strokeColor: 'yellow',
                            icons: [{
                                icon: {
                                    path: 'M 0,-2 0,2',
                                    strokeColor: 'red',
                                    strokeOpacity: 1.0,
                                },
                                repeat: '24px'
                            }],
                            map: map,
                        });

                      var  barometric = new google.maps.Polyline({
                            path: [
                              new google.maps.LatLng(47, -80),
                              new google.maps.LatLng(-43, 80)
                            ],
                            geodesic: true,
                            strokeOpacity: 1.0,
                            icons: [{
                                icon: {
                                    path: 'M 0,-2 A 2,2 0 0 0 0,2 z',
                                    fillColor: 'blue',
                                    fillOpacity: 1,
                                    strokeWeight: 1,
                                    strokeColor: 'black',
                                    strokeOpacity: 1.0,
                                    scale: 6
                                },
                                offset: '0',
                                repeat: '48px'
                            }, {
                                icon: {
                                    path: 'M 0,-2 A 2,2 0 0 1 0,2 z',
                                    fillColor: 'red',
                                    fillOpacity: 1,
                                    strokeWeight: 1,
                                    strokeColor: 'black',
                                    strokeOpacity: 1.0,
                                    scale: 6
                                },
                                offset: '24px',
                                repeat: '48px'
                            }],
                            map: map,
                        });

                      var  chevrons = new google.maps.Polyline({
                            path: [
                              new google.maps.LatLng(43, -80),
                              new google.maps.LatLng(-47, 80)
                            ],
                            geodesic: true,
                            strokeOpacity: 0.0,
                            icons: [{
                                icon: {
                                    path: 'M -1,1 0,0 1,1',
                                    strokeOpacity: 1,
                                    strokeWeight: 1.5,
                                    scale: 6
                                },
                                repeat: '10px'
                            }],
                            map: map,
                        });

                    var    offset = {
                            'dotted': 0,
                            'tracks': 0,
                            'dashed': 0,
                            'darrow0': 50,
                            'darrow1': 50,
                            'barometric0': 0,
                            'barometric1': 24,
                            'chevrons': 0
                        }

                        google.maps.event.addListener(map, 'mouseout', stop);
                        google.maps.event.addListener(map, 'tilesloaded', function () {
                            unlock = true;
                        });


                        function start() {
                            if (unlock) {
                                self.mask.style.display = "none";

                                timer = setInterval(function () {
                                    animateBarometric();
                                    animateChevrons();
                                    animateDashed();
                                    animateDotted();
                                    animateTracks();
                                }, 20);
                            }
                        }

                        function stop() {
                            clearInterval(timer);
                            self.mask.style.display = "block";
                        }


                        function animateDotted() {
                            if (offset['dotted'] == 5) {
                                offset['dotted'] = 0;
                            } else {
                                offset['dotted']++;
                            }
                            if (offset['darrow0'] == 100) {
                                offset['darrow0'] = 0;
                            } else {
                                offset['darrow0']++;
                            }
                            if (offset['darrow1'] == 0) {
                                offset['darrow1'] = 100;
                            } else {
                                offset['darrow1']--;
                            }
                            var icons = dotted.get('icons');
                            icons[0].offset = offset['darrow1'] + '%';
                            icons[1].offset = offset['darrow0'] + '%';
                            icons[2].offset = offset['dotted'] + 'px';
                            dotted.set('icons', icons);
                        }

                        function animateTracks() {
                            if (offset['tracks'] == 9) {
                                offset['tracks'] = 0;
                            } else {
                                offset['tracks']++;
                            }
                            var icons = tracks.get('icons');
                            icons[0].offset = offset['tracks'] + '%';
                            tracks.set('icons', icons);
                        }

                        function animateDashed() {
                            if (offset['dashed'] > 23) {
                                offset['dashed'] = 0;
                            } else {
                                offset['dashed'] += 2;
                            }
                            var icons = dashed.get('icons');
                            icons[0].offset = offset['dashed'] + 'px';
                            dashed.set('icons', icons);
                        }

                        function animateBarometric() {
                            if (offset['barometric0'] == 47) {
                                offset['barometric0'] = 0;
                            } else {
                                offset['barometric0']++;
                            }
                            if (offset['barometric1'] == 0) {
                                offset['barometric1'] = 47;
                            } else {
                                offset['barometric1']--;
                            }
                            var icons = barometric.get('icons');
                            icons[0].offset = offset['barometric0'] + 'px';
                            icons[1].offset = offset['barometric1'] + 'px';
                            barometric.set('icons', icons);
                        }

                        function animateChevrons() {
                            if (offset['chevrons'] == 9) {
                                offset['chevrons'] = 0;
                            } else {
                                offset['chevrons']++;
                            }
                            var icons = chevrons.get('icons');
                            icons[0].offset = offset['chevrons'] + 'px';
                            chevrons.set('icons', icons);
                        }
                        stop();
        }
    }



    return googleDashletClass;
});