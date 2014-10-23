// ** invx module
// AngularJS directives for Invexplorer application.
// ** requires Wijmo
// <link href="http://cdn.wijmo.com/themes/aristo/jquery-wijmo.css"
//       type="text/css" rel="stylesheet" />
// <link href="http://cdn.wijmo.com/jquery.wijmo-pro.all.3.20131.2.min.css"
//       type="text/css" rel="stylesheet" />
// <script src="http://cdn.wijmo.com/jquery.wijmo-open.all.3.20131.2.min.js" 
//       type="text/javascript"></script>
// <script src="http://cdn.wijmo.com/jquery.wijmo-pro.all.3.20131.2.js" 
//       type="text/javascript"></script>
angular.module("invx", []);

// utilities
angular.module("invx").factory("invxUtil", function () {
    return {

        // watch for changes in scope variables, call update function when all have been initialized
        watchScope: function (scope, props, fn, updateOnTimer, updateOnResize) {
            var cnt = props.length;
            for (var i = 0; i < props.length; i++) {
                scope.$watch(props[i], function () {
                    cnt--;
                    if (cnt <= 0) {
                        if (updateOnTimer) {
                            if (scope.updateTimeout) clearTimeout(scope.updateTimeout);
                            scope.updateTimeout = setTimeout(fn, 10);
                        } else {
                            fn();
                        }
                    }
                })
            }
            if (updateOnResize) {
                $(window).resize(function () {
                    if (scope.resizeTimeout) clearTimeout(scope.resizeTimeout);
                    scope.resizeTimeout = setTimeout(fn, 100);
                })
            }
        },

        // set an undefined scope variable to a default value
        setDefVal: function (scope, prop, defaultValue) {
            if (!scope[prop] || scope[prop] != defaultValue) {
                scope[prop] = defaultValue;
            }
        },

        // set an undefined scope variable to a default value
        apply: function (scope, prop, value) {
            if (scope[prop] != value) {
                scope[prop] = value;
                if (!scope.$$phase) scope.$apply(prop);
            }
        }
    }
});

// directive for jQueryUI autocomplete widget
angular.module("invx").directive("invxAutocomplete", function ($rootScope, invxUtil) {
    return {
        restrict: "E",
        replace: true,
        template: "<input/>",
        scope: {
            html: "@",          // Whether to display drop-down items as html (defaults to true).
            autoFocus: "@",     // Whether to focus on control when drop-down items appear (defaults to true).
            minLength: "@",     // Minimum input length to start matching (defaults to 2).
            delay: "@",         // Delay in milliseconds before starting a new search (defaults to 300).
            source: "&",        // Drop-down item source function.
            select: "&"         // Select function.
        },
        link: function (scope, element, attrs) {

            // update the control when scope parameters are updated
            var arr = ["html", "autoFocus", "minLength", "delay", "source", "select"];
            invxUtil.watchScope(scope, arr, updateControl, true);

            // udpate auto-complete control
            function updateControl() {

                // set default values
                invxUtil.setDefVal(scope, "html", true);
                invxUtil.setDefVal(scope, "autoFocus", true);
                invxUtil.setDefVal(scope, "minLength", 2);
                invxUtil.setDefVal(scope, "delay", 300);

                // build options object
                // list of valid options can be found here:
                //   http://api.jqueryui.com/autocomplete/#method-search
                var options = {
                    autoFocus: scope.$eval(scope.autofocus),
                    delay: scope.delay * 1,
                    source: scope.source(),
                    select: scope.select()
                };

                // create autocomplete widget with given options
                element.autocomplete(options);

                // render items in drop-down as html
                // http://stackoverflow.com/questions/3488016/using-html-in-jquery-ui-autocomplete
                if (scope.html) {
                    element.data("autocomplete")._renderItem = renderItem;
                }
            }

            // render items in drop-down as html
            function renderItem(ul, item) {
                return $("<li></li>")
                    .data("item.autocomplete", item)
                    .append("<a>" + item.label + "</a>")
                    .appendTo(ul);
            }
        }
    }
});

// directive for Wijmo chart widget
angular.module("invx").directive("invxChart", function ($rootScope, invxUtil) {
    return {
        restrict: "E",
        replace: true,
        template: "<div></div>",
        scope: {
            seriesList: "=",        // List of data series to show on the chart.
            seriesStyles: "=",      // List of styles to use for the data series.
            seriesHoverStyles: "=", // List of styles to use when the mouse hovers over the series.
            width: "@",             // Chart width in pixels (defaults to 600).
            height: "@",            // Chart height in pixels (defaults to 300).
            formatX: "@",           // Format to use for X values in axis annotations and tooltips.
            formatY: "@"            // Format to use for X values in axis annotations and tooltips.
        },
        link: function (scope, element, attrs) {

            // update the control when scope parameters are updated
            var arr = ["seriesList", "seriesStyles", "seriesHoverStyles", "delay", "source", "select"];
            invxUtil.watchScope(scope, arr, updateControl, true);

            // udpate auto-complete control
            function updateControl() {

                // set default values
                invxUtil.setDefVal(scope, "width", 600);
                invxUtil.setDefVal(scope, "height", 300);
                invxUtil.setDefVal(scope, "formatX", "dd-MMM-yy");
                invxUtil.setDefVal(scope, "formatY", "p0");

                // build options
                var options = {
                    seriesList: scope.seriesList,
                    seriesStyles: scope.seriesStyles,
                    seriesHoverStyles: scope.seriesHoverStyles,
                    width: scope.width * 1,
                    height: scope.height * 1,
                    showChartLabels: false,
                    animation: { enabled: false },
                    seriesTransition: { enabled: false },
                    legend: { visible: false },
                    axis: {
                        x: { annoFormatString: scope.formatX },
                        y: { annoFormatString: scope.formatY }
                    },
                    hint: {
                        content: function () {
                            return this.label + ": " + 
                                Globalize.format(this.x, scope.formatX) + "\n" +
                                Globalize.format(this.y, scope.formatY);
                        },
                        contentStyle: { fill: "black" }, // foreground
                        style: { fill: "white", "fill-opacity": .9 } // background
                    }
                };

                // create chart
                element.wijlinechart(options);
            }
        }
    }
});
