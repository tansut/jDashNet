
define(['dojo/_base/declare',
		'dojo/_base/lang',
        'dojo/topic',
        'dojo/Deferred'
],
	function (declare, lang, bus, Deferred) {
	    var singletonClass = declare("Klt.core.MessageBus", null, {

	        publish: function (topic, event) {
	            var defer = new Deferred();
	            var temp = this.subscribe(topic, function (args) {
	                temp.remove();
	                if (args && args.cancel) {
	                    defer.reject(args);
	                }
	                else if (args && args.nextDefer) {
	                    var self = this;
	                    args.nextDefer.then(function (result)
	                    {
	                        defer.resolve(lang.mixin(args, { deferResult: result }));
                        },
                        function (result) {
                            defer.reject(lang.mixin(args, { deferResult: result }));
                        });
	                }
	                else defer.resolve(args);
	            });

	            var res = bus.publish.apply(bus, arguments);
	            return defer;
	        },

	        subscribe: function (topic, listener) {
	            var res = bus.subscribe.apply(bus, arguments);
	            return res;
	        },

	        createEvent: function (sender, args) {
	            return {
	                sender: sender,
	                args: args || {}
	            }
	        }

	    });

	    var singleton = new singletonClass();

	    return singleton;
	});