// define app module
var app = angular.module("dashApp", [ "dash" ]);

// define app routing
app.config(["$routeProvider", function ($routeProvider) {
    $routeProvider.
    when("/bullets",        { templateUrl: "partials/bullets.htm", controller: dashCtrl }).
    when("/chart",          { templateUrl: "partials/chart.htm",   controller: dashCtrl }).
    when("/product/:id",    { templateUrl: "partials/product.htm", controller: dashCtrl }).
    otherwise({ redirectTo: "/bullets" });
} ]);

// create a data cache as a shared service so we don't have to re-fetch the data
// from the server all the time.
app.factory("DataCache", function () {
    var cache = {};
    return cache;
});
