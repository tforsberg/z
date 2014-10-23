(function (wijmo, data) {
    'use strict';

    var grid = new wijmo.grid.FlexGrid('#smFlexGrid'),
        menu = new wijmo.input.Menu('#smMenu'),
        cv = new wijmo.collections.CollectionView(data.getData(100));

    grid.itemsSource = cv;
    updateMenuHeader();

    menu.selectedIndexChanged.addHandler(function (sender) {

        // update FlexGrid's selectionMode when the menu selection changes
        grid.selectionMode = sender.selectedValue;

        updateMenuHeader();
    });

    // update menu header
    function updateMenuHeader() {
        menu.header = '<b>Selection Mode:</b> ' + menu.text;
    }    
})(wijmo, appData);