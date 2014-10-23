'use strict';

var app = angular.module('app');

// InputNumber directive
app.directive('appInputNumber', function () {
    return {
        restrict: 'E',
        replace: true,
        scope: {
            control: '=',
            value: '=',
            required: '=',
            min: '=',
            max: '=',
            step: '=',
            format: '@'
        },
        template: '<div/>',
        link: function (scope, element, attrs) {

            // create InputNumber control
            var control = new wijmo.input.InputNumber(element[0]);
            if (typeof(scope.control) !== 'undefined') {
                scope.control = control;
                if (!scope.$$phase) scope.$apply('control');
            }

            // get/set value
            scope.$watch('value', function () {
                if (scope.value != null) {
                    control.value = scope.value;
                }
            });
            control.valueChanged.addHandler(function () {
                scope.value = control.value;
                if (!scope.$$phase) scope.$apply('value');
            });

            // set required/min/max/step/format
            scope.$watch('required', function () {
                if (scope.required != null) {
                    control.required = scope.required;
                }
            });
            scope.$watch('min', function () {
                if (scope.min != null) {
                    control.min = scope.min;
                }
            });
            scope.$watch('max', function () {
                if (scope.max != null) {
                    control.max = scope.max;
                }
            });
            scope.$watch('step', function () {
                if (scope.step != null) {
                    control.step = scope.step;
                }
            });
            scope.$watch('format', function () {
                if (scope.format != null) {
                    control.format = scope.format;
                }
            });
        }
    }
});

// AutoComplete directive
app.directive('appAutocomplete', function () {
    return {
        restrict: 'E',
        replace: true,
        scope: {
            control: '=',
            text: '=',
            itemsSource: '=',
            itemsSourceFunction: '=',
            displayMemberPath: '@',
            selectedValuePath: '@',
            selectedIndex: '=',
            selectedValue: '=',
            showDropDownButton: '=',
            placeholder: '@',
            cssMatch: '@'
        },
        template: '<div/>',
        link: function (scope, element, attrs) {

            // create autocomplete
            var control = new wijmo.input.AutoComplete(element[0]);
            if (typeof(scope.control) !== 'undefined') {
                scope.control = control;
                if (!scope.$$phase) scope.$apply('control');
            }
            if (scope.itemsSource != null) {
                control.itemsSource = scope.itemsSource;
            }

            // notify of text changes
            control.textChanged.addHandler(function () {
                scope.text = control.text;
                scope.selectedIndex = control.selectedIndex;
                scope.selectedValue = control.selectedValue;
                if (!scope.$$phase) {
                    scope.$apply('text');
                    scope.$apply('selectedIndex');
                    scope.$apply('selectedValue');
                }
            });

            // apply scope properties to control
            scope.$watch('selectedValue', function () {
                if (typeof scope.selectedValue != 'undefined') {
                    control.selectedValue = scope.selectedValue;
                }
            });
            scope.$watch('text', function () {
                if (scope.text != null) {
                    control.text = scope.text;
                }
            });
            scope.$watch('placeholder', function () {
                if (scope.placeholder != null) {
                    control.placeholder = scope.placeholder;
                }
            });
            scope.$watch('itemsSource', function () {
                if (scope.itemsSource != null) {
                    control.itemsSource = scope.itemsSource;
                }
            });
            scope.$watch('itemsSourceFunction', function () {
                if (scope.itemsSourceFunction != null) {
                    control.itemsSourceFunction = scope.itemsSourceFunction;
                }
            });
            scope.$watch('displayMemberPath', function () {
                if (scope.displayMemberPath != null) {
                    control.displayMemberPath = scope.displayMemberPath;
                }
            });
            scope.$watch('selectedValuePath', function () {
                if (scope.selectedValuePath != null) {
                    control.selectedValuePath = scope.selectedValuePath;
                }
            });
            scope.$watch('selectedIndex', function () {
                if (scope.selectedIndex != null) {
                    control.selectedIndex = scope.selectedIndex;
                }
            });
            scope.$watch('showDropDownButton', function () {
                if (scope.showDropDownButton != null) {
                    control.showDropDownButton = scope.showDropDownButton;
                }
            });
            scope.$watch('cssMatch', function () {
                if (scope.cssMatch != null) {
                    control.cssMatch = scope.cssMatch;
                }
            });
        }
    }
});

// FlexGrid directive
app.directive('appGrid', function ($compile) {

    function getCellScope(panel, r, c) {
        return {
            $row: panel.rows[r],
            $col: panel.rows[c],
            $item: panel.rows[r].dataItem
        };
    }
    function getCellTemplate(col) {
        var tpl = col.cellTemplate;
        if (tpl) {
            tpl = tpl.replace(/ng\-style/g, 'style');
            tpl = tpl.replace(/ class\=\"ng\-scope\"( \"ng\-binding\")?/g, '');
            tpl = tpl.replace(/<span>\s*<\/span>/g, '');
        }
        return tpl;
    }

    return {
        restrict: 'E',
        replace: true,
        transclude: true,
        scope: {
            control: '=',
            itemsSource: '=',
            childItemsPath: '=',
            selectionMode: '=',
            allowMerging: '=',
            allowDragging: '=',
            allowResizing: '=',
            rowHeaders: '=',
            readOnly: '=',
        },
        template: '<div ng-transclude/>',
        link: function (scope, element, attrs) {

            // clean up element
            element[0].innerHTML = '';

            // create flexgrid
            var control = new wijmo.grid.FlexGrid(element[0]);
            scope.grid = control;
            if (typeof (scope.control) !== 'undefined') {
                scope.control = control;
            }
            if (!scope.$$phase) {
                try {
                    scope.$apply('control');
                } catch (x) { }
            }

            // apply column info
            if (scope.columns && scope.columns.length) {
                control.autoGenerateColumns = false;
                control.columns.clear();
                for (var i = 0; i < scope.columns.length; i++) {
                    var c = new wijmo.grid.Column();
                    var ci = scope.columns[i];
                    if (ci.binding) {
                        c.binding = ci.binding;
                        c.name = ci.name;
                    }
                    if (ci.name) c.name = ci.name;
                    if (ci.type) c.dataType = wijmo.DataType[ci.type];
                    if (ci.map) c.dataMap = ci.map;
                    if (ci.format) c.format = ci.format;
                    if (ci.header) c.header = ci.header;
                    if (ci.width) c.width = (ci.width.indexOf('*') > -1) ? ci.width : ci.width * 1;
                    if (ci.minWidth) c.minWidth = ci.minWidth * 1;
                    if (ci.maxWidth) c.maxWidth = ci.maxWidth * 1;
                    if (ci.align) c.align = ci.align;
                    if (ci.allowDragging) c.allowDragging = ci.allowDragging == 'false' ? false : true;
                    if (ci.allowResizing) c.allowResizing = ci.allowResizing == 'false' ? false : true;
                    if (ci.allowMerging) c.allowMerging = ci.allowMerging == 'false' ? false : true;
                    if (ci.readOnly) c.isReadOnly = ci.readOnly == 'false' ? false : true;
                    if (ci.aggregate) c.aggregate = wijmo.Aggregate[ci.aggregate];
                    if (ci.cellTemplate) c.cellTemplate = ci.cellTemplate;
                    if (ci.cellStyle) c.cellStyle = ci.cellStyle;
                    control.columns.push(c);
                }
            }

            // honor cell templates
            control.itemFormatter = function (panel, r, c, cell) {
                if (panel.cellType == wijmo.grid.CellType.Cell) {
                    var col = panel.columns[c],
                        tpl = getCellTemplate(col);

                    // apply cell template
                    if (tpl) {

                        // build cell scope
                        var cellScope = getCellScope(panel, r, c);
                        var html = tpl.replace(/\{\{(.*)\}\}/g, function (match, expression) {
                            var value = scope.$parent.$eval(expression, cellScope);
                            return value != null ? value : '';
                        });

                        // assign result to cell and compile it so ng-click works
                        cell.innerHTML = html;
                        $compile(cell)(scope.$parent);
                    }

                    // apply cell style
                    if (col.cellStyle) {

                        // build cell style object
                        var cellStyle = col.cellStyle,
                            cellScope = getCellScope(panel, r, c),
                            style = scope.$parent.$eval(cellStyle, cellScope);

                        // apply style to cell
                        if (style) {
                            for (var key in style) {
                                cell.style[key] = style[key];
                            }
                        }
                    }
                }
            }

            // apply properties
            scope.$watch('itemsSource', function () {
                if (scope.itemsSource != null) {
                    control.itemsSource = scope.itemsSource;
                }
            });
            scope.$watch('childItemsPath', function () {
                if (scope.childItemsPath != null) {
                    control.childItemsPath = scope.childItemsPath;
                }
            });
            scope.$watch('selectionMode', function () {
                if (scope.selectionMode != null) {
                    control.selectionMode = wijmo.grid.SelectionMode[scope.selectionMode];
                }
            });
            scope.$watch('allowMerging', function () {
                if (scope.allowMerging != null) {
                    control.allowMerging = wijmo.grid.AllowMerging[scope.allowMerging];
                }
            });
            scope.$watch('allowDragging', function () {
                if (scope.allowDragging != null) {
                    control.allowDragging = wijmo.grid.AllowDragging[scope.allowDragging];
                }
            });
            scope.$watch('allowResizing', function () {
                if (scope.allowResizing != null) {
                    control.allowResizing = wijmo.grid.AllowResizing[scope.allowResizing];
                }
            });
            scope.$watch('readOnly', function () {
                if (scope.readOnly != null) {
                    control.isReadOnly = scope.readOnly;
                }
            });
            scope.$watch('rowHeaders', function () {
                if (scope.rowHeaders == false) {
                    control.rowHeaders.columns.clear();
                }
            });
        },
        controller: function ($scope) {
            var scope = $scope;
            var columns = $scope.columns = [];
            this.addColumn = function (columnScope) {
                columns.push(columnScope);
            }
            this.setDataMap = function (columnScope) {
                if (columnScope.map && columnScope.binding && scope.grid) {
                    var column = scope.grid.columns.getColumn(columnScope.binding);
                    if (column) {
                        column.dataMap = columnScope.map;
                    }
                }
            }
        }
    }
});
app.directive('appGridColumn', function () {
    return {
        restrict: 'E',
        require: '^appGrid',
        replace: true,
        transclude: true,
        scope: {
            name: '@',
            type: '@',
            map: '=',
            binding: '@',
            format: '@',
            header: '@',
            width: '@',
            minWidth: '@',
            maxWidth: '@',
            align: '@',
            allowDragging: '@',
            allowResizing: '@',
            allowMerging: '@',
            readOnly: '@',
            aggregate: '@'
        },
        template: '<div ng-transclude/>',
        compile: function (element, attrs) {
            return this.link;
        },
        link: function (scope, element, attrs, grid) {

            // get column template (HTML content)
            var tpl = element[0].innerHTML;
            if (tpl) {
                scope.cellTemplate = tpl;
            }

            // get column style
            var style = attrs['ngStyle'];
            if (style) {
                scope.cellStyle = style;
            }

            // add column scope to parent grid
            grid.addColumn(scope);

            // update column's data map
            scope.$watch('map', function () {
                if (scope.map) {
                    grid.setDataMap(scope);
                }
            });
        }
    }
});

// CollectionView header sorter
app.directive('appSorter', function () {

    // update element content to show whether is the sorted column
    function updateSortIndicator(scope, element) {
        if (scope.view) {
            var sd = scope.view.sortDescriptions,
                sortIndicator = '';
            if (sd.length > 0 && sd[0].property == scope.binding) {
                sortIndicator = sd[0].ascending ? ' ▲' : ' ▼';
            }
            element.innerText = scope.header + sortIndicator;
        }
    };

    // apply/change/remove sort on this column
    function applySort(scope, args) {
        if (scope.view) {
            var sd = scope.view.sortDescriptions;
            if (args.ctrlKey) { // clear sort on ctrl-click 
                sd.clear();
            } else { // add/reverse sort on clicked column
                var ascending = true;
                if (sd.length > 0 && sd[0].property == scope.binding) {
                    ascending = !sd[0].ascending;
                }
                var sdNew = new wijmo.collections.SortDescription(scope.binding, ascending);
                sd.splice(0, sd.length, sdNew);
            }
        }
    };

    return {
        restrict: 'E',
        replace: true,
        transclude: true,
        scope: {
            view: '=',
            binding: '@'
        },
        template: '<span ng-transclude/>',
        link: function (scope, element, attrs) {
            var e = element[0];

            // save header to update on clicks
            if (!scope.header) {
                scope.header = e.textContent;
            }

            // make cursor a hand
            var p = e.parentElement;
            p.style.cursor = 'pointer';

            // show sort indicator
            updateSortIndicator(scope, e);
            if (scope.view) {
                scope.view.collectionChanged.addHandler(function () {
                    updateSortIndicator(scope, e);
                });
            }

            // change sort on click
            p.addEventListener('click', function (args) {
                if (scope.view) {
                    applySort(scope, args);
                }
            });
        }
    }
});

// StockChart directive
app.directive('appStockChart', function () {
    return {
        restrict: 'E',
        replace: true,
        scope: {
            portfolio: '=',
        },
        template: '<div/>',
        link: function (scope, element, attrs) {
            var chart,
                portfolio;

            // create FlexChart control
            chart = new wijmo.chart.FlexChart(element[0]);
            chart.chartType = wijmo.chart.ChartType.Line;
            chart.axisY.format = 'p0';
            chart.axisX.format = 'MMM-yyyy';
            chart.legend.isVisible = false; // chart.legend.position = Position.None?

            // bind to portfolio
            scope.$watch('portfolio', function () {
                var p = portfolio;
                if (p) {
                    p.itemsChanged.removeHandler(itemsChanged);
                }
                p = scope.portfolio;
                if (p) {
                    portfolio = p;
                    p.itemsChanged.addHandler(itemsChanged);
                }
            });

            // update chart when portfolio changes
            function itemsChanged() {
                if (chart && portfolio) {
                    updateChart(chart, portfolio);
                }
            }
        }
    }
    function updateChart(chart, portfolio) {

        // don't update chart until all done            
        chart.beginUpdate();

        // remove current series
        var series = [];
        while (chart.series.length > 0) {
            series.push(chart.series[0]);
            chart.series.splice(0, 1);
        }

        // add new series
        chart.bindingX = 'date';
        chart.binding = 'change';
        var items = portfolio.view.items;
        for (var i = 0; i < items.length; i++) {
            var item = items[i];
            if (item.chartData && item.chartData.length && item.chart) {
                var series = new wijmo.chart.Series();
                series.itemsSource = item.chartData;
                series.name = item.symbol;
                series.style = { stroke: item.color };
                chart.series.push(series);
                //console.log('added series with ' + item.chartData.length + ' items.');
            }
        }

        // ready to update chart
        chart.endUpdate();
    }
});
