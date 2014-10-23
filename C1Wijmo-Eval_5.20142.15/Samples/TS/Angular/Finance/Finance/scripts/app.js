var app = angular.module('app', ['wj', 'ngRoute' ]);

// Globalize filter
// globalizes numbers and dates using Globalize.js formats
// converts null into empty strings
app.filter('glbz', function () {
    return function (input, format) {
        return input ? wijmo.Globalize.format(input, format) : '';
    }
});
