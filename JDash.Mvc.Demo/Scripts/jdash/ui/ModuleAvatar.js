
define([   
         'dojo/dom-attr',
        'dojo/_base/declare',
        'dojo/_base/lang',
        'dojo/text!./templates/ModuleAvatar.html',
        './_WidgetBase',
        './_TemplatedMixin',
        './_WidgetsInTemplateMixin',
        'dojo/on',
        'dojo/dom-construct',
        'dojo/query',
        'dojo/dom-class',
        'dojo/dom-style',
        '../model/DashletModel',
        "./_ThemeMixin",
        "./Button"
],
function (domAttr, declare, lang, template, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn,
          on, domConstruct, query, domClass, domStyle, DashletModel, _ThemeMixin) {
    return declare('jdash.ui.ModuleAvatar', [_WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn], {

        templateString: template,

        baseClass: "d-moduleItem",

        themeClass: "d-bar-",

        themeStyleClass: "d-bar-",

        _createDashlet: function (e) {
            if (this.domNode.preventClick) {
                this.domNode.preventClick = false;
                return;
            }

            if (!this.domNode.isDragging) {
                e.preventDefault();
                var model = new DashletModel({ module: this.module });                
        		return this.moduleView.dashboardView.createDashlet(model);
        	}
        },

       

        postCreate: function () {
            this._initDragNode();
            if (this.module.metaData.description)
                this.domNode.title = this.module.metaData.description;
            if (this.module.paneConfig.has("iconClass"))
                this.btn.set("iconClass", this.module.paneConfig.get("iconClass").value);
            this.inherited(arguments);
        },
        _initDragNode: function () {            
            var self = this;
            this.domNode.AvatarNode = true;
            this.domNode.module = this.module;
            this.domNode.menuIndex = this.index;
            this.domNode.initialStyle = this.domNode.getAttribute("style");            
            this.domNode.model = new DashletModel({ module: self.module });
            this.domNode.sourceNode = this.moduleView.modulesNode;

        }
   
    });
});
