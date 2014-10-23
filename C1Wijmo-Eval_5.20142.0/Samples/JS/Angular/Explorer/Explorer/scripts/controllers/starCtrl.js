'use strict';

var app = angular.module('app');

// star controller: shows star sizing
app.controller('starCtrl', function appCtrl($scope, dataSvc) {
    $scope.ctx = {
        flex: null,
        data: dataSvc.getData(100)
    };
});
