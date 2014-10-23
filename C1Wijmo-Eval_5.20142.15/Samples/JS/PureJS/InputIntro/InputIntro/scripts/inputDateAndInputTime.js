(function (wijmo, $) {
    'use strict';

    var inputDate = new wijmo.input.InputDate('#iditInputDate'),
        inputTime = new wijmo.input.InputTime('#iditInputTime'),
        today = new Date(),
        minDate = new Date(today.getFullYear(), 0, 1),
        maxDate = new Date(today.getFullYear(), 11, 31),
        minTime = new Date(0, 0, 0, 7, 0, 0, 0),
        maxTime = new Date(0, 0, 0, 19, 0, 0, 0);

    inputTime.valueChanged.addHandler(valueChanged);
    inputDate.valueChanged.addHandler(valueChanged);

    inputDate.value = today;
    inputDate.min = minDate;
    inputDate.max = maxDate;
    inputDate.format = 'MMM dd, yyyy';

    inputTime.value = today;
    inputTime.min = minTime;
    inputTime.max = maxTime;
    inputTime.step = 15;

    // valueChanged event handler
    function valueChanged() {

        // get new date from the two controls using Wijmo utility functions
        var val = wijmo.DateTime.fromDateTime(inputDate.value, inputTime.value);

        // format and display the new date
        $('#iditSelectedValue').text(wijmo.Globalize.format(val, 'MMM dd, yyyy h:mm:ss tt'));
    }
})(wijmo, jQuery);