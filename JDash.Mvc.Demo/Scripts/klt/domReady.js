define(["require"], function (require) {
    return {
        load: function (name, req, load, config) {
            require(["dojo/domReady!"], function (ready) {
                load(ready);
            });
        }
    }
});