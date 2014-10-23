(function () {
    'use strict';

    var controllerId = 'controller1';

    // TODO: replace app with your module name
    angular.module('app').controller(controllerId,
        ['$scope', controller1]);

    function controller1($scope) {
        $scope.title = 'controller1';
        $scope.activate = activate;

        function activate() { }
    }
})();
