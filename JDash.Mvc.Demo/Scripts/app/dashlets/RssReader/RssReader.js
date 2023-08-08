define([    "dojo/i18n!./resources/nls/language",
			"dojo/_base/lang",
            "klt/core/Deferred",
            "require"

], function (language, lang, Deferred, require) {

    return function (params) {

        this.domNode = document.createElement("div");
        var context = this.context = params.context;

        var linkTemplate = '<a target="_blank" href="{link}">{title}</a>';
        var itemTemplate = '<div class="rssEntry">{0}</div>';

        this.viewTemplates = {
            headersOnly: lang.replace(itemTemplate, [linkTemplate]),
            fullContent: lang.replace(itemTemplate, [linkTemplate + '<div>{content}</div>']),
            contentSnippet: lang.replace(itemTemplate, [linkTemplate + '<div>{contentSnippet}</div>'])
        }

        this.cssPath = require.toUrl("./resources/styles.css");
        this.context.loadResource(this.cssPath);

        this.refresh = function () {
            var defer = null;
            if (!this.context.config.has("rssUrl")) {
                defer = this.context.openEditor();
            } else {
                defer = this.loadFeeds();
                this.context.setBusy(defer, language.ValidatingRSSContent);
            }
            return defer;
        }

        this.set = function (key, value) {
            var self = this;
            switch (key) {
                case 'feeds': {
                    this.feeds = value;
                    this.renderFeeds();
                    break;
                }
                case "viewMode": {
                    setTimeout(function () {
                        self.renderFeeds();
                    });
                    break;
                }
                case "feedCount": {
                    setTimeout(function () {
                        self.renderFeeds();
                    });
                    break;
                }
                case "rssUrl": {
                    var feedsResult = this.loadFeeds(value);
                    this.context.setBusy(feedsResult, language.ValidatingRSSContent);
                    break;
                }
            }
        }

        this.renderFeeds = function () {
            var feeds = this.feeds;
            $(this.domNode).empty();
            if (feeds) {
                var viewMode = this.context.config.getDefault("viewMode", "headersOnly");
                var selectedTemplate = this.viewTemplates[viewMode];
                var feedCount = Math.min(this.context.config.getDefault("feedCount", feeds.feed.entries.length),
                    feeds.feed.entries.length);

                for (var i = 0; i < feedCount; i++) {
                    var entry = feeds.feed.entries[i];
                    var itemContent = lang.replace(selectedTemplate, entry);
                    $(this.domNode).append($(itemContent));
                }
            }
        }

        this.retreiveFeeds = function (feedUrl) {
            var api = "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&callback=?&q=" + encodeURIComponent(feedUrl);
            api += "&output=json_xml"
            var self = this;
            var loadDefer = new Deferred();

            setTimeout(function () {
                $.getJSON(api, function (data) {
                    if (data.responseStatus == 200) {
                        loadDefer.resolve(data.responseData);
                    } else {
                        loadDefer.reject(data.responseDetails);
                    };
                });
            }, 0);
            return loadDefer;
        }

        this.loadFeeds = function (url) {
            var url = url || this.context.config.get("rssUrl");
            var self = this;
            var feedsResult = this.retreiveFeeds(url);

            feedsResult.then(function (feeds) {
                self.set("feeds", feeds);
            }, function (err) {
                alert(err.message);
            });

            return feedsResult;
        }

        this.startup = function () {
            this.refresh();
        }


        this.destroy = function () {
            this.context.unloadResource(this.cssPath);
        }
    }
});
