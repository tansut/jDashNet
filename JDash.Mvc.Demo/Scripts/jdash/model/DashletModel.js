define(['dojo/_base/declare',
		'dojo/_base/lang',
        './../ui/_DomMixin',
        'dojo/json',
        './ModelBase',
        "./ConfigModel",
        "./DashletModuleModel"
],
	function (declare, lang, _DomMixin, Json, ModelBase, ConfigModel, DashletModuleModel) {
	    var retClass = declare('jdash.model.DashletModel', [ModelBase, _DomMixin], {

	        getModule: function () {
	            if (this.module)
	                return this.module;
	            else return this._provider.getDashletModule(this.moduleId);
	        },

	        _createConfig: function (config, serialized) {
	            var config = new ConfigModel(serialized ? { data: config } : config);
	            return config;
	        },

	        postscript: function (args) {
	            args = args || {};

	            if (!("module" in args) && !("moduleId" in args))
	                throw new Error("Either module or moduleId should be specified")

	            if (args.module && !(args.module instanceof DashletModuleModel)) {
	                args.module = new DashletModuleModel(lang.mixin(args.module, { _serialized: args._serialized }));
	            }

	            args.config = this._createConfig(args.config, args._serialized);
	            args.paneConfig = this._createConfig(args.paneConfig, args._serialized);
	           
	            this.inherited(arguments, [args]);
	        },

	        _moduleSetter: function (value) {
	            this.module = value;
	            if (typeof this.title == "undefined" || this.title == null) {
	                this.set("title", value.title);
	            }
	        },

	        serializeConfig: function (config, source) {
	            var serialized = config.serialized();
	            if (this.module && this.module[source]) {
	                var moduleConfig = this.module[source].serialized();
	                for (var p in moduleConfig) {
	                    var config = moduleConfig[p];
	                    if (config.propertyConfig == DashletModuleModel.propertyConfig.replace)
	                        delete serialized[p];
	                }
	            }
	            return serialized;
	        },

	        serialized: function () {
	            var res = this.inherited(arguments);
	            lang.mixin(res, {
	                id: this.id,
	                title: this.title,
	                config: this.serializeConfig(this.config, "config"),
	                paneConfig: this.serializeConfig(this.paneConfig, "paneConfig"),
	                moduleId: this.module ? this.module.id : this.moduleId,
	                position: this.position.serialized(),
	                dashboardId: this.dashboardId
	            });
	            if (res.config.length == 0) delete res.config;
	            if (res.paneConfig.length == 0) delete res.paneConfig;
	            return res;
	        }
	    });


	    return retClass;
	});
