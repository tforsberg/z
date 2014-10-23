(function (wijmo) {
    'use strict';

    var inputNumber = new wijmo.input.InputNumber('#gsInputNumber');
    inputNumber.value = 3.5;
    inputNumber.step = 0.5;
    inputNumber.format = 'n';
})(wijmo);