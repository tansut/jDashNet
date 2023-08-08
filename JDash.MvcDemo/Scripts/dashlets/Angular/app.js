define(["/scripts/angular.min.js"], function() {
    var app = angular.module('JDashNetDemo', []).run();
    angular.bootstrap(document, ['JDashNetDemo']);
    return app;
})