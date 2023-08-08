define([
	"dojo/_base/array", 
	"dojo/aspect",
	"dojo/_base/declare"
], function (array, aspect, declare) {
    return declare("klt.core.destroyable", null, {
        destroy: function (/*Boolean*/ preserveDom) {
            this._destroyed = true;
        },

        own: function () {
            array.forEach(arguments, function (handle) {
                var destroyMethodName =
				"destroyRecursive" in handle ? "destroyRecursive" :	// remove "destroyRecursive" for 2.0
				"destroy" in handle ? "destroy" :
				"remove";
                handle._odh = aspect.before(this, "destroy", function (preserveDom) {
                    handle._odh.remove();
                    handle[destroyMethodName](preserveDom);
                });

                aspect.after(handle, destroyMethodName, function () {
                    handle._odh.remove();
                });
            }, this);

            return arguments;		
        }
    });

});
