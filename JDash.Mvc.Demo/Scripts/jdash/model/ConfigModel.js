define(['dojo/_base/declare',
		'dojo/_base/lang',
        'klt/core/Dictionary',
        'dojo/json',
        './ModelBase',
        'dojo/_base/array',
        "dojo/when",
		'klt/core/DictionarySerializationMode'
],
	function (declare, lang, Dictionary, Json, ModelBase, array, when, DictionarySerializationMode) {
		var retClass = declare('jdash.model.ConfigModel', [ModelBase], {

			serializationMode: DictionarySerializationMode.object,

			constructor: function () {
				this._buffer = {};
			},


			remove: function (name) {
				delete this._buffer[name];
				delete this[name];

			},

			set: function (name, value, force) {

				if (typeof name === "object") {
					for (var x in name) {
						if (name.hasOwnProperty(x)) {
							this.set(x, name[x]);
						}
					}
					return this;
				}

				var self = this;

				if (force) {
					return when(this.inherited(arguments), function () {
						if (typeof value == "undefined")
							self.remove(name)
						else self._buffer[name] = value;
					});
				} else if (this.hasUpdated(name, value)) {
					return when(this.inherited(arguments), function () {
						if (typeof value == "undefined")
							self.remove(name)
						else self._buffer[name] = value;
					});
				}

				return null;
			},


			toPlainObject: function () {
				return lang.clone(this._buffer);
			},

			postscript: function (args) {
				args = args || {};
				scope = args._scope || this;

				var _serialized = typeof args.data != "undefined";
				var data = args.data || [];
				delete args.data;
				delete args._serialized;

				fn = args._fn || function (item) {
					return _serialized ? item : item
				};

				delete args._fn;
				delete args._scope;

				if (_serialized) {
					//for ----> mvc4
					for (var itemKey in data) {
						var itemVal = data[itemKey];
						args[itemKey] = fn.call(scope, itemVal);
						this._buffer[itemKey] = args[itemKey];
					}
					//for ----> mvc3
					//array.forEach(data, function (item) {
					//    args[item.Key] = fn.call(scope, item.Value);
					//    this._buffer[item.Key] = args[item.Key];
					//}, this);
				} else {
					for (var p in args) {
						args[p] = fn.call(scope, args[p]);
						this._buffer[p] = args[p];
					}
				}



				this.inherited(arguments, [args]);
			},

			serialized: function (fn, scope) {
				scope = scope || this;
				fn = fn || function (el) {
					return (el && lang.isFunction(el.serialized)) ? el.serialized() : el;
				};
				var list = null;

				//for ----> mvc4
				if (this.serializationMode == DictionarySerializationMode.object) {
					list = {};
				} else {
					//for ----> mvc3
					list = [];
				}
				for (var p in this._buffer) {
					if (this._buffer[p] != undefined)
						if (this.serializationMode == DictionarySerializationMode.object) {
							//for ----> mvc4
							list[p] = fn.call(scope, this._buffer[p]);
						} else {
							//for ----> mvc3
							list.push({ Key: p, Value: fn.call(scope, this._buffer[p]) });
						}
				}
				return list;
			}
		});


		return retClass;
	});