define(["require"],
	function (require) {
	    return function (params) {
	        this.context = params.context;
	        this.domNode = document.createElement("div");
	        var form = document.createElement("form");

	        var scaleSelect = document.createElement("select");
	        scaleSelect.setAttribute("name", "scale");
	        this.scaleSelect = scaleSelect;

	        var values = ["default", "noborder", "exactfit", "noscale"];
	        var inners = ["Default", "No Border", "Exact Fit", "No Scale"];
	        for (i = 0; i < values.length; i++) {
	            var option = document.createElement("option");
	            option.setAttribute("value", values[i]);
	            option.innerHTML = inners[i];
	            var value = document.createAttribute("value");
	            scaleSelect.appendChild(option);
	        }

	        form.appendChild(scaleSelect);

	        var fors = ["flashurl", "height", "width"];
	        inners = ["Flash URL", "Height", "Width"];
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

	            this.height.value = this.context.config.getDefault("flashHeight", "100%");
	            this.width.value = this.context.config.getDefault("flashWidth", "100%");
	            this.scaleSelect.value = this.context.config.getDefault("scale", "default");
	            this.flashurl.value = this.context.config.getDefault("flashUrl", "");
                
	            var self = this;

	            this.context.subscribe("jdash/dashlet/editor/validating", function (event) {
	                if (event.sender == this) {
	                    var height = this.config.set("flashHeight", self.height.value, true);
	                    var width = this.config.set("flashWidth", self.width.value, true);
	                    var scaleSelect = this.config.set("scale", self.scaleSelect.value);
	                    var urlTest = this.config.set("flashUrl", self.flashurl.value, true);
	                    event.nextDefer = urlTest;

	                }
	            });
	        }
	    }
	});