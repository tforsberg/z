'use strict';

var app = angular.module('app');

// application controller (single)
app.controller('appCtrl', function appCtrl($scope, $routeParams, $filter, $location) {

    // create portfolio
    var p = new finance.Portfolio();
    $scope.portfolio = p;

    // update angular when portfolio items change 
    p.itemsChanged.addHandler(function () {
        $scope.$apply('portfolio.items');
    });

    // show positive values in green, negative in red
    $scope.getAmountColor = function(amount) {
        return amount < -0.01 ? '#9F3912' : amount > 0.01 ? '#217648' : '#b0b0b0';
    }

    // search for companies to fill auto complete control
    var cache = {};
    $scope.searchCompany = function(query, max, callback) {

        // try getting the result from the cache
        var result = cache[query];
        if (result) {
            //console.log('found "' + query + '" in cache, ' + result.length + ' items.');
            callback(result);
            return;
        }

        // not in cache, get from server
        //console.log('querying server for "' + query + '".');
        $.get('StockInfo.ashx', { search: query, max: max }, function (result) {

            // parse result
            var lines = result.split('\r'),
                matches = [];
            //console.log('got result with ' + lines.length + ' matches.');
            for (var i = 0; i < lines.length; i++) {
                var items = lines[i].split('\t');
                if (items.length == 2) {
                    var symbol = items[0].trim(),
                        name = items[1].trim(),
                        symbolName = '<b>' + symbol + '</b>: ' + name;
                    matches.push({ symbol: symbol, name: name, symbolName: symbolName });
                }
            }

            // store result in cache
            cache[query] = matches;

            // and return the result
            callback(matches);
        })
        .fail(function (error) {
            console.log('error: ' + error.responseText);
            cache[query] = null; // << no point in trying this query again
            callback(null);
        });
    }
});
