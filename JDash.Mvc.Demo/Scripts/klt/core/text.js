define(["require"], function (require) {
    return {
        load: function (name, req, load, config) {
            
            require(["dojo/text!" + name], function (text) {
                if (text && text.charCodeAt(0) == 65279)
                    text = text.slice(1);
                load(text);
            });
        }
    }
});