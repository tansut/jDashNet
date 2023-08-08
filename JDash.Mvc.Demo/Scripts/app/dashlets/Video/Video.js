define(["require", "dojo/dom-attr", "dojo/dom-construct", "dojo/domReady!"],
	function (require, domAttr, domConstruct) {
	    return function (params) {

	        this.context = params.context;
	        this.domNode = document.createElement("center");

	        this.set = function (name, value) {
	            if (name = "videoUrl") {
	                this.startup(value);
	            }
	        },

	        this.reload = function (pathVal) {
	            var defer = null;

	            var path = pathVal || this.context.config.get("videoUrl");
	            if (!path) {
	                defer = this.context.pane.openEditor();
	            }
	            else {
	                var stream = dojo.byId(this.context.id + "streamObj");
	                if (stream) domConstruct.destroy(stream);
	                var video = document.createElement("video");
	                video.setAttribute("id", this.context.id + "streamObj");
	                video.setAttribute("height", this.context.config.get("videoHeight"));
	                video.setAttribute("width", this.context.config.get("videoWidth"));
	                video.setAttribute("controls", "controls");
	                var source = document.createElement("source");
	                source.setAttribute("src", path);
	                source.setAttribute("type", "video/mp4; codecs='avc1.4D401E, mp4a.40.2'");
	                video.appendChild(source);
	                this.domNode.appendChild(video);
	                video.load();
	                video.play();
	            }
	            return defer;
	        },

	        this.startup = function (value) {
	            this.started = true;
	            this.context.loadResource(require.toUrl("./resources/dashlet.css"));
	            return this.reload(value);

	        }


	    }

	});