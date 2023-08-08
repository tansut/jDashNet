define(['dojo/_base/declare',
		'dojo/_base/lang',
        './ModelBase'
],
function (declare, lang, ModelBase) {
    return declare('jdash.model.DashletPositionModel', [ModelBase], {

        isEmpty: function () {
            return typeof this.section == 'undefined';
        },

        toString: function () {
            if (this.isEmpty())
                return "[Empty]";
            else return this.section + "," + this.zone + "," + this.pos;
        },


        serialized: function () {
            return {
                section: this.section,
                zone: this.zone,
                pos:this.pos
            };
        },

        assignNew: function (source) {
            if (this.section !== source.section)
                this.set("section", source.section);
            if (this.zone !== source.zone)
                this.set("zone", source.zone);
            if (this.pos !== source.pos)
            	this.set("pos", source.pos);
            return this;
        }

    });
});