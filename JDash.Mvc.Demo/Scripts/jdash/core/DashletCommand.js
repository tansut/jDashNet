define(['dojo/_base/declare',
		'dojo/_base/lang',
        "./CommandName",
            "dojo/i18n!../nls/language",
            "dojo/has",
            "./DesignMode"
],
	function (declare, lang, CommandName, language, has, DesignMode) {
	    var commands = {

	        create: function (name, props) {
	            var existing = commands[name];
	            var cmd = existing ? lang.clone(existing) : { name: name };
	            if (typeof cmd["location"] == "undefined")
	                cmd.location = "header";
	            lang.mixin(cmd, props);
	        	return cmd;
	        },

	        none: { name: CommandName.name },
	        maximize: { name: CommandName.maximize, label: language.Maximize, type: "visualState", location: "header", ui: { iconClass: "d-icon-maximize", title: language.Maximize } },
	        refresh: { name: CommandName.refresh, label: language.Refresh, type: "builtIn", location: "header", ui: { iconClass: "d-icon-refresh", title: language.Refresh } },
	        collapse: { name: CommandName.collapse, label: language.Collapse, type: "visualState", location: "header", ui: { iconClass: "d-icon-collapse", title: language.Collapse } },
	        restore: { name: CommandName.restore, label: language.Restore, type: "visualState", location: "header", ui: { iconClass: "d-icon-restore", title: language.Restore } },
	        remove: { name: CommandName.remove, label: language.Remove, type: "builtIn", location: "header", ui: { iconClass: "d-icon-remove", title: language.Remove }, designMode: DesignMode.dashboard, confirm: false },
	        clone: { name: CommandName.clone, label: language.Clone, type: "builtIn", location: "header", ui: { iconClass: "d-icon-clone", title: language.Clone}, designMode: DesignMode.dashboard, confirm: false },
	        seperator: { name: "seperator", type: "seperator" },
	        share: { name: CommandName.share, label: language.Share, type: "builtIn", location: "menu", ui: { title: language.Share } },
	        about: { name: CommandName.about, label: language.About, type: "url", location: "menu", ui: { title: language.About } },
	        edit: { name: CommandName.edit, label: language.EditSettings, type: "builtIn", location: "header", ui: { title: language.EditSettings, iconClass: "d-icon-edit" }, designMode: DesignMode.dashlets },
	        menu: { name: CommandName.menu, label: language.Options, type: "builtIn", location: "header", ui: { iconClass: "d-icon-grid", title: language.Options } },
	        visualState: {
                name: CommandName.visualState, type: "builtIn", location:"none",
	            states: {
	                restore: ['collapse', 'maximize'],
	                collapse: ['restore'],
                    maximize: ['restore']
	            }
	        }
	    }

	    return commands;
	});