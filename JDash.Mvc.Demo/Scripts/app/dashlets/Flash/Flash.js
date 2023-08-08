define(["require", "dojo/dom-attr", "dojo/dom-construct"],
	function (require, domAttr, domConstruct) {
	    return function (params) {

	        this.context = params.context;
	        this.domNode = document.createElement("center");

	        this.set = function (name, value) {
	            if (name == "flashUrl") {
	                //this.domNode.innerHTML = value;
	                this.startup(value);
	            }
	        },

	        this.reload = function (urlValue) {
	            var defer = null;

	            var url = urlValue || this.context.config.get("flashUrl");
	            if (!url) {
	                defer = this.context.pane.openEditor();
	            }
	            else {
	                var flash = dojo.byId(this.context.id + "flashObject");
	                if (flash) domConstruct.destroy(flash);
	                var object = domConstruct.create("OBJECT");
	                //domAttr.set(object, 'width', this.context.config.get("flashWidth"));
	                //domAttr.set(object, 'height', this.context.config.get("flashHeight"));
	                domAttr.set(object, 'id', this.context.id + "flashObject");
	                var fwidth = this.context.config.get("flashWidth");
	                var fheight = this.context.config.get("flashHeight");
	                domAttr.set(object, 'style', "height:" + fheight + ";" + "width:" + fwidth + ";");
	                var embed = domConstruct.create("EMBED");
	                //domAttr.set(embed, 'width', this.context.config.get("flashWidth"));
	                //domAttr.set(embed, 'height', this.context.config.get("flashHeight"));
	                domAttr.set(embed, 'style', "height:" + fheight + ";" + "width:" + fwidth + ";");
	                domAttr.set(embed, 'src', url);
	                domAttr.set(embed, 'scale', this.context.config.get("scale"));
	                domAttr.set(embed, 'wmode', "transparent");
	                domAttr.set(embed, 'quality', "high");
	                domAttr.set(embed, 'bgcolor', "#ffffff");
	                domAttr.set(embed, 'type', "application/x-shockwave-flash");
	                domAttr.set(embed, 'pluginspage', "http://www.macromedia.com/go/getflashplayer");
	                var param = domConstruct.create("PARAM");
	                domAttr.set(param, 'name', "quality");
	                domAttr.set(param, 'value', "high");
	                var param2 = domConstruct.create("PARAM");
	                domAttr.set(param2, 'name', "bgcolor");
	                domAttr.set(param2, 'value', "#ffffff");
	                //var param3 = domConstruct.create("PARAM");
	                //domAttr.set(param3, 'name', "scale");
	                //domAttr.set(param3, 'value', "exactfit");
	                domConstruct.place(param, object, 0);
	                domConstruct.place(param2, object, 1);
	                //domConstruct.place(param3, object, 2);
	                domConstruct.place(embed, object, 2);
	                domConstruct.place(object, this.domNode, 0);
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