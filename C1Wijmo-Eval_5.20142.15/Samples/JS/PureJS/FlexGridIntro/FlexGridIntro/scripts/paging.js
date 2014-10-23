(function (wijmo, $, data) {
    'use strict';

    var grid = new wijmo.grid.FlexGrid('#pFlexGrid'),
        cv = new wijmo.collections.CollectionView(data.getData(100));

    grid.itemsSource = cv;
    cv.pageSize = 10; // set collectionView's pageSize

    // init pager
    updatePager();

    // click handler for pager buttons
    $('#pPager button').on('click', function () {
        // update pager
        updatePager($(this).data('action'));
    });

    // disable/enable buttons and update display text for pager
    function updatePager(action) {

        // get buttons by id
        var $display = $('#pn'),
            $fb = $('#pfb'), $sb = $('#psb'),
            $sf = $('#psf'), $ff = $('#pff'),
            enableBackwards = false,
            enableForwards = false;

        // handle pager operation based on button's attribute
        switch (action) {
            case 'fast-backward':
                cv.moveToFirstPage();
                break;
            case 'step-backward':
                cv.moveToPreviousPage();
                break;
            case 'step-forward':
                cv.moveToNextPage();
                break;
            case 'fast-forward':
                cv.moveToLastPage();
                break;
        }

        // update the pager text
        $display.text((cv.pageIndex + 1) + ' / ' + (cv.pageCount));

        // determine which pager buttons to enable/disable
        enableBackwards = cv.pageIndex <= 0;
        enableForwards = cv.pageIndex >= cv.pageCount - 1;

        // enable/disable pager buttons
        $fb.prop('disabled', enableBackwards);
        $sb.prop('disabled', enableBackwards);
        $sf.prop('disabled', enableForwards);
        $ff.prop('disabled', enableForwards);
    }
})(wijmo, jQuery, appData);