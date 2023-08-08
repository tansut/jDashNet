define(["dojo/on", "dojo/query", "dojo/dom-class", "dojo/when"], function (on, query, domClass, when) {
    return {
        css: function (node, cssClass, cb) {
            var handleRemoved = false;
            function removeAnimation(event) {
                handleRemoved = true;
                event = event || window.event;
                //console.log(event);
                var waitHandle = null;

                if (cb) {
                    waitHandle = cb.apply(this, [event]);
                }
                when(waitHandle, function () {
                    domClass.remove(node, cssClass + " animated");
                }, function () { domClass.remove(node, cssClass + " animated"); })
            }


            var timeOut = setTimeout(function () {
                if (!handleRemoved) {
                    console.log("animation timeout " + cssClass);
                    removeAnimation(null);
                }
            }, 2500);

            var handle = on(node, "webkitAnimationEnd,mozAnimationEnd,oAnimationEnd,animationEnd,MSAnimationEnd", function (event) {                
                handle.remove();
                clearTimeout(timeOut);
                removeAnimation(event)
            });
            
            var timeOut = setTimeout(function () {
                if (!handleRemoved) {
                    //console.log("animation timeout " + cssClass);
                    removeAnimation(null);
                }
            }, 2500);

            domClass.add(node, cssClass + " animated");
        }
    }
})