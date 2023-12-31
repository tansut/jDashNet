/*
 FusionCharts JavaScript Library
 Copyright FusionCharts Technologies LLP
 License Information at <http://www.fusioncharts.com/license>

 @version fusioncharts/3.3.1-release.19520

 @attributions (infers respective third-party copyrights)
 Raphael 2.1.0 (modified as "Red Raphael") <http://raphaeljs.com/license.html>
 SWFObject v2.2 (modified) <http://code.google.com/p/swfobject/>
 JSON v2 <http://www.JSON.org/js.html>
 jQuery 1.8.3 <http://jquery.com/>
 Firebug Lite 1.3.0 <http://getfirebug.com/firebuglite>
*/
(function () {
    if (!window.FusionCharts || !window.FusionCharts.version) {
        var a = {}, g = a.modules = {}, i = a.interpreters = {}, e = Object.prototype.toString, h = /msie/i.test(navigator.userAgent) && !window.opera, d = !!document.createElementNS && !!document.createElementNS("http://www.w3.org/2000/svg", "svg").createSVGRect, l = !1, b = function () { var c = a.ready; a.ready = !0; if (a.raiseEvent) a.readyNotified = !0, a.raiseEvent("ready", { version: a.core.version, now: !c }, a.core); a.readyNow = !c }, c = function (a, o) {
            var f, j; if (o instanceof Array) for (f =
            0; f < o.length; f += 1) typeof o[f] !== "object" ? a[f] = o[f] : (typeof a[f] !== "object" && (a[f] = o[f] instanceof Array ? [] : {}), c(a[f], o[f])); else for (f in o) typeof o[f] === "object" ? (j = e.call(o[f]), j === "[object Object]" ? (typeof a[f] !== "object" && (a[f] = {}), c(a[f], o[f])) : j === "[object Array]" ? (a[f] instanceof Array || (a[f] = []), c(a[f], o[f])) : a[f] = o[f]) : a[f] = o[f]; return a
        }; a.extend = function (a, o, f, j) { var k; if (f && a.prototype) a = a.prototype; if (j === !0) c(a, o); else for (k in o) a[k] = o[k]; return a }; a.uniqueId = function () {
            return "chartobject-" +
            (a.uniqueId.lastId += 1)
        }; a.uniqueId.lastId = 0; a.policies = { options: { swfSrcPath: ["swfSrcPath", void 0], product: ["product", "v3"], insertMode: ["insertMode", "replace"], safeMode: ["safeMode", !0], overlayButton: ["overlayButton", void 0], containerBackgroundColor: ["backgroundColor", "#ffffff"], chartType: ["type", void 0] }, attributes: { lang: ["lang", "EN"], "class": ["className", "FusionCharts"], id: ["id", void 0] }, width: ["width", "100%"], height: ["height", "100%"], src: ["swfUrl", ""] }; i.stat = ["swfUrl", "id", "width", "height", "debugMode",
        "registerWithJS", "backgroundColor", "scaleMode", "lang", "detectFlashVersion", "autoInstallRedirect"]; a.parsePolicies = function (c, o, f) { var j, k, b; for (k in o) if (a.policies[k] instanceof Array) b = f[o[k][0]], c[k] = b === void 0 ? o[k][1] : b; else for (j in typeof c[k] !== "object" && (c[k] = {}), o[k]) b = f[o[k][j][0]], c[k][j] = b === void 0 ? o[k][j][1] : b }; a.parseCommands = function (a, c, f) { var b, k; typeof c === "string" && (c = i[c] || []); b = 0; for (k = c.length; b < k; b++) a[c[b]] = f[b]; return a }; a.core = function (c) {
            if (!(this instanceof a.core)) {
                if (arguments.length ===
                1 && c instanceof Array && c[0] === "private") { if (g[c[1]]) return; g[c[1]] = {}; c[3] instanceof Array && (a.core.version[c[1]] = c[3]); return typeof c[2] === "function" ? c[2].call(a, g[c[1]]) : a } if (arguments.length === 1 && typeof c === "string") return a.core.items[c]; a.raiseError && a.raiseError(this, "25081840", "run", "", new SyntaxError('Use the "new" keyword while creating a new FusionCharts object'))
            } var b = {}; this.__state = {}; if (arguments.length === 1 && typeof arguments[0] === "object") b = arguments[0]; else if (a.parseCommands(b, i.stat,
            arguments), a.core.options.sensePreferredRenderer && b.swfUrl && b.swfUrl.match && !b.swfUrl.match(/[^a-z0-9]+/ig)) b.type = b.swfUrl; arguments.length > 1 && typeof arguments[arguments.length - 1] === "object" && (delete b[i.stat[arguments.length - 1]], a.extend(b, arguments[arguments.length - 1])); this.id = typeof b.id === "undefined" ? this.id = a.uniqueId() : b.id; this.args = b; if (a.core.items[this.id] instanceof a.core) a.raiseWarning(this, "06091847", "param", "", Error('A FusionChart oject with the specified id "' + this.id + '" already exists. Renaming it to ' +
            (this.id = a.uniqueId()))); if (b.type && b.type.toString) { if (!a.renderer.userSetDefault && (h || d)) b.renderer = b.renderer || "javascript"; b.swfUrl = (a.core.options.swfSrcPath || b.swfSrcPath || a.core.options.scriptBaseUri).replace(/\/\s*$/g, "") + "/" + b.type.replace(/\.swf\s*?$/ig, "") + ".swf" } a.parsePolicies(this, a.policies, b); this.attributes.id = this.id; this.resizeTo(b.width, b.height, !0); a.raiseEvent("BeforeInitialize", b, this); a.core.items[this.id] = this; a.raiseEvent("Initialized", b, this); return this
        }; a.core.prototype =
        {}; a.core.prototype.constructor = a.core; a.extend(a.core, { id: "FusionCharts", version: [3, 3, 1, "release", 19520], items: {}, options: { sensePreferredRenderer: !0 }, getObjectReference: function (c) { return a.core.items[c].ref } }, !1); window.FusionCharts = a.core; window.FusionMaps && window.FusionMaps.legacy && (a.core(["private", "modules.core.geo", window.FusionMaps.legacy, window.FusionMaps.version]), l = !0); !/loaded|complete/.test(document.readyState) && !document.loaded ? function () {
            function c() {
                if (!arguments.callee.done) {
                    arguments.callee.done =
                    !0; f && clearInterval(f); if (!l) window.FusionMaps && window.FusionMaps.legacy && a.core(["private", "modules.core.geo", window.FusionMaps.legacy, window.FusionMaps.version]), window.FusionMaps = a.core; setTimeout(b, 1)
                }
            } document.addEventListener ? document.addEventListener("DOMContentLoaded", c, !1) : document.attachEvent && window.attachEvent("onLoad", c); if (/msie/i.test(navigator.userAgent) && !window.opera) try {
                location.protocol === "https:" ? document.write('<script id="__ie_onload_fusioncharts" defer="defer" src="//:"><\/script>') :
                document.write('<script id="__ie_onload_fusioncharts" defer="defer" src="javascript:void(0)"><\/script>'), document.getElementById("__ie_onload_fusioncharts").onreadystatechange = function () { this.readyState == "complete" && c() }
            } catch (o) { } if (/WebKit/i.test(navigator.userAgent)) var f = setInterval(function () { /loaded|complete/.test(document.readyState) && c() }, 10); window.onload = function (a) { return function () { c(); a && a.call && a.call(window) } }(window.onload)
        }() : (a.ready = !0, setTimeout(b, 1)); window.FusionMaps = a.core
    }
})();
(function () {
    var a = FusionCharts(["private", "EventManager"]); if (a !== void 0) {
        window.FusionChartsEvents = {
            BeforeInitialize: "beforeinitialize", Initialized: "initialized", Loaded: "loaded", BeforeRender: "beforerender", Rendered: "rendered", DataLoadRequested: "dataloadrequested", DataLoadRequestCancelled: "dataloadrequestcancelled", DataLoadRequestCompleted: "dataloadrequestcompleted", BeforeDataUpdate: "beforedataupdate", DataUpdateCancelled: "dataupdatecancelled", DataUpdated: "dataupdated", DataLoadCancelled: "dataloadcancelled",
            DataLoaded: "dataloaded", DataLoadError: "dataloaderror", NoDataToDisplay: "nodatatodisplay", DataXMLInvalid: "dataxmlinvalid", InvalidDataError: "invaliddataerror", DrawComplete: "drawcomplete", Resized: "resized", BeforeDispose: "beforedispose", Disposed: "disposed", Exported: "exported"
        }; var g = function (a, d, e, b) { try { a[0].call(d, e, b || {}) } catch (c) { setTimeout(function () { throw c; }, 0) } }, i = function (h, d, e) {
            if (h instanceof Array) for (var b = 0, c; b < h.length; b += 1) {
                if (h[b][1] === d.sender || h[b][1] === void 0) if (c = h[b][1] === d.sender ?
                d.sender : a.core, g(h[b], c, d, e), d.detached === !0) h.splice(b, 1), b -= 1, d.detached = !1; if (d.cancelled === !0) break
            }
        }, e = {
            unpropagator: function () { return (this.cancelled = !0) === !1 }, detacher: function () { return (this.detached = !0) === !1 }, undefaulter: function () { return (this.prevented = !0) === !1 }, listeners: {}, lastEventId: 0, addListener: function (h, d, l) {
                if (h instanceof Array) for (var b = 0; b < h.length; b += 1) e.addListener(h[b], d, l); else typeof h !== "string" ? a.raiseError(l || a.core, "03091549", "param", "::EventTarget.addListener", Error("Unspecified Event Type")) :
                typeof d !== "function" ? a.raiseError(l || a.core, "03091550", "param", "::EventTarget.addListener", Error("Invalid Event Listener")) : (h = h.toLowerCase(), e.listeners[h] instanceof Array || (e.listeners[h] = []), e.listeners[h].push([d, l]))
            }, removeListener: function (h, d, l) {
                var b; if (typeof d !== "function") a.raiseError(l || a.core, "03091560", "param", "::EventTarget.removeListener", Error("Invalid Event Listener")); else if (h instanceof Array) for (b = 0; b < h.length; b += 1) e.removeListener(h[b], d, l); else if (typeof h !== "string") a.raiseError(l ||
                a.core, "03091559", "param", "::EventTarget.removeListener", Error("Unspecified Event Type")); else if (h = h.toLowerCase(), h = e.listeners[h], h instanceof Array) for (b = 0; b < h.length; b += 1) h[b][0] === d && h[b][1] === l && (h.splice(b, 1), b -= 1)
            }, triggerEvent: function (h, d, l, b, c) {
                if (typeof h !== "string") a.raiseError(d, "03091602", "param", "::EventTarget.dispatchEvent", Error("Invalid Event Type")); else {
                    h = h.toLowerCase(); d = {
                        eventType: h, eventId: e.lastEventId += 1, sender: d || Error("Orphan Event"), cancel: !1, stopPropagation: this.unpropagator,
                        prevented: !1, preventDefault: this.undefaulter, detached: !1, detachHandler: this.detacher
                    }; if (b) d.originalEvent = b; i(e.listeners[h], d, l); i(e.listeners["*"], d, l); c && d.prevented === !1 && g(c, d.sender, d, l); return !0
                }
            }
        }; a.raiseEvent = function (a, d, l, b, c) { return e.triggerEvent(a, l, d, b, c) }; a.addEventListener = function (a, d) { return e.addListener(a, d) }; a.removeEventListener = function (a, d) { return e.removeListener(a, d) }; a.extend(a.core, { addEventListener: a.addEventListener, removeEventListener: a.removeEventListener }, !1); a.extend(a.core,
        { addEventListener: function (a, d) { return e.addListener(a, d, this) }, removeEventListener: function (a, d) { return e.removeListener(a, d, this) } }, !0); a.addEventListener("BeforeDispose", function (a) { var d, l; for (d in e.listeners) for (l = 0; l < e.listeners[d].length; l += 1) e.listeners[d][l][1] === a.sender && e.listeners[d].splice(l, 1) }); if (a.ready && !a.readyNotified) a.readyNotified = !0, a.raiseEvent("ready", { version: a.core.version, now: a.readyNow }, a.core)
    }
})();
(function () {
    var a = FusionCharts(["private", "ErrorHandler"]); if (a !== void 0) {
        var g = { type: "TypeException", range: "ValueRangeException", impl: "NotImplementedException", param: "ParameterException", run: "RuntimeException", comp: "DesignTimeError", undefined: "UnspecifiedException" }, i = function (h, d, e, b, c, n) {
            var o = "#" + d + " " + (h ? h.id : "unknown-source") + b + " " + n + " >> "; c instanceof Error ? (c.name = g[e], c.module = "FusionCharts" + b, c.level = n, c.message = o + c.message, o = c.message, window.setTimeout(function () { throw c; }, 0)) : o += c; d =
            { id: d, nature: g[e], source: "FusionCharts" + b, message: o }; a.raiseEvent(n, d, h); if (typeof window["FC_" + n] === "function") window["FC_" + n](d)
        }; a.raiseError = function (a, d, e, b, c) { i(a, d, e, b, c, "Error") }; a.raiseWarning = function (a, d, e, b, c) { i(a, d, e, b, c, "Warning") }; var e = {
            outputHelpers: {
                text: function (a, d) { e.outputTo("#" + a.eventId + " [" + (a.sender.id || a.sender).toString() + '] fired "' + a.eventType + '" event. ' + (a.eventType === "error" || a.eventType === "warning" ? d.message : "")) }, event: function (a, d) { this.outputTo(a, d) }, verbose: function (a,
                d) { e.outputTo(a.eventId, a.sender.id, a.eventType, d) }
            }, outputHandler: function (h, d) { typeof e.outputTo !== "function" ? a.core.debugMode.outputFailed = !0 : (a.core.debugMode.outputFailed = !1, e.currentOutputHelper(h, d)) }, currentOutputHelper: void 0, outputTo: void 0, enabled: !1
        }; e.currentOutputHelper = e.outputHelpers.text; a.extend(a.core, {
            debugMode: {
                syncStateWithCharts: !0, outputFormat: function (a) {
                    if (a && typeof a.toLowerCase === "function" && typeof e.outputHelpers[a = a.toLowerCase()] === "function") return e.currentOutputHelper =
                    e.outputHelpers[a], !0; return !1
                }, outputTo: function (h) { typeof h === "function" ? e.outputTo = h : h === null && (a.core.debugMode.enabled(!1), delete e.outputTo) }, enabled: function (h, d, i) {
                    var b; if (typeof h === "object" && arguments.length === 1) b = h, h = b.state, d = b.outputTo, i = b.outputFormat; if (typeof h === "function") { if (typeof d === "string" && (arguments.length === 2 || b)) i = d; d = h; h = !0 } if (typeof h === "boolean" && h !== e.enabled) a.core[(e.enabled = h) ? "addEventListener" : "removeEventListener"]("*", e.outputHandler); if (typeof d === "function") e.outputTo =
                    d; a.core.debugMode.outputFormat(i); return e.enabled
                }, _enableFirebugLite: function () { window.console && window.console.firebug ? a.core.debugMode.enabled(console.log, "verbose") : a.loadScript("firebug-lite.js", function () { a.core.debugMode.enabled(console.log, "verbose") }, "{ startOpened: true }") }
            }
        }, !1)
    }
})();
FusionCharts(["private", "modules.mantle.ajax", function () {
    var a = this, g = window, i = parseFloat(navigator.appVersion.split("MSIE")[1]), e = i >= 5.5 && i <= 7 ? !0 : !1, h = g.location.protocol === "file:", d = g.ActiveXObject, l = (!d || !h) && g.XMLHttpRequest, b = { objects: 0, xhr: 0, requests: 0, success: 0, failure: 0, idle: 0 }, c = function () {
        var a; if (l) return c = function () { b.xhr++; return new l }, c(); try { a = new d("Msxml2.XMLHTTP"), c = function () { b.xhr++; return new d("Msxml2.XMLHTTP") } } catch (o) {
            try {
                a = new d("Microsoft.XMLHTTP"), c = function () {
                    b.xhr++;
                    return new d("Microsoft.XMLHTTP")
                }
            } catch (f) { a = !1 }
        } return a
    }, g = a.ajax = function (a, c) { this.onSuccess = a; this.onError = c; this.open = !1; b.objects++; b.idle++ }; g.stats = function (c) { return c ? b[c] : a.extend({}, b) }; g.prototype.headers = { "If-Modified-Since": "Sat, 29 Oct 1994 19:43:31 GMT", "X-Requested-With": "XMLHttpRequest", "X-Requested-By": "FusionCharts", Accept: "text/plain, */*", "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8" }; g.prototype.transact = function (n, d, f, j) {
        var k = this, q = k.xmlhttp, i = k.headers,
        m = k.onError, r = k.onSuccess, n = n === "POST", l, g; if (!q || e) q = c(), k.xmlhttp = q; q.onreadystatechange = function () { try { if (q.readyState === 4) !q.status && h || q.status >= 200 && q.status < 300 || q.status === 304 || q.status === 1223 || q.status === 0 ? (r && r(q.responseText, k, j, d), b.success++) : m && (m(Error("XmlHttprequest Error"), k, j, d), b.failure++), b.idle--, k.open = !1 } catch (a) { m && m(a, k, j, d), window.FC_DEV_ENVIRONMENT && setTimeout(function () { throw a; }, 0), b.failure++ } }; try {
            q.overrideMimeType && q.overrideMimeType("text/plain"); if (n) if (q.open("POST",
            d, !0), typeof f === "string") l = f; else { l = []; for (g in f) l.push(g + "=" + (f[g] + "").replace(/\=/g, "%3D").replace(/\&/g, "%26")); l = l.join("&") } else q.open("GET", d, !0), l = null; for (g in i) q.setRequestHeader(g, i[g]); q.send(l); b.requests++; b.idle++; k.open = !0
        } catch (B) { a.raiseError(a.core, "1110111515A", "run", "XmlHttprequest Error", B.message) } return q
    }; g.prototype.get = function (a, c) { return this.transact("GET", a, void 0, c) }; g.prototype.post = function (a, c, f) { return this.transact("POST", a, c, f) }; g.prototype.abort = function () {
        var a =
        this.xmlhttp; this.open = !1; return a && typeof a.abort === "function" && a.readyState && a.readyState !== 0 && a.abort()
    }; g.prototype.dispose = function () { this.open && this.abort(); delete this.onError; delete this.onSuccess; delete this.xmlhttp; delete this.open; b.objects--; return null }
}]);
(function () {
    var a = FusionCharts(["private", "modules.mantle.runtime;1.1"]); if (a !== void 0) {
        var g = /(^|[\/\\])(fusioncharts\.js|fusioncharts\.debug\.js|fusioncharts\.core\.js|fusioncharts\.min\.js)([\?#].*)?$/ig; a.getScriptBaseUri = function (a) { var c = document.getElementsByTagName("script"), f = c.length, b, n; for (n = 0; n < f; n += 1) if (b = c[n].getAttribute("src"), !(b === void 0 || b === null || b.match(a) === null)) return b.replace(a, "$1") }; a.core.options.scriptBaseUri = function () {
            var c = a.getScriptBaseUri(g); if (c === void 0) return a.raiseError(FusionCharts,
            "1603111624", "run", ">GenericRuntime~scriptBaseUri", "Unable to locate FusionCharts script source location (URL)."), ""; return c
        }(); var i = /[\\\"<>;&]/, e = /^[^\S]*?(sf|f|ht)(tp|tps):\/\//i, h = FusionChartsEvents.ExternalResourceLoad = "externalresourceload", d = {}, l = {}, b = {}, c = {}; a.isXSSSafe = function (a, c) { if (c && e.exec(a) !== null) return !1; return i.exec(a) === null }; a.loadScript = function (f, n, j, m, o) {
            if (!f) return !1; var e = n && n.success || n, i = n && n.failure, g, x = { type: "script", success: !1 }, w = function () {
                c[g] = clearTimeout(c[g]);
                x.success ? e && e(f, g) : i && i(f, g); a.raiseEvent(h, x, a.core)
            }, o = o ? "" : a.core.options.scriptBaseUri; g = o + f; a.isXSSSafe(g, !1) || (g = typeof window.encodeURIComponent === "function" ? window.encodeURIComponent(g) : window.escape(g)); x.path = o; x.src = g; x.file = f; if (b[g] === !0 && m) return x.success = !0, x.notReloaded = !0, typeof n === "function" && (n(), a.raiseEvent(h, x, a.core)), !0; if (d[g] && m) return !1; d[g] = !0; l[g] && l[g].parentNode && l[g].parentNode.removeChild(l[g]); n = l[g] = document.createElement("script"); n.type = "text/javascript"; n.src =
            g; j && (n.innerHTML = j); if (typeof e === "function") b[g] = !1, c[g] = clearTimeout(c[g]), n.onload = function () { b[g] = !0; x.success = !0; w() }, n.onerror = function () { b[g] = !1; d[g] = !1; w() }, n.onreadystatechange = function () { if (this.readyState === "complete" || this.readyState === "loaded") b[g] = !0, x.success = !0, w() }; document.getElementsByTagName("head")[0].appendChild(n); typeof i === "function" && (c[g] = setTimeout(function () { b[g] || w() }, a.core.options.html5ResourceLoadTimeout || 15E3)); return !0
        }; a.capitalizeString = function (a, c) {
            return a ?
            a.replace(c ? /(^|\s)([a-z])/g : /(^|\s)([a-z])/, function (a, c, f) { return c + f.toUpperCase() }) : a
        }; var n = a.purgeDOM = function (a) { var c = a.attributes, f, b; if (c) for (f = c.length - 1; f >= 0; f -= 1) b = c[f].name, typeof a[b] === "function" && (a[b] = null); if (c = a.childNodes) { c = c.length; for (f = 0; f < c; f += 1) n(a.childNodes[f]) } }, o = function (a, c, f) { for (var b in a) { var n; if (a[b] instanceof Array) c[a[b][0]] = f[b]; else for (n in a[b]) c[a[b][n][0]] = f[b][n] } }, f = /[^\%\d]*$/ig, j = /^(FusionCharts|FusionWidgets|FusionMaps)/; a.extend(a.core, {
            dispose: function () {
                a.raiseEvent("BeforeDispose",
                {}, this); a.renderer.dispose(this); delete a.core.items[this.id]; a.raiseEvent("Disposed", {}, this); for (var c in this) delete this[c]
            }, clone: function (c, f) { var b = typeof c, n = {}, j = a.extend({}, this.args, !1, !1); o(a.policies, j, this); o(a.renderer.getRendererPolicy(this.options.renderer), j, this); delete j.id; delete j.animate; delete j.stallLoad; n.link = j.link; j = a.extend({}, j, !1, !1); j.link = n.link; switch (b) { case "object": a.extend(j, c); break; case "boolean": f = c } return f ? j : new a.core(j) }, isActive: function () {
                if (!this.ref ||
                document.getElementById(this.id) !== this.ref || typeof this.ref.signature !== "function") return !1; try { return j.test(this.ref.signature()) } catch (a) { return !1 }
            }, resizeTo: function (c, b, n) { var j = { width: c, height: b }; if (typeof c === "object") j.width = c.width, j.height = c.height, n = b; if (j.width && typeof j.width.toString === "function") this.width = j.width.toString().replace(f, ""); if (j.height && typeof j.height.toString === "function") this.height = j.height.toString().replace(f, ""); n !== !0 && a.renderer.resize(this, j) }, chartType: function (a) {
                var c =
                this.src, f; if (typeof a === "string") this.src = a, this.isActive() && this.render(); return (f = (f = c.substring(c.indexOf(".swf"), 0)) ? f : c).substring(f.lastIndexOf("/") + 1).toLowerCase().replace(/^fcmap_/i, "")
            }
        }, !0); window.getChartFromId = window.getMapFromId = function (c) {
            a.raiseWarning(this, "11133001041", "run", "GenericRuntime~getObjectFromId()", 'Use of deprecated getChartFromId() or getMapFromId(). Replace with "FusionCharts()" or FusionCharts.items[].'); return a.core.items[c] instanceof a.core ? a.core.items[c].ref :
            window.swfobject.getObjectById(c)
        }
    }
})();
(function () {
    var a = FusionCharts(["private", "RendererManager"]); if (a !== void 0) {
        a.policies.options.containerElementId = ["renderAt", void 0]; a.policies.options.renderer = ["renderer", void 0]; a.normalizeCSSDimension = function (a, b, d) {
            var a = a === void 0 ? d.offsetWidth : a, b = b === void 0 ? d.offsetHeight : b, f; d.style.width = a = a.toString ? a.toString() : "0"; d.style.height = b = b.toString ? b.toString() : "0"; if (a.match(/^\s*\d*\.?\d*\%\s*$/) && !a.match(/^\s*0\%\s*$/) && d.offsetWidth === 0) for (f = d; f = f.offsetParent;) if (f.offsetWidth > 0) {
                a =
                (f.offsetWidth * parseFloat(a.match(/\d*/)[0]) / 100).toString(); break
            } if (b.match(/^\s*\d*\.?\d*\%\s*$/) && !b.match(/^\s*0\%\s*$/) && d.offsetHeight <= 20) for (f = d; f = f.offsetParent;) if (f.offsetHeight > 0) { b = (f.offsetHeight * parseFloat(b.match(/\d*/)[0]) / 100).toString(); break } f = { width: a.replace ? a.replace(/^\s*(\d*\.?\d*)\s*$/ig, "$1px") : a, height: b.replace ? b.replace(/^\s*(\d*\.?\d*)\s*$/ig, "$1px") : b }; d.style.width = f.width; d.style.height = f.height; return f
        }; var g = function () {
            a.raiseError(this, "25081845", "run", "::RendererManager",
            Error("No active renderer"))
        }, i = { undefined: { render: g, remove: g, update: g, resize: g, config: g, policies: {} } }, e = {}, h = a.renderer = {
            register: function (c, b) { if (!c || typeof c.toString !== "function") throw "#03091436 ~renderer.register() Invalid value for renderer name."; c = c.toString().toLowerCase(); if (i[c] !== void 0) return a.raiseError(a.core, "03091438", "param", "::RendererManager>register", 'Duplicate renderer name specified in "name"'), !1; i[c] = b; return !0 }, userSetDefault: !1, setDefault: function (c) {
                if (!c || typeof c.toString !==
                "function") return a.raiseError(a.core, "25081731", "param", "::RendererManager>setDefault", 'Invalid renderer name specified in "name"'), !1; if (i[c = c.toString().toLowerCase()] === void 0) return a.raiseError(a.core, "25081733", "range", "::RendererManager>setDefault", "The specified renderer does not exist."), !1; this.userSetDefault = !1; a.policies.options.renderer = ["renderer", c]; return !0
            }, notifyRender: function (c) {
                var b = a.core.items[c && c.id]; (!b || c.success === !1 && !c.silent) && a.raiseError(a.core.items[c.id], "25081850",
                "run", "::RendererManager", Error("There was an error rendering the chart. Enable FusionCharts JS debugMode for more information.")); if (b.ref = c.ref) c.ref.FusionCharts = a.core.items[c.id]; a.raiseEvent("internal.DOMElementCreated", c, b)
            }, protectedMethods: { options: !0, attributes: !0, src: !0, ref: !0, constructor: !0, signature: !0, link: !0, addEventListener: !0, removeEventListener: !0 }, getRenderer: function (a) { return i[a] }, getRendererPolicy: function (a) { a = i[a].policies; return typeof a === "object" ? a : {} }, currentRendererName: function () { return a.policies.options.renderer[1] },
            update: function (a) { e[a.id].update.apply(a, Array.prototype.slice.call(arguments, 1)) }, render: function (a) { e[a.id].render.apply(a, Array.prototype.slice.call(arguments, 1)) }, remove: function (a) { e[a.id].remove.apply(a, Array.prototype.slice.call(arguments, 1)) }, resize: function (a) { e[a.id].resize.apply(a, Array.prototype.slice.call(arguments, 1)) }, config: function (a) { e[a.id].config.apply(a, Array.prototype.slice.call(arguments, 1)) }, dispose: function (a) {
                e[a.id].dispose.apply(a, Array.prototype.slice.call(arguments,
                1))
            }
        }, d = function (c) { return function () { if (this.ref === void 0 || this.ref === null || typeof this.ref[c] !== "function") a.raiseError(this, "25081617", "run", "~" + c + "()", "ExternalInterface call failed. Check whether chart has been rendered."); else return this.ref[c].apply(this.ref, arguments) } }; a.addEventListener("BeforeInitialize", function (c) {
            var c = c.sender, b; if (typeof c.options.renderer === "string" && i[c.options.renderer.toLowerCase()] === void 0) c.options.renderer = a.policies.options.renderer[1]; c.options.renderer =
            c.options.renderer.toLowerCase(); e[c.id] = i[c.options.renderer]; if (e[c.id].initialized !== !0 && typeof e[c.id].init === "function") e[c.id].init(), e[c.id].initialized = !0; a.parsePolicies(c, e[c.id].policies || {}, c.args); for (var d in e[c.id].prototype) c[d] = e[c.id].prototype[d]; for (b in e[c.id].events) c.addEventListener(b, e[c.id].events[b])
        }); a.addEventListener("Loaded", function (c) {
            var b = c.sender, c = c.sender.ref; b instanceof a.core && delete b.__state.rendering; if (!(c === void 0 || c === null || typeof c.getExternalInterfaceMethods !==
            "function")) { var o; try { o = c.getExternalInterfaceMethods(), o = typeof o === "string" ? o.split(",") : [] } catch (f) { o = [], a.raiseError(b, "13111126041", "run", "RendererManager^Loaded", Error("Error while retrieving data from the chart-object." + (f.message && f.message.indexOf("NPObject") >= 0 ? " Possible cross-domain security restriction." : ""))) } for (c = 0; c < o.length; c += 1) b[o[c]] === void 0 && (b[o[c]] = d(o[c])) }
        }); var l = function (a, b) { if (typeof a[b] === "function") return function () { return a[b].apply(a, arguments) }; return a[b] }; a.addEventListener("loaded",
        function (c) { var b = c.sender; if (b.ref) { var d = a.renderer.protectedMethods, f = a.renderer.getRenderer(b.options.renderer).protectedMethods, j; for (j in c.sender) if (f && !d[j] && !(f[j] || b.ref[j] !== void 0)) try { b.ref[j] = l(c.sender, j) } catch (k) { } } }); var b = function (a, b) { var d = document.getElementById(a), f = b.getAttribute("id"); if (d === null) return !1; if (a === f) return !0; for (var f = b.getElementsByTagName("*"), j = 0; j < f.length; j += 1) if (f[j] === d) return !1; return !0 }; a.extend(a.core, {
            render: function (c) {
                var d, e; ((d = window[this.id]) &&
                d.FusionCharts && d.FusionCharts === this || (d = this.ref) && d.FusionCharts && d.FusionCharts === this) && a.renderer.dispose(this); window[this.id] !== void 0 && a.raiseError(this, "25081843", "comp", ".render", Error("#25081843:IECompatibility() Chart Id is same as a JavaScript variable name. Variable naming error. Please use unique name for chart JS variable, chart-id and container id.")); e = this.options.insertMode.toLowerCase() || "replace"; if (c === void 0) c = this.options.containerElementId; typeof c === "string" && (c = document.getElementById(c));
                if (c === void 0 || c === null) return a.raiseError(this, "03091456", "run", ".render()", Error("Unable to find the container DOM element.")), this; if (b(this.id, c)) return a.raiseError(this, "05102109", "run", ".render()", Error("A duplicate object already exists with the specific Id: " + this.id)), this; d = document.createElement(this.options.containerElementType || "span"); d.setAttribute("id", this.id); if (e !== "append" && e !== "prepend") for (; c.hasChildNodes() ;) c.removeChild(c.firstChild); e === "prepend" && c.firstChild ? c.insertBefore(d,
                c.firstChild) : c.appendChild(d); this.options.containerElement = c; this.options.containerElementId = c.id; if (e = d.style) e.position = "relative", e.textAlign = "left", e.lineHeight = "100%", e.display = "inline-block", e.zoom = "1", e["*DISPLAY"] = "inline"; a.normalizeCSSDimension(this.width, this.height, d); this.__state.rendering = !0; a.raiseEvent("BeforeRender", { container: c, width: this.width, height: this.height, renderer: this.options.renderer }, this); a.renderer.render(this, d, a.renderer.notifyRender); return this
            }, remove: function () {
                a.renderer.remove(this);
                return this
            }, configure: function (c, b) { var d; c && (typeof c === "string" ? (d = {}, d[c] = b) : d = c, a.renderer.config(this, d)) }
        }, !0); a.extend(a.core, {
            setCurrentRenderer: function () { var a = h.setDefault.apply(h, arguments); h.userSetDefault = !0; return a }, getCurrentRenderer: function () { return h.currentRendererName.apply(h, arguments) }, render: function () {
                var c = ["swfUrl", "id", "width", "height", "renderAt", "dataSource", "dataFormat"], b = {}, d; if (arguments[0] instanceof a.core) return arguments[0].render(), arguments[0]; for (d = 0; d < arguments.length &&
                d < c.length; d += 1) b[c[d]] = arguments[d]; typeof arguments[arguments.length - 1] === "object" && (delete b[c[d - 1]], a.extend(b, arguments[arguments.length - 1])); if (b.dataFormat === void 0) b.dataFormat = FusionChartsDataFormats.XMLURL; return (new a.core(b)).render()
            }
        }, !1)
    }
})();
(function () {
    var a = FusionCharts(["private", "DataHandlerManager"]); if (a !== void 0) {
        window.FusionChartsDataFormats = {}; var g = a.transcoders = {}, i = {}, e = {}, h = /url$/i, d = function (c, b, d, f) {
            var j = !1, k = d.obj, e = d.format, d = d.silent; a.raiseEvent("DataLoadRequestCompleted", { source: "XmlHttpRequest", url: f, data: c, dataFormat: e, cancelDataLoad: function () { j = !0; b.abort(); this.cancelDataLoad = function () { return !1 }; return !0 }, xmlHttpRequestObject: b.xhr }, k); j !== !0 ? k.setChartData(c, e, d) : a.raiseEvent("DataLoadCancelled", {
                source: "XmlHttpRequest",
                url: f, dataFormat: e, xmlHttpRequestObject: b.xhr
            }, k)
        }, l = function (c, b, d, f) { d = d.obj; c = { source: "XmlHttpRequest", url: f, xmlHttpRequestObject: b.xhr, error: c, httpStatus: b.xhr && b.xhr.status ? b.xhr.status : -1 }; a.raiseEvent("DataLoadError", c, d); typeof window.FC_DataLoadError === "function" && window.FC_DataLoadError(d.id, c) }; a.policies.options.dataSource = ["dataSource", void 0]; a.policies.options.dataFormat = ["dataFormat", void 0]; a.policies.options.dataConfiguration = ["dataConfiguration", void 0]; a.policies.options.showDataLoadingMessage =
        ["showDataLoadingMessage", !0]; a.addDataHandler = function (c, b) {
            if (typeof c !== "string" || g[c.toLowerCase()] !== void 0) a.raiseError(a.core, "03091606", "param", "::DataManager.addDataHandler", Error("Invalid Data Handler Name")); else {
                var d = {}, f = c.toLowerCase(); g[f] = b; b.name = c; d["set" + c + "Url"] = function (a) { return this.setChartDataUrl(a, c) }; d["set" + c + "Data"] = function (a, f) { return this.setChartData(a, c, !1, f) }; d["get" + c + "Data"] = function () { return this.getChartData(c) }; window.FusionChartsDataFormats[c] = f; window.FusionChartsDataFormats[c +
                "URL"] = f + "URL"; a.extend(a.core, d, !0)
            }
        }; a.addEventListener("BeforeInitialize", function (a) {
            var a = a.sender, b = a.options.dataSource; i[a.id] = ""; e[a.id] = {}; if (b !== void 0 && b !== null) {
                a.__state.dataSetDuringConstruction = !0; if (typeof a.options.dataFormat !== "string") switch (typeof b) { case "function": b = a.options.dataSource = b(a); a.options.dataFormat = "JSON"; break; case "string": a.options.dataFormat = /^\s*?\{[\s\S]*\}\s*?$/g.test(a.options.dataFormat) ? "JSON" : "XML"; break; case "object": a.options.dataFormat = "JSON" } a.setChartData(b,
                a.options.dataFormat)
            }
        }); a.addEventListener("BeforeDispose", function (a) { var b = a.sender; delete i[a.sender.id]; delete e[a.sender.id]; b && b.__state && b.__state.dhmXhrObj && b.__state.dhmXhrObj.abort() }); a.extend(a.core, {
            setChartDataUrl: function (c, b, e) {
                if (b === void 0 || b === null || typeof b.toString !== "function") a.raiseError(a.core, "03091609", "param", ".setChartDataUrl", Error("Invalid Data Format")); else {
                    var b = b.toString().toLowerCase(), f, j = this, k = j.options && j.options.renderer === "flash" && j.options.useLegacyXMLTransport ||
                    !1; h.test(b) ? f = b.slice(0, -3) : (f = b, b += "url"); a.raiseEvent("DataLoadRequested", { source: "XmlHttpRequest", url: c, dataFormat: f, cancelDataLoadRequest: function () { k = !0; a.raiseEvent("DataLoadRequestCancelled", { source: "XmlHttpRequest", url: c, dataFormat: f }, j); try { this.__state && this.__state.dhmXhrObj && this.__state.dhmXhrObj.abort() } catch (b) { } this.cancelDataLoadRequest = function () { return !1 }; return !0 } }, j); if (k) { if (this.__state && this.__state.dhmXhrObj) try { this.__state.dhmXhrObj.abort() } catch (g) { } } else {
                        this.options.dataSource =
                        c; if (!this.__state.dhmXhrObj) this.__state.dhmXhrObj = new a.ajax(d, l); this.__state.dhmXhrObj.get(typeof window.decodeURIComponent === "function" ? window.decodeURIComponent(c) : window.unescape(c), { obj: this, format: f, silent: e })
                    }
                }
            }, setChartData: function (c, b, d) {
                if (b === void 0 || b === null || typeof b.toString !== "function") a.raiseError(a.core, "03091610", "param", ".setChartData", Error("Invalid Data Format")); else {
                    var b = b.toString().toLowerCase(), f; if (h.test(b)) this.setChartDataUrl(c, b, d); else {
                        this.options.dataSource =
                        c; f = b; this.options.dataFormat = b; var b = g[f], j = !1; if (typeof b === "undefined") a.raiseError(a.core, "03091611", "param", ".setChartData", Error("Data Format not recognized")); else if (b = b.encode(c, this, this.options.dataConfiguration) || {}, b.format = b.dataFormat = f, b.dataSource = c, b.cancelDataUpdate = function () { j = !0; this.cancelDataUpdate = function () { return !1 }; return !0 }, a.raiseEvent("BeforeDataUpdate", b, this), delete b.cancelDataUpdate, j === !0) a.raiseEvent("DataUpdateCancelled", b, this); else {
                            i[this.id] = b.data || ""; e[this.id] =
                            {}; if (d !== !0) this.options.safeMode === !0 && this.__state.rendering === !0 && !this.isActive() ? (this.__state.updatePending = b, a.raiseWarning(this, "23091255", "run", "::DataHandler~update", "Renderer update was postponed due to async loading.")) : (delete this.__state.updatePending, a.renderer.update(this, b)); this.__state.dataReady = void 0; a.raiseEvent("DataUpdated", b, this)
                        }
                    }
                }
            }, getChartData: function (b, d) {
                var c; var h; if (b === void 0 || typeof b.toString !== "function" || (h = g[b = b.toString().toLowerCase()]) === void 0) a.raiseError(this,
                "25081543", "param", "~getChartData()", Error('Unrecognized data-format specified in "format"')); else return c = typeof e[this.id][b] === "object" ? e[this.id][b] : e[this.id][b] = h.decode(i[this.id], this, this.options.dataConfiguration), h = c, Boolean(d) === !0 ? h : h.data
            }, dataReady: function () { return this.__state.dataReady }
        }, !0); a.extend(a.core, {
            transcodeData: function (b, d, e, f, j) {
                if (!d || typeof d.toString !== "function" || !e || typeof e.toString !== "function" || g[e = e.toString().toLowerCase()] === void 0 || g[d = d.toString().toLowerCase()] ===
                void 0) a.raiseError(this, "14090217", "param", "transcodeData()", Error("Unrecognized data-format specified during transcoding.")); else { b = g[d].encode(b, this, j); e = g[e].decode(b.data, this, j); if (!(e.error instanceof Error)) e.error = b.error; return f ? e : e.data }
            }
        }, !1); a.addEventListener("Disposed", function (a) { delete e[a.sender.id] }); a.addEventListener("Loaded", function (b) { b = b.sender; b instanceof a.core && b.__state.updatePending !== void 0 && (a.renderer.update(b, b.__state.updatePending), delete b.__state.updatePending) });
        a.addEventListener("NoDataToDisplay", function (a) { a.sender.__state.dataReady = !1 }); var b = a._interactiveCharts = { selectscatter: [!0, !1], dragcolumn2d: [!0, !0], dragarea: [!0, !0], dragline: [!0, !0], dragnode: [!0, !0] }; a.addEventListener("Loaded", function (c) {
            var c = c.sender, d = c.__state, e, f; if (c.chartType && b[c.chartType()] && b[c.chartType()][0]) {
                for (e in a.transcoders) f = a.transcoders[e].name, f = "get" + f + "Data", c[f] = function (b, f) {
                    return function (c) {
                        return c === !1 ? f.apply(this) : this.ref.getUpdatedXMLData ? a.core.transcodeData(this.ref.getUpdatedXMLData(),
                        "xml", b) : this.getData ? this.getData(b) : f.apply(this)
                    }
                }(e, c.constructor.prototype[f]), c[f]._dynamicdatarouter = !0; d.dynamicDataRoutingEnabled = !0
            } else if (d.dynamicDataRoutingEnabled) { for (e in a.transcoders) f = a.transcoders[e].name, f = "get" + f + "Data", c.hasOwnProperty(f) && c[f]._dynamicdatarouter && delete c[f]; d.dynamicDataRoutingEnabled = !1 }
        })
    }
})();
var swfobject = window.swfobject = function () {
    function a() { if (!D) { try { var a = p.getElementsByTagName("body")[0].appendChild(p.createElement("span")); a.parentNode.removeChild(a) } catch (b) { return } D = !0; for (var a = E.length, f = 0; f < a; f++) E[f]() } } function g(a) { D ? a() : E[E.length] = a } function i(a) {
        if (typeof w.addEventListener != v) w.addEventListener("load", a, !1); else if (typeof p.addEventListener != v) p.addEventListener("load", a, !1); else if (typeof w.attachEvent != v) k(w, "onload", a); else if (typeof w.onload == "function") {
            var b =
            w.onload; w.onload = function () { b(); a() }
        } else w.onload = a
    } function e() { var a = p.getElementsByTagName("body")[0], b = p.createElement(y); b.setAttribute("type", B); var f = a.appendChild(b); if (f) { var c = 0; (function () { if (typeof f.GetVariable != v) { var d; try { d = f.GetVariable("$version") } catch (j) { } if (d) d = d.split(" ")[1].split(","), s.pv = [parseInt(d[0], 10), parseInt(d[1], 10), parseInt(d[2], 10)] } else if (c < 10) { c++; setTimeout(arguments.callee, 10); return } a.removeChild(b); f = null; h() })() } else h() } function h() {
        var a = u.length; if (a >
        0) for (var f = 0; f < a; f++) {
            var e = u[f].id, k = u[f].callbackFn, g = u[f].userData || {}; g.success = !1; g.id = e; if (s.pv[0] > 0) {
                var h = j(e); if (h) if (q(u[f].swfVersion) && !(s.wk && s.wk < 312)) { if (m(e, !0), k) g.success = !0, g.ref = d(e), k(g) } else if (u[f].expressInstall && l()) {
                    g = {}; g.data = u[f].expressInstall; g.width = h.getAttribute("width") || "0"; g.height = h.getAttribute("height") || "0"; if (h.getAttribute("class")) g.styleclass = h.getAttribute("class"); if (h.getAttribute("align")) g.align = h.getAttribute("align"); for (var i = {}, h = h.getElementsByTagName("param"),
                    r = h.length, n = 0; n < r; n++) h[n].getAttribute("name").toLowerCase() != "movie" && (i[h[n].getAttribute("name")] = h[n].getAttribute("value")); b(g, i, e, k)
                } else c(h), k && k(g)
            } else if (m(e, !0), k) { if ((e = d(e)) && typeof e.SetVariable != v) g.success = !0, g.ref = e; k(g) }
        }
    } function d(a) { var b, f = null; if (!document.embeds || !(b = document.embeds[a])) if (!((b = j(a)) && b.nodeName == "OBJECT")) b = window[a]; if (!b) return f; typeof b.SetVariable != v ? f = b : (a = b.getElementsByTagName(y)[0]) && (f = a); return f } function l() {
        return !H && q("6.0.65") && (s.win ||
        s.mac) && !(s.wk && s.wk < 312)
    } function b(a, b, f, c) {
        H = !0; K = c || null; M = { success: !1, id: f }; var d = j(f); if (d) {
            d.nodeName == "OBJECT" ? (G = n(d), I = null) : (G = d, I = f); a.id = x; if (typeof a.width == v || !/%$/.test(a.width) && parseInt(a.width, 10) < 310) a.width = "310"; if (typeof a.height == v || !/%$/.test(a.height) && parseInt(a.height, 10) < 137) a.height = "137"; p.title = p.title.slice(0, 47) + " - Flash Player Installation"; c = s.ie && s.win ? "ActiveX" : "PlugIn"; c = "MMredirectURL=" + w.location.toString().replace(/&/g, "%26") + "&MMplayerType=" + c + "&MMdoctitle=" +
            p.title; typeof b.flashvars != v ? b.flashvars += "&" + c : b.flashvars = c; if (s.ie && s.win && d.readyState != 4) c = p.createElement("div"), f += "SWFObjectNew", c.setAttribute("id", f), d.parentNode.insertBefore(c, d), d.style.display = "none", function () { d.readyState == 4 ? d.parentNode.removeChild(d) : setTimeout(arguments.callee, 10) }(); o(a, b, f)
        }
    } function c(a) {
        if (s.ie && s.win && a.readyState != 4) {
            var b = p.createElement("div"); a.parentNode.insertBefore(b, a); b.parentNode.replaceChild(n(a), b); a.style.display = "none"; (function () {
                a.readyState ==
                4 ? a.parentNode.removeChild(a) : setTimeout(arguments.callee, 10)
            })()
        } else a.parentNode.replaceChild(n(a), a)
    } function n(a) { var b = p.createElement("div"); if (s.win && s.ie) b.innerHTML = a.innerHTML; else if (a = a.getElementsByTagName(y)[0]) if (a = a.childNodes) for (var f = a.length, c = 0; c < f; c++) !(a[c].nodeType == 1 && a[c].nodeName == "PARAM") && a[c].nodeType != 8 && b.appendChild(a[c].cloneNode(!0)); return b } function o(a, b, f) {
        var c, f = j(f); if (s.wk && s.wk < 312) return c; if (f) {
            if (typeof a.id == v) a.id = f.id; if (s.ie && s.win) {
                var d = "", e; for (e in a) if (a[e] !=
                Object.prototype[e]) e.toLowerCase() == "data" ? b.movie = a[e] : e.toLowerCase() == "styleclass" ? d += ' class="' + a[e] + '"' : e.toLowerCase() != "classid" && (d += " " + e + '="' + a[e] + '"'); e = ""; for (var m in b) b[m] != Object.prototype[m] && (e += '<param name="' + m + '" value="' + b[m] + '" />'); f.outerHTML = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"' + d + ">" + e + "</object>"; J[J.length] = a.id; c = j(a.id)
            } else {
                m = p.createElement(y); m.setAttribute("type", B); for (var k in a) a[k] != Object.prototype[k] && (k.toLowerCase() == "styleclass" ?
                m.setAttribute("class", a[k]) : k.toLowerCase() != "classid" && m.setAttribute(k, a[k])); for (d in b) b[d] != Object.prototype[d] && d.toLowerCase() != "movie" && (a = m, e = d, k = b[d], c = p.createElement("param"), c.setAttribute("name", e), c.setAttribute("value", k), a.appendChild(c)); f.parentNode.replaceChild(m, f); c = m
            }
        } return c
    } function f(a) {
        var b = j(a); if (b && b.nodeName == "OBJECT") s.ie && s.win ? (b.style.display = "none", function () {
            if (b.readyState == 4) { var f = j(a); if (f) { for (var c in f) typeof f[c] == "function" && (f[c] = null); f.parentNode.removeChild(f) } } else setTimeout(arguments.callee,
            10)
        }()) : b.parentNode.removeChild(b)
    } function j(a) { var b = null; try { b = p.getElementById(a) } catch (f) { } return b } function k(a, b, f) { a.attachEvent(b, f); F[F.length] = [a, b, f] } function q(a) { var b = s.pv, a = a.split("."); a[0] = parseInt(a[0], 10); a[1] = parseInt(a[1], 10) || 0; a[2] = parseInt(a[2], 10) || 0; return b[0] > a[0] || b[0] == a[0] && b[1] > a[1] || b[0] == a[0] && b[1] == a[1] && b[2] >= a[2] ? !0 : !1 } function t(a, b, f, c) {
        if (!s.ie || !s.mac) {
            var d = p.getElementsByTagName("head")[0]; if (d) {
                f = f && typeof f == "string" ? f : "screen"; c && (L = C = null); if (!C || L !=
                f) c = p.createElement("style"), c.setAttribute("type", "text/css"), c.setAttribute("media", f), C = d.appendChild(c), s.ie && s.win && typeof p.styleSheets != v && p.styleSheets.length > 0 && (C = p.styleSheets[p.styleSheets.length - 1]), L = f; s.ie && s.win ? C && typeof C.addRule == y && C.addRule(a, b) : C && typeof p.createTextNode != v && C.appendChild(p.createTextNode(a + " {" + b + "}"))
            }
        }
    } function m(a, b) { if (N) { var f = b ? "visible" : "hidden"; D && j(a) ? j(a).style.visibility = f : t("#" + a, "visibility:" + f) } } function r(a) {
        return /[\\\"<>\.;]/.exec(a) != null &&
        typeof encodeURIComponent != v ? encodeURIComponent(a) : a
    } var v = "undefined", y = "object", B = "application/x-shockwave-flash", x = "SWFObjectExprInst", w = window, p = document, A = navigator, z = !1, E = [function () { z ? e() : h() }], u = [], J = [], F = [], G, I, K, M, D = !1, H = !1, C, L, N = !0, s = function () {
        var a = typeof p.getElementById != v && typeof p.getElementsByTagName != v && typeof p.createElement != v, b = A.userAgent.toLowerCase(), f = A.platform.toLowerCase(), c = f ? /win/.test(f) : /win/.test(b), f = f ? /mac/.test(f) : /mac/.test(b), b = /webkit/.test(b) ? parseFloat(b.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,
        "$1")) : !1, d = !+"\u000b1", e = [0, 0, 0], j = null; if (typeof A.plugins != v && typeof A.plugins["Shockwave Flash"] == y) { if ((j = A.plugins["Shockwave Flash"].description) && !(typeof A.mimeTypes != v && A.mimeTypes[B] && !A.mimeTypes[B].enabledPlugin)) z = !0, d = !1, j = j.replace(/^.*\s+(\S+\s+\S+$)/, "$1"), e[0] = parseInt(j.replace(/^(.*)\..*$/, "$1"), 10), e[1] = parseInt(j.replace(/^.*\.(.*)\s.*$/, "$1"), 10), e[2] = /[a-zA-Z]/.test(j) ? parseInt(j.replace(/^.*[a-zA-Z]+(.*)$/, "$1"), 10) : 0 } else if (typeof w.ActiveXObject != v) try {
            var m = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
            if (m) { try { j = m.GetVariable("$version") } catch (k) { } j && (d = !0, j = j.split(" ")[1].split(","), e = [parseInt(j[0], 10), parseInt(j[1], 10), parseInt(j[2], 10)]) }
        } catch (g) { } return { w3: a, pv: e, wk: b, ie: d, win: c, mac: f }
    }(); (function () {
        s.w3 && ((typeof p.readyState != v && p.readyState == "complete" || typeof p.readyState == v && (p.getElementsByTagName("body")[0] || p.body)) && a(), D || (typeof p.addEventListener != v && p.addEventListener("DOMContentLoaded", a, !1), s.ie && s.win && (p.attachEvent("onreadystatechange", function () {
            p.readyState == "complete" &&
            (p.detachEvent("onreadystatechange", arguments.callee), a())
        }), w == top && function () { if (!D) { try { p.documentElement.doScroll("left") } catch (b) { setTimeout(arguments.callee, 0); return } a() } }()), s.wk && function () { D || (/loaded|complete/.test(p.readyState) ? a() : setTimeout(arguments.callee, 0)) }(), i(a)))
    })(); (function () {
        s.ie && s.win && window.attachEvent("onunload", function () {
            for (var a = F.length, b = 0; b < a; b++) F[b][0].detachEvent(F[b][1], F[b][2]); a = J.length; for (b = 0; b < a; b++) f(J[b]); for (var c in s) s[c] = null; s = null; for (var d in swfobject) swfobject[d] =
            null; swfobject = null
        })
    })(); return {
        FusionChartsModified: !0, registerObject: function (a, b, f, c, d) { var e = d || {}; if (s.w3 && a && b) e.id = a, e.swfVersion = b, e.expressInstall = f, e.callbackFn = c, e.userData = d, u[u.length] = e, m(a, !1); else if (c) e.success = !1, e.id = a, c(e) }, getObjectById: function (a) { if (s.w3) return d(a) }, embedSWF: function (a, f, c, d, e, j, k, h, i, r, n) {
            var t = n || {}; t.success = !1; t.id = f; s.w3 && !(s.wk && s.wk < 312) && a && f && c && d && e ? (m(f, !1), g(function () {
                c += ""; d += ""; var g = {}; if (i && typeof i === y) for (var n in i) g[n] = i[n]; g.data = a; g.width =
                c; g.height = d; n = {}; if (h && typeof h === y) for (var p in h) n[p] = h[p]; if (k && typeof k === y) for (var s in k) typeof n.flashvars != v ? n.flashvars += "&" + s + "=" + k[s] : n.flashvars = s + "=" + k[s]; if (q(e)) p = o(g, n, f), g.id == f && m(f, !0), t.success = !0, t.ref = p; else if (j && l()) { g.data = j; b(g, n, f, r); return } else m(f, !0); r && r(t)
            })) : r && r(t)
        }, switchOffAutoHideShow: function () { N = !1 }, ua: s, getFlashPlayerVersion: function () { return { major: s.pv[0], minor: s.pv[1], release: s.pv[2] } }, hasFlashPlayerVersion: q, createSWF: function (a, b, f) {
            if (s.w3) return o(a,
            b, f)
        }, showExpressInstall: function (a, f, c, d) { s.w3 && l() && b(a, f, c, d) }, removeSWF: function (a) { s.w3 && f(a) }, createCSS: function (a, b, f, c) { s.w3 && t(a, b, f, c) }, addDomLoadEvent: g, addLoadEvent: i, getQueryParamValue: function (a) { var b = p.location.search || p.location.hash; if (b) { /\?/.test(b) && (b = b.split("?")[1]); if (a == null) return r(b); for (var b = b.split("&"), f = 0; f < b.length; f++) if (b[f].substring(0, b[f].indexOf("=")) == a) return r(b[f].substring(b[f].indexOf("=") + 1)) } return "" }, expressInstallCallback: function () {
            if (H) {
                var a = j(x);
                if (a && G) { a.parentNode.replaceChild(G, a); if (I && (m(I, !0), s.ie && s.win)) G.style.display = "block"; K && K(M) } H = !1
            }
        }
    }
}();
FusionCharts(["private", "modules.renderer.flash", function () {
    var a = this, g = window, i = document, e = function (a) { return typeof a === "function" }, h = g.encodeURIComponent ? function (a) { return g.encodeURIComponent(a) } : function (a) { return g.escape(a) }; try { a.swfobject = g.swfobject, g.swfobject.createCSS("object.FusionCharts:focus, embed.FusionCharts:focus", "outline: none") } catch (d) { } a.core.options.requiredFlashPlayerVersion = "8"; a.core.options.flashInstallerUrl = "http://get.adobe.com/flashplayer/"; a.core.options.installRedirectMessage =
    "You need Adobe Flash Player 8 (or above) to view the charts on this page. It is a free, lightweight and safe installation from Adobe Systems Incorporated.\n\nWould you like to go to Adobe's website and install Flash Player?"; a.core.hasRequiredFlashVersion = function (b) { if (typeof b === "undefined") b = a.core.options.requiredFlashPlayerVersion; return g.swfobject ? g.swfobject.hasFlashPlayerVersion(b) : void 0 }; var l = !1, b = /.*?\%\s*?$/g, c = { chartWidth: !0, chartHeight: !0, mapWidth: !0, mapHeight: !0 }, n = function (b, c) {
        if (!(c &&
        c.source === "XmlHttpRequest")) { var d = b.sender; if (d.ref && e(d.ref.dataInvokedOnSWF) && d.ref.dataInvokedOnSWF() && e(d.ref.getXML)) a.raiseWarning(d, "08300116", "run", "::DataHandler~__fusioncharts_vars", "Data was set in UTF unsafe manner"), d.setChartData(g.unescape(b.sender.ref.getXML({ escaped: !0 })), FusionChartsDataFormats.XML, !0), d.flashVars.dataXML = d.getChartData(FusionChartsDataFormats.XML), delete d.flashVars.dataURL; b.sender.removeEventListener("DataLoaded", n) }
    }; g.__fusioncharts_dimension = function () {
        return function (f) {
            var c,
            d; return !((c = a.core(f)) instanceof a.core && c.ref && (d = c.ref.parentNode)) ? {} : { width: d.offsetWidth * (b.test(c.width) ? parseInt(c.width, 10) / 100 : 1), height: d.offsetHeight * (b.test(c.height) ? parseInt(c.height, 10) / 100 : 1) }
        }
    }(); g.__fusioncharts_vars = function (b, c) {
        var d = a.core.items[b]; if (!(d instanceof a.core)) return setTimeout(function () {
            var c; if (c = b !== void 0) {
                var d = g.swfobject.getObjectById(b), j, k, h; c = {}; var i; if (!d && typeof d.tagName !== "string") c = void 0; else {
                    if ((j = d.parentNode) && j.tagName && j.tagName.toLowerCase() ===
                    "object" && j.parentNode) j = j.parentNode; if (j) { c.renderAt = j; if (!(d.tagName.toLowerCase() !== "object" && d.getAttribute && (i = d.getAttribute("flashvars") || "")) && d.hasChildNodes && d.hasChildNodes()) { h = d.childNodes; j = 0; for (d = h.length; j < d; j += 1) if (h[j].tagName === "PARAM" && (k = h[j].getAttribute("name")) && k.toLowerCase() === "flashvars") i = h[j].getAttribute("value") || "" } if (i && e(i.toString)) { i = i.split(/\=|&/g); c.flashVars = {}; j = 0; for (d = i.length; j < d; j += 2) c.flashVars[i[j]] = i[j + 1] } } else c = void 0
                }
            } c || a.raiseError(a.core, "25081621",
            "run", "::FlashRenderer", "FusionCharts Flash object is accessing flashVars of non-existent object.")
        }, 0), !1; if (typeof c === "object") { if (d.ref && e(d.ref.dataInvokedOnSWF) && d.ref.dataInvokedOnSWF()) { if (c.dataURL !== void 0) d.addEventListener("DataLoaded", n); else if (c.dataXML !== void 0) c.dataXML = g.unescape(c.dataXML); d.__state.flashUpdatedFlashVars = !0 } else delete c.dataURL, delete c.dataXML; a.extend(d.flashVars, c); return !0 } if (d.__state.dataSetDuringConstruction && d.flashVars.dataXML === void 0 && d.options.dataSource !==
        void 0 && typeof d.options.dataFormat === "string") d.flashVars.dataXML = d.options.dataSource; d.__state.flashInvokedFlashVarsRequest = !0; return d.flashVars
    }; g.__fusioncharts_event = function (b, c) { setTimeout(function () { a.raiseEvent(b.type, c, a.core.items[b.sender]) }, 0) }; var o = function (b) {
        b = b.sender; if (b.options.renderer === "flash") {
            if (b.width === void 0) b.width = a.renderer.policies.flashVars.chartWidth[1]; if (b.height === void 0) b.height = a.renderer.policies.flashVars.chartHeight[1]; if (b.flashVars.DOMId === void 0) b.flashVars.DOMId =
            b.id; a.extend(b.flashVars, { registerWithJS: "1", chartWidth: b.width, chartHeight: b.height, InvalidXMLText: "Invalid data." }); if (Boolean(b.options.autoInstallRedirect) === !0 && !g.swfobject.hasFlashPlayerVersion(a.core.options.requiredFlashPlayerVersion.toString()) && l === !1 && (l = !0, a.core.options.installRedirectMessage && g.confirm(a.core.options.installRedirectMessage))) g.location.href = a.core.options.flashInstallerUrl; if (b.options.dataFormat === void 0 && b.options.dataSource === void 0) b.options.dataFormat = FusionChartsDataFormats.XMLURL,
            b.options.dataSource = "Data.xml"
        }
    }; a.renderer.register("flash", {
        dataFormat: "xml", init: function () { a.addEventListener("BeforeInitialize", o) }, policies: {
            params: { scaleMode: ["scaleMode", "noScale"], scale: ["scaleMode", "noScale"], wMode: ["wMode", "opaque"], menu: ["menu", void 0], bgColor: ["backgroundColor", "#ffffff"], allowScriptAccess: ["allowScriptAccess", "always"], quality: ["quality", "best"], swLiveConnect: ["swLiveConnect", void 0], base: ["base", void 0], align: ["align", void 0], salign: ["sAlign", void 0] }, flashVars: {
                lang: ["lang",
                "EN"], debugMode: ["debugMode", void 0], scaleMode: ["scaleMode", "noScale"], animation: ["animate", void 0]
            }, options: { autoInstallRedirect: ["autoInstallRedirect", !1], useLegacyXMLTransport: ["_useLegacyXMLTransport", !1] }
        }, render: function (b, d) {
            Boolean(this.flashVars.animation) === !0 && delete this.flashVars.animation; this.src || a.raiseError(this, "03102348", "run", "::FlashRenderer.render", 'Could not find a valid "src" attribute. swfUrl or chart type missing.'); var e = {}, i = this.flashVars.dataXML, n = this.flashVars.dataURL,
            m, r; a.extend(e, this.flashVars); if (this.flashVars.stallLoad === !0) { if (this.options.dataFormat === FusionChartsDataFormats.XML) i = this.options.dataSource; if (this.options.dataFormat === FusionChartsDataFormats.XMLURL) n = this.options.dataSource } if (a.core.debugMode.enabled() && a.core.debugMode.syncStateWithCharts && e.debugMode === void 0 && this.options.safeMode) e.debugMode = "1"; this.__state.lastRenderedSrc = this.src; e.dataXML = h(i) || ""; e.dataURL = a.isXSSSafe(n) ? n || "" : h(n) || ""; for (m in c) e.hasOwnProperty(m) && (e[m] = h(e[m]));
            if (!g.swfobject || !g.swfobject.embedSWF || !g.swfobject.FusionChartsModified) g.swfobject = a.swfobject; l && !a.core.options.installRedirectMessage && (r = { silent: !0 }); g.swfobject && g.swfobject.embedSWF ? g.swfobject.embedSWF(this.src, b.id, this.width, this.height, a.core.options.requiredFlashPlayerVersion, void 0, e, this.params, this.attributes, d, r) : a.raiseError(this, "1113061611", "run", "FlashRenderer~render", Error("Could not find swfobject library or embedSWF API"))
        }, update: function (a) {
            var b = this.ref, c = a.data; this.flashVars.dataXML =
            c; a.error === void 0 ? this.isActive() && e(b.setDataXML) ? this.src !== this.__state.lastRenderedSrc ? this.render() : b.setDataXML(c, !1) : (delete this.flashVars.dataURL, delete this.flashVars.animation) : this.isActive() && e(b.showChartMessage) ? b.showChartMessage("InvalidXMLText") : (this.flashVars.dataXML = "<Invalid" + a.format.toUpperCase() + ">", delete this.flashVars.dataURL, delete this.flashVars.animation)
        }, resize: function () {
            this.flashVars.chartWidth = this.width; this.flashVars.chartHeight = this.height; if (this.ref !== void 0) this.ref.width =
            this.width, this.ref.height = this.height, e(this.ref.resize) && this.ref.resize(this.ref.offsetWidth, this.ref.offsetHeight)
        }, config: function (b) { a.extend(this.flashVars, b) }, dispose: function () { var a; g.swfobject.removeSWF(this.id); (a = this.ref) && a.parentNode && a.parentNode.removeChild(a) }, protectedMethods: { flashVars: !0, params: !0, setDataXML: !0, setDataURL: !0, hasRendered: !0, getXML: !0, getDataAsCSV: !0, print: !0, exportChart: !0 }, events: {
            Loaded: function (a) { a.sender.flashVars.animation = "0" }, DataLoadRequested: function (b,
            c) {
                var d = b.sender, e = c.url, h = !1; if (c.dataFormat === FusionChartsDataFormats.XML && (g.location.protocol === "file:" && Boolean(d.options.safeMode) || Boolean(d.options.useLegacyXMLTransport))) d.ref ? d.ref.setDataURL ? d.ref.setDataURL(e, !1) : a.raiseError(this, "0109112330", "run", ">FlashRenderer^DataLoadRequested", Error("Unable to fetch URL due to security restriction on Flash Player. Update global security settings.")) : d.flashVars.dataURL = e, b.stopPropagation(), h = !0, c.cancelDataLoadRequest(), d.addEventListener("DataLoaded",
                n); if (d.ref && d.showChartMessage) delete d.flashVars.stallLoad, d.options.showDataLoadingMessage && d.ref.showChartMessage("XMLLoadingText"); else if (!h) d.flashVars.stallLoad = !0
            }, DataLoadRequestCancelled: function (a) { a = a.sender; a.ref && e(a.showChartMessage) && a.ref.showChartMessage(); delete a.flashVars.stallLoad }, DataLoadError: function (a, b) {
                var c = a.sender; c.ref && e(c.ref.showChartMessage) && b.source === "XmlHttpRequest" ? c.ref.showChartMessage("LoadDataErrorText") : (delete c.flashVars.dataURL, c.flashVars.dataXML =
                "<JSON parsing error>", delete c.flashVars.stallLoad)
            }, DataLoadRequestCompleted: function (a, b) { b.source === "XmlHttpRequest" && delete a.sender.flashVars.stallLoad }
        }, prototype: {
            getSWFHTML: function () {
                var a = i.createElement("span"), b = i.createElement("span"), c = "RnVzaW9uQ2hhcnRz" + (new Date).getTime(); a.appendChild(b); b.setAttribute("id", c); a.style.display = "none"; i.getElementsByTagName("body")[0].appendChild(a); g.swfobject.embedSWF(this.src, c, this.width, this.height, "8.0.0", void 0, this.flashVars, this.params, this.attrs);
                b = a.innerHTML.replace(c, this.id); g.swfobject.removeSWF(c); a.parentNode.removeChild(a); return b
            }, setTransparent: function (a) { typeof a !== "boolean" && a !== null && (a = !0); this.params.wMode = a === null ? "window" : a === !0 ? "transparent" : "opaque" }, registerObject: function () { }, addVariable: function () { a.raiseWarning(this, "1012141919", "run", "FlashRenderer~addVariable()", 'Use of deprecated "addVariable()". Replace with "configure()".'); a.core.prototype.configure.apply(this, arguments) }, setDataXML: function (b) {
                a.raiseWarning(this,
                "11033001081", "run", "GenericRuntime~setDataXML()", 'Use of deprecated "setDataXML()". Replace with "setXMLData()".'); b === void 0 || b === null || !e(b.toString) ? a.raiseError(this, "25081627", "param", "~setDataXML", 'Invalid data type for parameter "xml"') : this.ref === void 0 || this.ref === null || !e(this.ref.setDataXML) ? this.setChartData(b.toString(), FusionChartsDataFormats.XML) : this.ref.setDataXML(b.toString())
            }, setDataURL: function (b) {
                a.raiseWarning(this, "11033001082", "run", "GenericRuntime~setDataURL()", 'Use of deprecated "setDataURL()". Replace with "setXMLUrl()".');
                b === void 0 || b === null || !e(b.toString) ? a.raiseError(this, "25081724", "param", "~setDataURL", 'Invalid data type for parameter "url"') : this.ref === void 0 || this.ref === null || !e(this.ref.setDataURL) ? this.setChartData(b.toString(), FusionChartsDataFormats.XMLURL) : this.ref.setDataURL(b.toString())
            }
        }
    }); a.renderer.setDefault("flash")
}]);
FusionCharts(["private", "modules.renderer.js", function () {
    var a = this, g = window, i = document, e = a.core.options; /msie/i.test(navigator.userAgent); i.createElementNS && i.createElementNS("http://www.w3.org/2000/svg", "svg"); var h = function () { }, d = a.hcLib = { cmdQueue: [] }, l = d.moduleCmdQueue = { jquery: [], base: [], charts: [], powercharts: [], widgets: [], maps: [] }, b = d.moduleDependencies = {}, c = d.moduleMeta = {
        jquery: "jquery.min.js", base: "FusionCharts.HC.js", charts: "FusionCharts.HC.Charts.js", powercharts: "FusionCharts.HC.PowerCharts.js",
        widgets: "FusionCharts.HC.Widgets.js", maps: "FusionCharts.HC.Maps.js"
    }, n = {}, o = d.getDependentModuleName = function (a) { var c = [], d, f; for (d in b) if ((f = b[d][a]) !== void 0) c[f] = d; return c }; d.injectModuleDependency = function (a, c, f) { var j = !1; c === void 0 && (c = a); b[a] || (b[a] = {}, l[a] || (l[a] = [], d.moduleMeta[a] = e.html5ScriptNamePrefix + c + e.html5ScriptNameSuffix), j = !0); b[a][c] = f || 0; return j }; var f = d.hasModule = function (b) {
        var c, d; if (b instanceof Array) {
            c = 0; for (d = b.length; c < d; c += 1) if (!Boolean(a.modules["modules.renderer.js-" +
            b]) || b === "jquery" && !Boolean(g.jQuery)) return !1; return !0
        } if (b === "jquery") return Boolean(g.jQuery); return Boolean(a.modules["modules.renderer.js-" + b])
    }; d.needsModule = function (a, b) { return (d.moduleDependencies[a] && d.moduleDependencies[a][b]) !== void 0 }; var j = d.loadModule = function (b, d, e, j) {
        b instanceof Array || (b = [b]); var g = b.length, h = 0, i = function () {
            if (h >= g) d && d(); else {
                var k = b[h], l = c[k], q; h += 1; if (k) if (f(k)) { i(); return } else {
                    if (n[k]) {
                        a.raiseError(j || a.core, "1112201445A", "run", "JavaScriptRenderer~loadModule() ",
                        "required resources are absent or blocked from loading."); e && e(k); return
                    }
                } else e && e(k); q = k === "jquery" ? a.core.options.jQuerySourceFileName : a.core.options["html5" + a.capitalizeString(k) + "Src"]; a.loadScript(q == void 0 ? l : q, { success: function () { f(k) ? i() : e && e(k) }, failure: e && function () { e(k) } }, void 0, !0)
            }
        }; i()
    }, k = d.executeWaitingCommands = function (a) { for (var b; b = a.shift() ;) typeof b === "object" && h[b.cmd].apply(b.obj, b.args) }; d.cleanupWaitingCommands = function (a) {
        for (var b = a.chartType(), b = o(b), c, d = [], f; c = b.shift() ;) {
            for (c =
            l[c] || []; f = c.shift() ;) typeof f === "object" && f.obj !== a && d.push(f); c.concat(d); d = []
        }
    }; var q = function (a) { delete a.sender.jsVars._reflowData; a.sender.jsVars._reflowData = {}; delete a.sender.jsVars._reflowClean }, t = function () {
        var a = function () { }; a.prototype = {
            LoadDataErrorText: "Error in loading data.", XMLLoadingText: "Retrieving data. Please wait", InvalidXMLText: "Invalid data.", ChartNoDataText: "No data to display.", ReadingDataText: "Reading data. Please wait", ChartNotSupported: "Chart type not supported.", PBarLoadingText: "",
            LoadingText: "Loading chart. Please wait", RenderChartErrorText: "Unable to render chart."
        }; return a.prototype.constructor = a
    }(); a.extend(a.core.options, { html5ScriptNameSuffix: ".js", html5ScriptNamePrefix: "FusionCharts.HC.", jQuerySourceFileName: "jquery.min.js" }); a.extend(h, {
        dataFormat: "json", ready: !1, policies: { jsVars: {}, options: { showLoadingMessage: ["showLoadingMessage", !0] } }, init: function () {
            g.jQuery ? f("base") ? h.ready = !0 : j("base", function () { h.ready = !0; k(d.cmdQueue) }, void 0, a.core) : j("jquery", function () {
                jQuery.noConflict();
                if (g.$ === void 0) g.$ = jQuery; h.init()
            }, void 0, a.core)
        }, render: function (a) {
            var b = a, c = this.jsVars, f = c.msgStore; if (b && this.options.showLoadingMessage) b.innerHTML = '<small style="display: inline-block; *zoom:1; *display:inline; width: 100%; font-family: Verdana; font-size: 10px; color: #666666; text-align: center; padding-top: ' + (parseInt(b.style.height, 10) / 2 - 5) + 'px">' + (f.PBarLoadingText || f.LoadingText) + "</small>", b.style.backgroundColor = c.transparent ? "transparent" : this.options.containerBackgroundColor ||
            "#ffffff"; d.cmdQueue.push({ cmd: "render", obj: this, args: arguments })
        }, update: function () { d.cmdQueue.push({ cmd: "update", obj: this, args: arguments }) }, resize: function () { d.cmdQueue.push({ cmd: "resize", obj: this, args: arguments }) }, dispose: function () { var a = d.cmdQueue, b, c; b = 0; for (c = a.length; b < c; b += 1) a[b].obj === this && (a.splice(b, 1), c -= 1, b -= 1) }, load: function () { d.cmdQueue.push({ cmd: "load", obj: this, args: arguments }) }, config: function (a, b) {
            var c, d = this.jsVars, f = d.msgStore, d = d.cfgStore; typeof a === "string" && arguments.length >
            1 && (c = a, a = {}, a[c] = b); for (c in a) f[c] !== void 0 ? f[c] = a[c] : d[c.toLowerCase()] = a[c]
        }, protectedMethods: {}, events: {
            BeforeInitialize: function (a) { var b = a.sender, a = b.jsVars, c = this.chartType(); a.fcObj = b; a.msgStore = a.msgStore || new t; a.cfgStore = a.cfgStore || {}; a.previousDrawCount = -1; a.drawCount = 0; a._reflowData = {}; if (!(a.userModules instanceof Array) && (b = a.userModules, a.userModules = [], typeof b === "string")) a.userModules = a.userModules.concat(b.split(",")); if (!d.chartAPI || !d.chartAPI[c]) a.needsLoaderCall = !0 }, Initialized: function (a) {
                var a =
                a.sender, b = a.jsVars; b.needsLoaderCall && (delete b.needsLoaderCall, h.load.call(a))
            }, BeforeDataUpdate: q, BeforeDispose: q, BeforeRender: function (a) { var b = a.sender.jsVars; delete b.drLoadAttempted; delete b.waitingModule; delete b.waitingModuleError; q.apply(this, arguments) }, DataLoadRequested: function (a) {
                var a = a.sender, b = a.jsVars; delete b.loadError; a.ref && a.options.showDataLoadingMessage ? b.hcObj && !b.hasNativeMessage && b.hcObj.showLoading ? b.hcObj.showMessage(b.msgStore.XMLLoadingText) : a.ref.showChartMessage ? a.ref.showChartMessage("XMLLoadingText") :
                b.stallLoad = !0 : b.stallLoad = !0
            }, DataLoadRequestCompleted: function (a) { delete a.sender.id.stallLoad }, DataLoadError: function (a) { var b = a.sender, c = b.jsVars; delete c.stallLoad; c.loadError = !0; b.ref && typeof b.ref.showChartMessage === "function" && b.ref.showChartMessage("LoadDataErrorText"); q.apply(this, arguments) }
        }, _call: function (a, b, c) { a.apply(c || g, b || []) }
    }); a.extend(h.prototype, {
        getSWFHTML: function () { a.raiseWarning(this, "11090611381", "run", "JavaScriptRenderer~getSWFHTML()", "getSWFHTML() is not supported for JavaScript charts.") },
        addVariable: function () { a.raiseWarning(this, "11090611381", "run", "JavaScriptRenderer~addVariable()", 'Use of deprecated "addVariable()". Replace with "configure()".'); a.core.prototype.configure.apply(this, arguments) }, getXML: function () { a.raiseWarning(this, "11171116291", "run", "JavaScriptRenderer~getXML()", 'Use of deprecated "getXML()". Replace with "getXMLData()".'); return this.getXMLData.apply(this, arguments) }, setDataXML: function () {
            a.raiseWarning(this, "11171116292", "run", "JavaScriptRenderer~setDataXML()",
            'Use of deprecated "setDataXML()". Replace with "setXMLData()".'); return this.setXMLData.apply(this, arguments)
        }, setDataURL: function () { a.raiseWarning(this, "11171116293", "run", "JavaScriptRenderer~setDataURL()", 'Use of deprecated "SetDataURL()". Replace with "setXMLUrl()".'); return this.setXMLUrl.apply(this, arguments) }, hasRendered: function () { return this.jsVars.hcObj && this.jsVars.hcObj.hasRendered }, setTransparent: function (a) {
            var b; if (b = this.jsVars) typeof a !== "boolean" && a !== null && (a = !0), b.transparent =
            a === null ? !1 : a === !0 ? !0 : !1
        }
    }); a.extend(a.core, {
        _fallbackJSChartWhenNoFlash: function () { g.swfobject.hasFlashPlayerVersion(a.core.options.requiredFlashPlayerVersion) || a.renderer.setDefault("javascript") }, _enableJSChartsForSelectedBrowsers: function (b) { b === void 0 || b === null || a.renderer.setDefault(RegExp(b).test(navigator.userAgent) ? "javascript" : "flash") }, _doNotLoadExternalScript: function (a) { var b, d; for (b in a) d = b.toLowerCase(), c[d] && (n[d] = Boolean(a[b])) }, _preloadJSChartModule: function () {
            throw "NotImplemented()";
        }
    }); a.renderer.register("javascript", h); g.swfobject && g.swfobject.hasFlashPlayerVersion && !g.swfobject.hasFlashPlayerVersion(a.core.options.requiredFlashPlayerVersion) && (a.raiseWarning(a.core, "1204111846", "run", "JSRenderer", "Switched to JavaScript as default rendering due to absence of required Flash Player."), a.renderer.setDefault("javascript"))
}]);
(function () { var a = FusionCharts(["private", "XMLDataHandler"]); if (a !== void 0) { var g = function (a) { return { data: a, error: void 0 } }; a.addDataHandler("XML", { encode: g, decode: g }) } })(); var JSON; JSON || (JSON = {});
(function () {
    function a(a) { return a < 10 ? "0" + a : a } function g(a) { h.lastIndex = 0; return h.test(a) ? '"' + a.replace(h, function (a) { var c = b[a]; return typeof c === "string" ? c : "\\u" + ("0000" + a.charCodeAt(0).toString(16)).slice(-4) }) + '"' : '"' + a + '"' } function i(a, b) {
        var f, e, h, q, t = d, m, r = b[a]; r && typeof r === "object" && typeof r.toJSON === "function" && (r = r.toJSON(a)); typeof c === "function" && (r = c.call(b, a, r)); switch (typeof r) {
            case "string": return g(r); case "number": return isFinite(r) ? String(r) : "null"; case "boolean": case "null": return String(r);
            case "object": if (!r) return "null"; d += l; m = []; if (Object.prototype.toString.apply(r) === "[object Array]") { q = r.length; for (f = 0; f < q; f += 1) m[f] = i(f, r) || "null"; h = m.length === 0 ? "[]" : d ? "[\n" + d + m.join(",\n" + d) + "\n" + t + "]" : "[" + m.join(",") + "]"; d = t; return h } if (c && typeof c === "object") { q = c.length; for (f = 0; f < q; f += 1) typeof c[f] === "string" && (e = c[f], (h = i(e, r)) && m.push(g(e) + (d ? ": " : ":") + h)) } else for (e in r) Object.prototype.hasOwnProperty.call(r, e) && (h = i(e, r)) && m.push(g(e) + (d ? ": " : ":") + h); h = m.length === 0 ? "{}" : d ? "{\n" + d + m.join(",\n" +
            d) + "\n" + t + "}" : "{" + m.join(",") + "}"; d = t; return h
        }
    } if (typeof Date.prototype.toJSON !== "function") Date.prototype.toJSON = function () { return isFinite(this.valueOf()) ? this.getUTCFullYear() + "-" + a(this.getUTCMonth() + 1) + "-" + a(this.getUTCDate()) + "T" + a(this.getUTCHours()) + ":" + a(this.getUTCMinutes()) + ":" + a(this.getUTCSeconds()) + "Z" : null }, String.prototype.toJSON = Number.prototype.toJSON = Boolean.prototype.toJSON = function () { return this.valueOf() }; var e = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
    h = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g, d, l, b = { "\u0008": "\\b", "\t": "\\t", "\n": "\\n", "\u000c": "\\f", "\r": "\\r", '"': '\\"', "\\": "\\\\" }, c; if (typeof JSON.stringify !== "function") JSON.stringify = function (a, b, f) {
        var e; l = d = ""; if (typeof f === "number") for (e = 0; e < f; e += 1) l += " "; else typeof f === "string" && (l = f); if ((c = b) && typeof b !== "function" && (typeof b !== "object" || typeof b.length !== "number")) throw Error("JSON.stringify"); return i("",
        { "": a })
    }; if (typeof JSON.parse !== "function") JSON.parse = function (a, b) {
        function c(a, d) { var e, j, h = a[d]; if (h && typeof h === "object") for (e in h) Object.prototype.hasOwnProperty.call(h, e) && (j = c(h, e), j !== void 0 ? h[e] = j : delete h[e]); return b.call(a, d, h) } var d, a = String(a); e.lastIndex = 0; e.test(a) && (a = a.replace(e, function (a) { return "\\u" + ("0000" + a.charCodeAt(0).toString(16)).slice(-4) })); if (/^[\],:{}\s]*$/.test(a.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, "@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,
        "]").replace(/(?:^|:|,)(?:\s*\[)+/g, ""))) return d = eval("(" + a + ")"), typeof b === "function" ? c({ "": d }, "") : d; throw new SyntaxError("JSON.parse");
    }
})();
(function () {
    var a = FusionCharts(["private", "JSON_DataHandler"]); if (a !== void 0) {
        window.JSON === void 0 && a.raiseError(this, "1113062012", "run", "JSONDataHandler", Error("Could not find library support for JSON parsing.")); a.core.options.allowIESafeXMLParsing = ["_allowIESafeXMLParsing", !0]; var g = function (a) { if (a === null || a === void 0 || typeof a.toString !== "function") return ""; return a = a.toString().replace(/&/g, "&amp;").replace(/\'/g, "&#39;").replace(/\"/g, "&quot;").replace(/</g, "&lt;").replace(/>/g, "&gt;") }, i = function () {
            var e =
            {
                arr: {
                    set: !0, trendlines: !0, vtrendlines: !0, line: { trendlines: !0, vtrendlines: !0 }, data: !0, dataset: !0, lineset: !0, categories: !0, category: !0, linkeddata: !0, application: !0, definition: !0, axis: !0, connectors: !0, connector: { connectors: !0 }, trendset: !0, row: { rows: !0 }, column: { columns: !0 }, label: { labels: !0 }, color: { colorrange: !0 }, dial: { dials: !0 }, pointer: { pointers: !0 }, point: { trendpoints: !0 }, process: { processes: !0 }, task: { tasks: !0 }, milestone: { milestones: !0 }, datacolumn: { datatable: !0 }, text: { datacolumn: !0 }, item: { legend: !0 },
                    alert: { alerts: !0 }, groups: { annotations: !0 }, items: { groups: !0 }, shapes: !0, shape: { shapes: !0 }, entitydef: !0, entity: { entitydef: !0 }
                }, tag: {
                    chart: "linkedchart", map: "linkedmap", set: "data", vline: { chart: "data", graph: "data", dataset: "data", categories: "category", linkedchart: "data" }, apply: { application: "application" }, style: { definition: "definition" }, marker: { application: "application", definition: "definition" }, entity: { entitydef: "entitydef", data: "data" }, shape: { shapes: "shapes" }, connector: {
                        connectors: {
                            chart: "connector", linkedchart: "connector",
                            map: "connectors", linkedmap: "connectors"
                        }
                    }, annotationgroup: { annotations: "groups" }, annotation: { groups: "items" }
                }, attr: { vline: { vline: "true" } }, ins: { chart: !0, map: !0, graph: !0 }, dsv: { dataset: "data", categories: "category" }, text: { target: "target", value: "value" }, group: { styles: { definition: !0, application: !0 }, chart: { value: !0, target: !0 }, graph: { value: !0, target: !0 }, linkedchart: { value: !0, target: !0 }, markers: { definition: !0, application: !0, shapes: !0, connectors: !0 }, map: { entitydef: !0, data: !0 }, linkedmap: { entitydef: !0, data: !0 } }
            },
            d = {
                append: function (a, c, d, g) { e.arr[d] && (e.arr[d] === !0 || e.arr[d][g] === !0) ? (c[d] instanceof Array || (c[d] = []), c[d].push(a)) : c[d] = a }, child: function (b, c, g, i) {
                    var f, j, k, l, t, m; for (f = 0; f < c.length; f += 1) switch (k = c[f], j = k.nodeName.toLowerCase(), k.nodeType) {
                        case 1: l = d.attr(k.attributes); m = e.ins[j]; m === !0 && (t = l, l = {}, l[j] = t); m = e.attr[j]; typeof m === "object" && a.extend(l, m); if (m = e.tag[j]) if (typeof m === "object" && typeof m[g] === "object") for (t in t = void 0, m[g]) { if (i[t]) { j = m[g][t]; break } } else typeof m === "object" && typeof m[g] ===
                        "string" ? j = m[g] : typeof m === "string" && (j = m); k.childNodes.length && ((m = e.group[g]) && m[j] ? d.child(b, k.childNodes, j, i) : d.child(l, k.childNodes, j, i)); m = e.group[g]; (!m || !m[j]) && d.append(l, b, j, g); break; case 3: if (m = e.text[g]) j = m, l = k.data, d.append(l, b, j, g); m = e.dsv[g]; if (typeof m === "string" && i.chart && parseInt(i.chart.compactdatamode, 10)) j = m, l = k.data, b[j] = b[j] ? b[j] + l : l
                    }
                }, attr: function (a) { var c, d = {}; if (!a || !a.length) return d; for (c = 0; c < a.length; c += 1) d[a[c].nodeName.toLowerCase()] = a[c].value || a[c].nodeValue; return d }
            },
            g = function (b) {
                var c = {}, e, h, f, j, i, q, t, m; if (typeof b !== "object" && typeof b.toString !== "function") return g.errorObject = new TypeError("xml2json.parse()"), c; for (var b = b.toString().replace(/<\!--[\s\S]*?--\>/g, "").replace(/<\?xml[\s\S]*?\?>/ig, "").replace(/&(?!([^;\n\r]+?;))/g, "&amp;$1"), b = b.replace(/^\s\s*/, ""), r = /\s/, v = b.length; r.test(b.charAt(v -= 1)) ;); b = b.slice(0, v + 1); if (!b) return c; try {
                    if (window.DOMParser) e = (new window.DOMParser).parseFromString(b, "text/xml"); else if (document.body && a.core.options.allowIESafeXMLParsing) {
                        var y =
                        document.createElement("xml"); y.innerHTML = b; document.body.appendChild(y); e = y.XMLDocument; document.body.removeChild(y)
                    } else e = new ActiveXObject("Microsoft.XMLDOM"), e.async = "false", e.loadXML(b); if (!e || !e.childNodes || !(e.childNodes.length === 1 && (h = e.childNodes[0]) && h.nodeName && (f = h.nodeName.toLowerCase()) && (f === "chart" || f === "map" || f === "graph"))) return g.errorObject = new TypeError("xml2json.parse()"), c; else if (f === "graph") {
                        j = e.createElement("chart"); for (m = (q = h.attributes) && q.length || 0; m--;) j.setAttribute(q[m].name,
                        q[m].value), q.removeNamedItem(q[m].name); if (m = (t = h.childNodes) && t.length || 0) m -= 1, i = h.removeChild(t[m]), j.appendChild(i); for (; m--;) i = h.removeChild(t[m]), j.insertBefore(i, j.firstChild); e.replaceChild(j, h); h = j
                    }
                } catch (B) { g.errorObject = B } h ? (h.attributes && (c[f] = d.attr(h.attributes)), h.childNodes && d.child(c, h.childNodes, f, c), delete g.errorObject) : g.errorObject = new TypeError("xml2json.parse()"); return c
            }; return function (a) { delete g.errorObject; return { data: g(a), error: g.errorObject } }
        }(), e = function () {
            var a =
            {
                items: {
                    explode: { data: "set", groups: { annotations: "annotationgroup" }, items: { groups: "annotation" } }, text: { chart: { target: "target", value: "value" }, graph: { target: "target", value: "value" } }, dsv: { dataset: { data: "dataset" }, categories: { category: "categories" } }, attr: { chart: { chart: "chart" }, graph: { graph: "graph" }, map: { map: "map" }, linkedmap: { map: "map" }, linkedchart: { chart: "chart" } }, group: {
                        styles: { definition: "style", application: "apply" }, map: { data: "entity", entitydef: "entity" }, markers: {
                            definition: "marker", application: "marker",
                            shapes: "shape", connectors: "connector"
                        }
                    }
                }, qualify: function (a, b, c) { return typeof this.items[a][c] === "object" ? this.items[a][c][b] : this.items[a][c] }
            }, d = function (e, b, c, i) {
                var o = "", f = "", j = "", k = "", q, t, m; b && typeof b.toLowerCase === "function" && (b = b.toLowerCase()); if (c === void 0 && e[b]) for (q in e[b]) if (t = q.toLowerCase(), t === "compactdatamode") i.applyDSV = e[b][q] == 1; if (e instanceof Array) for (q = 0; q < e.length; q += 1) k += typeof e[q] === "string" ? g(e[q]) : d(e[q], b, c, i); else {
                    for (q in e) t = q.toLowerCase(), e[q] instanceof Array &&
                    (m = a.qualify("group", t, b)) ? f += "<" + t + ">" + d(e[q], m, b, i) + "</" + t + ">" : typeof e[q] === "object" ? (m = a.qualify("attr", t, b)) ? (j = d(e[q], m, b, i).replace(/\/\>/ig, ""), b = t) : f += d(e[q], t, b, i) : i.applyDSV && (m = a.qualify("dsv", t, b)) ? f += e[q] : (m = a.qualify("text", t, b)) ? f += "<" + m + ">" + e[q] + "</" + m + ">" : t === "vline" && Boolean(e[q]) ? b = "vline" : o += " " + t + '="' + g(e[q]).toString().replace(/\"/ig, "&quot;") + '"'; if (m = a.qualify("explode", c, b)) b = m; k = (j !== "" ? j : "<" + b) + o + (f !== "" ? ">" + f + "</" + b + ">" : " />")
                } return k
            }; return function (a) {
                delete d.errorObject;
                if (a && typeof a === "string") try { a = JSON.parse(a) } catch (b) { d.errorObject = b } return { data: d(a, a && a.graph ? "graph" : a && a.map ? "map" : "chart", void 0, {}), error: d.errorObject }
            }
        }(); a.addDataHandler("JSON", { encode: e, decode: i })
    }
})();
FusionCharts(["private", "CSVDataHandler", function () {
    var a = this, g; g = function (a) { this.data = []; this.columnCount = this.rowCount = 0; this.configure(a) }; g.decodeLiterals = function (a, e) { if (a === void 0 || a === null || !a.toString) return e; return a.replace("{tab}", "\t").replace("{quot}", '"').replace("{apos}", "'") }; g.prototype.set = function (a, e, g) { var d; if (this.rowCount <= a) { for (d = this.rowCount; d <= a; d += 1) this.data[d] = []; this.rowCount = a + 1 } if (this.columnCount <= e) this.columnCount = e + 1; this.data[a][e] = g }; g.prototype.setRow =
    function (a, e) { var g; if (this.rowCount <= a) { for (g = this.rowCount; g <= a; g += 1) this.data[g] = []; this.rowCount = a + 1 } if (this.columnCount < e.length) this.columnCount = e.length; this.data[a] = e }; g.prototype.get = function (a, e) { var g = this.data; return g[a] && g[a][e] }; g.prototype.configure = function (a) { var e = g.decodeLiterals; this.delimiter = e(a.delimiter, ","); this.qualifier = e(a.qualifier, '"'); this.eolCharacter = e(a.eolCharacter, "\r\n") }; g.prototype.clear = function () { this.data = []; this.columnCount = this.rowCount = 0 }; g.prototype.toString =
    function () { var a, e, g = ""; for (a = 0; a < this.rowCount; a += 1) e = this.qualifier + this.data[a].join(this.qualifier + this.delimiter + this.qualifier) + this.qualifier, g += e === '""' ? this.eolCharacter : e + this.eolCharacter; this.rowCount > 0 && (g = g.slice(0, g.length - 2)); return g }; a.addDataHandler("CSV", {
        encode: function (g, e) { a.raiseError(e, "0604111215A", "run", "::CSVDataHandler.encode()", "FusionCharts CSV data-handler only supports encoding of data."); throw "FeatureNotSupportedException()"; }, decode: function (i) {
            var i = a.core.transcodeData(i,
            "xml", "json") || {}, e, h, d, l, b, c, n, o, f = i.chart || i.map || i.graph || {}, j = Boolean(f.exporterrorcolumns || 0), k = i.categories && i.categories[0] && i.categories[0].category || []; h = i.map && !i.chart; var q = !1, t = !1, m = !1, r, v, y, B, x, w, p, A, z, E, u; e = new g({ separator: f.exportdataseparator, qualifier: f.exportdataqualifier }); if (h) e.setRow(0, ["Id", " Short Name", "Long Name", "Value", "Formatted Value"]); else if ((r = i.dials && i.dials.dial || i.pointers && i.pointers.pointer || i.value) !== void 0) if (typeof r === "string") e.set(0, 0, r), typeof i.target ===
            "string" && e.set(0, 1, i.target); else { e.setRow(0, ["Id", "Value"]); b = 0; n = 1; for (c = r.length; b < c; b += 1, n += 1) e.setRow(n, [n, r[b].value]) } else if (r = i.dataset || !(i.data instanceof Array) && []) {
                d = 1; (v = i.lineset) && (r = r.concat(v)); (y = i.axis) && (r = r.concat(y)); x = k.length; if (!(w = r.length)) for (b = 0; b < x; b += 1) p = k[b], e.set(b + 1, 0, p.label || p.name); for (b = 0; b < w; b += 1) {
                    A = r; A[b].dataset ? (A = A[b].dataset, l = 0, B = A.length) : (A = r, l = b, B = l + 1); for (; l < B && !q && !m; l += 1, d += 1) {
                        z = A[l]; e.set(0, d, z.seriesname); if (typeof z.data === "string") z.data = z.data.split(f.dataseparator ||
                        "|"); n = c = 0; for (E = z.data && z.data.length || 0; c < E || c < x; c += 1) { p = k[c]; h = n + 1; u = z.data && z.data[n] || {}; if (u.x !== void 0 && u.y !== void 0) { q = !0; break } if (u.rowid !== void 0 && u.columnid !== void 0) { m = !0; break } if (c < x && !p.vline) { e.set(h, 0, p.label || p.name); p = parseFloat(u ? u.value : ""); p = isNaN(p) ? "" : p; e.set(h, d, p); if (t || j || u.errorvalue) t || (t = !0, e.set(0, d + 1, "Error")), o = 1, e.set(h, d + 1, u.errorvalue); n += 1 } } o && (d += o, o = 0)
                    }
                } v && (r = r.slice(0, -v.length)); y && r.slice(0, -y.length)
            } else if (r = i.data) {
                e.set(0, 1, f.yaxisname || "Value"); b = 0; for (x =
                r.length; b < x; b += 1) u = r[b], u.vline || (p = parseFloat(u.value ? u.value : ""), p = isNaN(p) ? "" : p, e.setRow(b + 1, [u.label || u.name, p]))
            } if (q) {
                e.clear(); t = !1; o = 0; e.setRow(0, ["Series", "x", "y"]); b = 0; h = 1; r = i.dataset; for (B = r.length; b < B; b += 1) {
                    c = 0; z = r[b] && r[b].data || []; for (w = z.length; c < w; c += 1, h += 1) {
                        u = z[c] || {}; p = [r[b].seriesname, u.x, u.y]; u.z !== void 0 && (p.push(u.z), o || (e.set(0, 3, "z"), o = 1)); if (t || j || u.errorvalue !== void 0 || u.horizontalerrorvalue !== void 0 || u.verticalerrorvalue !== void 0) p.push(u.errorvalue, u.horizontalerrorvalue ===
                        void 0 ? u.errorvalue : u.horizontalerrorvalue, u.verticalerrorvalue === void 0 ? u.errorvalue : u.verticalerrorvalue), t || (e.set(0, o + 3, "Error"), e.set(0, o + 4, "Horizontal Error"), e.set(0, o + 5, "Vertical Error")), t = !0; e.setRow(h, p)
                    }
                }
            } else if (m) {
                e.clear(); j = {}; q = {}; b = 0; c = 1; k = i.rows && i.rows.row || []; for (o = k.length; b < o; b += 1, c += 1) p = k[b], p.id && (j[p.id.toLowerCase()] = c, e.set(c, 0, p.label || p.id)); b = 0; c = 1; k = i.columns && i.columns.column || []; for (o = k.length; b < o; b += 1, c += 1) p = k[b], p.id && (q[p.id.toLowerCase()] = c, e.set(0, c, p.label ||
                p.id)); z = i.dataset && i.dataset[0] && i.dataset[0].data || []; b = 0; for (o = z.length; b < o; b += 1) { u = z[b]; h = u.rowid.toLowerCase(); d = u.columnid.toLowerCase(); if (!j[h]) j[h] = e.rowCount, e.set(e.rowCount, 0, u.rowid); if (!q[d]) q[d] = e.columnCount, e.set(0, e.columnCount, u.columnid); e.set(j[h], q[d], u.value) }
            } e.rowCount > 0 && e.get(0, 0) === void 0 && e.set(0, 0, f.xaxisname || "Label"); return { data: e.toString(), error: void 0 }
        }
    }); a.core.addEventListener("Loaded", function (a) {
        a = a.sender; if (a.options.renderer === "javascript" && !a.getDataAsCSV) a.getDataAsCSV =
        a.ref.getDataAsCSV = a.getCSVData
    })
}]);
(function () {
    var a = FusionCharts(["private", "DynamicChartAttributes"]); a !== void 0 && a.extend(a.core, {
        setChartAttribute: function (a, i) { if (typeof a === "string") { var e = a, a = {}; a[e] = i } else if (a === null || typeof a !== "object") return; var e = 0, h = this.getChartData(FusionChartsDataFormats.JSON), d, l = h.chart || h.graph || h.map || {}; for (d in a) e += 1, a[d] === null ? delete l[d.toLowerCase()] : l[d.toLowerCase()] = a[d]; if (e > 0) { if (typeof l.animation === "undefined") l.animation = "0"; this.setChartData(h, FusionChartsDataFormats.JSON) } }, getChartAttribute: function (g) {
            var i =
            (i = this.getChartData(FusionChartsDataFormats.JSON)).chart || i.graph || i.map; if (arguments.length === 0 || g === void 0 || i === void 0) return i; var e, h; if (typeof g === "string") e = i[g.toString().toLowerCase()]; else if (g instanceof Array) { e = {}; for (h = 0; h < g.length; h += 1) e[g[h]] = i[g[h].toString().toLowerCase()] } else a.raiseError(this, "25081429", "param", "~getChartAttribute()", 'Unexpected value of "attribute"'); return e
        }
    }, !0)
})();
(function () {
    var a = FusionCharts(["private", "api.LinkManager"]); if (a !== void 0) {
        a.policies.link = ["link", void 0]; var g = window.FusionChartsDOMInsertModes = { REPLACE: "replace", APPEND: "append", PREPEND: "prepend" }, i = {}, e = function (d, e) { this.items = {}; this.root = d; this.parent = e; e instanceof a.core ? this.level = this.parent.link.level + 1 : (i[d.id] = [{}], this.level = 0) }, h = function (a, e) {
            return (a.options.containerElement === e.options.containerElement || a.options.containerElementId === e.options.containerElementId) && a.options.insertMode ===
            g.REPLACE
        }; e.prototype.configuration = function () { return i[this.root.id][this.level] || (i[this.root.id][this.level] = {}) }; a.extend(a.core, {
            configureLink: function (d, e) {
                var b; if (d instanceof Array) { for (b = 0; b < d.length; b += 1) typeof i[this.link.root.id][b] !== "object" && (i[this.link.root.id][b] = {}), a.extend(i[this.link.root.id][b], d[b]); i[this.link.root.id].splice(d.length) } else if (typeof d === "object") {
                    if (typeof e !== "number") e = this.link.level; i[this.link.root.id][e] === void 0 && (i[this.link.root.id][e] = {}); a.extend(i[this.link.root.id][e],
                    d)
                } else a.raiseError(this, "25081731", "param", "~configureLink()", "Unable to update link configuration from set parameters")
            }
        }, !0); a.addEventListener("BeforeInitialize", function (d) { if (d.sender.link instanceof e) { if (d.sender.link.parent instanceof a.core) d.sender.link.parent.link.items[d.sender.id] = d.sender } else d.sender.link = new e(d.sender) }); a.addEventListener("LinkedChartInvoked", function (d, g) {
            var b = d.sender, c = b.clone({ dataSource: g.data, dataFormat: g.linkType, link: new e(b.link.root, b) }, !0), i = g.alias;
            if (i) { if (!c.swfSrcPath && c.swfUrl) c.swfSrcPath = c.swfUrl.replace(/(.*?)?[^\/]*\.swf.*?/ig, "$1"); c.type = i } b.args && parseInt(b.args.animate, 10) !== 0 && delete c.animate; a.extend(c, b.link.configuration()); a.raiseEvent("BeforeLinkedItemOpen", { level: b.link.level }, b.link.root); a.core.items[c.id] instanceof a.core && a.core.items[c.id].dispose(); c = new a.core(c); if (!h(c, b) && (!b.options.overlayButton || !b.options.overlayButton.message)) {
                if (typeof b.options.overlayButton !== "object") b.options.overlayButton = {}; b.options.overlayButton.message =
                "Close"
            } c.render(); a.raiseEvent("LinkedItemOpened", { level: b.link.level, item: c }, b.link.root)
        }); a.addEventListener("OverlayButtonClick", function (d, e) { if (e.id === "LinkManager") { var b = d.sender, c = b.link.level - 1, g = b.link.parent, i = b.link.root; a.raiseEvent("BeforeLinkedItemClose", { level: c, item: b }, i); setTimeout(function () { a.core.items[b.id] && b.dispose(); a.raiseEvent("LinkedItemClosed", { level: c }, i) }, 0); !g.isActive() && h(b, g) && g.render() } }); a.addEventListener("Loaded", function (d) {
            if ((d = d.sender) && d.link !== void 0 &&
            d.link.root !== d && d.link.parent instanceof a.core) if (d.ref && typeof d.ref.drawOverlayButton === "function") { var e = a.extend({ show: !0, id: "LinkManager" }, d.link.parent.options.overlayButton); a.extend(e, d.link.parent.link.configuration().overlayButton || {}); d.ref.drawOverlayButton(e) } else a.raiseWarning(d, "04091602", "run", "::LinkManager^Loaded", "Unable to draw overlay button on object. -" + d.id)
        }); a.addEventListener("BeforeDispose", function (d) {
            var g = d.sender; g && g.link instanceof e && (g.link.parent instanceof
            a.core && delete g.link.parent.link.items[d.sender.id], delete i[g.id])
        }); FusionChartsEvents.LinkedItemOpened = "linkeditemopened"; FusionChartsEvents.BeforeLinkedItemOpen = "beforelinkeditemopen"; FusionChartsEvents.LinkedItemClosed = "linkeditemclosed"; FusionChartsEvents.BeforeLinkedItemClose = "beforelinkeditemclose"
    }
})();
(function () {
    var a = FusionCharts(["private", "PrintManager"]); if (a !== void 0) {
        var g = { enabled: !1, invokeCSS: !0, processPollInterval: 2E3, message: "Chart is being prepared for print.", useExCanvas: !1, bypass: !1 }, i = {
            getCanvasElementOf: function (b, c, d) {
                if (b.__fusioncharts__canvascreated !== !0) {
                    var e = document.createElement("canvas"), h = a.core.items[b.id].attributes["class"]; g.useExCanvas && G_vmlCanvasManager && G_vmlCanvasManager.initElement(e); e.setAttribute("class", h); e.__fusioncharts__reference = b.id; b.parentNode.insertBefore(e,
                    b.nextSibling); b.__fusioncharts__canvascreated = !0
                } b.nextSibling.setAttribute("width", c || b.offsetWidth || 2); b.nextSibling.setAttribute("height", d || b.offsetHeight || 2); return b.nextSibling
            }, removeCanvasElementOf: function (a) {
                var b = a.ref && a.ref.parentNode ? a.ref.parentNode : a.options.containerElement || window.getElementById(a.options.containerElementId); if (b) {
                    var c = b.getElementsByTagName("canvas"), d, e; e = 0; for (d = c.length; e < d; e += 1) if (c[e].__fusioncharts__reference === a.id && (b.removeChild(c[e]), a.ref)) a.ref.__fusioncharts__canvascreated =
                    !1
                }
            }, rle2rgba: function (a, b, c) { typeof c !== "string" && (c = "FFFFFF"); var a = a.split(/[;,_]/), d, e, g, h, i, l = 0; for (e = 0; e < a.length; e += 2) { a[e] === "" && (a[e] = c); a[e] = ("000000" + a[e]).substr(-6); g = parseInt("0x" + a[e].substring(0, 2), 16); h = parseInt("0x" + a[e].substring(2, 4), 16); i = parseInt("0x" + a[e].substring(4, 6), 16); for (d = 0; d < a[e + 1]; d += 1) b[l] = g, b[l + 1] = h, b[l + 2] = i, b[l + 3] = 255, l += 4 } return b }, rle2array: function (a, b) {
                typeof b !== "string" && (b = "FFFFFF"); var c = a.split(";"), d, e; for (d in c) {
                    c[d] = c[d].split(/[_,]/); for (e = 0; e < c[d].length; e +=
                    2) c[d][e] = c[d][e] === "" ? b : ("000000" + c[d][e]).substr(-6)
                } return c
            }, drawText: function (b, c, d, e) { b = b.getContext("2d"); d = d || 2; e = e || 2; b.clearRect(0, 0, d, e); b.textBaseline = "middle"; b.textAlign = "center"; b.font = "8pt verdana"; b.fillStyle = "#776666"; typeof b.fillText === "function" ? b.fillText(c, d / 2, e / 2) : typeof b.mozDrawText === "function" ? (b.translate(d / 2, e / 2), b.mozDrawText(c)) : a.raiseWarning(a.core, "25081803", "run", "::PrintManager>lib.drawText", "Canvas text drawing is not supported in browser"); return !0 }, appendCSS: function (a) {
                var b =
                document.createElement("style"); b.setAttribute("type", "text/css"); typeof b.styleSheet === "undefined" ? b.appendChild(document.createTextNode(a)) : b.styleSheet.cssText = a; return document.getElementsByTagName("head")[0].appendChild(b)
            }
        }; i.drawRLE = function (a, b, c, d, e) {
            c = c || 2; d = d || 2; a.setAttribute("width", c); a.setAttribute("height", d); a = a.getContext("2d"); if (typeof a.putImageData === "function" && typeof a.createImageData === "function") c = a.createImageData(c, d), i.rle2rgba(b, c.data, e), a.putImageData(c, 0, 0); else for (e in c =
            i.rle2array(b, e), d = e = b = 0, c) for (d = b = 0; d < c[e].length; d += 2) a.fillStyle = "#" + c[e][d], a.fillRect(b, e, c[e][d + 1], 1), b += parseInt(c[e][d + 1], 10); return !0
        }; var e = { styles: { print: "canvas.FusionCharts{display:none;}@media print{object.FusionCharts{display:none;}canvas.FusionCharts{display:block;}}", error: "canvas.FusionCharts{display:none;}", normal: "" }, cssNode: void 0 }, h = {}, d = {}, l = 0, b; e.invoke = function (a) {
            typeof this.styles[a] !== "undefined" && (a = this.styles[a]); if (typeof a !== "undefined") this.cssNode !== void 0 && this.cssNode.parentNode !==
            void 0 && this.cssNode.parentNode.removeChild(this.cssNode), e.cssNode = i.appendCSS(a)
        }; var c = function (c) {
            var d = c.sender.ref, k, n; if (d === void 0 || typeof d.prepareImageDataStream !== "function" || d.prepareImageDataStream() === !1) b(c.sender); else {
                h[c.sender.id] || (h[c.sender.id] = d, l += 1, l === 1 && a.raiseEvent("PrintReadyStateChange", { ready: !1, bypass: g.bypass }, c.sender)); try { k = d.offsetWidth, n = d.offsetHeight, i.drawText(i.getCanvasElementOf(d, k, n), g.message, k, n) } catch (o) {
                    e.invoke("error"), a.raiseError(c.sender, "25081807",
                    "run", "::PrintManager>onDrawComplete", "There was an error while showing message to user via canvas.")
                }
            }
        }, n = function (b, c) { try { i.drawRLE(i.getCanvasElementOf(b.sender.ref, c.width, c.height), c.stream, c.width, c.height, c.bgColor) === !0 && h[b.sender.id] && (delete h[b.sender.id], l -= 1, l === 0 && a.raiseEvent("PrintReadyStateChange", { ready: !0, bypass: g.bypass }, b.sender)) } catch (d) { e.invoke("error"), a.raiseError(b.sender, "25081810", "run", "::PrintManager>onImageStreamReady", "There was an error while drawing canvas.") } },
        o = function (a) { i.removeCanvasElementOf(a.sender) }; b = function (b) { var e; if (b instanceof a.core) d[b.id] = b; else for (e in d) c({ sender: d[e] }, {}), delete d[e] }; a.extend(a.core, {
            printManager: {
                configure: function (b) { a.extend(g, b || {}) }, isReady: function () { if (g.bypass) return !0; if (l > 0 || !g.enabled) return !1; var b, c; for (b in a.core.items) if ((c = a.core.items[b].ref) !== void 0 && c.hasRendered && c.hasRendered() === !1) return !1; return !0 }, enabled: function (d) {
                    if (d === void 0) return g.enabled; if (a.renderer.currentRendererName() !==
                    "flash" || typeof document.createElement("canvas").getContext !== "function") return g.bypass = !0, a.raiseEvent("PrintReadyStateChange", { ready: !0, bypass: g.bypass }), a.raiseWarning(a.core, "25081816", "run", ".printManager.enabled", "printManager is not compatible with your browser"), g.enabled; g.bypass = !1; var h = d ? "addEventListener" : "removeEventListener"; a.core[h]("ImageStreamReady", n); a.core[h]("DrawComplete", c); a.core[h]("BeforeDispose", o); if (d === !0) {
                        var k; g.invokeCSS === !0 && e.invoke("print"); for (k in a.core.items) b(a.core.items[k]),
                        b()
                    } else { var l; e.invoke("error"); for (l in a.core.items) i.removeCanvasElementOf(a.core.items[l]); g.bypass || a.raiseEvent("PrintReadyStateChange", { ready: !1, bypass: g.bypass }); e.invoke("normal") } return g.enabled = d
                }, managedPrint: function (b) {
                    g.bypass ? window.print() : a.core.printManager.isReady() ? typeof b === "object" && b.ready !== !0 || (a.removeEventListener("PrintReadyStateChange", a.core.printManager.managedPrint), window.print()) : a.core.printManager.enabled(!0) !== !0 ? window.print() : a.addEventListener("PrintReadyStateChange",
                    a.core.printManager.managedPrint)
                }
            }
        }, !1); FusionChartsEvents.PrintReadyStateChange = "printreadystatechange"
    }
})();