'use strict';

var app = angular.module('app');

// app controller: load Firebase tables and expose them as collection views
app.controller('appCtrl', function appCtrl($scope, $location) {

    // expose current view name to scope
    $scope.currentView = function () {
        return $location.path().toLowerCase();
    };

    // define base url for Firebase data and override some field types
    // based on their names (mostly dates).
    var nwnd = 'https://Firebase.firebaseIO-demo.com/Northwind/',
        dataTypes = [
            { name: 'UnitPrice', type: wijmo.DataType.Number },
            { name: 'Freight', type: wijmo.DataType.Number },
            { name: /.*Date/, type: wijmo.DataType.Date }
        ];

    // create a FirebaseCollectionView for each table in the database
    $scope.cvCat = new wijmo.data.FirebaseCollectionView(nwnd + 'categories', dataTypes, loaded);
    $scope.cvPrd = new wijmo.data.FirebaseCollectionView(nwnd + 'products', dataTypes, loaded);
    $scope.cvShp = new wijmo.data.FirebaseCollectionView(nwnd + 'shippers', dataTypes, loaded);
    $scope.cvSup = new wijmo.data.FirebaseCollectionView(nwnd + 'suppliers', dataTypes, loaded);
    $scope.cvEmp = new wijmo.data.FirebaseCollectionView(nwnd + 'employees', dataTypes, loaded);
    $scope.cvCst = new wijmo.data.FirebaseCollectionView(nwnd + 'customers', dataTypes, loaded);
    $scope.cvOrd = new wijmo.data.FirebaseCollectionView(nwnd + 'orders', dataTypes, loaded);
    $scope.cvDtl = new wijmo.data.FirebaseCollectionView(nwnd + 'orderdetails', dataTypes, loaded);

    // tell scope when tables finish loading
    function loaded() {
        $scope.$apply();
    }

    // create data maps to show related items
    $scope.mapCat = new wijmo.grid.DataMap($scope.cvCat, 'CategoryID', 'CategoryName');
    $scope.mapPrd = new wijmo.grid.DataMap($scope.cvPrd, 'ProductID', 'ProductName');
    $scope.mapShp = new wijmo.grid.DataMap($scope.cvShp, 'ShipperID', 'CompanyName');
    $scope.mapSup = new wijmo.grid.DataMap($scope.cvSup, 'SupplierID', 'CompanyName');
    $scope.mapEmp = new wijmo.grid.DataMap($scope.cvEmp, 'EmployeeID', 'LastName');

    // show products for selected category
    $scope.cvPrd.filter = function (item) {
        var cat = $scope.cvCat.currentItem;
        return cat && item.CategoryID == cat.CategoryID;
    }
    $scope.cvCat.currentChanged.addHandler(function () {
        $scope.cvPrd.refresh();
        $scope.$apply();
    });

    // show orders for selected customer
    $scope.cvOrd.filter = function (item) {
        var cst = $scope.cvCst.currentItem;
        return cst && item.CustomerID == cst.CustomerID;
    }
    $scope.cvCst.currentChanged.addHandler(function () {
        $scope.cvOrd.refresh();
        $scope.$apply();
    });

    // show details for selected order
    $scope.cvDtl.filter = function (item) {
        var ord = $scope.cvOrd.currentItem;
        return ord && item.OrderID == ord.OrderID;
    }
    $scope.cvOrd.currentChanged.addHandler(function () {
        $scope.cvDtl.refresh();
        $scope.$apply();
    });

    // initialize new categories (new id)
    $scope.cvCat.newItemCreator = function () {
        return {
            CategoryID: getNewId($scope.cvCat, 'CategoryID')
        };
    }

    // initialize new products (new id and current category)
    $scope.cvPrd.newItemCreator = function () {
        return {
            ProductID: getNewId($scope.cvPrd, 'ProductID'),
            CategoryID: $scope.cvCat.currentItem.CategoryID
        };
    }

    // initialize new orders (new id, current customer)
    $scope.cvOrd.newItemCreator = function () {
        return {
            OrderID: getNewId($scope.cvOrd, 'OrderID'),
            CustomerID: $scope.cvCst.currentItem.CustomerID
        };
    }

    // initialize new order detail (current order)
    $scope.cvDtl.newItemCreator = function () {
        return {
            OrderID: $scope.cvOrd.currentItem.OrderID
        };
    }

    // get new ID for an item by adding one to the maximum ID present in the
    // source (unfiltered) collection
    function getNewId(view, idField) {
        var items = view.sourceCollection;
        return items.length > 0 ? wijmo.getAggregate(wijmo.Aggregate.Max, view.sourceCollection, idField) + 1 : 0;
    }

    // copy NorthWind OData source (read-only) to read-write Firebase data tables.
    // use this method to restore the Firebase version of the database when it gets
    // too messed up with edits.
    $scope.restoreFirebase = function() {

        // declare Firebase tables    
        var fbNwnd = new Firebase('https://Firebase.firebaseIO-demo.com/Northwind'),
            fbCategories = fbNwnd.child('categories'),
            fbProducts = fbNwnd.child('products'),
            fbShippers = fbNwnd.child('shippers'),
            fbSuppliers = fbNwnd.child('suppliers'),
            fbEmployees = fbNwnd.child('employees'),
            fbCustomers = fbNwnd.child('customers'),
            fbOrders = fbNwnd.child('orders'),
            fbOrderDetails = fbNwnd.child('orderdetails');

        // add items to Firebase database (once)
        var urlBase = 'http://services.odata.org/Northwind/Northwind.svc/';
        loadTable(fbCategories, urlBase, 'Categories?$select=CategoryID,CategoryName,Description');
        loadTable(fbProducts, urlBase, 'Products');//?$select=ProductID,SupplierID,ProductName,QuantityPerUnit,UnitPrice,UnitsInStock,Discontinued');
        loadTable(fbShippers, urlBase, 'Shippers');
        loadTable(fbSuppliers, urlBase, 'Suppliers');
        loadTable(fbEmployees, urlBase, 'Employees');//?$select=EmployeeID,LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath');
        loadTable(fbCustomers, urlBase, 'Customers');
        loadTable(fbOrders, urlBase, 'Orders');
        loadTable(fbOrderDetails, urlBase, 'Order_Details');
    }

    // load table data from OData, push into Firebase table
    function loadTable(fb, urlBase, link, keep) {

        // remove old data
        if (!keep) {
            fb.remove();
        }

        // build data url
        var url = urlBase + link;
        url += url.indexOf('?') < 0 ? '?$format=json' : '&$format=json';

        // get new data
        $.ajax({
            dataType: "json",
            url: url,
            success: function (data) {

                // add new data
                for (var i = 0; i < data.value.length; i++) {
                    var item = data.value[i];
                    fb.push(item);
                }
                //console.log('got ' + data.value.length + ' items from ' + url);

                // continue getting data
                var nextLink = data['odata.nextLink'];
                if (nextLink) {
                    //console.log('reading more from ' + nextLink + '...');
                    loadTable(fb, urlBase, nextLink, true);
                }
            }
        });
    }
});