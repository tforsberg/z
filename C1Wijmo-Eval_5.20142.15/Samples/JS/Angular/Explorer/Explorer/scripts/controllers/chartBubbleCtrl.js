'use strict';

var app = angular.module('app');

app.controller('chartBubbleCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        chart: null,
        itemsSource: []
    };

    for (var i = 0; i < 30; i++) {
        $scope.ctx.itemsSource.push({
            x: i,
            y: Math.random() * 10,
            size: Math.random() * 100
        });
    }
});
