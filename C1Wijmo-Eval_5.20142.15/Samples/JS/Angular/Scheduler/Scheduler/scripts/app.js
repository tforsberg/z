// define application module 'app', 
// include dependency on Wijmo's AngularJS directives
var app = angular.module('app', ['wj', 'ngRoute']);

app.config(function ($routeProvider) {
    $routeProvider.
        when('/book', { templateUrl: 'partials/book.htm' }).
        when('/review', { templateUrl: 'partials/review.htm' }).
        when('/login', { templateUrl: 'partials/login.htm' }).

        // default...
        when('/', { templateUrl: 'partials/book.htm' }).
        otherwise({ redirectTo: '/' });
});
