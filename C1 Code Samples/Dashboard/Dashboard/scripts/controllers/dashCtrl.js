// the dashboard controller
function dashCtrl($scope, $routeParams, DataCache) {

    // expose products and chart data
    $scope.products = [];
    $scope.chartType = "column";

    // expose this and previous quarter
    $scope.qStart = new Date().getFullYear() + "-Q1";
    $scope.qThis = product.prototype.getQuarter(true);
    $scope.qPrev = product.prototype.getQuarter(false);

    // prepare to load the data
    $scope.error = null;

    // get/set current chart type
    $scope.setChartType = function (newValue) {
        $scope.chartType = newValue.toLowerCase();
        notifyViews();
    }

    // load data
    getData(function (data) {

        // expose start year
        $scope.qStart = data.startYear + "-Q1";

        // get products, chart data
        for (var i = 0; i < data.products.length; i++) {

            // add product to list
            var p = new product(data.products[i]);
            $scope.products.push(p);

            // keep track of current product (for detail view)
            if ($routeParams && $routeParams.id == p.id) {
                $scope.product = p;
            }
        }

        // update chart data
        var data = [["Product", $scope.qThis]];
        for (var i = 1; i < $scope.products.length; i++) {
            var p = $scope.products[i];
            data.push([p.name, p.sales.qThis]);
        }
        $scope.chartData = data;
        $scope.setChartType($scope.chartType);
    });

    // notify listeners of any changes
    function notifyViews() {
        if (!$scope.$$phase) {
            $scope.$digest();
        }
    }

    // get data from cache or from server
    function getData(success) {

        // get data from cache if possible
        if (DataCache.data) {
            success(DataCache.data);
            return;
        }

        // progress indicator on
        $scope.loading = true;
        notifyViews();

        // get data from server
        $.getJSON('GetData.ashx', function (data) {
            DataCache.data = data;
            success(DataCache.data);
        })
        .fail(function (error) {
            $scope.error = "Error downloading data from the server";
        })
        .always(function () {
            $scope.loading = false;
            notifyViews();
        });
    }
}