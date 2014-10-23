'use strict';

// declare app module
var app = angular.module('app');

// app controller provides data
app.controller('appCtrl', function appCtrl($scope) {

    // generate some random data
    var countries = 'US,Germany,UK,Japan,Italy,Greece'.split(','),
        data = [];
    for (var i = 0; i < countries.length; i++) {
        data.push({
            country: countries[i],
            downloads: Math.round(Math.random() * 20000),
            sales: Math.random() * 10000,
            expenses: Math.random() * 5000
        });
    }

    // add data array to scope
    $scope.data = data;

    // add chart properties to scope
    $scope.chartProps = {
        chartType: wijmo.chart.ChartType.Column,
        stacking: wijmo.chart.Stacking.None,
        legendPosition: wijmo.chart.Position.Right,
        rotated: false,
        header: 'Sample Chart',
        footer: 'copyright (c) ComponentOne',
        titleX: 'country',
        titleY: 'amount',
        selectionMode: wijmo.chart.SelectionMode.Series,
        selection: null
    };

    // series-toggling chart control
    $scope.toggleChart = null;

    // dynamic data
    var toAddData;
    $scope.trafficData = new wijmo.collections.ObservableArray();
    $scope.setInterval = function (interval) {
        if (toAddData) {
            clearTimeout(toAddData);
            toAddData = null;
        }
        $scope.interval = interval;
        if (interval) {
            toAddData = setTimeout(addTrafficItem);
        }
    };
    $scope.setInterval(500);

    function addTrafficItem() {
        var len = $scope.trafficData.length,
            last = len ? $scope.trafficData[len - 1] : null,
            trucks = last ? last.trucks : 0,
            ships = last ? last.ships : 0,
            planes = last? last.planes : 0;
        trucks = Math.max(0, trucks + Math.round(Math.random() * 50 - 25));
        ships = Math.max(0, ships + Math.round(Math.random() * 10 - 5));
        planes = Math.max(0, planes + Math.round(Math.random() * 10 - 5));

        // add random data, limit array length
        $scope.trafficData.push({ time: new Date(), trucks: trucks, ships: ships, planes: planes });
        if ($scope.trafficData.length > 200) {
            $scope.trafficData.splice(0, 1);
        }

        // keep adding
        if ($scope.interval) {
            toAddData = setTimeout(addTrafficItem, $scope.interval);
        }
    }
});
