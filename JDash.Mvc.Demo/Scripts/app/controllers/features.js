define(['dojo/_base/declare',
        'dojo/_base/lang',
        "dojo/Stateful",
        "dojo/request"], function (declare, lang, Stateful,request) {
            return declare('app.controllers.features', [Stateful], {

                constructor: function () {
                    console.info("Features controller created");
                },

                dashlet: function (params) {
                    console.info("Features/Dashlet controller active");

                    return this.app.renderView("/Features/Dashlet/DropValidation", { query: { partial: 1 } }, params.node, true);
                }
            });
        });