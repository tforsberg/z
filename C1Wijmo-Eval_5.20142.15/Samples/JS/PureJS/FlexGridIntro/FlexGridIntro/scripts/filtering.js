(function (wijmo, $, data) {
    'use strict';

    var grid = new wijmo.grid.FlexGrid('#fFlexGrid'),
        cv = new wijmo.collections.CollectionView(data.getData(100)),
        filterText = '';

    grid.itemsSource = cv;

    // keyup event handler for filter textbox
    $('#fFilter').on('keyup', function () {

        // get filter's text in lowercase
        filterText = $(this).val().toLowerCase();

        // refresh CollectionView
        cv.refresh();
    });

    // CollectionView filter
    cv.filter = function (item) {

        // always show data if the filter textbox is empty
        if (!filterText) {
            return true;
        }

        // compare CollectionView's data with filter text
        return item.country.toLowerCase().indexOf(filterText) > -1;
    };
})(wijmo, jQuery, appData);