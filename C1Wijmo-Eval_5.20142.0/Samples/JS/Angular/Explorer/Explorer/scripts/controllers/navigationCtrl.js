'use strict';

var app = angular.module('app');

app.controller('navigationCtrl', function ($scope, menuSvc) {
    $scope.menuData = {};
    $scope.navCollapsed = true;

    menuSvc.getMenu().then(function(data) {
        $scope.menuData = data;
    });

    $scope.collapseMenu = function() {
        $scope.navCollapsed = true;
    };
});
