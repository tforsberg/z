(function (wijmo, data) {
    'use strict';

    var grid = new wijmo.grid.FlexGrid('#gsFlexGrid'),
        cv = new wijmo.collections.CollectionView(data.getData(100));

    grid.itemsSource = cv;
})(wijmo, appData);