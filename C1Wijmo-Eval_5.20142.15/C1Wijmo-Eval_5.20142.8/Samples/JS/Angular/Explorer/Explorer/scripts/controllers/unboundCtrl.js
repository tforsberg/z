'use strict';

var app = angular.module('app');

// tree controller: show how to use the grid as a tree 
app.controller('unboundCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        flex: null
    };

    // populate the unbound grid when it is created
    $scope.$watch('ctx.flex', function () {
        if ($scope.ctx.flex) {
            var flex = $scope.ctx.flex;
            flex.allowResizing = wijmo.grid.AllowResizing.Both;
            flex.allowDragging = wijmo.grid.AllowDragging.Both;

            // add 50 rows, 10 columns
            for (var r = 0; r < 50; r++) {
                flex.rows.push(new wijmo.grid.Row());
            }
            for (var c = 0; c < 10; c++) {
                flex.columns.push(new wijmo.grid.Column());
            }

            // populate the scrollable area
            for (var r = 0; r < flex.rows.length; r++) {
                for (var c = 0; c < flex.columns.length; c++) {
                    flex.setCellData(r, c, 'r' + r + ',c' + c);
                }
            }

            // add 3 rows to the column header and 3 columns to the row header panels
            for (var i = 0; i < 3; i++) {
                flex.columnHeaders.rows.insert(0, new wijmo.grid.Row());
                flex.rowHeaders.columns.insert(0, new wijmo.grid.Column());
            }

            // populate the fixed area
            var p = flex.columnHeaders;
            for (var r = 0; r < p.rows.length; r++) {
                for (var c = 0; c < p.columns.length; c++) {
                    p.setCellData(r, c, 'cHdr r' + r + ',c' + c);
                }
            }
            p = flex.rowHeaders;
            for (var r = 0; r < p.rows.length; r++) {
                for (var c = 0; c < p.columns.length; c++) {
                    p.setCellData(r, c, 'rHdr r' + r + ',c' + c);
                }
            }
            p = flex.topLeftCells;
            for (var r = 0; r < p.rows.length; r++) {
                for (var c = 0; c < p.columns.length; c++) {
                    p.setCellData(r, c, 'tl r' + r + ',c' + c);
                }
            }
        }
    });
});
