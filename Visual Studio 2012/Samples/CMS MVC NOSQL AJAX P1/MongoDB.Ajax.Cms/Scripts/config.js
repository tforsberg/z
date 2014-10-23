

$(function () {

    var __url = "";
    setInterval(function () {
        var h = $(window).height();

        var _heights = $('.col-left,.col-right').map(function () {
            return $(this).height();
        }).get();

        var _maxHeight = Math.max.apply(null, _heights);
        _maxHeight = Math.max(h, _maxHeight);


        $('.col-left,.col-right').height(_maxHeight);
        
        //
        //loadUrl();
    }, 500);

    function loadUrl() {

        var _u = window.location.href.replace(window.location.host, "").replace(window.location.protocol + "//", "");

        if (__url != "" && __url != _u) {
              __url = _u;
              $.Ajax.load(__url + '?f=1', { target: '#ajax-container' });
          
        }
    }
    

    $('.dropdown').dropdown({ when: 'click' });

    $('input.check-master').live('click', function () {
        $.toggleCheckbox($(this).is(':checked'));
    });

    // init grid
    $('.grid tr').live('click', function () {
        $(this).toggleClass('selected');
        $(this).find('input.selected').attr('checked', $(this).hasClass('selected'));

    });

    $('.menu-left a').bind('click', function (e) {
        e.preventDefault();
        $('.menu-left a.actived').removeClass('actived');
        $(this).addClass('actived');
    });

    $('a.ajax').live('click', function (e) {
        e.preventDefault();

        var _t = $(this);
        var _data = _t.metadata({ type: 'attr', name: 'data-ajax' });
        if (_data.target == "#ajax-container") {
            __url = _t.attr('href');
        }
        if (_t.hasClass('confirm')) {

            $.KoolBox.confirm(_t.attr("title"), { title: 'Confirm' }, function (r) {

                if (r) {
                    $.Ajax.load(_t.attr('href'), _data);
                }

            });
        } else {
            
            $.Ajax.load(_t.attr('href'), _data);
        }

      

    });

    $('a.timer').live('click', function (e) {
        e.preventDefault();

        if (!$(this).hasClass('running')) {

            $(this).addClass('running').find('.ico-16').removeClass('alarm').addClass('accept');
            _timer = setInterval(function () {
                if ($('a.timer').hasClass('running')) {
                    $('#_fsearch').submit();
                } else {
                    clearInterval(_timer);
                }

            }, 10000);
        } else {

            $(this).removeClass('running').find('.ico-16').removeClass('accept').addClass('alarm');;
            clearInterval(_timer);
        }

    });

    $('input.search').live('keydown', function (e) {

        var _code = (e.keyCode ? e.keyCode : e.which);
        if (_code == 13) {
            $('#pageIndex').val(1);
            $('#_fsearch').submit();
        }

    });

    $('a.ajax-page').live('click', function (e) {
        e.preventDefault();
        $('#pageIndex').val($(this).attr('rel'));
        $('#_fsearch').submit();

    });

    $('.btn-refresh,.btn-search').live('click', function (e) {
        e.preventDefault();
        $('#_fsearch').submit();
    });

    $('.btn-gear').live('click', function (e) {
        e.preventDefault();
        $('#search').slideToggle();

    });

    $('.window').live('click', function (e) {
        e.preventDefault();

        var _t = $(this);
        var _o = _t.metadata({ type: 'attr', name: 'data-window' });

        if (_t.attr('href')) {
            $.extend(_o, { url: _t.attr('href'), type: 'ajax' });
        }

        new $.Window(_o);


    });


    $('form.ajax').live('submit', function () {

        $.Ajax.submit($(this));

        return false;

    });


    $(window).bind('keypress, keydown', function (e) {


        var _code = (e.keyCode ? e.keyCode : e.which);

        // alert(_code);

        if (!(/textarea|select/i.test(e.target.nodeName) || e.target.type === "text")) {



            if (e.ctrlKey && _code == 17) {
                //  $.xfm.selectAll();
            }
            //alert(_code);

            switch (_code) {
                case 38:
                    //  $.xfm.focus('up');
                    break;
                case 40:
                    // $.xfm.focus('down');
                    break;

                case 46:
                    var _items = $.getItemsSelected();

                    if (_items.length > 0) {
                        $.KoolBox.confirm("Are you want to delete all selected item", { title: 'Message Box' }, function (r) {
                            if (r) {

                                $('#_fgrid').submit();
                            }

                        });
                    } else {

                        $.KoolBox.alert("You must select one item for action", { title: "Message Box" });

                    }



                    break;

                    /*   case 116:
                         //  $.xfm.refresh();
                           break;*/

                case 85:
                    //$.xfm.upload();
                    break;

                case 90:
                    //$.xfm.action('zoom');
                    break;

                case 67:
                    //  $.xfm.action('crop');
                    break;

                    /* case 13:
                         //   $.xfm.selectCurrent();
                         break;*/
            }

        }
    });


});

