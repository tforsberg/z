'use strict';

angular.module('app').factory('menuSvc', function ($http, $q) {
    return {
        getMenu: function () {            
            return $http.get('data/menu.json')
                    .then(function (result) {
                        return result.data;
                    });
        }
    }
});