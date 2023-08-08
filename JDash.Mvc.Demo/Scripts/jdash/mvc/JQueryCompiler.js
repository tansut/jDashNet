define(["dojo/dom-construct", "dojo/query"],
    function (domConstruct, query) {
        return {
            id: 'jquery',
            compile: function (htmlString) {
                var node = $(htmlString);
                try {
                    for (var i = 1; i < node.length ; i++) {
                        node[0].appendChild(node[i]);
                    }
                } catch (e) {

                }
                var forms = query("form", node[0]);
                if (forms.length && $.validator && $.validator.unobtrusive) {
                    $(forms[0]).removeData("validator");
                    $(forms[0]).removeData("unobtrusiveValidation");
                    if ($.validator && $.validator.unobtrusive)
                        $.validator.unobtrusive.parse(forms[0]);
                }
                return node[0];
            }
        }
    })

