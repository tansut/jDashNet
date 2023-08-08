define(['dojo/_base/declare',
			'dojo/_base/lang'
],
	function (declare, lang) {
	    var res = {
	        none: "none", // no design nor editing dashlets
	        dashboard: "dashboard", // layout editing, drag-drop and removing of dashlets.
	        dashlets: "dashlets", // Only dashlet editing.
            full: "full" // full
	    }
	    lang.setObject("jdash.designMode", res);
	    return res;
	});