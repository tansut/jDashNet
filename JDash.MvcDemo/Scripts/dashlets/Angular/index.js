define(["./todoctrl", "./app"], function (TodoCtrl, app) {

    window.TodoCtrl = TodoCtrl;

    return {

        initialize: function (context, viewNode) {
            angular.element(viewNode).injector().invoke(function ($compile) {
                var scope = angular.element(viewNode).scope();
                $compile(viewNode)(scope);
                scope.$digest();
            });
        }
    }
})