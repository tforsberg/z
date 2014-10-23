'use strict';

var app = angular.module('app');

// Globalize filter
app.filter('glbz', function () {
    return function (input, format) {
        return wijmo.Globalize.format(input, format);
    }
});

// CellRange filter
app.filter('cellRange', function () {
    return function (input) {
        var rng = '';
        if (input instanceof wijmo.grid.CellRange) {
            rng = '(' + input.row + ';' + input.col + ')';
            if (!input.isSingleCell) {
                rng += '-(' + input.row2 + ';' + input.col2 + ')';
            }
        }
        return rng;
    }
});


