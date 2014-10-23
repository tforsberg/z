'use strict';

var app = angular.module('app');

app.controller('chartFinanceCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        chart: null,
        data: []
    };

    var start = new Date(99, 0, 1);
    for (var i = 0; i < 90; i++) {
        var q = {};

        q.x = new Date(99, 0, i);

        if (i > 0)
            q.open = $scope.ctx.data[i - 1].close;
        else
            q.open = 1000;

        q.hi = q.open + Math.random() * 50;
        q.lo = q.open - Math.random() * 50;

        q.close = q.lo + Math.random() * (q.hi - q.lo);

        $scope.ctx.data.push(q);
    }

    $scope.$watch('ctx.chart', function () {
        if ($scope.ctx.chart) {
            var chart = $scope.ctx.chart;
            chart.axisX.format = 'MMM-dd';

            chart.tooltip.content = function (ht) {
                return 'Date: ' + wijmo.Globalize.format(ht.x, 'MMM-dd') + '<br/>' +
                    'High: ' + ht.item.hi.toFixed() + '<br/>' +
                    'Low: ' + ht.item.lo.toFixed() + '<br/>' +
                    'Open: ' + ht.item.open.toFixed() + '<br/>' +
                    'Close: ' + ht.item.close.toFixed();
            };

        }
    });
});
