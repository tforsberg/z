'use strict';

var app = angular.module('app');

// basic controller: show basic grid functionality
app.controller('basicCtrl', function appCtrl($scope, $compile, dataSvc) {

    // data context
    $scope.ctx = {
        flex: null,
        flexInline: null,
        itemCount: 500,
        data: dataSvc.getData(500),
        filter: '',
        groupBy: '',
        pageSize: 0,
        dataMaps: true,
        formatting: true,
        alwaysEdit: false,
        countries: dataSvc.getCountries(),
        products: dataSvc.getProducts(),
        colors: dataSvc.getColors(),
        culture: 'en'
    };

    // update data when 'itemCount' changes
    $scope.$watch('ctx.itemCount', function () {
        $scope.ctx.data = dataSvc.getData($scope.ctx.itemCount * 1);
        $scope.ctx.groupBy = '';
    });

    // update page size
    $scope.$watch('ctx.pageSize', function () {
        var flex = $scope.ctx.flex;
        if (flex && $scope.ctx.pageSize != null) {
            var cv = flex.collectionView;
            cv.pageSize = $scope.ctx.pageSize;
        }
    });

    // update groups when 'groupBy' changes
    $scope.$watch('ctx.groupBy', function () {
        if ($scope.ctx.flex) {

            // get the collection view, start update
            var cv = $scope.ctx.flex.collectionView;
            cv.beginUpdate();

            // clear existing groups
            cv.groupDescriptions.clear();

            // add new groups
            var groupNames = $scope.ctx.groupBy.split('/'),
                groupDesc;
            for (var i = 0; i < groupNames.length; i++) {
                var propName = groupNames[i].toLowerCase();
                if (propName == 'amount') {

                    // group amounts in ranges
                    // (could use the mapping function to group countries into continents, 
                    // names into initials, etc)
                    groupDesc = new wijmo.collections.PropertyGroupDescription(propName, function (item, prop) {
                        var value = item[prop];
                        if (value > 1000) return 'Large Amounts';
                        if (value > 100) return 'Medium Amounts';
                        if (value > 0) return 'Small Amounts';
                        return 'Negative';
                    });
                    cv.groupDescriptions.push(groupDesc);
                } else if (propName) {

                    // group other properties by their specific values
                    groupDesc = new wijmo.collections.PropertyGroupDescription(propName);
                    cv.groupDescriptions.push(groupDesc);
                }
            }

            // done updating
            cv.endUpdate();
        }
    });

    // ICollectionView filter function
    function filterFunction(item) {
        var f = $scope.ctx.filter;
        if (f && item) {

            // split string into terms to enable multi-field searches such as 'us gadget red'
            var terms = f.toUpperCase().split(' ');

            // look for any term in any string field
            for (var i = 0; i < terms.length; i++) {
                var termFound = false;
                for (var key in item) {
                    var value = item[key];
                    if (angular.isString(value) && value.toUpperCase().indexOf(terms[i]) > -1) {
                        termFound = true;
                        break;
                    }
                }

                // fail if any of the terms is not found
                if (!termFound) {
                    return false;
                }
            }
        }

        // include item in view
        return true;
    }

    // apply filter (applied on a 500 ms timeOut)
    var toFilter;
    $scope.$watch('ctx.filter', function () {
        if (toFilter) {
            clearTimeout(toFilter);
        }
        toFilter = setTimeout(function () {
            toFilter = null;
            if ($scope.ctx.flex) {
                var cv = $scope.ctx.flex.collectionView;
                if (cv) {
                    if (cv.filter != filterFunction) {
                        cv.filter = filterFunction;
                    } else {
                        cv.refresh();
                    }
                    $scope.$apply('ctx.flex.collectionView');
                }
            }
        }, 500);
    });

    // connect to flex when it becomes available
    // Don't remove this watcher or DataMaps won't work in Templates sample
    $scope.$watch('ctx.flex', function () {
        var flex = $scope.ctx.flex;
        if (flex) {
            // update data maps, formatting, paging on FlexGrid initialized with itemssource
            updateDataMaps();
            updateFormatting();
        }
    });

    $scope.itemsSourceChangedHandler = function (sender, args) {
        // update data maps, formatting, paging now and when the itemsSource changes

        var flex = $scope.ctx.flex;

        updateDataMaps();
        updateFormatting();
        if (flex.collectionView && $scope.ctx.pageSize != null) {
            flex.collectionView.pageSize = $scope.ctx.pageSize;
        }
    };

    $scope.selectionChangedHandler = function () {
        var flex = $scope.ctx.flex;
        // notify AngularJS of selection changes
        $scope.current = flex.collectionView ? flex.collectionView.currentItem : null;
        if (!$scope.$$phase) {
            $scope.$apply('current');
            $scope.$apply('ctx.flex.selection');
        }

        // keep the control in edit mode
        if ($scope.ctx.alwaysEdit == true) {
            setTimeout(function () {
                flex.startEditing(false);
            }, 50);
        }
    };

    // when the culture changes, load the new culture, apply, and invalidate
    $scope.$watch('ctx.culture', function () {
        $.ajax({
            url: 'scripts/vendor/wijmo.culture.' + $scope.ctx.culture + '.js',
            dataType: 'script',
            success: function (data) {
                eval(data); // apply new culture
                var flex = $scope.ctx.flex;
                if (flex) {
                    flex.invalidate(); // show the change in the FlexGrid
                }
            },
        });
    });

    // update data maps
    $scope.$watch('ctx.dataMaps', function () {
        updateDataMaps();
    });

    // update column formatting
    $scope.$watch('ctx.formatting', function () {
        updateFormatting();
    });

    // apply/remove data maps
    function updateDataMaps() {
        var flex = $scope.ctx.flex;
        if (flex) {
            var colCountry = flex.columns.getColumn('countryId');
            var colProduct = flex.columns.getColumn('productId');
            var colColor = flex.columns.getColumn('colorId');
            if (colCountry && colProduct && colColor) {
                if ($scope.ctx.dataMaps == true) {
                    colCountry.dataMap = new wijmo.grid.DataMap(dataSvc.getCountries());
                    colProduct.dataMap = new wijmo.grid.DataMap(dataSvc.getProducts());
                    colColor.dataMap = new wijmo.grid.DataMap(dataSvc.getColors());
                } else {
                    colCountry.dataMap = null;
                    colProduct.dataMap = null;
                    colColor.dataMap = null;
                }
            }
        }
    }

    // apply/remove column formatting
    function updateFormatting() {
        var flex = $scope.ctx.flex;
        if (flex) {
            var fmt = $scope.ctx.formatting;
            setColumnFormat('amount', fmt ? 'c' : null);
            setColumnFormat('amount2', fmt ? 'c' : null);
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

    // test grid's object model
    $scope.toggleColumnVisibility = function () {
        var flex = $scope.ctx.flex;
        var col = flex.columns[0];
        col.visible = !col.visible;
    };
    $scope.changeColumnSize = function () {
        var flex = $scope.ctx.flex;
        var col = flex.columns[0];
        col.visible = true;
        col.width = col.width == flex.columns.defaultSize ? 30 : -1;
        col = flex.rowHeaders.columns[0];
        col.width = col.width == flex.headerColumns.defaultSize ? 90 : -1;
    };
    $scope.toggleRowVisibility = function () {
        var flex = $scope.ctx.flex;
        var row = flex.rows[0];
        row.visible = !row.visible;
    };
    $scope.changeRowSize = function () {
        var flex = $scope.ctx.flex;
        var row = flex.rows[0];
        row.visible = true;
        row.height = row.height == flex.rows.defaultSize ? 80 : -1;
        row = flex.columnHeaders.rows[0];
        row.height = row.height == flex.headerRows.defaultSize ? 80 : -1;
    };
    $scope.changeDefaultRowSize = function () {
        var flex = $scope.ctx.flex;
        flex.rows.defaultSize = flex.rows.defaultSize == 28 ? 65 : 28;
    };
    $scope.changeScrollPosition = function () {
        var flex = $scope.ctx.flex;
        if (flex.scrollPosition.y == 0) {
            var sz = flex.scrollSize;
            flex.scrollPosition = new wijmo.Point(-sz.width / 2, -sz.height / 2);
        } else {
            flex.scrollPosition = new wijmo.Point(0, 0);
        }
    };
    $scope.autoSizeColumn = function () {
        var flex = $scope.ctx.flex;
        var sel = flex.selection;
        flex.autoSizeColumns(sel.leftCol, sel.rightCol);
    };
    $scope.autoSizeRow = function () {
        var flex = $scope.ctx.flex;
        var sel = flex.selection;
        flex.autoSizeRows(sel.topRow, sel.bottomRow);
    };

    // ** save/restore column layout
    $scope.saveColumnLayout = function () {
        if (localStorage) {
            var flex = $scope.ctx.flex;
            localStorage['columns'] = flex.columnLayout;
        }
    }
    $scope.loadColumnLayout = function () {
        if (localStorage) {
            var flex = $scope.ctx.flex;
            flex.columnLayout = localStorage['columns'];
        }
    }

    // ** inline editing
    $scope.$watch('ctx.flexInline', function () {
        var flex = $scope.ctx.flexInline;
        if (flex) {

            // prevent default editing
            flex.isReadOnly = true;

            // make rows taller to accommodate edit buttons
            flex.rows.defaultSize = 36;

            // use formatter to create buttons and custom editors
            flex.itemFormatter = itemFormatter;

            // commit row changes when scrolling the grid
            flex.scrollPositionChanged.addHandler(function () {
                if ($scope.ctx.editIndex > -1) {
                    $scope.commitRow($scope.ctx.editIndex);
                }
            });
        }
    });
    function itemFormatter(panel, r, c, cell) {
        if (panel.cellType == wijmo.grid.CellType.Cell) {
            var col = panel.columns[c],
                html = cell.innerHTML;
            if (r == $scope.ctx.editIndex) {
                switch (col.name) {
                    case 'buttons':
                        html = '<div>' +
                                '&nbsp;&nbsp;' +
                                '<button class="btn btn-primary btn-sm" ng-click="commitRow(' + r + ')">' +
                                    '<span class="glyphicon glyphicon-ok"></span> OK' +
                                '</button>' +
                                '&nbsp;&nbsp;' +
                                '<button class="btn btn-warning btn-sm" ng-click="cancelRow(' + r + ')">' +
                                    '<span class="glyphicon glyphicon-ban-circle"></span> Cancel' +
                                '</button>' +
                            '</div>';
                        break;
                    case 'date':
                        html = '<input id="theDate" class="form-control" value="' + panel.getCellData(r, c, true) + '"/>';
                        break;
                    case 'product':
                        html = '<input id="theProduct" class="form-control" value="' + panel.getCellData(r, c, true) + '"/>';
                        break;
                }
            } else {
                switch (col.name) {
                    case 'buttons':
                        cell.style.padding = '3px';
                        html = '<div>' +
                                '&nbsp;&nbsp;' +
                                '<button class="btn btn-default btn-sm" ng-click="editRow(' + r + ')">' +
                                    '<span class="glyphicon glyphicon-pencil"></span> Edit' +
                                '</button>' +
                                '&nbsp;&nbsp;' +
                                '<button class="btn btn-default btn-sm" ng-click="deleteRow(' + r + ')">' +
                                    '<span class="glyphicon glyphicon-remove"></span> Delete' +
                                '</button>' +
                            '</div>';
                        break;
                }
            }

            // update cell and compile its contents into the scope 
            // (required to wire up the ng-click directives)
            if (html != cell.innerHTML) {
                cell.innerHTML = html;
                cell.style.padding = '3px';
                $compile(cell)($scope);
            }
        }
    }
    $scope.editRow = function (row) {
        $scope.ctx.editIndex = row;
        $scope.ctx.flexInline.rows[row].height = 44;
    }
    $scope.deleteRow = function (row) {
        var ecv = $scope.ctx.flexInline.collectionView;
        ecv.removeAt(row);
    }
    $scope.commitRow = function (row) {

        // save changes
        var flex = $scope.ctx.flexInline;
        flex.setCellData(row, 'start', $("#theDate").val());
        flex.setCellData(row, 'product', $("#theProduct").val());

        // done editing
        $scope.cancelRow(row);
    }
    $scope.cancelRow = function (row) {
        $scope.ctx.editIndex = -1;
        $scope.ctx.flexInline.rows[row].height = -1;
    }
});
