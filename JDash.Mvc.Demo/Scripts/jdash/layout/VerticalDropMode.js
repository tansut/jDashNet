define([
	"dojo/_base/kernel",
	"dojo/_base/declare",
	"dojo/_base/array",
	"dojo/dom-geometry",
    "dojo/has"
], function (dojo, declare, array, geom, has) {
    var vdm = declare(
		"jdash.layout.VerticalDropMode",
		null,
	{
	    // summary:
	    //		Enabled a type of calcul for Dnd.
	    //		Default class to find the nearest target.

	    // _oldXPoint: Integer
	    //		used to save a X position
	    _oldXPoint: null,

	    // _oldYPoint: Integer
	    //		used to save a Y position
	    _oldYPoint: null,

	    // _oldBehaviour: String
	    //		see `getDragPoint`
	    _oldBehaviour: "up",

	    indicatorVeriticalInterval: 100,

	    constructor: function () {
	    },

	    addArea: function (/*Array*/areas, /*Object*/object) {
	        // summary:
	        //		Add a DnD Area into an array sorting by the x position.
	        // areas:
	        //		array of areas
	        // object:
	        //		data type of a DndArea
	        // returns:
	        //		a sorted area

	        //console.log("dojox.mdnd.dropMode.VerticalDropMode ::: addArea");
	        var length = areas.length;
	        var position = geom.position(object.node, true);
	        object.coords = { 'x': position.x, 'y': position.y };
	        if (length == 0) {
	            areas.push(object);
	        }
	        else {
	            var x = object.coords.x;
	            for (var i = 0; i < length; i++) {
	                if (x < areas[i].coords.x) {
	                    for (var j = length - 1; j >= i; j--)
	                        areas[j + 1] = areas[j];
	                    areas[i] = object;
	                    break;
	                }
	            }
	            if (i == length) {
	                areas.push(object);
	            }
	        }
	        return areas;	// Array
	    },

	    updateAreas: function (/*Array*/areaList) {
	        // summary:
	        //		Refresh intervals between areas to determinate the nearest area to drop an item.
	        //		Algorithm :
	        //		the marker should be the vertical line passing by the
	        //		central point between two contiguous areas.
	        //		Note:
	        //		If the page has only one targetArea, it's not necessary to calculate coords.
	        // areaList:
	        //		array of areas

	        //console.log("dojox.mdnd.dropMode.VerticalDropMode ::: initAreas");
	        var length = areaList.length;
	        if (length >= 1) {
	            var currentRight, nextLeft;
	            for (var i = 0; i < length; i++) {
	                var area = areaList[i];
	                var nextArea;
	                area.coords.x1 = -1;
	                area.coords.x2 = -1;
	                if (i == 0) {
	                    nextArea = areaList[i + 1];
	                    this._updateArea(area);
	                    if (nextArea)
	                    this._updateArea(nextArea);
	                    currentRight = area.coords.x + area.node.offsetWidth;
	                    if (nextArea) {
	                        nextLeft = nextArea.coords.x;
	                        area.coords.x2 = currentRight + (nextLeft - currentRight) / 2;
	                    }
	                }
	                else if (i == length - 1) {
	                    area.coords.x1 = areaList[i - 1].coords.x2;
	                }
	                else {
	                    nextArea = areaList[i + 1];
	                    this._updateArea(nextArea);
	                    currentRight = area.coords.x + area.node.offsetWidth;
	                    nextLeft = nextArea.coords.x;
	                    area.coords.x1 = areaList[i - 1].coords.x2;
	                    area.coords.x2 = currentRight + (nextLeft - currentRight) / 2;
	                }
	            }
	        }
	    },

	    _updateArea: function (/*Object*/area) {
	        // summary:
	        //		update the DnD area object (i.e. update coordinates of its DOM node)
	        // area:
	        //		the DnD area
	        // tags:
	        //		protected

	        //console.log("dojox.mdnd.dropMode.VerticalDropMode  ::: _updateArea");
	        try {
	            var position = geom.position(area.node, true);
	            area.coords.x = position.x;
	            area.coords.y = position.y;
	        }
	        catch (e) {
	            area.coords.x = area.node.offsetLeft;
	            area.coords.y = area.node.offsetTop;
	        }
	        area.coords.startX = area.node.offsetLeft;
	        area.coords.endX = area.node.offsetLeft + area.node.offsetWidth;
	        area.coords.startY = area.node.offsetTop;
	    },

	    initItems: function (/*Object*/area) {
	        // summary:
	        //		initialize the horizontal line in order to determinate the drop zone.
	        // area:
	        //		the DnD area

	        //console.log("dojox.mdnd.dropMode.VerticalDropMode ::: initItems");
	        array.forEach(area.items, function (obj) {
	            //get the vertical middle of the item
	            var node = obj.item.node;
	            var position = geom.position(node, true);
	            var y = position.y + position.h / 2;
	            obj.y = y;
	        });
	        area.initItems = true;
	    },

	    refreshItems: function (/*Object*/area, /*Integer*/indexItem, /*Object*/size, /*Boolean*/added) {
	        // summary:
	        //		take into account the drop indicator DOM element in order to compute horizontal lines
	        // area:
	        //		a DnD area object
	        // indexItem:
	        //		index of a draggable item
	        // size:
	        //		dropIndicator size
	        // added:
	        //		boolean to know if a dropIndicator has been added or deleted

	        //console.log("dojox.mdnd.dropMode.VerticalDropMode ::: refreshItems");
	        if (indexItem == -1) {
	            return;
	        }
	        else if (area && size && size.h) {
	            var height = size.h;
	            if (area.margin) {
	                height += area.margin.t;
	            }
	            var length = area.items.length;
	            for (var i = indexItem; i < length; i++) {
	                var item = area.items[i];
	                if (added) {
	                    item.y += height;
	                }
	                else {
	                    item.y -= height;
	                }
	            }
	        }
	    },

	    getDragPoint: function (/*Object*/coords, /*Object*/size, /*Object*/mousePosition) {
	        // summary:
	        //		return coordinates of the draggable item
	        // description:
	        //		return for:
	        //
	        //		- X point : the middle
	        //	  	- Y point : search if the user goes up or goes down with his mouse.
	        //	  	- Up : top of the draggable item
	        //	  	- Down : bottom of the draggable item
	        // coords:
	        //		an object encapsulating X and Y position
	        // size:
	        //		an object encapsulating width and height values
	        // mousePosition:
	        //		coordinates of mouse
	        // returns:
	        //		an object of coordinates
	        //		example : {'x':10,'y':10}

	        //console.log("dojox.mdnd.dropMode.VerticalDropMode ::: getDragPoint");
	        var y = coords.y;
	        if (this._oldYPoint) {
	            if (y > this._oldYPoint) {
	                this._oldBehaviour = "down";
	                y += size.h;
	            }
	            else
	                if (y <= this._oldYPoint) {
	                    this._oldBehaviour = "up";
	                }
	        }
	        this._oldYPoint = y;
	        return {
	            'x': coords.x + (size.w / 2),
	            'y': y
	        };	// Object
	    },

	    getTargetArea: function (/*Array*/areaList, /*Object*/ coords, /*integer*/currentIndexArea) {
	        // summary:
	        //		get the nearest DnD area.
	        //		Coordinates are basically provided by the ``getDragPoint`` method.
	        // areaList:
	        //		a list of DnD areas objects
	        // coords:
	        //		coordinates [x,y] of the dragItem
	        // currentIndexArea:
	        //		an index representing the active DnD area
	        // returns:
	        //		the index of the DnD area

	        //console.log("dojox.mdnd.dropMode.VerticalDropMode ::: getTargetArea");


	        if (areaList.length >= 1) {
	            var result = this._checkInterval(areaList, currentIndexArea, coords.x, coords.y)
	            this._oldXPoint = coords.x;
	            if (result)
	                return result.index;
	            else currentIndexArea;

	        }

	    },

	    _checkInterval: function (/*Array*/areaList, /*Integer*/index, /*Coord*/x, /*Coord*/y) {
	        // summary:
	        //		check if the dragNode is in the interval.
	        //		The x coordinate is basically provided by the ``getDragPoint`` method.
	        // areaList:
	        //		a list of DnD areas objects
	        // index:
	        //		index of a DnD area (to get the interval)
	        // x:
	        //		coordinate x, of the dragNode
	        // returns:
	        //		true if the dragNode is in intervall
	        // tags:
	        //		protected	        
	        if (has("touch")) {
	            y = event.pageY;
	            x = event.pageX;
	        } else {
	            if (has("ie")) {
	                y = event.y + document.documentElement.scrollTop;
	                x = event.x + document.documentElement.scrollLeft;
	            } else {
	                if (has("ff")) {
	                    y = event.clientY + window.scrollY;
	                    x = event.clientX + window.scrollX;
	                } else {
	                    y = event.y + window.scrollY;
	                    x = event.x + window.scrollX;
	                }
	            }
	        }
	        var result = {};

	        for (var i = 0; i < areaList.length; i++) {
	            var area = areaList[i]
	            var areaCoords = area.coords;
	            var areaStartY = areaCoords.startY;
	            if (result && result.top && result.top >= areaStartY) {
	                continue;
	            }
	            if (y > areaStartY) {
	                if (areaCoords.startX < x && x <= areaCoords.endX) {
	                    result["index"] = i;
	                    result["top"] = areaStartY;
	                }
	            }
	        }
	        return result;	// Boolean
	    },


	    getDropIndex: function (/*Object*/ targetArea, /*Object*/ coords) {
	        // summary:
	        //		Return the index where the drop has to be placed.
	        // targetArea:
	        //		a DnD area object
	        // coords:
	        //		coordinates [x,y] of the draggable item
	        // returns:
	        //		a number
	        //		or -1 if the area has no children or the drop index represents the last position in to the area

	        //console.log("dojox.mdnd.dropMode.VerticalDropMode ::: getDropIndex");
	        var length = targetArea.items.length;
	        var coordinates = targetArea.coords;
	        var y = coords.y;
	        var scrollY;
	        if (has("ie")) {
	            scrollY = document.documentElement.scrollTop;
	        } else {
	            scrollY = window.scrollY
	        }
	        if (length > 0) {
	            // course all children in the target area.
	            for (var i = 0; i < length; i++) {
	                // compare y value with y value of children	                
	                if (y < targetArea.items[i].y + scrollY) {
	                    return i;	// Integer
	                }
	                else {
	                    if (i == length - 1) {
	                        return -1;
	                    }
	                }
	            }
	        }
	        return -1;
	    },

	    destroy: function () {
	        //	can be overwritten.
	    }
	});

    //------------
    //Singleton
    //------------

    return vdm;
});