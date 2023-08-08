
define(['require',
        'dojo/_base/declare',
        'dojo/_base/lang',
        '../ui/_WidgetBase',
        '../ui/_TemplatedMixin',
        './_LayoutWidget',
        'dojo/query',
        'dojo/_base/array',
        'dojo/dom-attr',
        'dojo/dom-construct',
        'dojo/dom-style',
        'dojo/dom-class',
        '../ui/registry',
        '../model/DashletPositionModel',
        'dojo/json',
        'dojo/Deferred',
        'dojo/on',
        'dojo/topic',
        './Section',
        './Zone',
        'klt/core/Dictionary',
        "klt/core/messageBus",
                'jdash/model/DashletModel',
"dojo/when",
"dojo/dom-geometry",
"jdash/ui/ThemeManager"],
function (require, declare, lang, _WidgetBase, _TemplatedMixin, _LayoutWidget, query, array, domAttr, domConstruct, domStyle, domClass,
    registry, DashletPosition, Json, Deferred, on, topic, Section, Zone,
    Dictionary, bus, DashletModel, when, domGeom, ResourceManager) {
    var layoutClass = declare('jdash._Layout', [_LayoutWidget], {

        sectionTag: 'div',

        zoneTag: 'div',


        publish: function (topic, event) {
            return bus.publish(topic, event);
        },

        _publishForLayout: function (topic, args) {
            var event = { sender: this, args: args || {} };
            return this.publish("jdash/layout/" + topic, event);
        },

        subscribeToLayout: function (topic, fn) {
            return this.subscribe("jdash/layout/" + topic, fn);
        },

        setSticky: function (/*Object*/child) {
            // summary:
            //      Set dashlet as not draggable
            // child:
            //      Dashlet object

        },

        constructor: function () {

        },

        removeDashlet: function (/* Object */ dashlet) {
            // summary:
            //     Removes dashlet object
            // dashlet:
            //      Dashlet object
            var deleteResult = this.getDashboard().provider.deleteDashlet(dashlet.context.id);
            var self = this;
            return when(deleteResult, function () {
                domConstruct.destroy(dashlet.domNode);
                self._adjustSectionHeight();
            });
        },

        maximizeDashlet: function (/* Object */ dashlet) {
            // summary:
            //     Maximizes a dashlet node.
            // dashlet:
            //      Dashlet object
            var node = this.getLayoutRoot();
            var rootGeom = domGeom.getMarginBox(node);
            domStyle.set(dashlet.containerNode, "height", rootGeom.h + "px");
            domStyle.set(dashlet.domNode, "width", rootGeom.w + "px");
            domStyle.set(dashlet.domNode, "zIndex", 999999);


        },

        minimizeDashlet: function (/* Object */ dashlet) {
            // summary:
            //     Minimizes a dashlet node.
            // dashlet:
            //      Dashlet object
            domStyle.set(dashlet.containerNode, "height", "auto");
            domStyle.set(dashlet.domNode, "width", "auto");
            domStyle.set(dashlet.domNode, "zIndex", "");
        },



        getLayoutRoot: function () {
            // summary:
            //     Returns container dom node of layout
            return this.containerNode;
        },

        getMaximizeRoot: function () {
            // summary:
            //     Returns maximization dom node
            return this.maximizeNode;
        },


        getDashboard: function () {
            // summary:
            //     Returns dashboard object of layout
            return this.dashboardView;
        },
        getSectionByZoneId: function (/* String */ _zoneId) {
            // summary:
            //     Returns section id  by specific zone id
            // _zoneId:
            //      Zone id.
            var sectionId = null, zoneId = null;
            var sit = this.sections.getIterator();
            while (sit.get()) {
                var zit = sit.element.value.zones.getIterator();
                while (zit.get()) {
                    if (zit.element.key == _zoneId)
                        return sit.element.key;
                }
            }
            return null;
        },
        getLayoutInfo: function (/* Object */ dom) {
            // summary:
            //     Returns section and zone information.
            // dom:
            //      Dom node object of zone
            var sectionId = null, zoneId = null;
            var sit = this.sections.getIterator();
            while (sit.get()) {
                var zit = sit.element.value.zones.getIterator();
                while (zit.get()) {
                    if (zit.element.value.domNode == dom)
                        return {
                            section: sit.element.key,
                            zone: zit.element.key
                        };
                }
            }
            return null;
        },

        _getChildNewPredefinedPosition: function (newLayout, child, positionList) {

            var layout = Object.keys(newLayout.sections);
            var chilPos = child.context.model.position
            var sit = this.sections.getIterator();
            var secIndex = 0, zoneIndex = 0, finded;
            while (sit.get()) {
                var zit = sit.element.value.zones.getIterator();
                if (sit.element.key == chilPos.section) {
                    while (zit.get()) {
                        if (zit.element.key == chilPos.zone) {
                            finded = true;
                            break;
                        }
                        zoneIndex++;
                    }
                }
                if (finded) break;
                secIndex++;
            }

            pos = chilPos.pos;
            if (layout.length > secIndex) {
                sectionKey = layout[secIndex];
                section = newLayout.sections[sectionKey];
            } else {
                sectionKey = layout[layout.length - 1];
                section = newLayout.sections[sectionKey];
            }
            zone = Object.keys(section.zones);
            if (zone.length > zoneIndex) {
                zone = zone[zoneIndex];
            } else {
                zone = zone[zone.length - 1];
            }
            var section, sectionKey, zone, pos;
            if (positionList[sectionKey] && positionList[sectionKey][zone] && positionList[sectionKey][zone].count)
                pos = positionList[sectionKey][zone].count
            else pos = 0;
            return new DashletPosition({ section: sectionKey, zone: zone, pos: pos });
        },

        getChildrenByNode: function (/* Object */ node) {
            // summary:
            //     Returns dashlets object by zone dom node.
            // dom:
            //      Dom node object
            return registry.findWidgets(node);
        },

        getChildren: function (/* String */ sectionId, /* String */ zoneId) {
            // summary:
            //     Returns an array of dashlet objects by specific zone id and section id.

            var node = this.containerNode;
            if (sectionId) {
                if (zoneId)
                    node = this.sections.item(sectionId).zones.item(zoneId).domNode;
                else node = this.sections.item(sectionId).domNode;
            }
            return this.getChildrenByNode(node);
        },

        getAllChildrenOnBody: function () {
            // summary:
            //     Returns an array of dashlet objects in html body element
            return this.getChildrenByNode(window.document.body);
        },

        getDefaultLayout: function () {
            // summary:
            //     Returns a layout preset
        },

        _createSectionDom: function (section) {
            var parent = this.getLayoutRoot();
            return domConstruct.create(this.sectionTag, {
            }, parent);
        },

        _createZoneDom: function (zone) {
            var parent = zone._parentSection.domNode;
            var node = domConstruct.create(this.zoneTag, {}, parent);
            node.zoneId = zone.zoneId;
            return node;
        },

        _applySectionProps: function (section) {

        },

        _applyZoneProps: function (zone) {
        },






        getElementsByClassName: function (className, TagName) {
            var re = new RegExp('\\b' + className + '\\b');
            var els = document.getElementsByTagName(TagName);
            for (var i = 0, j = els.length; i < j; i++) {
                if (re.test(els[i].className))
                    return els[i];
            }
        },

        _createDashletModel: function (node) {
            if (node.module)
                return new DashletModel({
                    module: node.module
                });
            else 
                return new DashletModel({
                    moduleId: node.moduleId
                });
        },

        _renderZone: function (zone) {
            zone.set('domNode', this._createZoneDom(zone));
            this._applyZoneProps(zone);
        },

        _renderSection: function (section) {
            section.set('domNode', this._createSectionDom(section));
            this._applySectionProps(section);
            var it = section.zones.getIterator();
            while (it.get()) {
                it.element.value.zoneId = it.element.key;
                this._renderZone(it.element.value);
            }
        },
        initilizeModuleNodes: function (moduleNodes) {
        },

        registerModuleNode: function (moduleNodes) {

        },

        unRegisterModuleNode: function (moduleNodes) {

        },
        postscript: function (args) {
            var dashboardView = args.dashboardView;
            delete args.dashboardView;
            var clone = lang.clone(args || {});
            clone.sections = this._createInitialLayout(clone.sections);
            clone.dashboardView = dashboardView;
            this.inherited(arguments, [clone]);
        },

        _generateSectionId: function () {
            var i = 0;
            while (this.sections.contains('s' + i)) { i++ };
            return 's' + i;
        },

        _generateZoneId: function (section) {
            var i = 0;
            while (section.zones.contains('z' + i)) { i++ };
            return 'z' + i;
        },

        newSectionTemplate: function () {
            if (this.sections.count > 0)
                return this.sections.firstValue().clone();
            return {
                Key: this._generateSectionId(),
                Value: {
                    zones: [{ Key: 'default', Value: {} }]
                }
            }

        },

        newZoneTemplate: function (section) {
            section = section || this.sections.firstValue();
            if (section) {
                return section.zones.firstValue().clone();
            }
            return {
                Key: 'default',
                Value: {

                }
            }
        },

        addSection: function (/* String */ id,/* Object */ data) {
            // summary:
            //      Adds a new section in layout.
            // id:
            //      Id of new section object
            // data:
            //      section template data
            if (id == null)
                id = this._generateSectionId();

            if (this.sections.contains(id))
                throw new Error(id + ' section already exists');

            if (!data)
                data = this.newSectionTemplate();
            var section = this._createSection(data);
            this.sections.add(id, section);
            this._renderSection(section);
            this.getDashboard().model.set("layout", this.serialized());
            return {
                id: id,
                section: section
            };
        },

        addZone: function (/* Object */ section, /* String */ zoneId, /* Object */ data) {
            // summary:
            //      Adds a new zone in section.
            // section:
            //      Section object
            // zoneId:
            //      Id of new zone object
            // data:
            //      Zone template data
            if (zoneId == null)
                zoneId = this._generateZoneId(section);
            if (!data)
                data = this.newZoneTemplate(section);
            var sit = this.sections.getIterator();
            var zone;
            while (sit.get()) {
                if (sit.element.value == section) {
                    zone = sit.element.value.addZone(zoneId, data);
                    break;
                }
            }
            if (zone) {
                this.getDashboard().model.set("layout", this.serialized());
                this._renderZone(zone);
                return {
                    id: zoneId,
                    zone: zone
                };
            }
        },

        removeZone: function (/* Object */  zone) {
            // summary:
            //      Removes a zone and its children
            // zone:
            //      Zone object
            var self = this;
            var sit = this.sections.getIterator();
            var section = null;
            var zoneCount = 0;
            var newChildPos = [];
            while (sit.get()) {
                zit = sit.element.value.zones.getIterator();
                if (lang.isString(zone)) zone = sit.element.value.zones.item(zone);
                if (!zone) continue;
                while (zit.get()) {
                    if (zit.element.value == zone) {
                        section = sit.element;
                        break;
                    }
                    zoneCount++;
                }
                if (section) break;
                zoneCount = 0;
            }

            if (sit.element.value.zones.count < 2) {
                return;
            }
            var zones = section.value.zones.getKeyList();
            var oldZone = zones[zoneCount];
            zones.splice(zoneCount, 1);
            zoneCount = zones.length - 1;
            var children = this.getChildrenByNode(zone.domNode);
            array.forEach(children, function (child) {
                var childPosition = self.getPositionFromChild(child);
                var newPos = new DashletPosition({ section: section.key, zone: zones[zoneCount], pos: children.length });
                newChildPos.push({
                    id: child.context.id,
                    position: self.serializedDashletPos(newPos)
                });
                self.updateChildPosition(child, newPos);
                domConstruct.place(child.domNode, section.value.zones.item(zones[zoneCount]).domNode, children.length);
            });
            if (newChildPos.length > 0)
                this.getDashboard().provider.updateDashletPositions(newChildPos);
            domConstruct.destroy(zone.domNode);
            section.value.zones.remove(oldZone);
            this.getDashboard().model.layout = this.serialized();
            this.getDashboard().save();
            this._adjustSectionHeight();
        },


        removeSection: function (/* Object | String */ section) {
            // summary:
            //      Removes a section and its children
            // section:
            //      Section object
            if (lang.isString(section)) section = this.sections.item(section);
            if (!section) return;
            var self = this;
            var sections = this.sections.getKeyList();
            var newChildPos = [];
            if (sections.length > 1) {
                var sit = this.sections.getIterator();
                var sectionIndex = 0
                var sectionChilds = [];
                var zone;
                while (sit.get()) {
                    if (sit.element.value == section) {
                        zit = sit.element.value.zones.getIterator();
                        while (zit.get()) {
                            sectionChilds = sectionChilds.concat(this.getChildrenByNode(zit.element.value.domNode));
                        }
                        break;
                    }
                    sectionIndex++;
                }
                var oldSection = this.sections.item(sections[sectionIndex]);
                var oldSectionZones = oldSection.zones.getKeyList();
                var newSectionKey = sections[sectionIndex - 1] ? sections[sectionIndex - 1] : sections[sectionIndex + 1];
                var newSection = this.sections.item(newSectionKey);
                var newSectionZones = newSection.zones.getKeyList();
                var newSectionZone;
                array.forEach(sectionChilds, function (child) {
                    var childPosition = self.getPositionFromChild(child);
                    var zoneIndex = array.indexOf(oldSectionZones, childPosition.zone);
                    var newSectionZoneIndex;
                    if (newSectionZones.length > zoneIndex)
                        newSectionZoneIndex = zoneIndex;
                    else newSectionZoneIndex = newSectionZones.length - 1;
                    newSectionZone = newSection.zones.item(newSectionZones[newSectionZoneIndex]);
                    var childCount = self.getChildrenByNode(newSectionZone.domNode).length;
                    var newPos = new DashletPosition({ section: newSectionKey, zone: newSectionZones[newSectionZoneIndex], pos: childCount });
                    newChildPos.push({
                        id: child.context.id,
                        position: self.serializedDashletPos(newPos)
                    });
                    self.updateChildPosition(child, newPos);
                    domConstruct.place(child.domNode, newSectionZone.domNode, childCount);
                });
                if (newChildPos.length > 0)
                    this.getDashboard().provider.updateDashletPositions(newChildPos);
                domConstruct.destroy(section.domNode);
                this.sections.remove(sections[sectionIndex]);
                this.getDashboard().model.layout = this.serialized();
                this.getDashboard().save();
                this._adjustSectionHeight();
            }
        },




        getPredefinedLayouts: function () {
            // summary:
            //      Returns an array of predefined layout objects
            layoutClass.prototype.getPredefinedLayouts.apply(this);
        },



        _createSection: function (data) {
            var sectionData =
                {
                    _parentLayout: this
                };
            lang.mixin(sectionData, data);
            var section = new Section(sectionData);
            return section;
        },

        _sortInitialDashlets: function (dashlets) {
            var self = this;
            return dashlets.sort(function (first, second) {
                return (parseInt(self.deSerializedDashletPos(first.position).pos) - parseInt(self.deSerializedDashletPos(second.position).pos));
            });
        },

        _createInitialLayout: function (sections) {
            if (!sections)
                sections = this.getDefaultLayout();
            var dict = new Dictionary();
            dict.load(sections, this._createSection, this);
            return dict;
        },

        serializedDashletPos: function (pos) {
            return pos.serialized();
        },

        deSerializedDashletPos: function (pos) {
            return pos;
        },

        destroyRecursive: function () {
            var sit = this.sections.getIterator();
            while (sit.get()) {
                var zit = sit.element.value.zones.getIterator();
                while (zit.get()) {
                    domConstruct.destroy(zit.element.value.domNode);
                }
                domConstruct.destroy(sit.element.value.domNode);
            }
            domConstruct.destroy(this.domNode);
            this.inherited(arguments);
            //ResourceManager.unload(require.toUrl("../resources/css/layout/predefinedLayout.css"));
        },

        getPositionInfo: function (/*Object */dashPos) {
            // summary:
            //     Returns a layout position object from dashlet position model
            // dashpos:
            //      dashlet position model object
            var dashPos = dashPos;

            if (lang.isString(dashPos))
                dashPos = this.deSerializedDashletPos(dashPos);

            if (typeof dashPos == "undefined")
                dashPos = new DashletPosition();
            else if (!(dashPos instanceof DashletPosition))
                dashPos = new DashletPosition(dashPos);

            if (typeof (dashPos.get('section')) == 'undefined')
                dashPos.set('section', this.sections.firstKey());

            if (typeof (dashPos.get('zone')) == 'undefined') {
                var section = this.sections.item(dashPos.get('section'));
                dashPos.set('zone', section.zones.firstKey());
            }
            var section = this.sections.item(dashPos.get('section'));

            if (!section)
                section = this.sections.firstValue();

            var zone = section.zones.item(dashPos.get('zone'));

            if (!zone)
                zone = section.zones.firstKey();

            return {
                zone: zone,
                dashPos: dashPos
            }
        },
        fixPositions: function (position) { },

        getType: function () {

        },

        serialized: function () {
            var res = {};
            lang.mixin(res, {
                type: this.getType(),
                sections: this.sections.serialized()
            });

            return res;
        },

        _adjustSectionHeight: function () {


        },
        _adjustZoneWidthHeight: function (section) {

        },

        getPositionFromChild: function (/*Object*/ child) {
            // summary:
            //     Returns position model of a dashlet
            // child:
            //      Dashlet object
            return child.context.model.get("position");
        },

        updateChildPosition: function (/*Object*/child,/*Object*/ dashpos) {
            // summary:
            //     Changes position property of a dashlet
            // child:
            //      Dashlet object
            // dashpos:
            //      Position object
            return child.context.model.position.assignNew(dashpos);
        },

        _positionChild: function (child, arrange, updatePositionModel) {

        },





        _arrangePositions: function (newChild, children, state) {
            var start = false;
            var newWidgetPos = [];
            array.forEach(children, function (child) {
                if (newChild != child) {
                    var dashPos = this.getPositionFromChild(child);
                    dashPos.set('pos', dashPos.get('pos') + 1);
                    newWidgetPos.push({
                        id: child.context.id,
                        position: this.serializedDashletPos(dashPos)
                    });
                }
            }, this);
            return newWidgetPos;
        },

        _incrementChildPosOnDrop: function (childs, sourcePosition, targetPosition, currentChild) {
            var newWidgetPos = [];
            if (sourcePosition.section == targetPosition.section && sourcePosition.zone == targetPosition.zone) {
                if (sourcePosition.pos > targetPosition.pos) {
                    for (var i = 0; i < childs.length; i++) {
                        var dashPos = this.getPositionFromChild(childs[i]);
                        if (childs[i] != currentChild && targetPosition.pos <= dashPos.pos && sourcePosition.pos > dashPos.pos) {
                            dashPos.set("pos", (dashPos.pos + 1));
                            newWidgetPos.push({
                                id: childs[i].context.id,
                                position: this.serializedDashletPos(dashPos)
                            });
                        }
                    }
                }
            } else {
                for (var i = 0; i < childs.length; i++) {
                    var dashPos = this.getPositionFromChild(childs[i]);
                    if (childs[i] != currentChild && targetPosition.pos <= dashPos.pos) {
                        dashPos.set("pos", (dashPos.pos + 1));
                        newWidgetPos.push({
                            id: childs[i].context.id,
                            position: this.serializedDashletPos(dashPos)
                        });
                    }
                }
            }
            return newWidgetPos;
        },

        _decrementChildPosOnDrop: function (childs, sourcePosition, targetPosition, currentChild) {
            var newWidgetPos = [];
            if (targetPosition && sourcePosition.section == targetPosition.section && sourcePosition.zone == targetPosition.zone) {
                if (sourcePosition.pos < targetPosition.pos) {
                    for (var i = 0; i < childs.length; i++) {
                        var dashPos = this.getPositionFromChild(childs[i]);

                        if (childs[i] != currentChild && targetPosition.pos >= dashPos.pos && sourcePosition.pos < dashPos.pos) {
                            dashPos.set("pos", (dashPos.pos - 1));
                            newWidgetPos.push({
                                id: childs[i].context.id,
                                position: this.serializedDashletPos(dashPos)
                            });
                        }
                    }
                }
            } else {
                for (var i = 0; i < childs.length; i++) {
                    var dashPos = this.getPositionFromChild(childs[i]);

                    if (childs[i] != currentChild && sourcePosition.pos < dashPos.pos) {
                        dashPos.set("pos", (dashPos.pos - 1));
                        newWidgetPos.push({
                            id: childs[i].context.id,
                            position: this.serializedDashletPos(dashPos)
                        });
                    }
                }

            }
            return newWidgetPos;
        },


        addChild: function (/*Object*/ child,/*Object*/ dashPos,/*Boolean*/ arrange) {
            // summary:
            //     Adds a new dashlet child in to layout
            // child:
            //      Dashlet object
            // dashpos:
            //      Position object
            try {
                jdash._Layout.superclass.addChild.call(this, child);
                //console.log("pane " + child.context.model.title + " added to layout");
                child._addedToLayout = this;
            } catch (e) {
                throw e;
            } finally {
                var positionUpdated = false;
                if (dashPos) {
                    if (!(dashPos instanceof DashletPosition))
                        dashPos = new DashletPosition(dashPos);
                    this.updateChildPosition(child, dashPos);
                    positionUpdated = true;
                }
                if (this._inited) {
                    this._positionChild(child, arrange, positionUpdated);
                    //console.log("pane " + child.context.model.title + " positioned");
                }
                else alert("Layout is not inited");

                this._adjustSectionHeight();
            }

            return null;
        },

        _layoutWidgets: function (children) {
            array.forEach(children, function (child) {
                this._positionChild(child);
            }, this);
        },

        render: function () {
            this.renderSections();
        },

        renderSections: function () {
            var it = this.sections.getIterator();
            while (it.get()) {
                this._renderSection(it.element.value);
            }
        },

        buildRendering: function() {            
            this.inherited(arguments);
        },

        postCreate: function () {
            
            this.inherited(arguments);
            this.render();

        },

        clone: function () {
            return lang.clone(this.serialized());
        },

        startup: function () {
            this._inited = true;
            var children = this.getChildren();
            this._layoutWidgets(children);
            this.inherited(arguments);
            if (children.length == 0)
                this._adjustSectionHeight();
        }
    });

    layoutClass.prototype.getPredefinedLayouts = function () {
        // summary:
        //      Returns an array of predefined layout objects
        var predefLayouts = {};
        lang.mixin(predefLayouts, { "1": { sections: { "section1": { "zones": { "zone1": {} } } } }});
        lang.mixin(predefLayouts, { "2": { sections: { "section1": { "zones": { "zone1": { "title": null, "style": null, "cls": null, "attr": null }, "zone2": { "title": null, "style": null, "cls": null, "attr": null } }, "style": null, "cls": null, "attr": null } } }});
        lang.mixin(predefLayouts, { "3": { sections: { "section1": { "zones": { "zone1": {}, "zone2": {}, "zone3": {} } } } }});
        lang.mixin(predefLayouts, { "4": { sections: { "section1": { "zones": { "zone1": { flex: 2 }, "zone2": {} } } } }});
        lang.mixin(predefLayouts, { "5": { sections: { "section1": { "zones": { "zone1": {}, "zone2": { flex: 2 } } } } }});
        lang.mixin(predefLayouts, { "6": { sections: { "section1": { "zones": { "zone1": {}, "zone2": {}, "zone3": {}, "zone4": {} } } } }});

        lang.mixin(predefLayouts, { "7": { sections: { "section1": { "zones": { "zone1": {} } }, "section2": { "zones": { "zone1": {}, "zone2": {} } } } }});
        lang.mixin(predefLayouts, { "8": { sections: { "section1": { "zones": { "zone1": {} } }, "section2": { "zones": { "zone1": {}, "zone2": {}, "zone3": {} } } } }});
        lang.mixin(predefLayouts, { "9": { sections: { "section1": { "zones": { "zone1": {} } }, "section2": { "zones": { "zone1": { flex: 2 }, "zone2": {} } } } }});
        lang.mixin(predefLayouts, { "10": { sections: { "section1": { "zones": { "zone1": {} } }, "section2": { "zones": { "zone1": {}, "zone2": { flex: 2 } } } } }});
        lang.mixin(predefLayouts, { "11": { sections: { "section1": { "zones": { "zone1": {} } }, "section2": { "zones": { "zone1": {}, "zone2": {}, "zone3": {}, "zone4": {} } } } }});

        lang.mixin(predefLayouts, { "12": { sections: { "section1": { "zones": { "zone1": {}, "zone2": {} } }, "section2": { "zones": { "zone1": {} } } } }});
        lang.mixin(predefLayouts, { "13": { sections: { "section1": { "zones": { "zone1": {}, "zone2": {}, "zone3": {} } }, "section2": { "zones": { "zone1": {} } } } }});
        lang.mixin(predefLayouts, { "14": { sections: { "section1": { "zones": { "zone1": { flex: 2 }, "zone2": {} } }, "section2": { "zones": { "zone1": {} } } } }});
        lang.mixin(predefLayouts, { "15": { sections: { "section1": { "zones": { "zone1": {}, "zone2": { flex: 2 } } }, "section2": { "zones": { "zone1": {} } } } }});
        lang.mixin(predefLayouts, { "16": { sections: { "section1": { "zones": { "zone1": {}, "zone2": {}, "zone3": {}, "zone4": {} } }, "section2": { "zones": { "zone1": {} } } } }});

        lang.mixin(predefLayouts, { "17": { sections: { "section1": { "zones": { "zone1": {} } }, "section2": { "zones": { "zone1": {}, "zone2": {} } }, "section3": { "zones": { "zone1": {} } } } }});
        lang.mixin(predefLayouts, { "18": { sections: { "section1": { "zones": { "zone1": {} } }, "section2": { "zones": { "zone1": {}, "zone2": {}, "zone3": {} } }, "section3": { "zones": { "zone1": {} } } } }});
        lang.mixin(predefLayouts, { "19": { sections: { "section1": { "zones": { "zone1": {} } }, "section2": { "zones": { "zone1": { flex: 2 }, "zone2": {} } }, "section3": { "zones": { "zone1": {} } } } }});
        lang.mixin(predefLayouts, { "20": { sections: { "section1": { "zones": { "zone1": {} } }, "section2": { "zones": { "zone1": {}, "zone2": { flex: 2 } } }, "section3": { "zones": { "zone1": {} } } } }});
        lang.mixin(predefLayouts, { "21": { sections: { "section1": { "zones": { "zone1": {} } }, "section2": { "zones": { "zone1": {}, "zone2": {}, "zone3": {}, "zone4": {} } }, "section3": { "zones": { "zone1": {} } } } }});

        return predefLayouts;
    }


    ResourceManager.registerInitResource(require.toUrl("../resources/css/layout/builtin.css"));

    return layoutClass;
});
