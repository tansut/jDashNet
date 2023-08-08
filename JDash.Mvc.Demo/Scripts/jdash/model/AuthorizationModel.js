define(['dojo/_base/declare',
		'dojo/_base/lang',
        'dojo/json',
        './ModelBase'
],
	function (declare, lang, Json, ModelBase) {
	    var retClass = declare('jdash.model.AuthorizationModel', [ModelBase], {

	        postscript: function (args) {
	            args = args || {};

	 

	            if (args.created)
	                if (lang.isString(args.created))
	                    args.created = new Date(parseInt(args.created.replace("/Date(", "").replace(")/", ""), 10));
	                else
	                    args.created = new Date(args.created);
	            if (args.modified)
	                if (lang.isString(args.modified))
	                    args.modified = new Date(parseInt(args.modified.replace("/Date(", "").replace(")/", ""), 10));
	                else
	                    args.modified = new Date(args.modified);
	            if (args.shared)
	                if (lang.isString(args.shared))
	                    args.shared = new Date(parseInt(args.shared.replace("/Date(", "").replace(")/", ""), 10));
	                else
	                    args.shared = new Date(args.shared);



	            this.inherited(arguments, [args]);
	        },

	        add: function(key, values) {
	            this._buffer = this._buffer || {};
	            this._buffer[key] = values;
	        },

            //TODO Remove

	        serialized: function () {
	            var res = [];
	            var buffer = this.data.data || [];
	            if (buffer) {
	                buffer.forEach(function (item) {
	                    res.push({
	                        Key: item.Key,
	                        Value: item.Value
	                    });
	                });
	            }
	            return res;
	        }
	    });


	    return retClass;
	});