
define(['dojo/_base/declare',
		'dojo/_base/lang',
        './_LayoutItem',
        './Zone',
        'dojo/_base/array',
        "klt/core/Dictionary"
],
	function (declare, lang, _LayoutItem, Zone, array, Dictionary) {
	    return declare([_LayoutItem], {

	        addZone: function (key, value) {
	            this.zones = this.zones || new Dictionary();
	            var props = value;
	            lang.mixin(props, {
	                _parentLayout: this._parentLayout,
	                _parentSection: this

	            });
	            var zone = new Zone(props);
	            this.zones.add(key, zone);
	            return zone;
	        },

	        postscript: function (args) {
	            this.zones = new Dictionary();
	            if (args && lang.isObject(args.zones)) {
	                var zones = args.zones;
	                delete args.zones;
	                for (var itemKey in zones) {
	                    var itemValue = zones[itemKey];
	                    this.addZone(itemKey, itemValue);
	                }
	            }
	            declare.safeMixin(this, args);
	        },

	        serialized: function () {
	            var serialized = this.inherited(arguments);
	            return lang.mixin(serialized, {
	                zones: this.zones.serialized(),
                    title: this.title
	            });
	        },

	        clone: function () {
	            return lang.clone(this.serialized());
	        }
	    });
	});