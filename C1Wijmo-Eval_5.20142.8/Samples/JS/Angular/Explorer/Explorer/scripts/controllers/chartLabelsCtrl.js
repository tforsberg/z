'use strict';

var app = angular.module('app');

app.controller('chartLabelsCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        chart: null,
        itemsSource: []
    };

    var names = ['c1', 'c2', 'c3', 'c4', 'c5'];
    for (var i = 0; i < names.length; i++) {
        $scope.ctx.itemsSource.push({
            name: names[i],
            mar: Math.random() * 3,
            apr: Math.random() * 10,
            may: Math.random() * 5
        });
    }

    $scope.$watch('ctx.chart', function () {
        if ($scope.ctx.chart) {
            var chart = $scope.ctx.chart;
            chart.tooltip.content = null;

            chart.itemFormatter = function (engine, hitTestInfo, defaultFormat) {
                if (hitTestInfo.chartElement == wijmo.chart.ChartElement.SeriesSymbol) {
                    var fsz = engine.fontSize;
                    engine.fontSize = '10';
                    defaultFormat();
                    var point = hitTestInfo.point.clone();
                    point.y -= 6;
                    var text = hitTestInfo.x.toString() + '=' + hitTestInfo.y.toFixed(1);
                    var sz = engine.measureString(text);
                    var fill = engine.fill;
                    engine.fill = 'white';
                    engine.drawRect(point.x - 2 - sz.width / 2, point.y - sz.height - 2, sz.width + 4, sz.height + 4);
                    engine.fill = fill;
                    point.x -= sz.width / 2;
                    engine.drawString(text, point);
                    engine.fontSize = fsz;
                }
            };
        }
    });
});
