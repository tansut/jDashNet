define(["./scripts/sparkline.js"], {

    draw: function(type,value) {
        size = this.context.getDashletSize();
        var myvalues = [10, 8, 5, 7, 4, 4, 1, 12.8];
        $(".sparkLine", this.domNode).sparkline(myvalues, {
            width: Math.round(size.w / 1.7),
            height: 60
        });
        $(".type", this.domNode).text(type);
        $(".value", this.domNode).text(value);
    },

    resize: function() {
        this.draw();
    },

    initialize: function (context, viewNode) {
        var type = this.context.config.type != null ? this.context.config.get("model").type : "Cpu Utilization";
        var value = this.context.config.value!=null ? this.context.config.get("model").value : "10.2";
        this.draw(type,value);
    }
})