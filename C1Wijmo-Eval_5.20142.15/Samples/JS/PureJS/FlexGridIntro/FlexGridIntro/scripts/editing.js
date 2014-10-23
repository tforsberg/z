(function (wijmo, data) {
    'use strict';

    var grid = new wijmo.grid.FlexGrid('#eFlexGrid'),
        cv = new wijmo.collections.CollectionView(data.getData(100));

    grid.initialize({
        autoGenerateColumns: false,
        columns: [
            { header: 'ID', binding: 'id', width: '*', isReadOnly: true },  // cannot edit
            { header: 'Country', binding: 'country' },
            { header: 'Date', binding: 'date' },
            { header: 'Revenue', binding: 'amount', format: 'n0' },
            { header: 'Active', binding: 'active' },
        ],
        itemsSource: cv
    });
})(wijmo, appData);