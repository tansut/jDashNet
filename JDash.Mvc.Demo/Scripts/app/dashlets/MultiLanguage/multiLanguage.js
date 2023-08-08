define([
    "dojo/i18n!./resources/nls/language",
        'dojo/_base/declare',
        'dojo/_base/lang',
        'dojo/text!./template.htm',
        'dijit/_WidgetBase',
        'dijit/_TemplatedMixin',
        'dijit/_WidgetsInTemplateMixin',
        'app/ViewSourceDialog',
        'require'
],
function (language,declare, lang, template, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn,  Dialog, require) {
    return declare([_WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn], {

        templateString: template,
        constructor: function () {            
            this.sampleText = language.sampleText;
            this.turkish = language.turkish;
            this.english = language.english;
            this.german = language.german;
            this.selectALanguage = language.selectALanguage;
            this.inherited(arguments);
        },
        startup:function(){
           // prettyPrint();
        },
        destroyRecursive: function () {
            this.inherited(arguments);
        },
        changeLanguage: function (e) {
            if (this.languageSlc.selectedIndex == 0) return;
            var reg = location.search.match(/locale=([\w\-]+)/);
            var local = reg ? RegExp.$1 : "en";
            var newLocal=this.languageSlc.options[this.languageSlc.selectedIndex].value
            window.location.href = (reg) ? window.location.href.replace("locale=" + local, "locale=" + newLocal) : window.location.href + "?locale=" + newLocal;            
        },
        _viewSource: function () {
            var dialog = this.dialog = new Dialog({ href: "/Scripts/app/dashlets/MultiLanguage/multiLanguage.js" });
            dialog.show();

        },
    });
});
