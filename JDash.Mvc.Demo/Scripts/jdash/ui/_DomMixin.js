
define(['dojo/_base/declare',
			'dojo/_base/lang',
			'./_WidgetBase',
			'./_TemplatedMixin',
			'./_WidgetsInTemplateMixin',
			'dojo/on',
			'dojo/dom-construct',
			'dojo/query',
			'dojo/dom-class',
			'dojo/dom-style',
            'dojo/dom-prop',
            'dojo/_base/array',
            'dojo/Stateful',
            'dojo/json'

],
	function (declare, lang, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn,
			  on, domConstruct, query, domClass, domStyle, domProp, array, Stateful, 
              Json) {
	    return declare([Stateful], {

	        constructor: function () {

	        },

	        postscript: function (args) {
	            declare.safeMixin(this, args);
	        },

	        _callForDom: function () {
	            if (this.domNode) {
	                var f = arguments[0];
	                var args = lang._toArray(arguments, 1);
	                return f.apply(this, args);
	            }
	        },

	        _styleSetter: function (value) {
	            if (value) {
	                if (lang.isString(value)) {
	                    //value = Json.parse(value);
	                }

	                this._callForDom(domStyle.set, this.domNode, value);

	            }
	            this.style = value;
	        },

	        setStyle: function (n, v) {
	            var obj = { n: v };
	            this.style = lang.mixin(this.style, obj);
	            this._callForDom(domStyle.set, this.domNode, n, v);
	            if (!v)
	                delete this.style[n];
	        },

	        setAttr: function (n, v) {
	            var obj = { n: v };
	            this.attr = lang.mixin(this.attr, obj);
	            this._callForDom(domProp.set, this.domNode, n, v);
	            if (!v)
	                delete this.attr[n];
	        },

	        getAttr: function (n, defaultVal) {
	            if (!this.attr)
	                return defaultVal;
	            else if (!this.attr[n])
	                return defaultVal;
	            else return this.attr[n];
	        },

	        _attrSetter: function (value) {
	            if (value) {
	                if (lang.isString(value)) {
	                    //value = Json.parse(value);
	                }
	                this._callForDom(domProp.set, this.domNode, value);
	            }
	            this.attr = value;

	        },

	        addCls: function (value) {
	            if (!this.cls)
	                this.cls = value;
	            else this.cls = this.cls + ' ' + value;
	            this._callForDom(domClass.add, this.domNode, value);
	        },

	        _clsSetter: function (value) {
	            if (value) {
	                this._callForDom(domClass.add, this.domNode, value);
	            }
	            this.cls = value;
	        },

	        _domNodeSetter: function (value) {
	            if (value) {
	                this.domNode = value;
	                this.applyProps();

	            } else this.domNode = null;
	        },

	        applyProps: function () {
	            if (this.domNode) {
	                this.set('style', this.style);
	                this.set('cls', this.cls);
	                this.set('attr', this.attr);
	            }
	        },

	        serializeStyle: function () {
	            if (!this.style)
	                return '';
	            else return Json.stringify(this.style);
	        },

	        serializeAttr: function () {
	            if (!this.attr)
	                return '';
	            else return Json.stringify(this.attr);
	        },

	        serialized: function () {
	            var res = {};
	            lang.mixin(res, { style: this.serializeStyle() });
	            lang.mixin(res, { cls: this.cls });
	            lang.mixin(res, { attr: this.serializeAttr() });

	            return res;
	        }
	    });
	});
