'use strict';

var app = angular.module('app');

// basic controller: show basic grid functionality
app.controller('noDctvCtrl', function appCtrl($scope) {

    // create grid when the view is loaded
    var flex = null;
    $scope.$on('$viewContentLoaded', function () {

        if (!flex) {

            // create flex using a jQuery id selector
            flex = new wijmo.grid.FlexGrid('#flexNoDctv');

            // create flex using an element (same thing really)
            //var e = $('#flexNoDctv')[0];
            //flex = new wijmo.grid.FlexGrid(e);

            // populate the grid with the grid's own properties
            var data = [];
            for (var prop in flex) {
                if (prop.indexOf('_') != 0) {
                    var val = flex[prop];
                    var type = val instanceof wijmo.Event ? 'Event'
                        : val instanceof wijmo.grid.CellRange ? 'CellRange'
                        : val instanceof wijmo.Point ? 'Point'
                        : val instanceof wijmo.Size ? 'Size'
                        : val instanceof wijmo.collections.ObservableArray ? 'ObservableArray'
                        : typeof (val);
                if (!angular.isFunction(val)) {
                    data.push({
                            name: prop,
                            type: type,
                            value: val ? val.toString() : ''
                        });
                    }
                }
            }
            flex.itemsSource = data;
            flex.autoSizeColumns();
        }
    });
});
