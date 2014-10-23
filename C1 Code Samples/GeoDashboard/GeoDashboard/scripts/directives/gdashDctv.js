// retrieve 'gdash' module (defined in gdashApp.js)
// NOTE: do not specify a dependency array here, that should only be done in the module declaration.
angular.module("gdash")

// gdash utilities
.factory("gdashUtil", function () {
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
                            scope.updateTimeout = setTimeout(fn, 50);
                        } else {
                            fn();
                        }
                    }
                }, true) // compare by content since the scope may have changeable arrays
            }
            if (updateOnResize) {
                $(window).resize(function () {
                    if (scope.resizeTimeout) clearTimeout(scope.resizeTimeout);
                    scope.resizeTimeout = setTimeout(fn, 100);
                })
            }
        }
    }
})

// ** gdash-tile directive
// - frame for tile content.
// - provides a header and a click event.
.directive("gdashTile", function () {
    return {
        restrict: "E",
        transclude: true,
        replace: true,
        scope: {
            header: "@",
            click: "&"
        },
        template:
            "<div class='tile' style='float:left'>" +
            "  <strong>{{header}}</strong>" +
            "  <div ng-transclude></div>" +
            "</div>",
        link: function (scope, element, attrs) {
            element.click(function () {

                // invoke event handler
                if (scope.click) scope.click();

                // select this tile and un-select all others
                var tiles = $(element.parent()).children();
                $(tiles).css("box-shadow", "");
                element.css("box-shadow", "2px 2px 12px black");
            });
        }
    }
})

// ** gdash-enter directive
// - invokes a method when the enter key is pressed on the parent element.
.directive("gdashEnter", function () {
    return {
        restrict: "A",
        link: function (scope, element, attrs) {
            element.keypress(function (event) {
                if (event.which == 13 && attrs.gdashEnter) {
                    scope.$eval(attrs.gdashEnter);
                    event.preventDefault();
                }
            })
        }
    }
})

// ** gdash-slider directive
// - slider to show index values.
// - css is all internal to make the directive self-contained.
.directive("gdashSlider", function () {
    return {
        restrict: "E",
        scope: {
            value: "@",
            color: "@"
        },
        template:
            "<div style='height: 34px'>" +
            "  <div style='width:230px; height:1px; background:gray; position:relative;	top:50%'>" +
            "    <div style='text-align:center; border-radius:5px; width:10px; height:10px; background:#d2d1cf; position:relative; left:50%; top:-5px;'></div>" +
            "    <div id='marker' ng-style='{background:color}' style='text-align:center; border-radius:30px; width:30px; height:30px; line-height:30px; background:black; color:white; position:relative; top:-25px; left:25%'>" +
            "      {{value}}" +
            "    </div>" +
            "  </div>" +
            "</div>",
        link: function (scope, element, attrs) {

            // update slider position when value changes
            scope.$watch("value", function () {

                // calculate slider position (as a percentage)
                var value = Math.log(scope.value / 100);
                value = Math.min(Math.max(value, -1.5), +1.5);
                value = (value + 1.5) / 3;

                // convert to pixels
                value = value * 230 - 15;

                // apply position
                var e = element.find("#marker");
                e.css("left", value + "px");
            });
        }
    }
})

// ** gdash-gauge directive
// - wraps a wijradialgauge widget.
// - exposes value, max, and color properties.
// - configures the gauge to show a quarter circle (NW quadrant).
.directive("gdashGauge", function ($rootScope, gdashUtil) {
    return {
        restrict: "E",
        replace: true,
        scope: {
            value: "@",
            max: "@",
            color: "@"
        },
        template:
            "<div></div>",
        link: function (scope, element, attrs) {

            // watch for changes in the scope variables
            gdashUtil.watchScope(scope, ["value", "max", "color"], updateControl);

            // update the control when the scope variables change
            function updateControl() {
                var options = {
                    value: scope.value * 1,
                    cap: { radius: 7, style: { fill: 'black', stroke: 'none'} },
                    pointer: { style: { fill: 'black', stroke: 'none'} },
                    face: { style: { fill: 'none', stroke: 'none'} },
                    startAngle: 0,
                    sweepAngle: 90,
                    min: 0,
                    max: scope.max * 1,
                    tickMajor: { interval: 100000, style: { fill: 'none', stroke: 'none'} },
                    tickMinor: { interval: 50000, style: { fill: 'none', stroke: 'none'} },
                    labels: { format: function (val) { return Globalize.format(val / 1000, 'n0') + 'k' } },
                    origin: { x: 0.8, y: 0.8 },
                    height: 140,
                    width: 230,
                    radius: 125,
                    //animation: { enabled: false },
                    ranges: [
                        {
                            startValue: 0,
                            endValue: scope.max * 1,
                            startWidth: 24,
                            endWidth: 24,
                            startDistance: 0.5,
                            endDistance: 0.5,
                            style: { fill: '#ccc', stroke: 'none', opacity: 0.4 }
                        }, {
                            startValue: 0,
                            endValue: scope.value * 1,
                            startWidth: 24,
                            endWidth: 24,
                            startDistance: 0.5,
                            endDistance: 0.5,
                            style: { fill: scope.color, stroke: 'none' }
                        }]
                };

                // update/recreate the control
                element.wijradialgauge(options);
            }
        }
    }
})

// ** gdash-barchart directive
// - wraps a wijbarchart widget.
// - supports bar and column charts.
// - automatically reverses the data order for bar charts.
// - provides a custom formatted hint for the data points.
.directive("gdashBarchart", function ($rootScope, gdashUtil) {
    return {
        restrict: "E",
        replace: true,
        scope: {
            data: "=",          // array that contains the data for the chart.
            x: "@",             // property that contains the X values.
            y: "@",             // property that contains the Y values.
            hint: "@",          // format used for the element hints (use {x}, {y}, and {y%} to replace x, y, and y% values)
            color: "@",         // color of the chart elements.
            column: "@",        // whether the chart is a column chart (as opposed to a bar chart).
            width: "@",         // width of the chart in pixels.
            height: "@"         // height of the chart in pixels.
        },
        template:
            "<div></div>",
        link: function (scope, element, attrs) {

            // watch for changes in the scope variables
            gdashUtil.watchScope(scope, ["data", "x", "y", "color", "column", "width", "height"], updateControl, true);
            
            // update the control when any of the scope parameters change
            function updateControl() {

                // check that we have all the data we need
                if (!scope.data || !scope.x || !scope.y) {
                    return;
                }

                // remove old chart if any
                if (element.data().wijbarchart) {
                    element.data().wijbarchart.destroy();
                }

                // digest scope variables
                var data = scope.data;
                if (angular.isString(data)) data = scope.$eval(data);
                var horizontal = !scope.column || scope.column != "true";

                // reverse data in bar charts
                if (horizontal) {
                    var rev = [];
                    for (var i = data.length - 1; i >= 0; i--)
                        rev.push(data[i]);
                    data = rev;
                }

                // use elemen font in the chart
                var fontFamily = element.css("fontFamily");
                var fontSize = element.css("fontSize");
                var textStyle = {
                    "font-family": fontFamily,
                    "font-size": fontSize,
                    "font-weight": "normal",
                    fill: "black"
                };

                // build options
                var options = {
                    dataSource: data,
                    seriesList: [
                        { data: { x: { bind: scope.x }, y: { bind: scope.y}} }
                    ],
                    width: scope.width ? scope.width * 1 : 250,
                    height: scope.height ? scope.height * 1 : data.length * 35 + 30,
                    horizontal: horizontal,
                    seriesStyles: [{ fill: scope.color, stroke: 'none'}],
                    clusterWidth: 80,
                    legend: { visible: false },
                    showChartLabels: false,
                    axis: {
                        x: { textVisible: horizontal, labels: { style: textStyle} },
                        y: { textVisible: !horizontal, labels: { style: textStyle }, annoFormatString: "n0" }
                    },
                    //animation: { enabled: false },
                    textStyle: textStyle
                };

                // customize hints
                if (scope.hint) {
                    options.hint = {
                        style: { fill: "white", "fill-opacity": .9, stroke: "black" },
                        contentStyle: { fill: "black", "font-size": fontSize, "font-family": fontFamily },
                        content: function () {

                            // note: Angular treats "\n" as a regular string, not as a line break 
                            // which is what we really want, so replace it here.
                            var text = replaceAll(scope.hint, "\\n", "\n")
                            text = replaceAll(text, "{x}", this.x);
                            text = replaceAll(text, "{y}", Globalize.format(this.y, "n0"));
                            text = replaceAll(text, "{y%}", Globalize.format(this.y / sum(this.data.data.y) * 100, "n0") + "%");
                            return text;
                        }
                    };
                }

                // create the chart
                element.wijbarchart(options);
            }

            // replace all occurrences of a string with another
            function replaceAll(str, find, replace) {
                for (var i = 0; i < 20 && str.indexOf(find) > -1; i++) {
                    str = str.replace(find, replace);
                }
                return str;
            }

            // sum all numbers in an array
            function sum(arr) {
                var total = 0;
                for (var i = 0; i < arr.length; i++)
                    total += arr[i];
                return total;
            }
        }
    }
});
