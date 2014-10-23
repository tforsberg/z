var app = angular.module('app', ['wj', 'ngRoute']);

app.config(['$routeProvider', function ($routeProvider) {
    $routeProvider.

    // Infrastructure
    when('/infra/intro', { templateUrl: 'partials/infra/intro.htm' }).
    when('/infra/data', { templateUrl: 'partials/infra/data.htm', controller: 'dataCtrl' }).
    when('/infra/trackChanges', { templateUrl: 'partials/infra/trackChanges.htm', controller: 'changesCtrl' }).
    when('/infra/odata', { templateUrl: 'partials/infra/odata.htm', controller: 'odataCtrl' }).
    when('/infra/globalization', { templateUrl: 'partials/infra/globalization.htm', controller: 'inputCtrl' }).
    when('/infra/events', { templateUrl: 'partials/infra/events.htm', controller: 'dataCtrl' }).
    when('/infra/controls', { templateUrl: 'partials/infra/controls.htm', controller: 'inputCtrl' }).
    when('/infra/templates', { templateUrl: 'partials/infra/templates.htm', controller: 'templateCtrl' }).
    when('/infra/themes', { templateUrl: 'partials/infra/themes.htm', controller: 'inputCtrl' }).
    when('/infra/tooltips', { templateUrl: 'partials/infra/tooltips.htm', controller: 'tooltipCtrl' }).

    // Input
    when('/input/intro', { templateUrl: 'partials/input/intro.htm', controller: 'inputCtrl' }).
    when('/input/listbox', { templateUrl: 'partials/input/listbox.htm', controller: 'inputCtrl' }).
    when('/input/combo', { templateUrl: 'partials/input/combo.htm', controller: 'inputCtrl' }).
    when('/input/autocomplete', { templateUrl: 'partials/input/autocomplete.htm', controller: 'inputCtrl' }).
    when('/input/menu', { templateUrl: 'partials/input/menu.htm', controller: 'inputCtrl' }).
    when('/input/number', { templateUrl: 'partials/input/number.htm', controller: 'inputCtrl' }).
    when('/input/datetime', { templateUrl: 'partials/input/datetime.htm', controller: 'inputCtrl' }).
    when('/input/color', { templateUrl: 'partials/input/color.htm', controller: 'inputCtrl' }).

    // FlexGrid
    when('/grid/intro', { templateUrl: 'partials/grid/intro.htm', controller: 'basicCtrl' }).
    when('/grid/grouping', { templateUrl: 'partials/grid/grouping.htm', controller: 'basicCtrl' }).
    when('/grid/paging', { templateUrl: 'partials/grid/paging.htm', controller: 'basicCtrl' }).
    when('/grid/star', { templateUrl: 'partials/grid/starsizing.htm', controller: 'starCtrl' }).
    when('/grid/columnLayout', { templateUrl: 'partials/grid/columnLayout.htm', controller: 'basicCtrl' }).
    when('/grid/tree', { templateUrl: 'partials/grid/tree.htm', controller: 'treeCtrl' }).
    when('/grid/merging', { templateUrl: 'partials/grid/merging.htm', controller: 'mergingCtrl' }).
    when('/grid/unbound', { templateUrl: 'partials/grid/unbound.htm', controller: 'unboundCtrl' }).
    when('/grid/ccells', { templateUrl: 'partials/grid/customcells.htm', controller: 'customCellsCtrl' }).
    when('/grid/odata', { templateUrl: 'partials/grid/odata.htm', controller: 'odataCtrl' }).
    when('/grid/editing', { templateUrl: 'partials/grid/editing.htm', controller: 'basicCtrl' }).
    when('/grid/rtl', { templateUrl: 'partials/grid/rtl.htm', controller: 'basicCtrl' }).
    when('/grid/templates', { templateUrl: 'partials/grid/templates.htm', controller: 'basicCtrl' }).
    when('/grid/nodctv', { templateUrl: 'partials/grid/nodctv.htm', controller: 'noDctvCtrl' }).

    // Chart
    when('/chart/intro', { templateUrl: 'partials/chart/intro.htm', controller: 'chartCtrl' }).
    when('/chart/binding', { templateUrl: 'partials/chart/binding.htm', controller: 'chartBindingCtrl' }).
    when('/chart/seriesBinding', { templateUrl: 'partials/chart/seriesBinding.htm', controller: 'chartSeriesBindingCtrl' }).
    when('/chart/headerFooter', { templateUrl: 'partials/chart/headerFooter.htm', controller: 'chartHeaderFooterCtrl' }).
    when('/chart/hitTest', { templateUrl: 'partials/chart/hitTest.htm', controller: 'chartHitTestCtrl' }).
    when('/chart/selection', { templateUrl: 'partials/chart/selection.htm', controller: 'chartSelectionCtrl' }).
    when('/chart/labels', { templateUrl: 'partials/chart/labels.htm', controller: 'chartLabelsCtrl' }).
    when('/chart/itemFormatter', { templateUrl: 'partials/chart/itemFormatter.htm', controller: 'chartItemFormatterCtrl' }).
    when('/chart/bubble', { templateUrl: 'partials/chart/bubble.htm', controller: 'chartBubbleCtrl' }).
    when('/chart/zoom', { templateUrl: 'partials/chart/zoom.htm', controller: 'chartZoomCtrl' }).
    when('/chart/finance', { templateUrl: 'partials/chart/finance.htm', controller: 'chartFinanceCtrl' }).

    // Gauge
    when('/gauge/intro', { templateUrl: 'partials/gauge/intro.htm', controller: 'basicCtrl' }).

    // Report Viewer
    when('/report/intro', { templateUrl: 'partials/report/intro.htm', controller: 'basicCtrl' }).

    // Map<
    when('/map/intro', { templateUrl: 'partials/map/intro.htm', controller: 'basicCtrl' }).

    // default...
    when('/', { templateUrl: 'partials/infra/intro.htm', controller: 'basicCtrl' }).
    otherwise({ redirectTo: '/' });
}]);

