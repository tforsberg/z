(function (wijmo, data) {
    'use strict';

    var grid = new wijmo.grid.FlexGrid('#csFlexGrid'),
        cv = new wijmo.collections.CollectionView(data.getData(100));

    grid.initialize({
        autoGenerateColumns: false,
        columns: [
            { header: 'Country', binding: 'country', width: '*', isContentHtml: true, isReadOnly: true },
            { header: 'Date', binding: 'date' },
            { header: 'Revenue', binding: 'amount', format: 'n0' },
            { header: 'Active', binding: 'active' },
        ],
        itemsSource: cv,
        itemFormatter: function (panel, r, c, cell) {

            // validate CellType and if correct column
            if (wijmo.grid.CellType.Cell === panel.cellType &&
                'amount' === panel.columns[c].binding) {

                // get the cell's data
                var cellData = panel.getCellData(r, c);

                // set cell's foreground color
                cell.style.color = getAmountColor(cellData);
            }
        }
    });

    function getAmountColor(amount) {

        // convert to number if not already a number
        amount = wijmo.changeType(amount, wijmo.DataType.Number);

        // ensure that conversion was a success
        if (wijmo.isNumber(amount)) {

            // return a color
            if (amount < 500) return 'red';
            if (amount < 2500) return 'black';
            return 'green';
        }
    }
})(wijmo, appData);