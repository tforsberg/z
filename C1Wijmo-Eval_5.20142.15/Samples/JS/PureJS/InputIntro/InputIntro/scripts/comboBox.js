(function (wijmo, data) {
    'use strict';

    var comboBox1 = new wijmo.input.ComboBox('#cbComboBox1'),
        comboBox2 = new wijmo.input.ComboBox('#cbComboBox2');

    comboBox1.itemsSource = data.countries;
    comboBox1.isEditable = false;

    comboBox2.itemsSource = data.countries;
    comboBox2.isEditable = true;
})(wijmo, appData);