(function (wijmo, data) {
    'use strict';

    var autoComplete1 = new wijmo.input.AutoComplete('#acAutoComplete1'),
        autoComplete2 = new wijmo.input.AutoComplete('#acAutoComplete2');
    
    autoComplete1.itemsSource = data.countries;

    autoComplete2.itemsSource = data.countries;
    autoComplete2.cssMatch = 'highlight';   // CSS class for custom highlighting
})(wijmo, appData);