define([
    '../model/DashletPositionModel',
    '../ui/_TemplatedMixin',
    'dojo/json',
        '../ui/registry',
        'dojo/_base/declare',
        'dojo/_base/lang',
        './LayoutManager',
        'dojo/text!./templates/GridLayout.htm',
        'dojo/_base/array',
        'dojo/dom-class',
        'dojo/dom-construct',
        'dojo/query',
        'dojo/dom-attr',
"dojo/dom-style",
'./_BaseDndLayout',
"jdash/ui/ThemeManager",
"require",
"klt/core/WfPatch"
],
function (DashletPosition, _TemplatedMixin, Json, registry, declare, lang, LayoutManager, template, array, domClass, domConstruct,
    query, domAttr, domStyle, _BaseDndLayout, ResourceManager, require, WfPatch) {
    var gridLayout = declare('DDML', [_BaseDndLayout, _TemplatedMixin], {
	    
        templateString: WfPatch.patch(template),
		sectionTag: 'div',

		zoneTag: 'div',

		dndEnabled: false,

		getDefaultLayout: function () {
		    // summary:
		    //     Returns a layout preset
			var sections = {
				"defaultSection": {
					"zones": {
						"zone1": {},
						"zone2": {},
						"zone3": {}
					}
				}
			};
			this.hasDefaultLayout = true;
			return sections;
		},

		_applySectionProps: function (section) {
			domClass.add(section.domNode, "d-layout-grid-row");
		},

		_createSectionDom: function (section) {
			return this.inherited(arguments);
		},

		_createZoneDom: function (zone) {
			return this.inherited(arguments);
		},



		_applyZoneProps: function (zone) {
		    domClass.add(zone.domNode, "d-layout-grid-four");
		    
			this.inherited(arguments);
		},

		_renderZone: function (zone) {
			this.inherited(arguments);
		},

		_renderSection: function (section) {
			this.inherited(arguments);
		},

		addSection: function (/* String */id,/* Object */ data) {
		    // summary:
		    //      Adds a new section in layout.
		    // id:
		    //      Id of new section object
		    // data:
		    //      section template data
			var result = this.inherited(arguments);
			this._adjustZoneWidthHeight(result);
			return result;
		},

		addZone: function (/* Object */ section, /* String */ zoneId, /* Object */ data) {
		    // summary:
		    //      Adds a new section in section.
		    // section:
		    //      Section object
		    // zoneId:
		    //      Id of new zone object
		    // data:
		    //      Zone template data
			var result = this.inherited(arguments);
			this.dndManager.registerByNode(result.zone.domNode);
			this._adjustZoneWidthHeight(section);
			return result;

		},


		_setZoneCss: function (domNode,value) {
			var zoneCss =
				["d-layout-grid-one", "d-layout-grid-two", "d-layout-grid-three", "d-layout-grid-four",
					 "d-layout-grid-five", "d-layout-grid-six", "d-layout-grid-seven", "d-layout-grid-eight",
					"d-layout-grid-nine", "d-layout-grid-ten", "d-layout-grid-eleven", "d-layout-grid-twelve"];
	
			array.forEach(zoneCss, function (css) {
				if(domClass.contains(domNode,css))
					domClass.remove(domNode,css);
			});
			var css;
			if (value == 0 || value > zoneCss.length) css= zoneCss[0];
			else css = zoneCss[value - 1];
			if (this.hasDefaultLayout) css = "d-layout-grid-four";
			domClass.add(domNode, css);
			domClass.add(domNode, "d-layout-grid-columns");
			
		},

		_adjustZoneWidthHeight: function (section) {
			var sectionObj = section.value ? section.value : section;
			var zid = sectionObj.zones.getIterator();
			var zoneCount = sectionObj.zones.count;
			var zoneFlexTotal = 0;
			while (zid.get()) {
			    if (!zid.element.value.flex) zid.element.value.flex = 1;
				zoneFlexTotal += zid.element.value.flex;
			}
			zid = sectionObj.zones.getIterator();
			var zone;
			var zoneWidthRatio = 12 / zoneFlexTotal;
			var totalRatio = 0;
			var ctr = 1;			
			while (zid.get()) {
				if (ctr != zoneCount) {
					var currentRatio = Math.round(zoneWidthRatio * zid.element.value.flex);
					totalRatio += currentRatio;
					this._setZoneCss(zid.element.value.domNode, currentRatio);
				}
				zone = zid.element;
				ctr++;
			}
			if (zone)
				this._setZoneCss(zid.element.value.domNode, 12 - totalRatio);
			this.inherited(arguments);
		},






		removeZone: function (/* Object */zone) {
		    // summary:
		    //      Removes a zone and its children
		    // zone:
		    //      Zone object
			var sit = this.sections.getIterator();
			var section = null;
			var validatedZone = null;
			while (sit.get()) {
				var zit = sit.element.value.zones.getIterator();
				if (lang.isString(zone)) validatedZone = sit.element.value.zones.item(zone);
				else {
					var zid = sit.element.value.zones.getIterator();
					while (zid.get()) {
						if (zid.element.value == zone) {
							validatedZone = zone;
						}
					}
				}
				if (!validatedZone) continue;
				else
				{
					section = sit.element;
					break;
				}
			}
			if (validatedZone) {
				this.dndManager.unregister(validatedZone.domNode);
				this.inherited(arguments);
				this._adjustZoneWidthHeight(section);
			}
		},

		getPositionInfo: function (/*Object */dashPos) {
		    var result = this.inherited(arguments);
		    if (typeof (result.dashPos.pos) == "undefined")
		        result.dashPos.pos = 0;
		    return result;
		},


		_positionChild: function (child, arrange, avoidUpdatePosition) {
			var dashPos = this.getPositionFromChild(child);

			var zoneInfo = this.getPositionInfo(dashPos);
			var dashPos = zoneInfo.dashPos;
			var zone = zoneInfo.zone || dashPos.zone;
			if (!avoidUpdatePosition)
				this.updateChildPosition(child, dashPos);

			if (!this.dndEnabled) {
				domConstruct.place(child.domNode, zone.domNode, dashPos.get('pos'));
			}
			else {
				if (!child.dragRestriction) {
					this.dndManager.addDragItem(zone.domNode, child.domNode, dashPos.get('pos'), true);
				}
				else {
					if (!this.dndEnabled) {
						domConstruct.place(child.domNode, zone.domNode, dashPos.get('pos'));
					}
				}

			}

		},

		destroy: function () {
			var sit = this.sections.getIterator();
			while (sit.get()) {
				var zit = sit.element.value.zones.getIterator();
				while (zit.get()) {
					this.dndManager.unregister(zit.element.value.domNode);
				}
			}
			this.inherited(arguments);
		},
		_setColRowSpans: function () {

		},

		getLayoutRoot: function () {
		    // summary:
		    //     Returns container dom node of layout
			return this.containerDiv;
		},
	
		getType: function () {
			return "grid";
		},

		postCreate: function () {
		    //ResourceManager.load(require.toUrl("../resources/css/layout/gridLayout.css"));
			this.inherited(arguments);
		},


		destroyRecursive: function () {

			this.inherited(arguments);
			//ResourceManager.unload(require.toUrl("../resources/css/layout/gridLayout.css"));
		},

		onDndCancel: function (source, nodes, copy, target) {
			this.inherited(arguments);
		},

		onDndDrop: function (node, targetArea, indexChild) {
			document.body.style.cursor = 'default';

			return this.inherited(arguments);

		},
		_getDomPosition: function (node) {
			for (var i = 0; i < node.parentNode.children.length; i++) {
				if (node.parentNode.children[i] == node) {
					return i;
					break;
				}
			}
			return 0;
		},

		startup: function () {
			this.inherited(arguments);		
		}
	});

    LayoutManager.register('grid', gridLayout);
    
    return gridLayout;

});