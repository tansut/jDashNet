define(['dojo/_base/declare',
			'dojo/_base/lang',
            "klt/core/messageBusMixin",
            "dojo/Stateful",
            "dojo/dom-construct",
            "dojo/dom-style"

],
	function (declare, lang,MessageBusMixin, Stateful, domConstruct, domStyle) {
	    return declare('jdash.core.DashletEditorContext', [Stateful, MessageBusMixin], {


	        publish: function (topic, args) {
	            var event = { sender: this, args: args || {} };
	            return this.inherited(arguments, [topic, event]);
	        },


              
	        destroy: function(reason)
	        {
	            this.publish("jdash/dashlet/editor/destroying", { reason: reason });

	            if (this.editView && lang.isFunction(this.editView.destroyRecursive))
	                this.editView.destroyRecursive();

	            if (this.initialNode) {
	                domStyle.set(this.initialNode, "display", "none");
	                domConstruct.empty(this.initialNode);
	            }
	            this.inherited(arguments);
	            this.publish("jdash/dashlet/editor/destroyed", { reason: reason });
	        }
	    });
	});