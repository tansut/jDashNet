define(["dojo/i18n!app/dashlets/RssReader/resources/nls/language",
        "dojo/_base/declare",
		"dojo/_base/lang",
		"dojo/text!./resources/editor.htm",
		"dijit/_WidgetBase",
		"dijit/_TemplatedMixin",
        "jdash/ui/TitleEditor",
        "jdash/ui/DashletStylesList"],
	function (language, declare, lang, template, _WidgetBase, _TemplatedMixin, TitleEditor, DashletStylesList) {
	    return declare([_WidgetBase, _TemplatedMixin], {

	        templateString: template,

	        _viewModeChanged: function () {
	            this.context.config.set("viewMode", this.viewMode.value);
	        },

	        _feedCountChanged: function () {
	            var limitValue = parseInt(this.feedCount.value);
	            this.context.config.set("feedCount", limitValue == 0 ? undefined : limitValue);
	        },

	        buildRendering: function()
	        {
	            this.viewMode = language.ViewMode;
	            this.ShowHeadersOnly = language.ShowHeadersOnly;
	            this.ShowFullContent = language.ShowFullContent;
	            this.ShowContentSummary = language.ShowContentSummary;
	            this.LimitFeeds = language.LimitFeeds;
	            this.Unlimited = language.Unlimited;
	            this.inherited(arguments);
	            this.dashletTitle = new TitleEditor({ context: this.context.dashletContext }, this.dashletTitleNode);
	            this.dashletStyles = new DashletStylesList({ context: this.context.dashletContext }, this.dashletStylesNode);
	        },

	        startup: function () {
	            this.dashletTitle.startup();
	            this.dashletStyles.startup();
	            this.inherited(arguments);
	        },

	        postCreate: function () {
	            var url = this.context.config.get("rssUrl");
	            this.rssUrl.value = url ? url : "";
	            this.feedCount.value = this.context.config.getDefault("feedCount", 0);
	            this.viewMode.value = this.context.config.getDefault("viewMode", "headersOnly");
	            var self = this;

	            this.context.subscribe("jdash/dashlet/editor/validating", function (event) {
	                if (event.sender == this) {
	                    var urlTest = this.config.set("rssUrl", self.rssUrl.value, true);
	                    event.nextDefer = urlTest;
	                }
	            });

	            this.inherited(arguments);
	        },

	        destroyRecursive: function () {
	            this.dashletTitle.destroyRecursive();
	            this.dashletStyles.destroyRecursive();
	            this.inherited(arguments);
	            
	        }

	    });
	});
