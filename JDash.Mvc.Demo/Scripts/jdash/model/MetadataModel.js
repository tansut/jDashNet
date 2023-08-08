define(['dojo/_base/declare',
		'dojo/_base/lang',
        'dojo/json',
        './ModelBase'
],
	function (declare, lang, Json, ModelBase) {
		var retClass = declare('jdash.model.MetadataModel', [ModelBase], {

			postscript: function (args) {
				args = args || {};

				if (args.created)
					if (lang.isString(args.created))
						args.created = new Date(parseInt(args.created.replace("/Date(", "").replace(")/", ""), 10));
					else
						args.created = new Date(args.created);
				if (args.modified)
					if (lang.isString(args.modified))
						args.modified = new Date(parseInt(args.modified.replace("/Date(", "").replace(")/", ""), 10));
					else
						args.modified = new Date(args.modified);
				if (args.shared)
					if (lang.isString(args.shared))
						args.shared = new Date(parseInt(args.shared.replace("/Date(", "").replace(")/", ""), 10));
					else
						args.shared = new Date(args.shared);


				this.inherited(arguments, [args]);
			},

			serialized: function () {
				var res = this.inherited(arguments);
				lang.mixin(res, {
					group: this.group,
					description: this.description,
					tags: this.tags,
					createdBy: this.createdBy,
					modifiedBy: this.modifiedBy,
					sharedBy: this.sharedBy,
					created: this.created,
					modified: this.modified,
					shared: this.shared,
					userData: this.userData

				});
				return res;
			}
		});


		return retClass;
	});