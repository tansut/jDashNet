define(['dojo/_base/declare',
'dojo/_base/lang',
'require',
'dojo/_base/Deferred',
"dojo/when"],
function (declare, lang, require, Deferred, when) {
    return declare('klt.ui._DynamicViewHolderMixin', null, {
        viewPath: null,

        viewParams: null,

        viewDomNode: null,

        isLoaded: false,

        loadedView: null,

        _loadDefer: null,

        onLoad: function () {
            this.isLoaded = true;
        },

        destroyLoadedView: function () {
            if (this.loadedView && lang.isFunction(this.loadedView.destroyRecursive))
                this.loadedView.destroyRecursive();
            this.isLoaded = false;
            delete this.loadedView;
        },

        onLoadView: function () {

        },

        setView: function (viewClass, noStart) {
            var self = this;

            if (lang.isString(viewClass)) {
                self._loadDefer.reject(viewClass);
            } else {
                try {
                    if (lang.isFunction(viewClass))
                        self.loadedView = new viewClass(self.viewParams, self.viewDomNode);
                    else self.loadedView = viewClass;
                    var waitHandle = noStart ? null : self.loadedView.startup();
                    when(waitHandle, function () {
                        self.onLoadView();
                        self._loadDefer.resolve(self.loadedView);
                    }, function (err) {
                        self._loadDefer.reject(err);

                    });
                } catch (e) {
                    self._loadDefer.reject(e);
                }

            }
        },

        loadView: function (noStart) {
            var self = this;
            require([this.viewPath], function (viewClass) {
                self.setView(viewClass, noStart);
            }, function (err) {
                self._loadDefer.reject(err);
            });
        },

        refresh: function (noStart) {
            if (this.loadedView) {
                this.destroyLoadedView();
            }
            this.isLoaded = false;
            this._loadDefer = new Deferred();
            this.loadView(noStart);
            return this._loadDefer;
        },

        destroyRecursive: function () {
            if (this.loadedView)
                this.destroyLoadedView();
            this.inherited(arguments);
        }
    });
});