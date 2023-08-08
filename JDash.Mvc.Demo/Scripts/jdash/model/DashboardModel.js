define(['dojo/_base/declare',
		'dojo/_base/lang',
        './../ui/_DomMixin',
        'dojo/json',
        './ModelBase',
        "./ConfigModel",
        "../layout/_Layout",
        "./MetadataModel"
],
	function (declare, lang, _DomMixin, Json, ModelBase, ConfigModel, Layout, MetadataModel) {
	    var retClass = declare('jdash.model.DashboardModel', [ModelBase, _DomMixin], {


	        _createConfig: function (config, serialized) {
	            var config = new ConfigModel({ data: config, _serialized: serialized });
	            return config;
	        },

	        postscript: function (args) {
	            args = args || {};

	            if (typeof args.layout == "undefined")
	                throw new Error("Dashboard should have a layout");

	            if (args.layout instanceof Layout)
	                args.layout = args.layout.serialized();

	            else if (lang.isString(args.layout))
	                args.layout = { type: args.layout };

	            if (args.metaData && !(args.metaData instanceof MetadataModel))
	                args.metaData = new MetadataModel(args.metaData);

	            args.config = this._createConfig(args.config, args._serialized);
	            args.paneConfig = this._createConfig(args.paneConfig, args._serialized);

	            this.inherited(arguments, [args]);
	        },

	        serialized: function () {
	            var res = this.inherited(arguments);
	            lang.mixin(res, {
	                id: this.id,
	                title: this.title,
                    layout: this.layout,
	                config: this.config.serialized(),
	                paneConfig: this.paneConfig.serialized(),
	                metaData: (this.metaData ? this.metaData.serialized(): null)

	            });
	            if (res.config.length == 0) delete res.config;
	            if (res.paneConfig.length == 0) delete res.paneConfig;	            
	            return res;
	        }
	    });


	    return retClass;
	});