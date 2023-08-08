define([
            "dojo/i18n!jdash/nls/language",
            'dojo/_base/declare',
			'dojo/_base/lang',
			'dojo/text!./resources/template.htm',
			'dijit/_WidgetBase',
			'dijit/_TemplatedMixin',
			'dijit/_WidgetsInTemplateMixin',
			'dojo/on',
			'dojo/dom-construct',
			'dojo/query',
			'dojo/dom-class',
			'dojo/dom-style',
            'dojo/_base/Deferred',
            'dojo/_base/array',
            'dojo/json',
            'require',
            "dojo/dom-attr",
            "klt/core/when",
            "dojo/dom-geometry",
            "jdash/ui/Viewport"


],

	function (language, declare, lang, template, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn,
			  on, domConstruct, query, domClass, domStyle, Deferred, array, Json, require, domAttr,
              when, domGeom, Viewport) {
	    var dashletClass = declare('app.dashlets.ContentLoader', [_WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn], {

	        templateString: template,

	        postCreate: function () {
	            var self = this;

	            lang.mixin(this.context, {
	                adjustSize: function () {
	                    var node = self.contentLoader &&
                            self.contentLoader.domNode.contentWindow &&
                            self.contentLoader.domNode.contentWindow.document &&
                            self.contentLoader.domNode.contentWindow.document.body;
	                    if (node) {
	                        var computedStyle = domStyle.getComputedStyle(node);
	                        var output = domGeom.getContentBox(node, computedStyle);
	                        self.contentLoader.adjustSize(undefined, output.h);
	                    }
	                }

	            });

	            self = this;

	            this.context.subscribe("jdash/layout/dnd/dropped", function (event) {
	                if (event.sender == this.dashboard.layout &&
                        self.contentLoader &&
                        event.args.pane == this.pane) {
	                    self.loadContent();
	                }
	            });

	            this.context.subscribe("jdash/dashlet/visualStateChanged", function (event) {
	                if (event.sender == this &&
                        self._started && (event.args.state == "maximize" || event.args.state == "expand"))
	                    self.loadContent();
	            });

	            this.own(Viewport.on("resize", function () {
	                self.context.adjustSize();
	            }));

	            this.set("contentUrl", null);
	        },



	        loadMode: "iFrame",

	        startup: function () {
	            this.inherited(arguments);
	            //    this.context.config["contentUrl"] = "/Features/Dashlet/DropValidation/GettingStarted";	            	            
	            if (!this.context.config.has("contentUrl")) {
	                return this.context.pane.openEditor();
	            }
	            else return this.loadContent(this.get("contentUrl"));

	        },

	        destroyLoader: function () {
	            if (this.contentLoader) {
	                this.contentLoader.destroyRecursive();
	                delete this.contentLoader;
	                domConstruct.empty(this.containerNode);
	            }
	        },

	        loadContent: function (url) {

	            url = url || this.context.config.get("contentUrl");
	            if (!url || url.length == 0) return;
	            var self = this;
	            this.errorLbl.innerHTML = "";
	            this.destroyLoader();
	            var loaderClass;
	            switch (this.context.config.getDefault("viewMode", "iFrame")) {
	                case "iFrame":
	                    loaderClass = IFrame;
	                    break;
	                case "inline":
	                    loaderClass = InDocumentLoader;
	                    break;

	            }

	            var params = { url: url };
	            var loader = this.contentLoader = new loaderClass(params);
	            var loadDefer = loader.startup();

	            loader.placeAt(self.containerNode);

	            // this.context.setBusy(loadDefer, language.RetreivingContent);

	            when(loadDefer, function () {
	                self.context.showBody();
	                //     self.context.clearBusy(loadDefer, language.RetreivingContent);
	                var startup = self.contentLoader.domNode.contentWindow &&
                        self.contentLoader.domNode.contentWindow.startup;
	                if (lang.isFunction(startup)) {
	                    return startup.apply(self.contentLoader.domNode.contentWindow, [self.context]);
	                }
	            },
                function (err) {
                    self.context.showBody();
                    self.errorLbl.innerHTML = language.UnableToLoad;
                }
                );

	            return loader;
	        },

	        _setContentUrlAttr: function (value) {
	            if (this.context.config.get("w"))
	                this.context.pane.domNode.style.width = this.context.config.get("w");
	            else
	                this.context.pane.domNode.style.width = "";
	            if (this.context.config.get("h"))
	                this.domNode.style.height = this.context.config.get("h");
	            else
	                this.domNode.style.height = "";
	            if (value && value.length != 0)
	                this.context.showBody();
	            else { this.context.hideBody(); return; }

	            if (this._started) {
	                var loadResult = this.loadContent(value);
	                return loadResult;
	            }
	        },

	        destroyRecursive: function () {
	            this.destroyLoader();
	            this.inherited(arguments);
	        }

	    });
	    return dashletClass;
	});
