'use strict';

var app = angular.module('app');

app.controller('chartCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        chart: null,
        itemsSource: []
    };

    // populate itemsSource
    var names = ['Oranges', 'Apples', 'Pears', 'Bananas', 'Pineapples'],
        data = [];
    for (var i = 0; i < names.length; i++) {
        $scope.ctx.itemsSource.push({
            name: names[i],
            mar: Math.random() * 3,
            apr: Math.random() * 10,
            may: Math.random() * 5
        });
    }
});
