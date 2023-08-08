define(['dojo/_base/declare',
        'dojo/_base/lang',
        "dojo/Deferred",
        "klt/core/when",
        "dojo/_base/array",
        "dojo/promise/all",
        "dojo/has",
        "dojo/ready"
],
function (declare, lang, Deferred, when, array, all, has, ready) {
    return declare('klt.ResourceManager', [], {


        knownResourcePaths: {},

        _initResources: [],

        registerInitResource: function (path) {
            this._initResources.push(path);
        },

        normalizeResourcePath: function (path) {

            function endsWith(str, suffix) {
                return str.indexOf(suffix, str.length - suffix.length) !== -1;
            }

            for (var i in this.knownResourcePaths) {
                if (endsWith(path, i))
                    return this.knownResourcePaths[i];
            }

            return path;
        },

        resourceType: function (href) {
            if (href.indexOf(".js", href.length - ".js".length) !== -1)
                return "js";
            else if (href.indexOf(".css", href.length - ".css".length) !== -1)
                return "css";
        },

        resetCache: function (unload) {
            if (this.resourceCache && unload) {
                for (var file in this.resourceCache) {
                    this.unload(file, this.resourceCache[file].type);
                }
            }
            delete this.resourceCache;
        },

        loadChecked: function (href, type, callback) {
            type = type || this.resourceType(href);
            this.resourceCache = this.resourceCache || {};
            if (!this.resourceCache[href])
                this.resourceCache[href] = {
                    requestCount: 0,
                    type: type
                }
            var cache = this.resourceCache[href];
            var isLoaded = this.isLoaded(href, type);
            if (!isLoaded) {
                var opResult = this.load(href, type, callback);
                if (opResult) {
                    cache.requestCount = cache.requestCount + 1;
                }
                return opResult;
            } else {
                cache.requestCount = cache.requestCount + 1;
                if (callback)
                    callback.apply(null);
            }
        },

        unloadChecked: function (href, type) {
            type = type || this.resourceType(href);
            this.resourceCache = this.resourceCache || {};
            var cache = this.resourceCache[href];
            if (cache) {
                cache.requestCount = cache.requestCount - 1;
                if (cache.requestCount <= 0) {
                    delete this.resourceCache[href];
                    return this.unload(href, type);
                }
            }
            else return this.unload(href, type);
        },

        _init: function () {

        },

        _loadInitResources: function () {
            if (this._initResources.length > 0) {
                var defers = [];
                array.forEach(this._initResources, function (path) {
                    var initDefer = new Deferred();
                    defers.push({ path: path, defer: initDefer });
                    this.load(path, null, function () {
                        array.forEach(defers, function (defer) {
                            if (defer.path == path) {
                                defer.defer.resolve();
                                //console.log(path + " loaded");
                            }
                        });

                    });
                }, this);
                var defs = [];
                array.forEach(defers, function (defer) {
                    defs.push(defer.defer);
                });
                var allDefs = all(defs);
                delete this._initResources;
                return allDefs;
            }
        },

        initCompleted: function() {
            return this._inited ? true: false;
        },

        initDefer: function() {
            return this._initDefer;
        },

        init: function (initArgs, fn) {
            if (!this._inited && !this._initInrogress) {
                this._initDefer = new Deferred();
                this._initInrogress = true;
                
                var self = this;
                when(this._loadInitResources(initArgs), function () {
                    var res = self._init.apply(self, [initArgs]);
                    when(res, function (initRes) {
                        self._inited = true;
                        delete self._initInrogress;
                        self._initDefer.resolve(initRes);
                        fn && fn.apply(self);
                    }, function (err) {
                        delete self._initInrogress;
                        self._initDefer.reject(err);
                        fn && fn.apply(self, [err]);
                    });
                }, function (err) {
                    delete self._initInrogress;
                    self._initDefer.reject(err);
                    fn && fn.apply(self, [err]);
                });
            };
            return this._initDefer;
        },

        load: function (href, type, callback) {
            type = type || this.resourceType(href);
            if (type == "js") { //if href is a external JavaScript file
                var fileref = document.createElement('script');
                fileref.setAttribute("type", "text/javascript");
                fileref.setAttribute("src", this.normalizeResourcePath(href));
            }
            else if (type == "css") { //if href is an external CSS file
                var fileref = document.createElement("link")
                fileref.setAttribute("rel", "stylesheet");
                fileref.setAttribute("type", "text/css");
                fileref.setAttribute("href", this.normalizeResourcePath(href));
            }

            if (typeof fileref != "undefined") {
                
                if (callback) {
                    if (has("safari")) {
                        var self = this;
                        //setTimeout(function () {
                        //    ready(function () {
                        //        callback.apply(self);
                        //    });
                        //}, 50);
                        var intervalHandle = setInterval(function () {
                            if ("complete".indexOf(document.readyState) != -1) {
                                clearInterval(intervalHandle);
                                //console.log('Safari loaded document ' + href);
                                callback.apply(self);
                            }
                        }, 50);
                    }
                    else if (fileref.addEventListener) {
                        fileref.addEventListener("load", callback, false);
                    }
                    else {
                        fileref.onreadystatechange = function () {
                            if (fileref.readyState == 4)
                                callback.apply(this);
                        };
                        
                    }
                }
                document.getElementsByTagName("head")[0].appendChild(fileref);
            }

            return fileref;
        },

        unload: function (href, type) {
            type = type || this.resourceType(href);
            var removedelements = 0
            var targetelement = (type == "js") ? "script" : (type == "css") ? "link" : "none" //determine element type to create nodelist using
            var targetattr = (type == "js") ? "src" : (type == "css") ? "href" : "none" //determine corresponding attribute to test for
            var allsuspects = document.getElementsByTagName(targetelement)
            var result = [];
            for (var i = allsuspects.length; i >= 0; i--) { //search backwards within nodelist for matching elements to remove
                if (allsuspects[i] && allsuspects[i].getAttribute(targetattr) != null && allsuspects[i].getAttribute(targetattr).indexOf(this.normalizeResourcePath(href)) != -1) {
                    allsuspects[i].parentNode.removeChild(allsuspects[i]) //remove element by calling parentNode.removeChild()
                    result.push(allsuspects[i]);
                }
            }
            return result;
        },

        createRef: function (href, type) {
            type = type || this.resourceType(href);

            if (type == "js") { //if href is a external JavaScript file
                var fileref = document.createElement('script')
                fileref.setAttribute("type", "text/javascript")
                fileref.setAttribute("src", this.normalizeResourcePath(href))
            }
            else if (type == "css") { //if href is an external CSS file
                var fileref = document.createElement("link")
                fileref.setAttribute("rel", "stylesheet")
                fileref.setAttribute("type", "text/css")
                fileref.setAttribute("href", this.normalizeResourcePath(href))
            }
            return fileref
        },

        isLoaded: function (href, type) {
            type = type || this.resourceType(href);
            var targetelement = (type == "js") ? "script" : (type == "css") ? "link" : "none" //determine element type to create nodelist using
            var targetattr = (type == "js") ? "src" : (type == "css") ? "href" : "none" //determine corresponding attribute to test for
            var allsuspects = document.getElementsByTagName(targetelement);

            for (var i = allsuspects.length; i >= 0; i--) { //search backwards within nodelist for matching elements to remove
                if (allsuspects[i] && allsuspects[i].getAttribute(targetattr) != null && allsuspects[i].getAttribute(targetattr).indexOf(this.normalizeResourcePath(href)) != -1) {
                    return allsuspects[i];
                }
            }
        },

        replace: function (oldhref, newhref, type) {
            type = type || this.resourceType(oldhref);
            var targetelement = (type == "js") ? "script" : (type == "css") ? "link" : "none" //determine element type to create nodelist using
            var targetattr = (type == "js") ? "src" : (type == "css") ? "href" : "none" //determine corresponding attribute to test for
            var allsuspects = document.getElementsByTagName(targetelement)
            var result = [];

            for (var i = allsuspects.length; i >= 0; i--) { //search backwards within nodelist for matching elements to remove
                if (allsuspects[i] && allsuspects[i].getAttribute(targetattr) != null && allsuspects[i].getAttribute(targetattr).indexOf(this.normalizeResourcePath(href)) != -1) {
                    var newelement = this.createRef(newhref, type)
                    allsuspects[i].parentNode.replaceChild(newelement, allsuspects[i])
                    result.push(allsuspects[i]);
                }
            }

            return result;
        }
    });
});