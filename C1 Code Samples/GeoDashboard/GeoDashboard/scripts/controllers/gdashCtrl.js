"use strict";

function gdashCtrl($scope, $routeParams) {

    // create the viewModel
    var model = $scope.model = new viewModel();

    // expose information sources for the tiles
    $scope.sources = model.sources;

    // expose current map extent (read/write)
    $scope.extent = model.extent;

    // expose current map location (lat, lon, name, read only)
    $scope.location = model.getLocation();
    
    // when scope extent changes, update model extent
    $scope.$watch("extent", function () {
        model.setExtent($scope.extent);
    });

    // update location and tapestry description when new data arrives
    model.onGotData = function () {
        $scope.location = model.getLocation();
        $scope.domTapDescription = model.domTapDescription;
    };

    // get a description for an index (100 is the national average, 50 is half, 200 is double, etc)
    $scope.getIndexDescription = function (index) {
        return model.getIndexDescription(index);
    }

    // show tiles for a given info source
    $scope.selectSource = function (source) {
        if (source != $scope.selectedSource) {
            angular.forEach(model.sources, function (value, key) {
                value.selected = (value == source);
            });
            $scope.selectedSource = source;
            $scope.$apply("selectedSource");
        }
    }

    // go to the current location
    $scope.gotoCurrentLocation = function () {
        if ("geolocation" in navigator) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var c = position.coords;
                $scope.gotoLocation(c.latitude, c.longitude);
            });
            return true;
        }
        return false;
    };

    // go to any location
    $scope.gotoLocation = function (lat, lon) {
        var ptg = new esri.geometry.Point(lon, lat, $scope.extent.spatialReference);
        var ptm = esri.geometry.geographicToWebMercator(ptg);
        $scope.extent = $scope.extent.centerAt(ptm);
        $scope.$apply("extent");
    }

    // geocode a location
    $scope.search = "";
    $scope.geoCode = function () {
        if ($scope.search && $scope.search.length > 0) {
            if (!this.geocoder) {
                this.geocoder = new google.maps.Geocoder();
            }
            this.geocoder.geocode({ 'address': $scope.search }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var loc = results[0].geometry.location;
                    $scope.gotoLocation(loc.lat(), loc.lng());
                    $scope.search = "";
                } else {
                    alert("Sorry, this search produced no results.");
                }
            });
        }
    }
}
