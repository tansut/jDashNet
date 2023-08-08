define(["require"], function (require) {

    return function (params, node) {
        var context = this.context = params.context;
        var domNode = this.domNode = node || document.createElement("div");

        var dashletNode = this.dashletNode = document.createElement("div");
        domNode.appendChild(dashletNode);

        this._handleDomUpdate = function (newNode, insideOnly) {
            if (!insideOnly)
                domNode = this.domNode = newNode;
            domNode.appendChild(dashletNode);
        }

        this._handleDomUpdating = function () {
            this.domNode.removeChild(this.dashletNode);
        }


        var self = this;

        

        this.startup = function () {

            var path = require.toUrl("./resources/ckeditor.js");
            require([path], function () {
                CKEDITOR.replaceAll('ckeditor');
            });
            self.context.subscribe('jdash/dashlet/visualStateChanged', function (event) {
                if (event.sender == this) {
                    if(CKEDITOR)
                        CKEDITOR.replaceAll('ckeditor');
                }
            });
        }

    }
});