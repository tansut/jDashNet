define(['dojo/_base/declare',
        './DashletPaneBase',
	    "dojo/text!./templates/DashletPane.htm",
"klt/core/WfPatch"],
	function (declare, DashletPaneBase, template, WfPatch) {
	    return declare('jdash.ui.DashletPane', [DashletPaneBase], {
	        templateString: WfPatch.patch(template)
	    });
	});
