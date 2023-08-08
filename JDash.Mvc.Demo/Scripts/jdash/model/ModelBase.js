define(['dojo/_base/declare',
		'dojo/_base/lang',
        'dojo/Stateful',
        'dojo/_base/array',
        "dojo/when",
        "dojo/Deferred"
],
	function (declare, lang, Stateful, array, when, Deferred) {
	    var ModelBase = declare('jdash.model.ModelBase', [Stateful], {

	        endUpdateHandler: function (handler) {
	            this._endUpdateHandler = handler;
	        },

	        beginUpdateHandler: function (handler) {
	            this._beginUpdateHandler = handler;
	        },

	        cancelUpdateHandler: function (handler) {
	            this._cancelUpdateHandler = handler;
	        },


	        beginUpdate: function () {
	            this._updateCount = this._updateCount || 0;
	            this._updateCount = this._updateCount + 1;
	            if (this._updateCount == 1 && this._beginUpdateHandler)
	                this._beginUpdateHandler.apply(this);
	        },

	        endUpdate: function () {
	            if (this._updateCount) {
	                this._updateCount = this._updateCount - 1;
	                if (this._updateCount == 0) {
	                    delete this._updateCount;
	                    
	                    if (this._endUpdateHandler)
	                        this._endUpdateHandler.call(this, this._updatedValues);

	                    delete this._updatedValues;
	                }
	            }
	        },

	        cancelUpdate: function () {
	            delete this._updateCount;
	            var values = this._updatedValues || {};
	            delete this._updatedValues;
	            if (this._cancelUpdateHandler)
	                this._cancelUpdateHandler.apply(this, values);

	            for (var p in values) {
	                this.set(p, values[p]);
                }

	        },

	        inUpdate: function () {
	            return this._updateCount && this._updateCount > 0;
	        },

	        set: function (name, value) {

	            if (typeof name === "object") {
	                for (var x in name) {
	                    if (name.hasOwnProperty(x)) {
	                        this.set(x, name[x]);
	                    }
	                }
	                return this;
                }

	            if (lang.isFunction(this.validateCallback)) {
	                var validateRes = this.validateCallback.apply(this, arguments);

	                var args = arguments;
	                var self = this;

	                var defer = new Deferred();

	                when(validateRes, function (valRes) {
	                    if (valRes == false)
	                        defer.reject(valRes);
	                    else {
	                        self._saveUpdatedValue(name, value);
	                        defer.resolve(self.inherited(args))
	                    }
	                }, function (valRes) {
	                    defer.reject(valRes);
	                });

	                return defer;

	            } else {
	                this._saveUpdatedValue(name, value);
	                return this.inherited(arguments);
	            }
	        },


	        has: function (name) {
	            return typeof this.get(name) != "undefined";
	        },

	        _saveUpdatedValue: function (name, newValue) {
	            if (this.inUpdate()) {
	                var oldValue = this.get(name);
	                if (!this.isSameValue(newValue, oldValue)) {
	                    this._updatedValues = this._updatedValues || {};
	                    this._updatedValues[name] = lang.clone(oldValue);
	                }
	            }
	        },

	        isSameValue: function(newValue, oldValue) {
	            return newValue === oldValue;
	        },


	        hasUpdated: function (name, newVal) {
	            var oldval = this.get(name);
	            return !this.isSameValue(newVal, oldval);
	        },


	        getDefault: function (name, defaultValue) {
	            var value = this.get(name);
	            if (typeof value == "undefined" || value == undefined)
	                return defaultValue;
	            else return value;
	        },

	        serialized: function() {
	            return {};
	        },
	   

	        setDefault: function (name, value) {
	            if (!this.has(name)) {
	                this.set(name, value);
	                return value;
	            }
	            else return this.get(name);
	        }
	    });



	    return ModelBase;
	});