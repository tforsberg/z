(function (wijmo, $, data) {
    'use strict';

    var grid = new wijmo.grid.FlexGrid('#mdFlexGrid'),
        cv = new wijmo.collections.CollectionView(data.getData(100));

    grid.initialize({
        autoGenerateColumns: false,
        columns: [
            { header: 'Country', binding: 'country', width: '*' },
            { header: 'Date', binding: 'date' }
        ],
        itemsSource: cv
    });

    // init details pane
    updateDetails(cv.currentItem);

    // handle CollectionView's currentChanged event to update details
    cv.currentChanged.addHandler(function (sender, args) {
        updateDetails(sender.currentItem);
    });

    // update the details when the CollectionView's currentItem changes
    function updateDetails(item) {
        $('#mdCurId').text(item.id);
        $('#mdCurCountry').text(item.country);
        $('#mdCurDate').text(wijmo.Globalize.format(item.date, 'd'));
        $('#mdCurRevenue').text(wijmo.Globalize.format(item.amount, 'c'));
        $('#mdCurActive').text(item.active);
    }
})(wijmo, jQuery, appData);