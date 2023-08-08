
define(['dojo/_base/declare',
		'dojo/_base/lang',
        'dojo/dnd/Mover',
        'dojo/dnd/autoscroll'

],
	function (declare, lang, Mover, autoscroll) {
	    return declare("jdash.layout.StepMover", [Mover], {
	        

	        postscript: function (args) {

	            declare.safeMixin(this, args);
	        },
	

	        onMouseMove: function (e) {

	            autoscroll.autoScroll(e);
	            var m = this.marginBox;	            
	            var left = m.l + e.pageX < 0 ? 0 : m.l + e.pageX;
	            var top = m.t + e.pageY < 0 ? 0 : m.t + e.pageY;	            
	            if (e.ctrlKey) {
	                this.host.onMove(this, { l: parseInt(left / this.stepSize) * this.stepSize, t: parseInt(top / this.stepSize) * this.stepSize });
	            } else {
	                this.host.onMove(this, { l: left, t: top });
	            }
	            dojo.stopEvent(e);
	        }
	    });
	});