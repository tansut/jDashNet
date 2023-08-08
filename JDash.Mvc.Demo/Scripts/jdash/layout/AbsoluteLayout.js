define([
    '../model/DashletPositionModel',
    '../ui/_TemplatedMixin',
    'dojo/json',
        '../ui/registry',
        'dojo/_base/declare',
        'dojo/_base/lang',
        './LayoutManager',
        'dojo/text!./templates/AbsoluteLayout.htm',
        'dojo/_base/array',
        'dojo/dom-class',
        'dojo/dom-construct',
        'dojo/query',
        'dojo/dom-attr',
		"dojo/has",
		"dojo/when",
"dojo/dom-style",
'./_Layout',
'./StepMover',
"./AbsoluteMoveable",
"dojo/on",
"dojo/dom-geometry",
"jdash/ui/ThemeManager",
      "require",
"jdash/layout/MDropManager",
        "./DropIndicator",
	    "./OverDropMode",
        "./AutoScroll"
  
],
function (DashletPosition, _TemplatedMixin, Json, registry, declare, lang, LayoutManager, template, array, domClass, domConstruct,
    query, domAttr, has, when, domStyle, _Layout, StepMover, Moveable, on, domGeom, ResourceManager,require) {
  //  var absoluteLayout = declare('jdash.layout.AbsoluteLayout', [_Layout, _TemplatedMixin], {
    var absoluteLayout = declare('DDAL', [_Layout, _TemplatedMixin], {
    
        templateString: template,
        sectionTag: 'div',

        zoneTag: 'div',

        dndEnabled: false,
        stepSize: 100,
        getDefaultLayout: function () {
            var sections = {
                "defaultSection": {
                    "zones": {
                        "defaultZone": {}
                    }
                }
            };
            return sections;
        },

        defaultDimension: { w: 1600, h: 800 },

        setDimension: function (/*Object*/dimension) {
            // summary:
            //     Sets width and heigth of main zone.
            // dimension:
            //      An object with 'w' and 'h' properties
            if (dimension) {
                this.defaultDimension = dimension;
            }
            domGeom.setMarginBox(this.containerDiv, this.defaultDimension);
        },

        _applySectionProps: function (section) {
            domClass.add(section.domNode, "d-absoluteLayoutSection");
        },

        _createSectionDom: function (section) {
            return this.inherited(arguments);
        },

        _createZoneDom: function (zone) {
            return this.inherited(arguments);

        },
        removeDashlet: function (/* Object */ dashlet) {
            // summary:
            //     Removes dashlet object
            // dashlet:
            //      Dashlet object
            this.inherited(arguments);
            var children = this.getChildren(this.sections.firstKey(), this.sections.firstValue().zones.firstKey());
            array.forEach(children, function (child) {
                if (child != dashlet)
                    domStyle.set(child.domNode, "display", "block");
            });
        },

        _applyZoneProps: function (zone) {
            domClass.add(zone.domNode, "d-absoluteLayoutZone");
            this.inherited(arguments);
        },

        _renderZone: function (zone) {
            this.inherited(arguments);
        },

        _renderSection: function (section) {
            this.inherited(arguments);
        },

        addSection: function (/* String */ id, /* Object */data) {
            // summary:
            //      Adds a new section in layout.
            // id:
            //      Id of new section object
            // data:
            //      section template data
            if (this.sections.count == 0) {
                var result = this.inherited(arguments);
                return result;
            } else {
                return null;
            }

        },






        addZone: function (/* Object */ section,/* String */ zoneId, /* Object */data) {
            // summary:
            //      Adds a new section in section.
            // section:
            //      Section object
            // zoneId:
            //      Id of new zone object
            // data:
            //      Zone template data
            var section = self.sections.getIterator().get();
            if (section && section.zones.count == 0) {
                var result = this.inherited(arguments);
                return result;
            } else {
                return null;
            }
        },

        getMaximizeRoot: function () {
            // summary:
            //     Returns maximization dom node
            return this.containerNode;
        },

        maximizeDashlet: function (/* Object */ dashlet) {
            // summary:
            //     Maximizes a dashlet node.
            // dashlet:
            //      Dashlet object
            dashlet.moveable.stricky = true;
            this.inherited(arguments);
            var children = this.getChildren(this.sections.firstKey(), this.sections.firstValue().zones.firstKey());
            array.forEach(children, function (child) {
                if (child != dashlet)
                    domStyle.set(child.domNode, "display", "none");
            });
            var geom = domGeom.getMarginBox(dashlet.domNode);
            dashlet.minimizedGeometry = geom;
            domGeom.setMarginBox(dashlet.domNode, { l: 0, t: 0 });

        },

        minimizeDashlet: function (/* Object */ dashlet) {
            // summary:
            //     Minimizes a dashlet node.
            // dashlet:
            //      Dashlet object
            this.inherited(arguments);
            var children = this.getChildren(this.sections.firstKey(), this.sections.firstValue().zones.firstKey());
            array.forEach(children, function (child) {
                if (child != dashlet)
                    domStyle.set(child.domNode, "display", "block");
            });
            if (dashlet.minimizedGeometry)
                domGeom.setMarginBox(dashlet.domNode, { l: dashlet.minimizedGeometry.l, t: dashlet.minimizedGeometry.t });
            dashlet.moveable.stricky = false;
        },

        removeSection: function (section) {
        },

    

        _registerModuleNode: function (moduleNode) {
            var module = moduleNode.module;
            var dragNode = moduleNode.moduleNode;
            var modulesNode;
            if (dragNode.parentNode && domClass.contains(dragNode.parentNode, "dndArea"))
                modulesNode = dragNode.parentNode;
            else {
                modulesNode = domConstruct.create("div");
                domConstruct.place(modulesNode, dragNode.parentNode);
                domConstruct.place(dragNode, modulesNode);
            }
            if (moduleNode.module)
                dragNode.module = moduleNode.module;
            else dragNode.moduleId = moduleNode.moduleId;
            dragNode.AvatarNode = true;
            dragNode.menuIndex = dragNode.index;
            dragNode.initialStyle = dragNode.getAttribute("style");
            dragNode.model = this._createDashletModel(dragNode);
            domAttr.set(modulesNode, "accept", "modules");
            domAttr.set(dragNode, "dndType", "modules");
            if (!modulesNode.isDNDRegistered) {
                this.dndManager.registerByNode(modulesNode);
                domClass.add(modulesNode, "gridContainerZone");
                domClass.add(modulesNode, "dndArea");
                modulesNode.isDNDRegistered = true;
            }
        },


        registerModuleNode: function (moduleNodes) {
            var self = this;
            if (lang.isArray(moduleNodes)) {

                array.forEach(moduleNodes, function (item, i) {
                    item.lastModule = (i == moduleNodes.length - 1);
                    self._registerModuleNode(item);
                });
            } else this._registerModuleNode(moduleNodes);
        },
        unRegisterModuleNode: function (modulesNode) {
            this.dndManager.unregister(modulesNode);
        },

        initilizeModuleNodes: function (moduleNodes) {
            if (this.dndManager == null) return;
            for (var i = 0; i < moduleNodes.length; i++) {
                this._registerModuleNode(moduleNodes[i]);
            }
        },


        getPositionInfo: function (/*Object*/dashpos) {
            // summary:
            //     Returns a layout position object from dashlet position model
            // dashpos:
            //      dashlet position model object
            var zoneInfo = this.inherited(arguments);
            var dashPos = zoneInfo.dashPos;
            var position;
            if (lang.isString(dashpos))
                position = Json.parse(dashpos);
            else position = dashpos;
            if (position && position.pos) {
                position.pos.t = (position.pos.t < 0) ? 0 : position.pos.t;
                position.pos.l = (position.pos.l < 0) ? 0 : position.pos.l;
                dashPos.set('pos', position.pos)
            } else
                dashPos.set('pos', { l: 0, t: 0 })
            
            return zoneInfo;

        },
        getPredefinedLayouts: function () {
            // summary:
            //      Returns an array of predefined layout objects
            var predefLayouts = [];
            predefLayouts.push({ id: 1, layout: { "section1": { "zones": { "zone1": {} } } } });
            return predefLayouts;
        },
        removeZone: function (zone) {
        },

        _positionChild: function (child, arrange, avoidUpdatePosition) {
            var self = this;
            var dashPos = this.getPositionFromChild(child);
            var zoneInfo = this.getPositionInfo(dashPos);
            var dashPos = zoneInfo.dashPos;
            var zone = zoneInfo.zone;


            if (!child.dragRestriction) {
                var moveable = new Moveable(child.domNode, { mover: StepMover });
                moveable.context = this;
                moveable.child = child;
                child.moveable = moveable;
                lang.extend(moveable.mover, { stepSize: this.stepSize });
                on(moveable, "MoveStop", function (mover) {
                    var widget = registry.getEnclosingWidget(mover.node);
                    if (!widget.stricky) {
                        var pos = domGeom.getMarginBox(mover.node);
                        var position = self.getPositionInfo();
                        var dashPos = position.dashPos;
                        dashPos.set('pos', { l: pos.l, t: pos.t });
                        if (!avoidUpdatePosition)
                            self.updateChildPosition(child, dashPos);
                        self.getDashboard().provider.updateDashletPositions([{
                            id: widget.context.id,
                            position: self.serializedDashletPos(dashPos)
                        }]);
                        self._publishForLayout("dnd/moved", { mover: mover });
                    }
                });
            }
            domClass.add(child.domNode, "d-absoluteDashlet");

            domConstruct.place(child.domNode, zone.domNode, "last");
            var position = this.getPositionFromChild(child);
            domGeom.setMarginBox(child.domNode, { l: position.pos.l, t: position.pos.t });
        },

        onDndDrop: function (node, targetArea, indexChild) {
            if (has("mozilla"))
                node.preventCollapse = true;
            var parentDashBoard = this.getDashboard();
            var section = this.sections.firstItem();
            if (node.droppedPosition.t <= 0) node.droppedPosition.l = 0;
            var posToAdd = new DashletPosition({
                section: section.key,
                zone: section.value.zones.firstItem().key,
                pos: node.droppedPosition
            });
            var self = this;
            node.model.set("position", posToAdd);
            if (node.AvatarNode)
                parentDashBoard.createDashlet(node.model);

        },

        destroy: function () {
            this.inherited(arguments);
        },

        getLayoutRoot: function () {
            // summary:
            //     Returns container dom node of layout
            return this.containerDiv;
        },
        enableDnd: function () {
            // summary:
            //      Enable drag and drop features.
            this.dndEnabled = true;
        },
        disableDnd: function () {
            // summary:
            //      Disable drag and drop features.
            this.dndEnabled = false;
        },

        onDndCancel: function (source, nodes, copy, target) {

        },

        onDndStart: function (source, nodes, copy, target) {

        },

        postCreate: function () {
            //ResourceManager.load(require.toUrl("../resources/css/layout/absoluteLayout.css"));
            this.inherited(arguments);
            this.dndManager = jdash.layout.mDropManager();
            this.dndManager.context = this;
            this.subscribe("/dojox/mdnd/drop", "onDndDrop");
            this.subscribe("/dojox/mdnd/drag/start", "onDndStart");
            this.subscribe("/dojox/mdnd/drag/cancel", "onDndCancel");
        },


        destroyRecursive: function () {
            this.dndManager.destroy();
            this.inherited(arguments);
            //ResourceManager.unload(require.toUrl("../resources/css/layout/absoluteLayout.css"));
        },
        getType: function () {
            return "absolute";
        },



        _getDomPosition: function (node) {
            return 0;
        },

        startup: function () {
            this.inherited(arguments);
            this.enableDnd();
            this.setDimension();
        }
    });

    LayoutManager.register('absolute', absoluteLayout);
    return absoluteLayout;

});