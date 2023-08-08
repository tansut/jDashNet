define(["dojo/dom-construct"],
    function (domConstruct) {
        return {
            id: 'internal',
            compile: function (htmlString) {
                var node = domConstruct.toDom(htmlString);
                return node;
        }
    }
})