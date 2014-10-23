(function (wijmo, $, data) {
    'use strict';

    var listBox = new wijmo.input.ListBox('#lbListBox');
    listBox.selectedIndexChanged.addHandler(selectedIndexChanged);
    listBox.itemsSource = data.cities;

    // selectedIndexChanged event handler
    function selectedIndexChanged(sender) {

        // set selectedIndex and selectedValue text
        $('#lbSelIdx').text(sender.selectedIndex);
        $('#lbSelVal').text(sender.selectedValue);
    }
})(wijmo, jQuery, appData);