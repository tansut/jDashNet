define(['dojo/_base/declare',
		'dojo/_base/lang',
        "dojo/_base/array",
        "./messageBus",
        "./Destroyable",
        "dojo/aspect"
],
	function (declare, lang, array, bus, Destroyable, aspect) {
	    var mixin = declare('Klt.core.messageBusMixin', Destroyable, {

	        publish: function (t, event) {
	            return bus.publish(t, event);
	        },

	        own: function(handler) {
	            this.__cache = this.__cache || [];
	            this.__cache.push(handler);
	        },

	        destroy: function()
	        {
	            this.inherited(arguments);
	            array.forEach(this.__cache, function (item) {
	                item.remove();
                }, this);
	        },

	        subscribe: function (t, method) {
	            var handler = bus.subscribe(t, lang.hitch(this, method));
	            this.own(handler);
	            return handler;
	        },

	        unsubscribe: function (handle) {
	            handle.remove();
	        }
        });

	    return mixin;
	});