'use strict';

var app = angular.module('app');

// basic controller: show basic grid functionality
app.controller('odataCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        categories: new wijmo.collections.CollectionView(),
        products: new wijmo.collections.CollectionView(),
        supplierMap: null
    };

    // base url for public Northwind service
    var urlBase = 'http://services.odata.org/Northwind/Northwind.svc/';

    // load categories (ID, Name, and Description only; picture is big and we're not using it)
    var urlCategories = urlBase + 'Categories?$format=json&$select=CategoryID,CategoryName,Description';
    $.ajax({
        dataType: "json",
        url: urlCategories,
        success: function (data) {
            $scope.ctx.categories.sourceCollection = data.value;
            $scope.ctx.categories.moveCurrentToFirst();
            $scope.$apply('ctx.categories');
        }
    });

    // load suppliers (to show how to build data maps)
    var urlSuppliers = urlBase + 'Suppliers?$format=json&$select=SupplierID,CompanyName';
    $.ajax({
        dataType: "json",
        url: urlSuppliers,
        success: function (data) {
            $scope.ctx.supplierMap = new wijmo.grid.DataMap(data.value, 'SupplierID', 'CompanyName');
            $scope.$apply('ctx.supplierMap');
        }
    });

    // load orders (to show how to handle dates)
    // note that this NWind service does not return dates as '\/Date(ticks)\/' but as
    // 'yyyy-MM-ddThh:mm:ss', which can be parsed by the Date object constructor.
    var urlOrders = urlBase + 'Orders?$format=json&$top=5';
    $.ajax({
        dataType: "json",
        url: urlOrders,
        success: function (data) {
            var arr = data.value;
            for (var i = 0; i < arr.length; i++) {
                var order = arr[i];
                order.OrderDate	= new Date(order.OrderDate);
                order.RequiredDate = new Date(order.RequiredDate);
                order.ShippedDate = new Date(order.ShippedDate);
            }
        }
    });

    // load products for the current category
    $scope.ctx.categories.currentChanged.addHandler(function (s, e) {
        var id = $scope.ctx.categories.currentItem.CategoryID,
            urlProducts = urlBase + 'Products?$format=json&$select=ProductID,SupplierID,ProductName,QuantityPerUnit,UnitPrice,UnitsInStock,Discontinued&$filter=CategoryID eq ' + id;
        $.ajax({
            dataType: "json",
            url: urlProducts,
            success: function (data) {
                $scope.ctx.products.sourceCollection = data.value;
                $scope.ctx.products.moveCurrentToFirst();
                $scope.$apply('ctx.products');
            }
        });
        $scope.$apply('ctx.categories.currentItem');
    });
});
