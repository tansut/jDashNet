define([
          "dojo/i18n!klt/nls/language",
        "klt/core/Declare",
		"dojo/_base/lang",
		"dojo/text!./resources/editor.htm",
		"dijit/_WidgetBase",
		"dijit/_TemplatedMixin",
		"require",
	    'dojo/dom-construct',
        "jdash/ui/TitleEditor",
        "jdash/ui/DashletStylesList"

],
	function (language, declare, lang, template, _WidgetBase, _TemplatedMixin, require, domConstruct, TitleEditor, DashletStylesList) {
	    return declare([_WidgetBase, _TemplatedMixin], {

	        templateString: template,
	        postCreate: function () {
	            this.inherited(arguments);
	            this.boxes = [];
	            var CityBoxPath = require.toUrl("./CityBox.js");
	            var self = this;
	            require([CityBoxPath], function () {
	                var cities = self.context.config.get("cities");
	                if (self.context.config.cities) {
	                    for (var i = 0; i < cities.length; i++) {
	                        self.addBox(null, cities[i].query, cities[i].display);
	                    }
	                }
	                
	            });

	            this.context.subscribe("jdash/dashlet/editor/validating", function (event) {
	                if (event.sender == this) {
	                    self.setConfig();
	                }
	            });
	        },
	        removeBox: function (box) {
	            for (var i = 0; i < this.boxes.length; i++) {
	                if (box == this.boxes[i]) {
	                    this.boxes.splice(i, 1);
	                    break;
	                }
	            }
	            this.setConfig();
	        },
	        constructor: function () {
	            this.language = language;
	        },
	        addBox: function (arg,query, display) {

	            this.boxes.push(new CityBox(this, query || "", display || "", this.boxContainer));
                
	  //          this.setConfig();
	        },
	        setConfig: function () {
	            var configData = [];
	            for (var i = 0; i < this.boxes.length; i++) {
	                var box = this.boxes[i];
	                if (box.queryDom.value != "" && box.displayDom.value != "") {
	                    configData.push({ query: box.queryDom.value, display: box.displayDom.value });
	                }
	            }
	            this.context.config.set("cities", configData);
	        }
	    });
	});