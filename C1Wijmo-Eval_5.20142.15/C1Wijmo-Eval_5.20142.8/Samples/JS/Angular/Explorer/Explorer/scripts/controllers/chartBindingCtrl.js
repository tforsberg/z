'use strict';

var app = angular.module('app');

app.controller('chartBindingCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        chart: null,
        itemsSource: []
    };

    var dataCount = 300;
    for (var i = 0; i < dataCount; i++) {
        var mod = Math.floor(i / 10) % 10;
        $scope.ctx.itemsSource.push({
            date: new Date(10, 0, i),
            sales: mod == 0 ? null : Math.random() * 10,
            downloads: mod == 0 ? null : Math.random() * 10 + 10
        });
    }

    $scope.$watch('ctx.chart', function () {
        if ($scope.ctx.chart) {
            var chart = $scope.ctx.chart;
            chart.axisX.format = "MMM-yy";
            //chart.interpolateNulls = true;
            chart.tooltip.content = "{seriesName}<br/>{x:dd-MMM}<br/>{y:n3}";
        }
    });
});
