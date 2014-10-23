var app = angular.module('app', ['ngRoute'] );

// controller for the whole app
app.controller('appCtrl', function ($scope, $location) {

    // go method: 
    // adds 'topic/' to the relative url so it gets routed to the view
    $scope.go = function (url) {
        $location.path('topic/' + url);
    };

});

// scroll to top after view change
// http://stackoverflow.com/questions/23980938/angularjs-doesnt-scroll-to-top-after-changing-a-view
app.run(function ($rootScope, $window) {
    $rootScope.$on('$routeChangeSuccess', function () {
        var interval = setInterval(function () {
            if (document.readyState == 'complete') {
                $window.scrollTo(0, 0);
                clearInterval(interval);
            }
        }, 200);
    });
});

// route provider
app.config(function ($routeProvider, $locationProvider) {

    // no hashes in urls (to be SEO friendly)
    $locationProvider.html5Mode(true);

    $routeProvider.
        when('/topic/:id', { // return url to automatically-generated topic
            templateUrl: function (args) {
                return 'partials/generated/topics/' + args.id;
            }
        }).
        when('/static/:id', { // return url to manually-generated (static) topic
            templateUrl: function (args) {
                return 'partials/static/' + args.id;
            }
        }).
        when('/', { templateUrl: 'partials/static/home.html' }). // default
        otherwise({ redirectTo: '/' });
});

