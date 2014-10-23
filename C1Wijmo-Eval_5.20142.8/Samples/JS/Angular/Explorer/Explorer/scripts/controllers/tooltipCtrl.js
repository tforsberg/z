'use strict';

var app = angular.module('app');

// tooltip controller: shows how to use tooltips in 'manual' mode
app.controller('tooltipCtrl', function appCtrl($scope, dataSvc) {

    // data context
    $scope.ctx = {
        flex: null,
        data: dataSvc.getData(500)
    };

    $scope.$watch('ctx.flex', function () {
        if ($scope.ctx.flex) {

            // store reference to grid
            var flex = $scope.ctx.flex;

            // create tooltip
            var tip = new wijmo.Tooltip(),
                rng = null;

            // monitor the mouse over the grid
            flex.hostElement.addEventListener('mousemove', function (evt) {
                var ht = flex.hitTest(evt);
                if (!ht.cellRange.equals(rng)) {

                    // new cell selected, show tooltip
                    if (ht.cellType == wijmo.grid.CellType.Cell) {
                        rng = ht.cellRange;
                        var cellElement = document.elementFromPoint(evt.clientX, evt.clientY),
                            cellBounds = wijmo.Rect.fromBoundingRect(cellElement.getBoundingClientRect()),
                            data = wijmo.escapeHtml(flex.getCellData(rng.row, rng.col, true)),
                            tipContent = 'cell (' + rng.row + ' ' + rng.col + ') contains "<b>' + data + '</b>"';
                        if (cellElement.className.indexOf('wj-cell') > -1) {
                            tip.show(flex.hostElement, tipContent, cellBounds);
                        } else {
                            tip.hide(); // cell must be behind scroll bar...
                        }
                    }
                }
            });
            flex.hostElement.addEventListener('mouseout', function () {
                tip.hide();
                rng = null;
            });
        }
    });
});
