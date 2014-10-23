'use strict';

var app = angular.module('app');

// changes controller: exposes a CollectionView that tracks changes
app.controller('changesCtrl', function appCtrl($scope, dataSvc) {

    // create items, round numbers and dates so there's no rounding
    var items = dataSvc.getData(6);
    for (var i = 0; i < items.length; i++) {
        var item = items[i];
        item.amount = item.amount.toFixed(2) * 1;
        item.start = new Date(item.start.getFullYear(), item.start.getMonth(), item.start.getDate());
    }

    // create CollectionView
    var view = new wijmo.collections.CollectionView(items);

    // track changes
    view.trackChanges = true;

    // expose CollectionView
    $scope.ctx = {
        data: view
    };

});
