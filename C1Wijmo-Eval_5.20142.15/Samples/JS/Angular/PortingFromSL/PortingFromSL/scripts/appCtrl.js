'use strict';

// get reference to app module
var app = angular.module('app');

// declare app controller
app.controller('appCtrl', function appCtrl($scope) {

    $scope.startButton_Click = function () {

        // URL to Northwind service
        var svcUrl = 'http://services.odata.org/Northwind/Northwind.svc';

        // clear query history
        $scope.queryResources = [];

        // create customers, orders, details view
        $scope.customers = new wijmo.collections.CollectionView();
        $scope.orders = new wijmo.collections.CollectionView();
        $scope.details = new wijmo.collections.CollectionView();

        // when the current customer changes, get his orders
        $scope.customers.currentChanged.addHandler(function () {
            $scope.orders.sourceCollection = [];
            $scope.details.sourceCollection = [];
            var customer = $scope.customers.currentItem;
            if (customer) {
                loadData(svcUrl, $scope.orders, 'Customers(\'' + customer.CustomerID + '\')/Orders', {
                    OrderDate: wijmo.DataType.Date,
                    RequiredDate: wijmo.DataType.Date,
                    ShippedDate: wijmo.DataType.Date,
                    Freight: wijmo.DataType.Number
                });
            }
        });

        // when the current order changes, get the order details
        $scope.orders.currentChanged.addHandler(function () {
            $scope.details.sourceCollection = [];
            var order = $scope.orders.currentItem;
            if (order) {
                loadData(svcUrl, $scope.details, 'Orders(' + order.OrderID + ')/Order_Details', {
                    UnitPrice: wijmo.DataType.Number
                });
            }
        });

        // load the customers.
        loadData(svcUrl, $scope.customers, 'Customers');

        // utility to load OData into a CollectionView
        function loadData(baseUrl, view, table, types) {

            // build url
            var url = baseUrl + '/' + table;
            url += (url.indexOf('?') < 0) ? '?' : '&';
            url += '$format=json';

            // update query history
            $scope.queryResources.push({
                table: table.indexOf('/') > -1 ? table.split('/')[1] : table.split('?')[0],
                url: url
            });
            if (!$scope.$$phase) {
                $scope.$apply();
            }

            // go get the data
            $.ajax({
                dataType: 'json',
                url: url,
                success: function (data) {

                    // append new items
                    for (var i = 0; i < data.value.length; i++) {

                        // convert data types (JSON doesn't do dates...)
                        var item = data.value[i];
                        if (types) {
                            for (var key in types) {
                                if (item[key]) {
                                    item[key] = wijmo.changeType(item[key], types[key]);
                                }
                            }
                        }

                        // add item to collection
                        view.sourceCollection.push(item);
                    }

                    // continue loading more data or refresh and apply to update scope
                    if (data['odata.nextLink']) {
                        loadData(baseUrl, view, data['odata.nextLink']);
                    } else {
                        view.refresh();
                        view.moveCurrentToFirst();
                        $scope.$apply();
                    }
                }
            });
        }
    }
});