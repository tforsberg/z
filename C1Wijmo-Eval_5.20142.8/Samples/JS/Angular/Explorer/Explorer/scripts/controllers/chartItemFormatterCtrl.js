'use strict';

var app = angular.module('app');

app.controller('chartItemFormatterCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        chart: null,
        pts1: []
    };

    var ptsCount = 300;
    for (var i = 0; i < ptsCount; i++) {
        $scope.ctx.pts1.push({ x: 0.16 * i, y: Math.cos(0.12 * i) });
    }

    $scope.$watch('ctx.chart', function () {
        if ($scope.ctx.chart) {
            var chart = $scope.ctx.chart;

            chart.itemFormatter = function (engine, hitTestInfo, defaultFormat) {
                if (hitTestInfo.chartElement == wijmo.chart.ChartElement.SeriesSymbol) {
                    var y = hitTestInfo.y;
                    var r = y >= 0 ? 255 : (255 * (1+ y)).toFixed();
                    var b = y < 0 ? 255 : (255 * (1 - y)).toFixed();
                    var g = ((1 - Math.abs(y)) * 255).toFixed();
                    engine.fill = 'rgb(' + r + ',' + g + ',' + b+ ')';
                    defaultFormat();
                }
            };
        }
    });
});
