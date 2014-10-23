(function (wijmo, data) {
    'use strict';

    var grid = new wijmo.grid.FlexGrid('#tvFlexGrid'),
        cv = new wijmo.collections.CollectionView(data.treeData);

    grid.initialize({
        autoGenerateColumns: false,
        columns: [
            { binding: 'name', width: '*' },
            { binding: 'length', width: 80, align: 'center' }
        ],
        itemsSource: cv,
        childItemsPath: 'items',    // set hierarchy path
        allowResizing: wijmo.grid.AllowResizing.None,   // disable reszing
        headersVisibility: wijmo.grid.HeadersVisibility.None,   // hide headers
        selectionMode: wijmo.grid.SelectionMode.ListBox // use ListBox selection
    });
})(wijmo, appData);