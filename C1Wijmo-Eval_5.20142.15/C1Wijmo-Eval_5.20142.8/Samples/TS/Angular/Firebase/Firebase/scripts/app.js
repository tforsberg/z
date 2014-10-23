var app = angular.module('app', ['wj', 'ngRoute']);

app.config(['$routeProvider', function ($routeProvider) {
    $routeProvider.

    when('/products', { templateUrl: 'partials/products.htm' }).
    when('/customers', { templateUrl: 'partials/customers.htm' }).
    when('/employees', { templateUrl: 'partials/employees.htm' }).
    when('/restore', { templateUrl: 'partials/restore.htm' }).

    // default...
    when('/', { templateUrl: 'partials/home.htm' }).
    otherwise({ redirectTo: '/' });
}]);

