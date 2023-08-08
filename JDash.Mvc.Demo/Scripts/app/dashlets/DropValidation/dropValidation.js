define(['dojo/_base/declare',
        'dojo/_base/lang',
        'dojo/text!./template.htm',
        'dijit/_WidgetBase',
        'dijit/_TemplatedMixin',
        'dijit/_WidgetsInTemplateMixin',
        'dojo/on',
        'dojo/dom-construct',
        'dojo/query',
        'dojo/dom-class',
        'dojo/dom-style',
        'app/ViewSourceDialog',
        'require'
],
function (declare, lang, template, _WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn,
          on, domConstruct, query, domClass, domStyle, Dialog, require) {
    return declare([_WidgetBase, _TemplatedMixin, _WidgetsInTemplateMixIn], {

        templateString: template,

        addEvent2Log: function (msg) {
            this.events = this.events || {};
            var eventData = this.events[msg];
            if (!eventData) {
                eventData = this.events[msg] = { num: 0 };
            }

            if (eventData.num > 0)
                $(eventData.node).remove();
            var div = document.createElement("div");
            var content = document.createTextNode(msg + " " + eventData.num);
            div.appendChild(content);
            this.eventTracker.appendChild(div);
            eventData.node = div;
            eventData.num = eventData.num + 1;
        },

        _stickChange: function () {
            this.context.paneConfig.set("sticky", this.makeSticky.checked);
        },

        postCreate: function () {
            var self = this;

            // Subscribe to dropping event.
            this.context.subscribe("jdash/layout/dnd/dropping", function (event) {
                if (self.disableDrop.checked) {
                    event.cancel = true;
                    self.addEvent2Log("Cancelling drop");

                } else {
                    var msg = "jdash/layout/dnd/dropping - oldPos" + event.args.position.toString() +  " newPos: "+ event.args.newPosition.toString() + " " + event.args.pane.title;
                    self.addEvent2Log(msg);
                }
            });            
            this.context.subscribe("jdash/layout/dnd/dragStarting", function (event) {
                if (self.disableDrop.checked) {
                    event.cancel = true;
                    self.addEvent2Log("Cancelling drag start");

                } else {
                    var msg = "jdash/layout/dnd/dragStarting - " + event.args.position.toString() + " " + event.args.pane.title;
                    self.addEvent2Log(msg);
                }
            });

            this.context.subscribe("jdash/layout/dnd/dragStarted", function (event) {
                var msg = "jdash/layout/dnd/dragStarted - " + event.args.position.toString() + " " + event.args.pane.title;
                self.addEvent2Log(msg);
            });
            //simdilik iptal edildi
            //this.context.subscribe("jdash/layout/dnd/dragOver", function (event) {
            //    var msg = "jdash/layout/dnd/dragOver - " + event.args.position.toString() + " " + event.args.pane.title;
            //    self.addEvent2Log(msg);
            //}); 

            this.context.subscribe("jdash/layout/dnd/dropped", function (event) {
                var msg = "jdash/layout/dnd/dropped - oldPos" +  event.args.oldPosition.toString() + " newPos: " + event.args.newPosition.toString() + " " + event.args.pane.title;
                self.addEvent2Log(msg);
            });
        },

        _viewSource: function () {
      
            var dialog = this.dialog = new Dialog({ href: "/Scripts/app/dashlets/DropValidation/dropValidation.js" , context: this.context });
            dialog.show();
          
        },

        destroyRecursive: function () {

            this.inherited(arguments);

        }
    });
});
