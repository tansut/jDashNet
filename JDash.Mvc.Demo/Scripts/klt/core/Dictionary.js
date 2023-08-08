
define(['dojo/_base/declare',
		'dojo/_base/lang',
        'dojo/_base/array',
        './DictionaryBaseUtil',
        'dojo/json',
		'./DictionarySerializationMode'
],
	function (declare, lang, array, Dictionary, Json, DictionarySerializationMode) {
		return declare('klt.core.dictionary', [Dictionary], {

			serializationMode: DictionarySerializationMode.arrayOfObject,


			postscript: function (args) {
				this.inherited(arguments);
			},


			load: function (arr, fn, scope, itemsSerialized) {
				scope = scope || this;
				fn = fn || function (item) { return item };

				//for ----> mvc4	            
				for (var itemKey in arr) {
					var itemValue = arr[itemKey];
					this.add(itemKey, fn.call(scope, itemsSerialized ? Json.parse(itemValue) : itemValue));
				}

				//for ----> mvc3	            
				//array.forEach(arr, function (item) {
				//    this.add(item.Key, fn.call(scope, itemsSerialized ? Json.parse(item.Value) : item.Value));
				//}, this);
				return this;
			},


			serialized: function (fn, scope) {
				scope = scope || this;
				fn = fn || function (el) {
					return (el && lang.isFunction(el.serialized)) ? el.serialized() : Json.stringify(el);
				};
				if (this.serializationMode == DictionarySerializationMode.object) {
					//for ----> (object)mvc4
					var arr = {};
					this.forEach(function (el) {
						arr[el.key] = fn.call(scope, el.value);
					}, this);
				} else {
					//for ----> (array)mvc3
					var arr = [];
					this.forEach(function (el) {
						arr.push({
							Key: el.key,
							Value: fn.call(scope, el.value)
						});
					}, this);
				}
				return arr;
			},


			asObject: function () {
				var arr = {};
				this.forEach(function (el) {
					arr[el.key] = el.value;
				}, this);
				return arr;
			},


			firstKey: function () {
				var first = this.firstItem();
				if (first)
					return first.key;
				return null;

			},

			firstValue: function () {
				var first = this.firstItem();
				if (first)
					return first.value;
				return null;
			},

			firstItem: function () {
				var it = this.getIterator();
				while (it.get())
					return it.element;
				return null;
			}
		});
	});