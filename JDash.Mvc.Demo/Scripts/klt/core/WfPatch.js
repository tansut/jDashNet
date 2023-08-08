define([],
function () {

    var res = {

    }

    res.patch = function (template) {
        if (template && template.charCodeAt(0) == 65279)
            return template.slice(1);
        else return template;
    }

    return res;

});