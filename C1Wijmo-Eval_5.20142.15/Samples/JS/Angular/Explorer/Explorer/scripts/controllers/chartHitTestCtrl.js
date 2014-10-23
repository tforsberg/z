'use strict';

var app = angular.module('app');

app.controller('chartHitTestCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        chart: null,
        pts1: [],
        pts2: []
    };

    var len = 60;
    for (var i = 0; i < len; i++) {
        $scope.ctx.pts1.push({ x: i, y: Math.cos(0.12 * i) });
        $scope.ctx.pts2.push({ x: i, y: Math.sin(0.12 * i) });
    }

    $scope.$watch('ctx.chart', function () {
        if ($scope.ctx.chart) {
            var chart = $scope.ctx.chart;

            chart.axisY.style = {};

            chart.header = "Trigonometric functions";
            chart.headerStyle = { fontSize: 32 };
            chart.footer = "Cartesian coordinates";
            chart.footerStyle = { fontSize: 24 };

            chart.hostElement.onmousemove = function (e) {
                var hit = chart.hitTest(e);
                var info = $('#info');
                info.html(formatHitInfo(hit, chart.pointToData(e)));
            };
        }
    });

    function formatHitInfo(hitInfo, pt) {
        var s = '<div>Chart element: ' + wijmo.chart.ChartElement[hitInfo.chartElement] + '</div>';
        if (hitInfo.series) {
            s += '<div>Series name: ' + hitInfo.series.name;
            if (hitInfo.pointIndex !== null) {
                s += '<div>Point index: ' + hitInfo.pointIndex + '</div>';
                s += '<div>Distance: ' + hitInfo.distance.toFixed(0) + '</div>';

                if (hitInfo.chartElement == wijmo.chart.ChartElement.PlotArea) {
                    s += '<div>x: ' + pt.x.toFixed(2) + '</div>';
                    s += '<div>y: ' + pt.y.toFixed(2) + '</div>';
                }
            }
        }
        return s;
    }
});
