
define([
          "dojo/i18n!klt/nls/language",
        "klt/core/Declare",
		"dojo/_base/lang",
		"dojo/text!./resources/editor.htm",
		"dijit/_WidgetBase",
		"dijit/_TemplatedMixin",
		"require",
	    'dojo/dom-construct',
        "jdash/ui/TitleEditor",
        "jdash/ui/DashletStylesList",
        "dojo/_base/xhr"
],
	function (language, declare, lang, template, _WidgetBase, _TemplatedMixin, require, domConstruct, TitleEditor, DashletStylesList, xhr) {
	    return declare([_WidgetBase, _TemplatedMixin], {

	        templateString: template,
	        postCreate: function () {
	            var self = this;                
	            this.context.subscribe("jdash/dashlet/editor/validating", function (event) {
	                if (event.sender == this) {
	                    self._updateConfig();
	                }

	            });
	            this._initEditor();
	            this.inherited(arguments);
	        },
	        constructor: function () {
	            this.language = language;
	        },
	        _initEditor: function () {	            
	       
	        },
	        _updateConfig: function () {
	            var chartConfig = this._getConfig();
	            chartConfig.selectedPreset = this.presetsNode.value;
	            this.context.config.set("chartConfig", chartConfig);
	        },
	        _getConfig: function () {

	            var self = this;
	            return lang.mixin({}, self.context.config.getDefault("chartConfig", {}));

	        },
	        startup: function () {
	            var self = this;
	            this.dashletTitle = new TitleEditor({ context: self.context.dashletContext }, this.titleNode);
	            this.dashletStyles = new DashletStylesList({ context: self.context.dashletContext }, this.styleNode);
	            this.dashletTitle.startup();
	            this.dashletStyles.startup();
	            this.loadPresetList();
	        },
	        destroyRecursive: function () {
	            this.dashletTitle.destroyRecursive();
	            this.dashletStyles.destroyRecursive();
	            this.inherited(arguments);

	        },
	        getCurrentPreset: function () {
	            if (this.presets) {
	                var preset = this.presets.Presets[this.presetsNode.selectedIndex];
	                this._updateConfig();
	            }
	        },
	        _clearStringfy: function (stringfy) {
	            while (stringfy.indexOf("\"#") > -1 || stringfy.indexOf("#\"") > -1)
	                stringfy = stringfy.replace("\"#", "").replace("#\"", "");
	            return stringfy;
	        },
	        loadPresetList: function () {
	            var self = this;
	            xhr.get({
	            	url: "./Scripts/app/dashlets/D3/resources/presets.js", handleAs: "json",
	                load: function (presets) {
	                    if (presets) {
	                        self.presets = presets;
	                        for (var i = 0; i < presets.Presets.length ; i++) {
	                            var presetOption = document.createElement("option");
	                            presetOption.value = presets.Presets[i].config.id;
	                            presetOption.innerHTML = presets.Presets[i].config.title;
	                            self.presetsNode.appendChild(presetOption);
	                        }
	                        
	                        self.presetsNode.selectedIndex = (self._getConfig().selectedPreset) ? parseInt(self._getConfig().selectedPreset)-1 : 0;
	                    }
	                    if (!self._getConfig().config) {
	                        self.getCurrentPreset();
	                    }
	                }

	            });
	        }
	    });
	});

