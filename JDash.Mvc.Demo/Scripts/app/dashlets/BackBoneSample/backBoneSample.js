define(["require"], function ( require) {
    return function (params) {

        //Create an initial dom node
        this.domNode = document.createElement("div");


        //Define a template
        var template = "<h1>" +
                        "<%= title %>" +
                    "</h1>" +
                    "<br />" +
                    "<i><%= content %></i>";

        //Get resource paths
        var backboneScriptPath = require.toUrl("./Backbone.js");
        var underscoreScriptPath = require.toUrl("./Underscore.js");

        var self = this;



        //Load resources and create backbone view
        //Backbone needs underscore.js so load underscore.js first
        require([underscoreScriptPath], function () {
            require([backboneScriptPath], function () {

                //Define a backbone model
                var simpleModel = Backbone.Model.extend({
                    defaults: {
                        title: 'Backbone Dashlet',
                        content: 'I am  a backbone view'
                    }
                });

                //Define a backbone view
                var BackboneView = Backbone.View.extend({
                    //Set dashlet dom node as "el" object
                    el: self.domNode,
                    //Create instance of model
                    model: new simpleModel(),
                    //Set template source as an underscore template
                    template: _.template(template),
                    //Init view
                    initialize: function () {
                        _.bindAll(this, 'render');
                        this.render();
                    },
                    //Render view
                    render: function () {
                        this.el.innerHTML = (this.template(this.model.toJSON()));
                    }
                });

                //Create backbone view instance
                var myView = new BackboneView();
            });

        });
    }
});
