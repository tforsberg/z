(function (wijmo, data) {
    'use strict';

    var fgInitMethod = new wijmo.grid.FlexGrid('#cdInitMethod'),
        fgColsCollection = new wijmo.grid.FlexGrid('#cdColsCollection'),
        cv = new wijmo.collections.CollectionView(data.getData(100));

    // initialize method
    fgInitMethod.initialize({
        autoGenerateColumns: false,
        columns: [
            { header: 'Country', binding: 'country', width: '*' },
            { header: 'Date', binding: 'date' },
            { header: 'Revenue', binding: 'amount', format: 'n0' },
            { header: 'Active', binding: 'active' },
        ],
        itemsSource: cv
    });

    // columns collection
    fgColsCollection.autoGenerateColumns = false;
    fgColsCollection.itemsSource = cv;

    var countryCol = new wijmo.grid.Column();
    countryCol.binding = 'country';
    countryCol.header = 'Country';
    countryCol.width = '*';
    fgColsCollection.columns.push(countryCol);

    var dateCol = new wijmo.grid.Column();
    dateCol.binding = 'date';
    dateCol.header = 'Date';
    fgColsCollection.columns.push(dateCol);

    var revenueCol = new wijmo.grid.Column();
    revenueCol.binding = 'amount';
    revenueCol.header = 'Revenue';
    revenueCol.format = 'n0';
    fgColsCollection.columns.push(revenueCol);

    var activeCol = new wijmo.grid.Column();
    activeCol.binding = 'active';
    activeCol.header = 'Active';
    fgColsCollection.columns.push(activeCol);
})(wijmo, appData);