// ** dash module
// AngularJS directives for Dashboard components, including bulletChart, sparkline, gauge, and chart.
// ** requires Wijmo
// <link href="http://cdn.wijmo.com/themes/aristo/jquery-wijmo.css" rel="stylesheet" type="text/css" />
// <link href="http://cdn.wijmo.com/jquery.wijmo-pro.all.3.20131.2.min.css" rel="stylesheet" type="text/css" />
// <script src="http://cdn.wijmo.com/jquery.wijmo-open.all.3.20131.2.min.js" type="text/javascript"></script>
// <script src="http://cdn.wijmo.com/jquery.wijmo-pro.all.3.20131.2.js" type="text/javascript"></script>
angular.module("dash", []);

// dash utilities
angular.module("dash").factory("dashUtil", function () {
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
            if (!scope[prop] && scope[prop] != defaultValue) {
                scope[prop] = defaultValue;
                if (!scope.$$phase) scope.$apply(prop);
            }
        },

        // select placement for popovers/tooltips (avoid window edges)
        getPopupPlacement: function (element) {
            var rc = element[0].getBoundingClientRect();
            var height = $(window).height();
            return rc.top < height - rc.bottom ? "bottom" : "top";
        },

        // get content for popovers/tooltips (textual or lookup)
        getContent: function (content) {

            // if content starts with '#', look it up in other elements
            content = content.toString();
            if (content != null && content[0] == "#") {
                var el = $(content);
                if (el != null && el.length > 0) {
                    return el.html();
                }
            }

            // plain content
            return content;
        }
    }
});

// ** dash-popover directive
// - Shows extra information about an element in a tooltip-style popup with a header.
// - Auto-positions pop-overs to avoid clipping near the edges of the screen.
// - Supports html and document elements in the pop-over.
// - Automatically switches default trigger on desktop and touch devices (hover/click).
// ** example
// <div>
//   This is regular text, but 
//   <dash-popover html="true" header="<b>title<b>" content="detail with <b>HTML</b> goes here" >
//     this has a pop-over
//   </dash-popover>
//   and this is regular text again...</div>
// ** see
// - Bootstrap popovers: http://twitter.github.io/bootstrap/javascript.html#popovers
angular.module("dash").directive("dashPopover", function ($rootScope, dashUtil) {
    return {
        restrict: "E",
        transclude: true,
        scope: {
            header: "@",    // Pop-over header.
            content: "@",   // Pop-over content.
            html: "@",      // Whether the header and content are html or plain text.
            trigger: "@"    // When to display the pop-over (by default, the trigger is 'hover' on the desktop and 'click' on mobile devices).
        },
        template: "<a ng-transclude></a>",
        link: function (scope, element, attrs) {

            // listen to changes in attributes and update the control
            var arr = ["header", "content", "html", "trigger"];
            for (var i = 0; i < arr.length; i++) {
                scope.$watch(arr[i], updateControl, true);
            }

            // update control parameters
            function updateControl() {
                var options = {
                    title: getTitle,
                    content: getContent,
                    placement: getPlacement,
                    trigger: scope.trigger ? scope.trigger : isMobile() ? "click" : "hover",
                    html: scope.html ? scope.$eval(scope.html) : true
                };
                element.popover(options);
            }

            // check whether we are running on a mobile device
            // http://stackoverflow.com/questions/11381673/javascript-solution-to-detect-mobile-browser
            function isMobile() {
                return window.orientation != null;
            }

            // get popover title
            function getTitle() {
                return scope.header;
            }

            // get popover content
            function getContent() {
                return dashUtil.getContent(scope.content);
            }

            // get popover placement to avoid showing off-screen
            function getPlacement() {
                return dashUtil.getPopupPlacement(element);
            }
        }
    };
});

// ** dash-bullet directive
// - implements a bullet graph as described in Stephen Few's "Information Dashboard Design" book.
// - the chart consists of bars that show different performance levels as well as target and actual values.
// - implemented using the wijlineargauge widget.
// ** example
// <dash-bullet 
//   actual="{{p.sales.qThis}}"
//   target="{{p.levels.targe}}t"
//   poor="{{p.levels.poor}}"
//   satisfactory="{{p.levels.satisfactory}}"
//   good="{{p.levels.good}}"
//   max="{{p.levels.good}}" >
// </dash-bullet>
// ** see
// - Bullet graph design spec: http://www.perceptualedge.com/articles/misc/Bullet_Graph_Design_Spec.pdf
// - Stephen Few's book: http://www.amazon.com/Information-Dashboard-Design-Effective-Communication/dp/0596100167
// - Wijmo: http://wijmo.com
// - Wijmo linear gauge: http://wijmo.com/wiki/index.php/Lineargauge#API
angular.module("dash").directive("dashBullet", function ($rootScope, dashUtil) {
    return {
        restrict: "E",
        scope: {
            good: "@",              // Level considered good.
            satisfactory: "@",      // Level considered satisfactory (less than good).
            poor: "@",              // Level considered poor (less than satisfatory).
            actual: "@",            // Actual level.
            target: "@",            // Target level.
            max: "@",               // Maximum value to use for scaling the bullet graph.
            width: "@",             // Bullet graph width in pixels.
            height: "@"             // Bullet graph height in pixels.
        },
        template:
            "<div style='display:inline' ></div>",
        link: function (scope, element, attrs) {

            // listen to changes in attributes and update the control
            var arr = ["good", "satisfactory", "poor", "actual", "target", "max", "width", "height"];
            dashUtil.watchScope(scope, arr, updateControl, true);

            // update the control
            function updateControl() {

                // build options
                var options = {
                    value: scope.target * 1,
                    min: 0,
                    max: scope.max * 1,
                    ranges: [
                        createRange(scope.good, 0.1),
                        createRange(scope.satisfactory, 0.2),
                        createRange(scope.poor, 0.4),
                        createRange(scope.actual, 0.95, true)
                    ],
                    animation: { enabled: false },
                    marginLeft: 0, marginRight: 0, marginTop: 0, marginBottom: 0,
                    pointer: { length: 1, shape: "rect", style: { fill: "black", stroke: "none"} },
                    face: { style: { fill: "none", stroke: "none"} },
                    labels: { visible: false },
                    tickMajor: { visible: false },
                    tickMinor: { visible: false }
                };

                // set widget size
                options.width = scope.width ? scope.width : element.width() > 0 ? element.width() : 200;
                options.height = scope.height ? scope.height : element.height() > 0 ? element.height() : 16;

                // build widget
                element.wijlineargauge(options);
            }
            function createRange(value, opacity, center) {
                var range = {
                    startValue: 0,
                    endValue: value * 1,
                    startWidth: 1, endWidth: 1,
                    startDistance: 1, endDistance: 1,
                    style: { fill: 'grey', stroke: 'none', opacity: opacity * 1 }
                };
                if (center) {
                    range.startWidth = 0.3;
                    range.endWidth = 0.3;
                    range.startDistance = 0.65;
                    range.endDistance = 0.65;
                }
                return range;
            }
        }
    };
});
// ** dash-bullet-legend directive
// - shows a static legend describing the meaning of the bullet graph ranges
// ** example
// <dash-bullet-legend class="text-info text-right" style="float:right"></dash-bullet-legend>
angular.module("dash").directive("dashBulletLegend", function () {
    return {
        restrict: "E",
        template:
            "<div>" +
            "<span style='background:rgba(0,0,0,1)'>&nbsp;</span> Target &nbsp;&nbsp;" +
            "<span style='background:rgba(0,0,0,0.95)'>&nbsp;&nbsp;</span> Actual &nbsp;&nbsp;" +
            "<span style='background:rgba(0,0,0,0.4)'>&nbsp;&nbsp;&nbsp;</span> Poor &nbsp;&nbsp;" +
            "<span style='background:rgba(0,0,0,0.2)'>&nbsp;&nbsp;&nbsp;</span> Satisfactory &nbsp;&nbsp;" +
            "<span style='background:rgba(0,0,0,0.1)'>&nbsp;&nbsp;&nbsp;</span> Good" +
            "</div>"
    }
});

// ** dash-sparkline directive
// - shows a compact line chart used to identify trends.
// - implemented using the wijlinechart widget.
// ** example
// <dash-sparkline data="p.salesValues"></dash-sparkline>
// ** see
// - Wijmo: http://wijmo.com
// - Wijmo line chart: http://wijmo.com/wiki/index.php/Linechart#API
angular.module("dash").directive("dashSparkline", function ($rootScope, dashUtil) {
    return {
        restrict: "E",
        replace: true,
        scope: {
            data: "=",          // An array of numbers to display as a sparkline.
            stroke: "@",        // The color of the sparkline.
            strokeWidth: "@",   // The thickness of the sparkline.
            width: "@",         // Sparkline width in pixels.
            height: "@"         // Sparkline height in pixels.
        },
        template:
            "<div style='display:inline' ></div>",
        link: function (scope, element, attrs) {

            // watch for attribute changes and update the control
            var arr = ["data", "stroke", "strokeWidth", "width", "height"];
            dashUtil.watchScope(scope, arr, updateControl, true);

            // update the control
            function updateControl() {

                // get chart data
                var data = scope.data;
                if (angular.isString(data)) data = scope.$eval(data);
                
                // build options
                var options = {
                    seriesList: [getSeries(data)],
                    seriesStyles: [getStyle(scope.stroke, scope.strokeWidth)],
                    seriesHoverStyles: [getStyle(scope.stroke, scope.strokeWidth)],
                    showChartLabels: false,
                    marginLeft: 0, marginRight: 0, marginTop: 0, marginBottom: 0,
                    animation: { enabled: false },
                    seriesTransition: { enabled: false },
                    legend: { visible: false },
                    hint: { enable: false }, // REVIEW: 'enable' or 'enabled'??
                    axis: {
                        x: { visible: false, textVisible: false, gridMajor: { visible: false} },
                        y: { visible: false, textVisible: false, gridMajor: { visible: false} }
                    }
                };

                // set widget size
                options.width = scope.width ? scope.width * 1 : element.width() > 0 ? element.width() : 300;
                options.height = scope.height ? scope.height * 1 : element.height() > 0 ? element.height() : 16;

                // build widget
                element.wijlinechart(options);
            }
            function getSeries(data) {

                // copy data into arrays
                var x = [];
                var y = [];
                if (data) {
                    for (var i = 0; i < data.length; i++) {
                        x.push(i);
                        y.push(data[i]);
                    }
                }

                // return series with the arrays
                return { data: { x: x, y: y} };
            }
            function getStyle(stroke, strokeWidth) {
                var style = {
                    opacity: 1,
                    stroke : stroke ? stroke : "black",
                    "stroke-width" : strokeWidth ? strokeWidth * 1 : 1
                };
                return style;
            }
        }
    }
});

// ** dash-gauge directive
// - shows a streamlined radial gauge with min, max, and actual value.
// - implemented using the wijradialgauge widget.
// - uses Raphael canvas to add custom information to the gauge.
// ** example
// <dash-gauge 
//     value="{{product.sales.qThis}}"
//     max="{{product.sales.max}}"
//     fill="red" gauge="#e0e0e0"
//     target-value="{{product.levels.target}}" target-fill="green" >
//     </dash-gauge>
// ** see
// - Wijmo: http://wijmo.com
// - Wijmo radial gauge chart: http://wijmo.com/wiki/index.php/Radialgauge#API
angular.module("dash").directive("dashGauge", function ($rootScope, dashUtil) {
    return {
        restrict: "E",
        scope: {
            value: "@",             // Value indicated by the gauge pointer.
            min: "@",               // Gauge minimum (start) value.
            max: "@",               // Gauge maximum (end) value.
            gauge: "@",             // Color of the gauge display.
            fill: "@",              // Color of the filled area (from 'start' to 'value').
            stroke: "@",            // Color of the gauge outline.
            targetValue: "@",       // Target value for the gauge.
            targetFill: "@",        // Color of the filled area if 'value' is equal to or greater than 'targetValue'.
            showLimits: "@",        // Whether to show the minimum and maximum values below the gauge.
            width: "@"              // Gauge width in pixels.
        },
        template: "<div></div>",
        link: function (scope, element, attrs, controller) {

            // listen to changes in attributes and update the control
            var arr = ["value", "min", "max", "gauge", "fill", "stroke", "targetValue", "targetFill", "showLimits", "width"];
            dashUtil.watchScope(scope, arr, updateControl, true, true);

            // update the control
            function updateControl() {

                // initialize scope variables
                dashUtil.setDefVal(scope, "min", 0);
                dashUtil.setDefVal(scope, "max", 100);
                dashUtil.setDefVal(scope, "value", 0);

                // use targetFill if value >= targetValue
                var rangeFill = scope.targetValue && scope.targetFill && scope.value * 1 >= scope.targetValue * 1
                    ? scope.targetFill
                    : scope.fill;

                // honor showLimits
                var showLimits = scope.showLimits == null || scope.$eval(scope.showLimits) == true;

                // set width
                var width = scope.width ? scope.width * 1 : element.width();
                if (width == 0) width = 200;

                // build options
                var options = {
                    min: scope.min * 1,
                    max: scope.max * 1,
                    value: scope.value * 1,
                    ranges: [
                        createRange(scope.min, scope.max, scope.gauge, scope.stroke, width / 4),
                        createRange(scope.min, scope.value, rangeFill, "none", width / 4),
                    ],
                    animation: { enabled: false },
                    pointer: { visible: false },
                    cap: { visible: false },
                    face: { style: { fill: "none", stroke: "none"} },
                    labels: { visible: false },
                    tickMajor: { visible: false },
                    tickMinor: { visible: false },
                    width: width, height: width,
                    marginLeft: 0, marginRight: 0, marginTop: 0, marginBottom: 0
                };

                // show target value marker 
                var foreColor = element.css("color");
                if (scope.targetValue) {
                    var val = scope.targetValue * 1;
                    var range = createRange(val * 1.01, val * .99, foreColor, foreColor, width / 10);
                    options.ranges.push(range);
                }

                // build widget
                element.wijradialgauge(options);

                // get canvas to draw on
                var canvas = element.wijradialgauge("getCanvas");
                var fs = width / 12;
                var ff = element.css("font-family");
                var y = canvas.height / 2 + fs / 2 + 3;

                // show current value
                canvas.text(width / 2, y - fs, Globalize.format(scope.value * 1, 'n0'))
                .attr({ "font-family": ff, "font-size": fs * 2, "fill": foreColor });

                // show limits
                var showLimits = scope.showLimits ? scope.$eval(scope.showLimits) : true;
                if (showLimits) {

                    canvas.text(width / 8, y, Globalize.format(scope.min * 1, 'n0'))
                    .attr({ "font-family": ff, "font-size": fs, "fill": foreColor });

                    canvas.text(width / 8 * 7, y, Globalize.format(scope.max * 1, 'n0'))
                    .attr({ "font-family": ff, "font-size": fs, "fill": foreColor });
                }
            }
            function createRange(start, end, fill, stroke, width) {
                var range = {
                    startValue: start * 1,
                    endValue: end * 1,
                    startWidth: width,
                    endWidth: width,
                    startDistance: 0,
                    endDistance: 0,
                    style: {
                        fill: fill,
                        stroke: stroke
                    }
                };
                return range;
            }
        }
    }
});

// ** dash-chart directive
// - shows charts of different types.
// - implemented using the wijmo chart widgets.
// - uses a simple data format common to all chart types.
// ** example
// <dash-chart 
//   height="400"
//   type="{{chartType}}"
//   data="chartData"
//   min-value="0" 
//   interval="1000"
//   h-axis-title="Product"
//   v-axis-title="Units" >
//   </dash-chart>
// ** see
// - Wijmo: http://wijmo.com
// - Wijmo line chart: http://wijmo.com/wiki/index.php/Linechart#API
// - Wijmo bar chart: http://wijmo.com/wiki/index.php/Barchart#API
// - Wijmo pie chart: http://wijmo.com/wiki/index.php/Piechart#API
angular.module("dash").directive("dashChart", function ($rootScope, dashUtil) {
    return {
        restrict: "E",
        template: "<div></div>",
        replace: true,
        scope: {
            type: "@",          // Chart type: area, bar, bubble, column, line, pie, or scatter.
            titleX: "@",        // Title for the X (category) axis.
            titleY: "@",        // Title for the Y (value) axis.
            formatX: "@",       // Format for annotations along the X axis.
            formatY: "@",       // Format for annotations along the Y axis.
            min: "@",           // Minimum value to show on the Y axis.
            max: "@",           // Maximum value to show on the Y axis.
            interval: "@",      // Interval between grid lines.
            legend: "@",        // Whether to show a legend (by default, a legend is shown if there are more than one series).
            width: "@",         // Width of the chart in pixels.
            height: "@",        // Height of the chart in pixels.
            regression: "@",    // Whether to add a linear regression series to fit the first data series.
            data: "="           // Chart data: an array of arrays; the first column contains the x values and the remaining columns contain one series each (for most chart types).
        },
        link: function (scope, element, attrs, controller) {

            // listen to changes in attributes and update the control
            var arr = ["type", "titleX", "titleY", "formatX", "formatY", "min", "max", "interval", "legend", "width", "height", "regression", "data"];
            dashUtil.watchScope(scope, arr, updateControl, true, true);

            // keep track of chart widget
            var chart = null;

            // update the control
            function updateControl() {

                // remove the previous chart, if any
                // (because we may be attaching a new one of different type to the element)
                if (chart) {
                    chart.destroy();
                }

                // get chart data
                var data = scope.data;
                if (typeof (data) == "string") data = scope.$eval(data);

                // get chart type
                var chartType = scope.type ? scope.type : "line";

                // figure out whether to show a legend
                var legendVisible =
                    scope.legend ? scope.legend :
                    chartType == "pie" ? true :
                    data[0].length > 2 ? true : false;

                // set chart options
                var fontSize = element.css("fontSize");
                var textStyle = { "font-size": fontSize, "font-weight": "normal", fill: "black" };
                var options = {
                    seriesStyles: getStyleList(false),
                    seriesHoverStyles: getStyleList(true),
                    textStyle: textStyle,
                    animation: { enabled: false },
                    seriesTransition: { enabled: false },
                    legend: { visible: legendVisible, textStyle: textStyle },
                    clusterWidth: 50,
                    hint: {
                        enable: true,
                        contentStyle: { fill: "black" }, // foreground
                        style: { fill: "white", "fill-opacity": .9} // background
                    },
                    axis: {
                        x: {
                            text: scope.titleX,
                            textStyle: textStyle,
                            labels: { style: textStyle },
                            gridMajor: { visible: false }
                        },
                        y: {
                            text: scope.titleY,
                            textStyle: textStyle,
                            labels: { style: textStyle },
                            gridMajor: { visible: true, style: { opacity: 0.2} }
                        }
                    }
                };

                // add options to adjust for chart type
                if (chartType == "area") options.type = "area";
                if (chartType == "column") options.horizontal = false;
                if (chartType == "pie") {
                    options.showChartLabels = true;
                    options.textStyle = { fill: "white", "font-size": fontSize }; // REVIEW: should use element font size by default. disableDefaultTextStyle doesn't seem to do anything? Camel casing doesn't work for font-size???
                    options.hint.content = function () { // REVIEW: should allow html (would not need Title, TitleStyle)
                        return this.label + ":\n  " + this.value + "\n  (" + Globalize.format(this.value / this.total, "p0") + ")"; // pie slice
                    };
                } else {
                    options.showChartLabels = false;
                    options.hint.content = function () {
                        var fmt = scope.formatY ? scope.formatY : "n0";
                        if (this.data.lineSeries && this.data.lineSeries.isRegression) return this.label;
                        if (this.label) return this.x + "\n" + this.label + ": " + Globalize.format(this.y, fmt);
                        return this.x + "\n" + Globalize.format(this.y, fmt);
                    };
                }

                // set x-axis properties
                if (scope.formatX) {
                    options.axis.x.annoFormatString = scope.formatX;
                }

                // set y-axis properties
                options.axis.y.annoFormatString = scope.formatY ? scope.formatY : "n0";
                options.axis.y.unitMajor = scope.interval ? scope.interval * 1 : getInterval(data); // REVIEW: default interval is too small
                options.axis.y.autoMajor = false; // REVIEW: should not be necessary
                if (scope.min) {
                    options.axis.y.min = scope.min * 1;
                    options.axis.y.autoMin = false; // REVIEW: should not be necessary (could eliminate all auto* properties!!!)
                }
                if (scope.max) {
                    options.axis.y.max = scope.max * 1;
                    options.axis.y.autoMax = false; // REVIEW: should not be necessary
                }

                // set chart size
                if (scope.width) options.width = scope.width;
                if (scope.height) options.height = scope.height;

                // set chart data
                options.seriesList = chartType != "pie"
                    ? getSeriesList(data, chartType == "bar")
                    : getPieSeriesList(data);

                // add regression series
                if (scope.regression && scope.$eval(scope.regression) && chartType == "line") {
                    AddRegressionSeries(options);
                }

                // create the chart
                var el = $(element[0]);
                switch (chartType.toLowerCase()) {
                    case "line":
                    case "area":
                        el.wijlinechart(options);
                        chart = el.data().wijlinechart;
                        break;
                    case "bar":
                    case "column":
                        el.wijbarchart(options);
                        chart = el.data().wijbarchart;
                        break;
                    case "bubble":
                        el.wijbubblechart(options);
                        chart = el.data().wijbubblechart;
                        break;
                    case "pie":
                        el.wijpiechart(options);
                        chart = el.data().wijpiechart;
                        break;
                    case "scatter":
                        el.wijscatterchart(options);
                        chart = el.data().wijscatterchart;
                        break;
                    default:
                        throw "unknown chart type: " + chartType;
                }
            }

            // get an interval for the major Y grid lines
            function getInterval(data) {

                // get actual max/min values
                var mx = null, mn = null;
                for (var i = 0; i < data.length; i++) {
                    for (var j = 1; j < data[i].length; j++) {
                        var val = data[i][j];
                        if (typeof (val) == "number") {
                            if (!mx || val > mx) mx = val;
                            if (!mn || val < mn) mn = val;
                        }
                    }
                }

                // honor scope values
                if (scope.max) mx = scope.max * 1;
                if (scope.min) mn = scope.min * 1;

                // calculate interval based on delta
                var delta = (mx - mn).toFixed(0);
                return mx != null && mn != null && mx - mn > 1
                    ? delta[0] * Math.pow(10, delta.length - 1) / 4
                    : (mx - mn) / 4;
            }

            // get the list of series for all non-pie charts
            function getSeriesList(data, reverse) {

                // guess whether the first row contains data or series names:
                // if the first element in the second column is not a string, then
                // the first row probably contains data...
                var firstRowIsNames = typeof (data[0][1]) == "string";
                var firstIndex = firstRowIsNames ? 1 : 0;

                var list = [];
                for (var column = 1; column < data[0].length; column++) {
                    var series = {
                        data: { x: [], y: [] }
                    };
                    if (firstRowIsNames) {
                        series.label = data[0][column];
                        series.legendEntry = true;
                    }
                    if (reverse) {
                        for (var i = data.length - 1; i >= firstIndex; i--) {
                            series.data.x.push(data[i][0]);
                            series.data.y.push(data[i][column]);
                        }
                    } else {
                        for (var i = firstIndex; i < data.length; i++) {
                            series.data.x.push(data[i][0]);
                            series.data.y.push(data[i][column]);
                        }
                    }
                    list.push(series);
                }
                return list;
            }

            // get the list of series for a pie chart
            function getPieSeriesList(data) {

                // guess whether the first row contains data or series names:
                // if the first element in the second column is not a string, then
                // the first row probably contains data...
                var firstRowIsData = typeof (data[0][1]) != "string";
                var firstIndex = firstRowIsData ? 0 : 1;

                // build series list for pie chart (each slice is a different series)
                var list = [];
                for (var i = firstIndex; i < data.length; i++) {
                    list.push({
                        label: data[i][0],
                        data: data[i][1],
                        offset: 10,
                        legendEntry: true
                    });
                }
                return list;
            }

            // get a list of styles using a custom color palette
            function getStyleList(hover) {
                var arr = [
                    "#3366CC", "#DC3912", "#FF9900", "#109618", "#990099", "#0099C6", "#DD4477", "#66AA00",
                    "#B82E2E", "#316395", "#994499", "#22AA99", "#AAAA11", "#6633CC", "#E67300", "#8B0707",
                    "#40699C", "#9E413E", "#7F9A48", "#695185", "#3C8DA3", "#CC7B38", "#4F81BD", "#C0504D",
                    "#9BBB59", "#8064A2", "#4BACC6", "#F79646", "#AABAD7", "#D9AAA9", "#C6D6AC", "#BAB0C9"
                ];
                var list = [];
                for (var i = 0; i < arr.length; i++) {
                    var style = hover
                        ? { "stroke-width": 4, opacity: 1 }
                        : { "stroke-width": 3, opacity: .9, stroke: arr[i], "stroke-opacity": 1, fill: arr[i], "fill-opacity": 0.8 };
                    list.push(style);
                }
                return list;
            }

            // add a linear regression series to fit the first data series
            function AddRegressionSeries(options) {

                // get regression data
                var series = options.seriesList[0];

                // calculate regression
                var numericX = typeof (series.data.x[0]) == "number";
                var n = 0, sx = 0, sy = 0, sxx = 0, syy = 0, sxy = 0;
                for (var i = 0; i < series.data.y.length; i++) {
                    var x = numericX ? series.data.x[i] : i;
                    var y = series.data.y[i];
                    n++;
                    sx += x;
                    sy += y;
                    sxx += x * x;
                    syy += y * y;
                    sxy += x * y;
                }
                var b = (n * sxy - sx * sy) / (n * sxx - sx * sx);
                var a = sy / n - sx / n * b;
                var r2 = (n * sxy - sx * sy) * (n * sxy - sx * sy) / ((n * sxx - sx * sx) * (n * syy - sy * sy));

                // add regression series
                var reg = {
                    data: { x: series.data.x, y: [] }
                };
                for (var i = 0; i < series.data.y.length; i++) {
                    var x = numericX ? series.data.x[i] : i;
                    reg.data.y.push(a + b * x);
                }
                reg.isRegression = true;
                reg.label =
                    "Regression" +
                    "\ny = " + Globalize.format(b, "n2") + " x + " + Globalize.format(a, "n2") +
                    "\nr2 = " + Globalize.format(r2, "n2");

                // add series to list
                options.seriesList.push(reg);

                // adjust regression styles
                var regStyle = options.seriesStyles[options.seriesList.length - 1];
                regStyle.opacity = r2;
                regStyle.stroke = "black";
                regStyle["stroke-width"] = 1;
                regStyle = options.seriesHoverStyles[options.seriesList.length - 1];
                regStyle.stroke = "black";
                regStyle["stroke-width"] = 3;
            }
        }
    }
});

