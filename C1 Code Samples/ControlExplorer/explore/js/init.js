function onCallbackSuccess(result) {

}

$(document).ready(function () {

    if ($(".wijmo-stylesheet-wijmo_theme")[0]) {
        if ($(".wijmo-stylesheet-wijmo_theme").attr("href").indexOf("WebResource") != -1) {
            $('#themeswitcher').val("http://cdn.wijmo.com/themes/cobalt/jquery-wijmo.css");
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

    $('.wijmo-wijtabs:first').addClass('explore-tabs');

    $('.explore-tabs .ui-tabs-nav:first').addClass('ui-explore-tabs-nav');

    $('.ui-explore-tabs-nav li').addClass('btn btn-default explore-tabs-li');

    $('.ui-explore-tabs-nav .ui-tabs-selected').addClass('ui-explore-tabs-selected');
});