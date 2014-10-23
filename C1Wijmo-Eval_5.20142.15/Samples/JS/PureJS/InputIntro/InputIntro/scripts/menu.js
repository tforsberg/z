(function (wijmo) {
    'use strict';

    var fileMenu = new wijmo.input.Menu('#mFileMenu'),
        editMenu = new wijmo.input.Menu('#mEditMenu'),
        cmdMenu = new wijmo.input.Menu('#mCmdMenu'),
        inputNumber = new wijmo.input.InputNumber('#mInputNumber');

    fileMenu.header = 'File';
    fileMenu.itemClicked.addHandler(itemClicked);

    editMenu.header = 'Edit';
    editMenu.itemClicked.addHandler(itemClicked);

    cmdMenu.header = 'Change Tax';

    // set command object for the command menu
    cmdMenu.command = {
        executeCommand: function (arg) {

            // convert argument to Number
            arg = wijmo.changeType(arg, wijmo.DataType.Number);

            // check if the conversion was successful
            if (wijmo.isNumber(arg)) {

                // update the value
                inputNumber.value += arg;
            }
        },
        canExecuteCommand: function (arg) {

            // convert argument to Number
            arg = wijmo.changeType(arg, wijmo.DataType.Number);

            // check if the conversion was successful
            if (wijmo.isNumber(arg)) {
                var val = inputNumber.value + arg;

                // check if the value is valid
                return val >= 0 && val <= 1;
            }

            return false;
        }
    };

    inputNumber.value = 0.07;
    inputNumber.step = 0.05;
    inputNumber.format = 'p0';
    inputNumber.min = 0;
    inputNumber.max = 1;

    // itemClicked event handler for File and Edit menus
    function itemClicked(sender) {
        alert('You\'ve selected option ' + sender.selectedIndex + ' from the ' + sender.header + ' menu!');
    }
})(wijmo);