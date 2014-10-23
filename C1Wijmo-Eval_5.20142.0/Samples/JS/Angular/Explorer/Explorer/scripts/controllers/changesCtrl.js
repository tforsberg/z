'use strict';

var app = angular.module('app');

// changes controller: exposes a CollectionView that tracks changes
app.controller('changesCtrl', function appCtrl($scope, dataSvc) {

    // create CollectionView
    var items = dataSvc.getData(6);
    var view = new wijmo.collections.CollectionView(items);

    // track changes
    view.trackChanges = true;

    // expose CollectionView
    $scope.ctx = {
        data: view
    };

});
