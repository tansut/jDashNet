
define(['dojo/_base/declare',
		'dojo/_base/lang',
        './../ui/_DomMixin',
        'dojo/json',
        './ModelBase',
        './ConfigModel',
        "./MetadataModel",
        "./AuthorizationModel"
],
	function (declare, lang, _DomMixin, Json, ModelBase, ConfigModel, MetadataModel,AuthorizationModel) {
	    var moduleClass = declare('jdash.model.DashletModuleModel', [ModelBase, _DomMixin], {
	        
	        postscript: function (args) {
	            args = args || {};
	            args.config = this._createRegularConfig(args.config, args._serialized);
	            args.paneConfig = this._createRegularConfig(args.paneConfig, args._serialized);
	            args.dashletConfig = this._createRegularConfig(args.dashletConfig, args._serialized);

	            if (args.authorization && !(args.authorization instanceof AuthorizationModel)) {
	                args.authorization = new AuthorizationModel({ data: args.authorization });
	            } else args.authorization = new AuthorizationModel();

	            if (args.metaData && !(args.metaData instanceof MetadataModel))
	                args.metaData = new MetadataModel(args.metaData);

	            this.inherited(arguments, [args]);
	        },

	        _createRegularConfig: function (config, serialized) {
	            var config = new ConfigModel(serialized ? { data: config } : config);
	            return config;
	        },

	        //_createConfig: function (config, serialized) {
	        //    var fn = function (value) {
	        //        if (!lang.isObject(value))
	        //            value = { value: value, propertyConfig: moduleClass.propertyConfig.none }
	        //        return {
	        //            value: serialized ? value.value : value.value,
	        //            propertyConfig: value.propertyConfig
	        //        }
	        //    }

	        //    var params = serialized ? { _fn: fn, data: config } :
            //            lang.mixin(config, { _fn: fn });

	        //    var config = new ConfigModel(params);
	        //    return config;

	        //},

	        serialized: function () {
	            var res = this.inherited(arguments);
	            var _serializeItem = function (value) {
	                if (!lang.isObject(value))
	                    value = { value: value, propertyConfig: moduleClass.propertyConfig.none }
	                return {
	                    value: Json.stringify(value.value),
	                    propertyConfig: value.propertyConfig
	                }
	            }
	            lang.mixin(res, {
	                id: this.id,
	                path: this.path,
	                title: this.title,
	                config: this.config.serialized(),
	                paneConfig: this.paneConfig.serialized(),
	                dashletConfig: this.dashletConfig.serialized(),
	                metaData: (this.metaData ? this.metaData.serialized() : null),
	                authorization: this.authorization ? this.authorization.serialized() : null
	            });
	            if (res.config.length == 0) delete res.config;
	            if (res.paneConfig.length == 0) delete res.paneConfig;
	            if (res.dashletConfig.length == 0) delete res.dashletConfig;
	            return res;
	        }

	    });

	    lang.mixin(moduleClass, {
	        propertyConfig: {
	            none: 0,
	            replace: 1

	        }
	    });

	    return moduleClass;
	});