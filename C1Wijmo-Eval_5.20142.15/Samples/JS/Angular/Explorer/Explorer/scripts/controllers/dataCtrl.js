'use strict';

var app = angular.module('app');

// data controller: shows how the CollectionView class works
app.controller('dataCtrl', function appCtrl($scope, dataSvc) {

    // data context
    $scope.ctx = {
        cv: new wijmo.collections.CollectionView(dataSvc.getData(500))
    }

    // initialize collection view
    var cv = $scope.ctx.cv;
    cv.filter = filter;
    cv.pageSize = 10;
    cv.newItemCreator = function () {
        var newItem = dataSvc.getData(1)[0];
        newItem.id = -1;
        return newItem;
    };

    // update grouped list when the view changes
    $scope.groupedList = cv.items;
    cv.collectionChanged.addHandler(function () {
        $scope.groupedList = cv.items;
        if (cv.groups && cv.groups.length > 0) {
            $scope.groupedList = [];
            for (var i = 0; i < cv.groups.length; i++) {
                addGroup(cv.groups[i]);
            }
        }
    });
    function addGroup(g) {
        $scope.groupedList.push(g);
        if (g.isBottomLevel) {
            for (var i = 0; i < g.items.length; i++) {
                $scope.groupedList.push(g.items[i]);
            }
        } else {
            for (var i = 0; i < g.groups.length; i++) {
                addGroup(g.groups[i]);
            }
        }
    }

    // IEditableCollectionView commands
    $scope.isEditing = function () {
        return cv.isEditingItem || cv.isAddingNew;
    }
    $scope.edit = function () {
        cv.editItem(cv.currentItem);
    }
    $scope.add = function () {
        cv.addNew();
    }
    $scope.delete = function () {
        cv.remove(cv.currentItem);
    }
    $scope.commit = function () {
        cv.commitEdit();
        cv.commitNew();
    }
    $scope.cancel = function () {
        cv.cancelEdit();
        cv.cancelNew();
    }
    $scope.moveCurrentTo = function (item) {
        if (!$scope.isEditing() && !$scope.isGroup(item)) {
            cv.moveCurrentTo(item);
        }
    }

    // update filter string on a timer
    var timeOut;
    $scope.$watch('filter', function () {
        if (timeOut) {
            clearTimeout(timeOut);
        }
        timeOut = setTimeout(function () {
            timeOut = null;
            cv.refresh();
            $scope.$apply('ctx.cv');
        }, 250);
    }, true);

    // sorting
    $scope.getSort = function (propName) {
        var sd = cv.sortDescriptions;
        if (sd.length > 0 && sd[0].property == propName) {
            return sd[0].ascending ? '▲' : '▼';
        }
        return '◇';
    }
    $scope.toggleSort = function (propName) {
        var sd = cv.sortDescriptions;
        var ascending = true;
        if (sd.length > 0 && sd[0].property == propName) {
            ascending = !sd[0].ascending;
        }
        var sdNew = new wijmo.collections.SortDescription(propName, ascending);

        // remove any old sort descriptors and add the new one
        sd.splice(0, sd.length, sdNew);
    }

    // grouping
    $scope.getGroup = function (propName) {
        var index = findGroup(propName);
        return index < 0
            ? /*'▯' +*/ Array(cv.groupDescriptions.length + 2).join('▷')
            : /*'▮' +*/ Array(index + 2).join('▶');
    }
    $scope.toggleGroup = function (propName) {
        var gd = cv.groupDescriptions;
        var index = findGroup(propName);
        if (index >= 0) {
            gd.removeAt(index);
        } else {
            if (propName == 'amount') {

                // when grouping by amount, use ranges instead of specific values
                gd.push(new wijmo.collections.PropertyGroupDescription(propName, function (item, propName) {
                    var value = item[propName]; // amount
                    if (value > 1000) return 'Large Amounts';
                    if (value > 100) return 'Medium Amounts';
                    if (value > 0) return 'Small Amounts';
                    return 'Negative Amounts';
                }));
            } else {

                // group by specific property values
                gd.push(new wijmo.collections.PropertyGroupDescription(propName));
            }
        }
    }
    $scope.isGroup = function (item) {
        return item instanceof wijmo.collections.CollectionViewGroup;
    }
    function findGroup(propName) {
        var gd = cv.groupDescriptions;
        for (var i = 0; i < gd.length; i++) {
            if (gd[i].propertyName == propName) {
                return i;
            }
        }
        return -1;
    }

    // filtering
    function filter(item) {

        // check each filter parameter
        var f = $scope.filter;
        if (f) {
            if ((f.id == 'odd' && item.id % 2 == 0) ||
                (f.id == 'even' && item.id % 2 != 0)) {
                return false;
            }
            if (f.country && item.country.indexOf(f.country) < 0) {
                return false;
            }
            if (f.month != null && item.start.getMonth() != f.month * 1) {
                return false;
            }
            if (f.color && item.color.indexOf(f.color) < 0) {
                return false;
            }
            if (f.minAmount != null && item.amount < f.minAmount * 1) {
                return false;
            }
        }

        // all passed, return true to include the item
        return true;
    }
});
