define(["./templates"], function(templates) {
    return {


        initialize: function (context, node) {
            this.templateList = this.$get('.templateList');
            this.templateBox = this.$get('.templateBox');
            var self = this;
            this.templateList.onchange = function () {
                if (self.templateList.value)
                    self.templateBox.value =  self.$json.stringify(templates[self.templateList.value]);
            }
        }
    }
})