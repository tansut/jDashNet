define([
        "dojo/i18n!jdash/nls/language",
        'dojo/_base/declare',
		'dojo/_base/lang',
		'dojo/text!./resources/editor.htm',
		'dijit/_WidgetBase',
		'dijit/_TemplatedMixin',
		'dijit/_WidgetsInTemplateMixin',
		'dojo/on',
		'dojo/dom-construct',
		'dojo/query',
		'dojo/dom-class',
		'dojo/dom-style',
        "dojo/when"

],
	function (language, declare, lang, template, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn,
			  on, domConstruct, query, domClass, domStyle, when) {
	    return declare([_WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn], {

	        templateString: template,

	        _viewModeChanged: function () {
	            this.context.config.set("viewMode", this.viewMode.value);
	        },

	        postCreate: function () {
	            var url = this.context.config.get("contentUrl");
	            var w = this.context.config.get("w");
	            var h = this.context.config.get("h");
	            this.contentUrl.value = url ? url : "";
	            this.windowWidth.value = w ? w : "";
	            this.windowHeigth.value = h ? h : "";
	            this.viewMode.value = this.context.config.getDefault("viewMode", "iFrame");
	            var self = this;

	            this.context.subscribe("jdash/dashlet/editor/validating", function (event) {
	                if (event.sender == this) {	           
	                    this.config.set("w", self.windowWidth.value);
	                    this.config.set("h", self.windowHeigth.value);
	                    var urlTest = this.config.set("contentUrl", self.contentUrl.value, true);
	                    event.nextDefer = urlTest;
	                }
	            });
	            
	            this.languagez = language;
	            this.viewModeLbl.innerHTML = language.ViewMode;
	            this.iFrameOpt.innerHTML = language.InsideIFrame;
	            this.inlineOpt.innerHTML = language.InsideCurrentDocument;
	            this.windowWidth.placeholder = language.Width;
	            this.windowHeigth.placeholder = language.Heigth;
	            this.frameDimLbl.innerHTML = language.FrameDimensions;
	            
	        }

	    });
	});
