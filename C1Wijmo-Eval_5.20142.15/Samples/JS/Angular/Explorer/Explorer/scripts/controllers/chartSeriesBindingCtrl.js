'use strict';

var app = angular.module('app');

app.controller('chartSeriesBindingCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        chart: null,
        pts1: [],
        pts2: []
    };

    var ptsCount = 300;
    for (var i = 0; i < ptsCount; i++) {
        $scope.ctx.pts1.push({ x: 2 * Math.sin(0.16 * i), y: 2 * Math.cos(0.12 * i) });
        $scope.ctx.pts2.push({ x: Math.sin(0.1 * i), y: Math.cos(0.15 * i) });
    }

    $scope.$watch('ctx.chart', function () {
        if ($scope.ctx.chart) {
            var chart = $scope.ctx.chart;
            chart.axisY.style = {};
            chart.tooltip.content = "x={x}, y={y}";
        }
    });
});
