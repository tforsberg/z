function onCallbackSuccess(result) {

}

$(document).ready(function () {

    if ($(".wijmo-stylesheet-wijmo_theme")[0]) {
        if ($(".wijmo-stylesheet-wijmo_theme").attr("href").indexOf("WebResource") != -1) {
            $('#themeswitcher').val("http://cdn.wijmo.com/themes/rocket/jquery-wijmo.css");
        } else {
            $('#themeswitcher').val($(".wijmo-stylesheet-wijmo_theme").attr("href"));
        }
    }

    if ($('#themeswitcher')[0]) {
        $('#themeswitcher').bind("change", function () {
            $(".wijmo-stylesheet-wijmo_theme").attr("href", $(this).val());
            executeCallback("theme=" + $(this).val());
        }).wijdropdown();
    }

    if ($ && $.fn.wijsuperpanel) {
        $(".navigation").wijsuperpanel();
        $(".navigation").wijsuperpanel("refresh");
    }

    $('.wijmo-wijtabs:first').addClass('explore-tabs');

    $('.explore-tabs .ui-tabs-nav:first').addClass('ui-explore-tabs-nav');

    $('.ui-explore-tabs-nav li').addClass('explore-tabs-li');

    $('.ui-explore-tabs-nav .ui-tabs-selected').addClass('ui-explore-tabs-selected');


    //	var wijwidth = $('article .ui-widget').width();
    //	var wijheight = $('article .ui-widget').height();

    //	$('.widget-wrapper').css({
    //		'width': wijwidth
    //	});


    // page animation.
    //	$(".sample-list a").bind("click", function (e) {
    //		e.preventDefault();
    //		$("#sampleContainer").fadeOut(500, function () {
    //			window.location = $(e.target).attr("href");
    //		})
    //	})

    //$("#sampleContainer").css("opacity", 0).animate({ opacity: 1 }, 2000);

    //$('.sample-list').wijsuperpanel();
});