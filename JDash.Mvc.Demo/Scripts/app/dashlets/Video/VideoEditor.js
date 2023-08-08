define(["require"],
	function (require) {
	    return function (params) {
	        this.context = params.context;
	        this.domNode = document.createElement("div");
	        var form = document.createElement("form");

	        //var typeSelect = document.createElement("select");
	        //typeSelect.setAttribute("name", "videoType");
	        //this.typeSelect = typeSelect;

	        //var values = ["video/mp4; codecs='avc1.4D401E, mp4a.40.2'", "video/ogg; codecs='theora, vorbis'", "video/webm; codecs='vp8.0, vorbis'"];
	        ////var values = ["video/mp4", "video/ogg", "video/webm"];

	        //var inners = ["mp4", "ogg", "webm"];
	        //for (i = 0; i < values.length; i++) {
	        //    var option = document.createElement("option");
	        //    option.setAttribute("value", values[i]);
	        //    option.innerHTML = inners[i];
	        //    var value = document.createAttribute("value");
	        //    typeSelect.appendChild(option);
	        //}

	        //form.appendChild(typeSelect);

	        var fors = ["videoUrl", "height", "width"];
	        inners = ["Video URL", "Height", "Width"];
	        for (i = 0; i < fors.length; i++) {
	            var row = document.createElement("p");
	            var label = document.createElement("label");
	            label.setAttribute("for", fors[i]);
	            label.innerHTML = inners[i];
	            var input = document.createElement("input");
	            this[fors[i]] = input;
	            input.setAttribute("name", fors[i]);
	            row.appendChild(label);
	            row.appendChild(input);
	            form.appendChild(row);
	        }

	        this.domNode.appendChild(form);

	        this.startup = function () {

	            this.height.value = this.context.config.getDefault("videoHeight", "100%");
	            this.width.value = this.context.config.getDefault("videoWidth", "100%");
	            //this.typeSelect.value = this.context.config.getDefault("videoType", "video/mp4");
	            this.videoUrl.value = this.context.config.getDefault("videoUrl", "");

	            var self = this;

	            this.context.subscribe("jdash/dashlet/editor/validating", function (event) {
	                if (event.sender == this) {
	                    var height = this.config.set("videoHeight", self.height.value, true);
	                    var width = this.config.set("videoWidth", self.width.value, true);
	                    //var typeSelect = this.config.set("videoType", self.typeSelect.value);
	                    var urlTest = this.config.set("videoUrl", self.videoUrl.value, true);
	                    event.nextDefer = urlTest;

	                }
	            });
	        }
	    }
	});