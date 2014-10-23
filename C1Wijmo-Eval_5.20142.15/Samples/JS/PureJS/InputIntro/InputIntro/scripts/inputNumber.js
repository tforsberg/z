(function (wijmo) {
    'use strict';

    var inputNumber1 = new wijmo.input.InputNumber('#inInputNumber1'),
        inputNumber2 = new wijmo.input.InputNumber('#inInputNumber2'),
        inputNumber3 = new wijmo.input.InputNumber('#inInputNumber3'),
        inputNumber4 = new wijmo.input.InputNumber('#inInputNumber4');

    inputNumber1.value = 0;
    inputNumber1.format = 'n0';

    inputNumber2.value = Math.PI;
    inputNumber2.format = 'n';

    inputNumber3.value = 3.5;
    inputNumber3.format = 'c2';
    inputNumber3.step = 0.5;
    inputNumber3.min = 0;
    inputNumber3.max = 10;

    inputNumber4.placeholder = 'Enter a number...';
    inputNumber4.required = false;
    inputNumber4.value = null;
})(wijmo);