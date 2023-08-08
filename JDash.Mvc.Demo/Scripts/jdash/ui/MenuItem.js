define(['dojo/_base/declare',
        'dojo/_base/lang',
        'dojo/text!./templates/MenuItem.html',
        './_WidgetBase',
        './_TemplatedMixin',
        './_WidgetsInTemplateMixin',
        'dojo/dom-class',
        'dojo/dom-style',
        'dojo/dom-construct',
        './_ThemeMixin'         
],
function (declare, lang, template, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixin,
         domClass, domStyle, domConstruct, _ThemeMixin, domGeom) {
    return declare('jdash.ui.MenuItem', [_WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixin, _ThemeMixin], {

        templateString: template,

        postCreate: function () {
            this.inherited(arguments);
            
        },
        onClick: function (e) {            
                        
        }
    });
});