'use strict';

var app = angular.module('app');

app.controller('chartHeaderFooterCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        chart: null,
        itemsSource: []
    };

    for (var i = 0; i < 12; i++) {
        $scope.ctx.itemsSource.push({
            date: wijmo.Globalize.format(new Date(10, i, 1), 'MMM'),
            sales: Math.random() * 1000
        });
    }

    $scope.$watch('ctx.chart', function () {
        if ($scope.ctx.chart) {
            var chart = $scope.ctx.chart;

            chart.beginUpdate();

            chart.header = 'Monthly Sales Summary';
            chart.headerStyle = { fontSize: 36 };

            chart.footer = 'Footer (c) ' + new Date().getFullYear();
            chart.footerStyle = { halign: 'right', foreground: 'gray' };

            chart.legend.isVisible = false;

            chart.endUpdate();

            chart.tooltip.content = function (ht) {
                return 'Month: ' + ht.item.date + '<br/>' + 'Sales: ' + ht.item.sales.toFixed();
            };
        }
    });
});
