define(['dojo/_base/declare',
		'dojo/_base/lang',
        'dojo/store/JsonRest'
],
	function (declare, lang, JsonRest) {
	    var classDef = declare([JsonRest], {

	        postscript: function (args) {
	            args = args || {};
	            if (!args.syncMode)
	                args.syncMode = false;
	            this.inherited(arguments, [args]);

	        }
	    });

	    return classDef;
	});