'use strict';

var app = angular.module('app');

app.controller('chartSelectionCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        chart: null,
        itemsSource: [
            { name: 'Oranges', Mar: 3 * Math.random(), Apr: 10 * Math.random(), May: 5 * Math.random() },
            { name: 'Apples', Mar: 3 * Math.random(), Apr: 10 * Math.random(), May: 5 * Math.random() },
            { name: 'Pears', Mar: 3 * Math.random(), Apr: 10 * Math.random(), May: 5 * Math.random() },
            { name: 'Bananas', Mar: 3 * Math.random(), Apr: 10 * Math.random(), May: 5 * Math.random() },
            { name: 'Pineapples', Mar: 3 * Math.random(), Apr: 10 * Math.random(), May: 5 * Math.random() },
        ]
    };
});
