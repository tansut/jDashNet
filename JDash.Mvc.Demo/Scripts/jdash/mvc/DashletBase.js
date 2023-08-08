define(
    ["jdash/core/declare",
     "dojo/_base/lang",
     "klt/core/when",
     "dojo/dom-construct",
     "dojo/dom-class",
     "dojo/query",
     "jdash/ui/registry",
     "dojo/request/xhr",
     "dojo/json",
     "dojo/dom-style",
     "dojo/dom-attr",
     "./JQueryCompiler",
     "jdash/core/Deferred",
     "jdash/ui/linker",
     "./InternalCompiler",
	 "jdash/provider/Manager"], function (declare, lang, when, domConstruct, domClass, query, registry, xhr, json,
         style, attr, JQueryCompiler, Deferred, Linker, InternalCompiler, Manager) {

         var compilers = {
             jquery: JQueryCompiler,
             internal: InternalCompiler
         }


         return declare(null, {

             $query: function (selector) {
                 return query(selector, this.domNode)
             },

             $get: function (selector) {
                 return query(selector, this.domNode)[0];
             },

             $json: json,

             $xhr: xhr,

             $style: style,

             $class: domClass,

             $context: function () {
                 return this.context;
             },

             $compile: function (htmlString, options) {
                 var context = this.$context();
                 var engine = context.model.module.config.htmlCompiler || (window.jQuery ? "jquery" : "internal");
                 var compiler = lang.getObject(engine, false, compilers);
                 compiler = compiler || InternalCompiler;
                 return compiler.compile(htmlString, options);
             },

             $viewUrl: function () {
                 var url = this.$controller + "/index/" + this.$dashletId;
                 return url;
             },

             $viewHtml: function (options) {
                 var viewUrl = this.$viewUrl();
                 options = options || {preventCache: true};
                 return this.$xhr(viewUrl, options);
             },

             $handlerError: function (err) {
                 alert(err.message)
             },

             $createContainer: function () {
                 var container = domConstruct.create("div");
                 var dashletId = this.$context().model.id;
                 domClass.add(container, "dashlet" + dashletId);
                 return container;
             },

             $createControl: function (clazz, params, node) {
                 if (typeof (params.$context) != 'undefined') {
                     delete params.$context;
                     params.context = this.$context();
                 }
                 var widget = new clazz(params, node);
                 widget.startup();
             },

             $link: function (root) {                
                 Linker.link(root, {
                     paramsReplace: {
                         context: this.$context()
                     }
                 });
             },

             $init: function (htmlString) {
                 var context = this.$context();

                 this.viewNode = this.$compile(htmlString);

                 this.$link(this.viewNode);

                 domConstruct.place(this.viewNode, this.domNode);

                 var forms = query("form", this.domNode);
                 this.$form = forms.length ? forms[0] : undefined;
				 
                 /* Script Tags Executing */
				 var arr = query("script",this.domNode);
				 arr.forEach(function (scriptTag) {
                     var inlineFunc = "(function(){ this.$context = context; " +  scriptTag.innerHTML + "}());"
						eval(inlineFunc); 
				 });
				 /* Script Tags Executed */
				 
             },

             $construct: function (reason) {
                 var self = this;
                 var context = this.$context();


                 this.$constructWaitHandle = when(null, function () {
                     self.$dashletId = context.model.id;
                     self.$controller = Manager.getInstance().virtualPath + context.model.module.config.mvcConfig.controller;
                     self.domNode = self.domNode || self.$createContainer();
                     domConstruct.empty(self.domNode);

                     return when(self.$viewHtml(), function (htmlString) {
                         return self.$init(htmlString);
                     });
                 });
                 
                 context.setBusy();

                 when(this.$constructWaitHandle, function () {
                     context.clearBusy();
                 }, function (err) {
                     context.clearBusy();
                     self.$handlerError(err);
                 })

                 if (this._started)
                     this.$doInitialize(reason);
                 
                 return this.$constructWaitHandle;
             },

             constructor: function (context) {
                 this.context = context;
                 var self = this;
                 when(this.$construct(), function () {
                     self.$bindEvents();
                 });
             },

             resize: function() {

             },

             $bindEvents: function (context) {
                 var self = this;
                 var context = this.$context();
                 function doResize(event) {
                     if (typeof (self._$lastSize) != 'undefined') {
                         //var newSize = context.getDashletSize();
                         self.resize.call(self, event);
                         //if (newSize.w !== self._$lastSize.w || newSize.h !== self._$lastSize.h) {
                         //    self.resize.call(self, event);
                         //    self_$lastSize = newSize;
                         //}
                     }
                     else {
                         self._$lastSize = context.getDashletSize();
                         self.resize.call(self, event);
                     }
                 }

                 context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
                     if (event.sender == this && lang.isFunction(self.resize))
                         doResize(event);
                 });

                 context.subscribe('klt/viewport/resized', function (event) {
                     if (lang.isFunction(self.resize))
                         doResize(event);
                 });

                 context.subscribe("jdash/layout/dnd/dropped", function (event) {
                     if (self.context.pane == event.args.pane && lang.isFunction(self.resize))
                         doResize(event);
                 });
             },

             $doInitialize: function(reason) {
                 var self = this;
                 when(this.$constructWaitHandle, function () {
                     if (lang.isFunction(self.initialize))
                         self.initialize(self.$context(), self.viewNode, reason);
                 })
             },

             

             startup: function () {
                 this.$doInitialize();
             },

             destroyRecursive: function () {
                 if (lang.isFunction(this.destroy))
                     this.destroy.apply(this);
                 var widgets = registry.findWidgets(this.domNode);
                 for (var i = 0; i < widgets.length; i++) {
                     try {
                         widgets[i].destroyRecursive();
                     } catch (e) {
                         console.log("Error destroying widget " + e.message);
                     }
                 }
             }
         });
     })