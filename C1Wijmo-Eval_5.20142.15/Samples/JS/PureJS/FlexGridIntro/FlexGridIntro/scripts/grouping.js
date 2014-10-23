(function (wijmo, data) {
    'use strict';

    var grid = new wijmo.grid.FlexGrid('#gFlexGrid'),
        menu = new wijmo.input.Menu('#gMenu'),
        cv = new wijmo.collections.CollectionView(data.getData(100));

    grid.initialize({
        autoGenerateColumns: false,
        columns: [
            { header: 'Country', binding: 'country', width: '*' },
            { header: 'Date', binding: 'date' },
            { header: 'Revenue', binding: 'amount', format: 'n0' }
        ],
        itemsSource: cv
    });

    updateMenuHeader();

    // handle the Menu control's selectedIndexChanged event
    menu.selectedIndexChanged.addHandler(function (sender) {

        // menu's selected value
        var groupBy = sender.selectedValue;

        // clear current groups
        cv.groupDescriptions.clear();

        if (groupBy) {
            var groupNames = groupBy.split(',');
            for (var i = 0; i < groupNames.length; i++) {
                var groupName = groupNames[i];

                if (groupName == 'date') {

                    // group dates by year
                    var groupDesc = new wijmo.collections.PropertyGroupDescription(groupName, function (item, prop) {
                        return item.date.getFullYear();
                    });

                    cv.groupDescriptions.push(groupDesc);
                }
                else if (groupName == 'amount') {
                    // group amounts in ranges
                    var groupDesc = new wijmo.collections.PropertyGroupDescription(groupName, function (item, prop) {
                        return item.amount >= 5000 ? '> 5,000' : item.amount >= 500 ? '500 to 5,000' : '< 500';
                    });

                    cv.groupDescriptions.push(groupDesc);
                }
                else {

                    // group everything else by value
                    var groupDesc = new wijmo.collections.PropertyGroupDescription(groupName);
                    cv.groupDescriptions.push(groupDesc);
                }
            }            
        }

        updateMenuHeader();
    });

    // update menu header
    function updateMenuHeader() {
        menu.header = '<b>Group By:</b> ' + menu.text;
    }
})(wijmo, appData);