
define(['dojo/_base/declare',
		'dojo/_base/lang',
        './_LayoutItem',
        '../ui/_DomMixin'
],
	function (declare, lang, _LayoutItem) {
		return declare([_LayoutItem], {
			postscript: function (args) {
				declare.safeMixin(this, args);
			},

			clone: function () {
				return lang.clone(this.serialized());
			},

			serialized: function () {
				var res = this.inherited(arguments);
				lang.mixin(res, { title: this.title });
				lang.mixin(res, { flex: this.flex || 1});
				return res;
			}
		});
	});