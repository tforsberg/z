'use strict';

var app = angular.module('app');

// merging controller: show grid's cell merging functionality
app.controller('mergingCtrl', function appCtrl($scope, dataSvc) {

    // data context
    $scope.ctx = {
        flex: null,
        data: dataSvc.getData(500)
    };

    $scope.sourceChanged = function (sender, args) {
        // update data maps, formatting, and headers when the grid is populated
        update();
    }

    // connect to flex when it becomes available
    $scope.$watch('ctx.flex', function () {
        // update data maps, formatting, and headers when the grid is populated
        update();
    });

    function update() {
        if ($scope.ctx.flex) {
            updateDataMaps();
            updateFormatting();
            updateHeaders();
        }
    }

    // apply data maps
    function updateDataMaps() {
        var flex = $scope.ctx.flex;
        if (flex) {
            var colCountry = flex.columns.getColumn('countryId');
            var colProduct = flex.columns.getColumn('productId');
            var colColor = flex.columns.getColumn('colorId');
            if (colCountry && colProduct && colColor) {
                colCountry.dataMap = new wijmo.grid.DataMap(dataSvc.getCountries());
                colProduct.dataMap = new wijmo.grid.DataMap(dataSvc.getProducts());
                colColor.dataMap = new wijmo.grid.DataMap(dataSvc.getColors());
                colCountry.align = 'left';
                colProduct.align = 'left';
                colColor.align = 'left';
            }
        }
    }

    // apply/remove column formatting
    function updateFormatting() {
        var flex = $scope.ctx.flex;
        if (flex) {
            var fmt = $scope.ctx.formatting;
            setColumnFormat('amount', fmt ? 'c' : null);
            setColumnFormat('discount', fmt ? 'p0' : null);
            setColumnFormat('start', fmt ? 'MMM d yy' : null);
            setColumnFormat('end', fmt ? 'HH:mm' : null);
        }
    }
    function setColumnFormat(name, format) {
        var col = $scope.ctx.flex.columns.getColumn(name);
        if (col) {
            col.format = format;
        }
    }

    // add some column headers to show merging
    function updateHeaders() {
        var flex = $scope.ctx.flex;
        if (flex) {

            // insert new row if not yet
            if (flex.columnHeaders.rows.length === 1) {
                flex.columnHeaders.rows.insert(0, new wijmo.grid.Row());
            }
            var row = flex.columnHeaders.rows[0];
            row.allowMerging = true;

            // set headings so the cells merge
            for (var i = 0; i < flex.columns.length; i++) {
                var hdr = 'String';
                switch (flex.columns[i].binding) {
                    case 'id':
                    case 'amount':
                    case 'discount':
                        hdr = 'Number';
                        break;
                    case 'active':
                        hdr = 'Boolean';
                        break;
                }
                flex.columnHeaders.setCellData(0, i, hdr);
            }
        }
    }
});
