
define([
    "dojo/dom-construct",
        'dojo/dom-attr',
        'jdash/model/DashletModel',
        './_Layout',
        'dojo/dom-class',
        "dojo/on",
        '../ui/registry',
		"dojo/_base/lang",
		"dojo/_base/array",
        'dojo/_base/declare',
		"dojo/when",
        '../model/DashletPositionModel',
		       'dojo/dom-style',
          "dojo/has",
          "../core/DesignMode",
		  "dojo/dom-geometry",
         "dojo/_base/sniff",
		"jdash/layout/MDropManager",
        "./DropIndicator",
        "./VerticalDropMode",
        "./AutoScroll"],
function (domConstruct, domAttr, DashletModel, _Layout, domClass, on, registry, lang, array, declare, when, DashletPosition, domStyle, has, DesignMode, domGeom) {
    return declare('jdash._BaseDndLayout', [_Layout], {
        _applyZoneProps: function (zone) {
            domClass.add(zone.domNode, "gridContainerZone");
            domClass.add(zone.domNode, "dndArea");
            this.inherited(arguments);
        },


        enableDnd: function () {
            // summary:
            //      Enable drag and drop features.
            var sit = this.sections.getIterator();
            while (sit.get()) {
                var zit = sit.element.value.zones.getIterator();
                while (zit.get()) {
                    this.dndManager.registerByNode(zit.element.value.domNode);
                }
            }
            this.dndManager._dropMode.updateAreas(this.dndManager._areaList);
            this.dndEnabled = true;
        },
        disableDnd: function () {
            // summary:
            //      Disable drag and drop features.
            var sit = this.sections.getIterator();
            while (sit.get()) {
                var zit = sit.element.value.zones.getIterator();
                while (zit.get()) {
                    this.dndManager.unregister(zoneValue.value);
                    this.dndManager._dropMode.updateAreas(this.dndManager._areaList);
                }
            }
            this.dndEnabled = false;
        },

        getPredefinedLayouts: function () {
            // summary:
            //      Returns an array of predefined layout objects
            return this.inherited(arguments);
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

        setSticky: function (/*Object*/ child) {
            // summary:
            //      Set dashlet as not draggable
            // child:
            //      Dashlet object
            var sticky = child.get("sticky");
            if (typeof sticky == "undefined")
                return;
            if (sticky)
                this.dndManager.removeMoveableItem(child.domNode);
            else
                this.dndManager.addMoveableItem(child.domNode);
        },

        addChild: function (/*Object*/ child, /*Object*/ dashPos, /*Bool*/arrange) {
            // summary:
            //     Adds a new dashlet child in to layout
            // child:
            //      Dashlet object
            // dashpos:
            //      Position object
            var result = this.inherited(arguments);
            var self = this;
            this.setSticky(child);
            this.own(child.watch("sticky", function () {
                self.setSticky(child);
            }));
            return result;
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

        postCreate: function () {
            this.inherited(arguments);
            this.dndManager = new jdash.layout.MDropManager();;
            this.dndManager.context = this;
            this.subscribe("/dojox/mdnd/drop", "onDndDrop");
            this.subscribe("/dojox/mdnd/drag/start", "onDndStart");
            this.subscribe("/dojox/mdnd/drag/cancel", "onDndCancel");
        },
        onDndCancel: function (source, nodes, copy, target) {

        },

        onDndStart: function (source, nodes, copy, target) {
            var self = this;
            domClass.add(source.parentNode, self.getDashboard().baseClass);

            document.body.style.cursor = 'move';

        },

        _adjustZoneWidthHeight: function (section) {
        },

        _adjustSectionHeight: function () {
            var sid = this.sections.getIterator();
            while (sid.get()) {
                var childs = this.getChildren(sid.element.key)
                if (childs.length > 0) {
                    domStyle.set(sid.element.value.domNode, "height", '');
                }
                else {
                    domStyle.set(sid.element.value.domNode, "height", '200px');
                }
                this._adjustZoneWidthHeight(sid.element);
            }
        },

        _getDomPosition: function (node) {

        },




        _removeDragAvatar: function (node, targetArea, indexChild) {

            this.dndManager.removeMoveableItem(targetArea.node, node);
            this.dndManager.removeDragItem(targetArea.node, node);
            if (node.initialStyle == null)
                domAttr.set(node, "style", "");
            else
                node.style = node.initialStyle;
            this.dndManager.addDragItem(node.sourceNode, node, node.menuIndex + "", true);

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
            moduleNode.containerNode = modulesNode;
            if (moduleNode.module)
                dragNode.module = moduleNode.module;
            else dragNode.moduleId = moduleNode.moduleId;
            modulesNode.isModulesContainer = true;
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
            var self = this;

            if (dragNode.__clickHandler)
                dragNode.__clickHandler.remove();

            dragNode.__clickHandler = on(dragNode, "click", function (event) {
                //if (has("mozilla") && event && event.__cancelClick)
                //    return;
                if (self.__lastDropHandled) {
                    delete self.__lastDropHandled;
                    return;
                }
                var parentDashBoard = self.getDashboard();
                dragNode.model.set("position", undefined);
                parentDashBoard.createDashlet(dragNode.model);
            })
        },

        registerModuleNode: function (moduleNodes) {
            var self = this;
            if (lang.isArray(moduleNodes)) {

                array.forEach(moduleNodes, function (item, i) {
                    self._registerModuleNode(item);
                });
            } else this._registerModuleNode(moduleNodes);
        },

        unRegisterModuleNode: function (modulesNode) {
            this.dndManager.unregister(modulesNode.containerNode);
            modulesNode.containerNode.isDNDRegistered = false;
        },

        initilizeModuleNodes: function (moduleNodes) {
            if (this.dndManager == null) return;
            for (var i = 0; i < moduleNodes.length; i++) {
                this._registerModuleNode(moduleNodes[i]);
            }
        },

        calculateNewPositions: function (node, targetArea, indexChild) {
            if (node.AvatarNode) {

                var parentDashBoard = this.getDashboard();

                if (!parentDashBoard._hasDesignMode(DesignMode.dashboard)) {
                    this._removeDragAvatar(node, targetArea, indexChild);
                    return;
                }

                if (targetArea.node.isDNDRegistered) {
                    this._removeDragAvatar(node, targetArea, indexChild);
                    return;
                }
                var pos = this._getDomPosition(node);

                var dashPos = this.getLayoutInfo(targetArea.node);

                var posToAdd = new DashletPosition({
                    section: dashPos.section,
                    zone: dashPos.zone,
                    pos: pos
                });

                node.model.set("position", posToAdd);
                node.model.preventAddFirst = true;
                parentDashBoard.createDashlet(node.model);
                var widget = registry.getEnclosingWidget(node);
                var newWidgetPos = [];
                var sourceChilds = this.getChildren(posToAdd.section, posToAdd.zone);

                for (var i = 0; i < sourceChilds.length; i++) {

                    if (sourceChilds[i] != widget) {
                        var dashPos = this.getPositionFromChild(sourceChilds[i]);
                        if (dashPos.pos >= pos) {
                            dashPos.set("pos", (dashPos.pos + 1));
                            newWidgetPos.push({
                                id: sourceChilds[i].context.id,
                                position: this.serializedDashletPos(dashPos)
                            });
                        }
                    }
                }               
                this._removeDragAvatar(node, targetArea, indexChild);

            } else {
                var widget = registry.getEnclosingWidget(node);

                var sourcePosition = this.getPositionFromChild(widget);
                var targetPosition = this.getLayoutInfo(targetArea.node);
                var newPos = this._getDomPosition(node);
                if (sourcePosition.section != targetPosition.section || sourcePosition.zone != targetPosition.zone || sourcePosition.pos != newPos) {
                    var decPos = [];
                    var incPos = [];
                    targetPosition = new DashletPosition({
                        section: targetPosition.section,
                        zone: targetPosition.zone,
                        pos: newPos
                    });
                    var sourceChilds = this.getChildren(sourcePosition.section, sourcePosition.zone);
                    if (sourcePosition.section == targetPosition.section && sourcePosition.zone == targetPosition.zone) {
                        decPos = this._decrementChildPosOnDrop(sourceChilds, sourcePosition, targetPosition, widget);
                        incPos = this._incrementChildPosOnDrop(sourceChilds, sourcePosition, targetPosition, widget);
                    } else {
                        var targetChilds = this.getChildren(targetPosition.section, targetPosition.zone);
                        decPos = this._decrementChildPosOnDrop(sourceChilds, sourcePosition, targetPosition, widget);
                        incPos = this._incrementChildPosOnDrop(targetChilds, sourcePosition, targetPosition, widget);
                    }
                    this.updateChildPosition(widget, targetPosition);
                    decPos = decPos.concat(incPos);
                    decPos.push({
                        id: widget.context.id,
                        position: this.serializedDashletPos(targetPosition)
                    });
                    this.getDashboard().provider.updateDashletPositions(decPos);
                }
            }
            this._adjustSectionHeight();
            return false;
        },
        onDndDrop: function (node, targetArea, indexChild) {
            if (has("mozilla")) {
                node.preventCollapse = true;
                if (window.event) {
                    window.event.cancelBubble = true;
                    window.event.__cancelClick = true;
                }
            }
            this.__lastDropHandled = true;
            return this.calculateNewPositions(node, targetArea, indexChild);
        },

        removeDashlet: function (/*Object*/dashlet) {
            // summary:
            //     Removes dashlet object
            // dashlet:
            //      Dashlet object
            domStyle.set(dashlet.domNode, "display", "none");
            var deleteResult = this.getDashboard().provider.deleteDashlet(dashlet.context.id);
            var self = this;
            return when(deleteResult, function () {
                var info = self.getPositionInfo(dashlet.context.model.position);
                var refPos = info.dashPos.pos;
                var children = self.getChildrenByNode(info.zone.domNode);
                var updatedPositions = self._decrementChildPosOnDrop(children, info.dashPos);
                self.dndManager.removeDragItem(info.zone.domNode, dashlet.domNode, true);
                var maxNode = self.getMaximizeRoot();
                if (maxNode && dashlet.context.paneConfig.visualState == "maximize") {
                    domStyle.set(self.getLayoutRoot(), "display", "");
                    domStyle.set(maxNode, "display", "none");
                }
                if (self.getChildren().length == 0) {
                    var section = self.sections.item(self.getPositionFromChild(dashlet).section)
                    self._adjustSectionHeight(section);
                }
                if (updatedPositions.length > 0)
                    return self.getDashboard().provider.updateDashletPositions(updatedPositions);
                else return deleteResult;
            }, function (err) {
                domStyle.set(dashlet.domNode, "display", "");
            });

        },

        fixPositions: function (position) {
            var self = this;
            var children = this.getChildren(position.section, position.zone);
            var updatedPositions = [];
            for (var i =0; i < children.length; i++) {

                var dashPos = this.getPositionFromChild(children[i]);
                if (dashPos.pos != null && dashPos.pos >= position.pos) {
                    dashPos.set("pos", (dashPos.pos + 1));
                    updatedPositions.push({
                        id: children[i].context.id,
                        position: self.serializedDashletPos(dashPos)
                    });
                }
            }
            return updatedPositions;            
        },

        maximizeDashlet: function (/*Object*/dashlet) {
            // summary:
            //     Maximizes a dashlet node.
            // dashlet:
            //      Dashlet object
            var height = dashlet.domNode.offsetHeight;
            var node = this.getLayoutRoot();
            var maxNode = this.getMaximizeRoot();
            if (maxNode) {
                var info = this.getPositionInfo(dashlet.context.model.position);
                this.dndManager.removeDragItem(info.zone.domNode, dashlet.domNode);
                domConstruct.place(dashlet.domNode, maxNode, 0);                
                domStyle.set(node, "display", "none");
                domStyle.set(maxNode, "display", "block");
            }

        },

        minimizeDashlet: function (/*Object*/dashlet) {
            // summary:
            //     Minimizes a dashlet node.
            // dashlet:
            //      Dashlet object
            var node = this.getLayoutRoot();
            var maxNode = this.getMaximizeRoot();
            if (maxNode) {
                var info = this.getPositionInfo(dashlet.context.model.position);
                dashlet.domNode.parentNode.removeChild(dashlet.domNode);
                this.dndManager.addDragItem(info.zone.domNode, dashlet.domNode, dashlet.context.model.position.pos);
                domStyle.set(node, "display", "");
                domStyle.set(dashlet.containerNode, "height", "auto");
                domStyle.set(maxNode, "display", "none");
            }
        },


        removeModuleNode: function (node) {
            var modules = this.getDashboard().getModuleNodes();
            for (var i = 0; i < modules.length; i++) {
                if (modules[i].node == node) {
                    this.dndManager.removeMoveableItem(node);
                    modules.splice(i, 1);
                    break;
                }
            }
        },

        destroyRecursive: function () {
            // summary:
            //      Destroys dashboard context.            
            this.inherited(arguments);
            this.dndManager.destroy();

        },

        removeAllModuleNodes: function () {
            var modules = this.getDashboard().getModuleNodes();
            for (var i = 0; i < modules.length; i++) {
                this.dndManager.removeMoveableItem(node);
                modules.splice(i, 1);
            }
        },
        getPositionInfo: function (/*Object */dashPos) {
            // summary:
            //     Returns a layout position object from dashlet position model
            // dashpos:
            //      dashlet position model object
            var positionInfo = this.inherited(arguments);

            return positionInfo;
        },
        getType: function () {

        },
        startup: function () {
            this.inherited(arguments);
            this.enableDnd();
        }
    });
});