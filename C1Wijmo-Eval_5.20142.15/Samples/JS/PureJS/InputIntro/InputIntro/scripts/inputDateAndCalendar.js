(function (wijmo, $) {
    'use strict';

    var inputDate = new wijmo.input.InputDate('#idcInputDate'),
        calendar = new wijmo.input.Calendar('#idcCalendar'),
        today = new Date(),
        minDate = new Date(today.getFullYear(), 0, 1),
        maxDate = new Date(today.getFullYear(), 11, 31),
        format = 'MMM d, yyyy';

    inputDate.value = today;
    inputDate.min = minDate;
    inputDate.max = maxDate;
    
    calendar.value = today;
    calendar.min = minDate;
    calendar.max = maxDate;

    // set current date range values below the example
    $('#idcMinDate').text(wijmo.Globalize.format(minDate, format));
    $('#idcMaxDate').text(wijmo.Globalize.format(maxDate, format));
})(wijmo, jQuery);