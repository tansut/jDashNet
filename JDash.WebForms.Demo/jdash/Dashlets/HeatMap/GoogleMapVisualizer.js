define(["JDash/Dashlets/GoogleMapLoader!", "require"], function (foo, require) {

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
        this.mask.innerHTML = '<div class="msg"><center>Loading data...</center></div>';
        this.dashletNode.appendChild(this.mask);

        this.year = document.createElement("div");
        this.context.fn.domClass.add(this.year, "year");
        this.dashletNode.appendChild(this.year);
        
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
            
            var dataPath = require.toUrl("./resource/walmarts.js");            
            require([dataPath], function () {            
                self.mask.innerHTML = '<div class="msg"><center>Mouse over the map to view</center></div>';
                    self.showMap();                
            });

            
        }
        var timer;
        var map;
        var nextStore = 0;
        var year = 1962;
        var month = 1;
        var colors = [];
        var unlock = false;
        var running = false;
        var data;
        this.destroyRecursive = function () {
            clearInterval(timer);
            context.fn.domConstruct.destroy(dashletNode);
        }
   
        this.showMap = function () {

            var size = context.pane.getDashletSize();
            var height = "300px";
            if (size.h > 0)
                height = size.h + "px";
            //alert(size.w + " " + height);
            context.fn.domStyle.set(dashletNode, "height", height);

            data = new google.maps.MVCArray();
           self.map= map = new google.maps.Map(self.mapContainer, {
                zoom: 4,
                mapTypeControl: true,
                center: new google.maps.LatLng(37, -96),
                mapTypeId: google.maps.MapTypeId.SATELLITE,
                styles: [{
                    stylers: [{ saturation: -100 }]
                }, {
                    featureType: 'poi.park',
                    stylers: [{ visibility: 'off' }]
                }],
                disableDefaultUI: true
            });

            heatmap = new google.maps.visualization.HeatmapLayer({
                map: map,
                data: data,
                radius: 16,
                dissipate: false,
                maxIntensity: 8,
                gradient: [
                  'rgba(0, 0, 0, 0)',
                  'rgba(255, 255, 0, 0.50)',
                  'rgba(0, 0, 255, 1.0)'
                ]
            });
            self.mask.onmouseover = start;
            google.maps.event.addListener(map, 'mouseout', stop);
            google.maps.event.addListener(map, 'tilesloaded', function () {
                unlock = true;
            });


            function start() {
                if (unlock && !running) {
                    self.mask.style.display = "none";
                    self.mask.style.display = "none";
                    running = true;
                    nextMonth();
                }
            }

            function stop() {
                self.mask.style.display = "block";
                self.mask.style.display = "block";
                running = false;
            }

            function nextMonth() {
                
                if (!running) {
                    return;
                }
                while (stores[nextStore] && stores[nextStore].date[0] <= year && stores[nextStore].date[1] <= month && 1984>=year) {
                    data.push(new google.maps.LatLng(stores[nextStore].coords[0], stores[nextStore].coords[1]));
                    nextStore++;
                }
                if (nextStore < stores.length && 1984 >= year) {
                    if (month == 12) {
                        month = 1;
                        year++;
                        self.year.innerHTML = year;
                    } else {
                        month++;
                    }
                    setTimeout(nextMonth, 30);
                }
            }
            stop();

        }
    }



    return googleDashletClass;
});