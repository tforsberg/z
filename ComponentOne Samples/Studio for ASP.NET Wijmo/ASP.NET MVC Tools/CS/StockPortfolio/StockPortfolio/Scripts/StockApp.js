var stockApp = {};
stockApp.symbols = "";
stockApp.currentSymbol = "";
stockApp.initialized = false;
stockApp.minDate = "";
stockApp.minDay = 1;
stockApp.maxDate = "";
stockApp.maxDay = null;
stockApp.beginDate = "";
stockApp.endDate = "";
stockApp.timeSpan = 2000;
stockApp.isRefresh = false;
stockApp.data = [];
stockApp.newStock = null;

stockApp.init = function () {

    var d = new Date(), innerSet = false, minDate = new Date();

    stockApp.loadSymbols();
    minDate.setMonth(minDate.getMonth() - 3)
    stockApp.minDate = minDate.toDateString();
    stockApp.minDay = 1;
    stockApp.maxDate = d.toDateString();
    stockApp.maxDay = stockApp.getDaysCount(stockApp.maxDate, stockApp.minDate)
    stockApp.beginDay = stockApp.maxDay - 30;
    stockApp.beginDate = stockApp.getDateFromNumber(stockApp.minDate, stockApp.beginDay);
    stockApp.endDay = stockApp.maxDay;
    stockApp.endDate = stockApp.getDateFromNumber(stockApp.minDate, stockApp.endDay);

    /* Progress */
    $("#loadingOverlay").width(document.documentElement.clientWidth).height(document.documentElement.clientHeight);
    $("#loadProgress").wijprogressbar({
        value: 0,
        animationOptions: {
            duration: 0
        }
    });
    stockApp.updateProgress("Initializing...", 20);

    /* Add Stock */
    $("#addStock").button().click(function () {
        var isExsit = false;
        $.each(stockApp.data, function (i, n) {
            if (n.Symbol === stockApp.newStock) {
                isExsit = true;
                return false;
            }
        });
        if (!isExsit) {
            $.ajax({
                url: "Stocks/StockSymbols",
                data: { symbols: stockApp.newStock },
                dataType: "json",
                success: function (d) {
                    var data;
                    if (d.length === 1) {
                        data = d[0];
                        stockApp.data.push(data);
                        $("#stockList").wijgrid("data").push(data);
                        $("#stockList").wijgrid("ensureControl", true);
                        stockApp.symbols += "," + stockApp.newStock;
                        stockApp.saveSymbols();
                    }
                    stockApp.newStock = null;
                }
            });
        }
        else {
            stockApp.showAlert("This stock stymbol is already listed.");
        }
    });

    var proxy = new wijhttpproxy({
        url: "Stocks/StockSuggestion",
        dataType: "json",
        data: { count: 20 }
    });

    var myReader = new wijarrayreader([{
        name: 'label',
        mapping: function (item) {
            return item.Symbol + " (" + item.Name + ")";
        }
    }, {
        name: 'value',
        mapping: 'Symbol'
    }, {
        name: 'selected',
        defaultValue: false
    }]);

    var datasource = new wijdatasource({
        reader: myReader,
        proxy: proxy
    });

    $("#autocomplete").wijcombobox({
        data: datasource,
        minLength: 1,
        showTrigger: false,
        dropDownListPosition: { my: "right bottom", at: "right top" },
        search: function (e, obj) {
            obj.datasrc.proxy.options.data.symbol = obj.term.value;
        },
        select: function (e, item) {
            stockApp.newStock = item.value;
        }
    });
    /* End Add Stock */

    /* Date range */
    $("#showDateDialog").button({
        icons: { primary: "ui-icon-triangle-1-s" },
        text: false
    }).click(function () {
        var dialog = $("#dateRangeDialog"), btn = $(this), left;
        if (dialog.is(":hidden")) {
            left = btn.offset().left + btn.width() - dialog.width();
            dialog.fadeIn();
            dialog.css({ left: left });

            var _initDates = [], d;

            for (d = new Date(stockApp.beginDate); d <= new Date(stockApp.endDate); d.setDate(d.getDate() + 1)) {
                _initDates.push(new Date(d));
            }

            $("#calendar1").wijcalendar("option", "selectedDates", _initDates);

            $("#startDateInput").wijinputdate("option", "date", new Date(stockApp.beginDate));
            $("#endDateInput").wijinputdate("option", "date", new Date(stockApp.endDate));
        }
        else {
            dialog.fadeOut();
        }
    });



    $("#calendar1").wijcalendar({
        monthRows: 1,
        monthCols: 4,
        displayDate: new Date(stockApp.minDate),
        minDate: new Date(stockApp.minDate),
        maxDate: new Date(stockApp.maxDate),
        selectedDatesChanged: function (e, d) {
            var start, end, dates = $("#calendar1")
                .wijcalendar("option", "selectedDates"),
                length = dates.length;
            if (length) {
                start = new Date(dates[0]);
                end = new Date(dates[length - 1]);

                innerSet = true;
                $("#startDateInput").wijinputdate("option", "date", start);
                $("#endDateInput").wijinputdate("option", "date", end);
                innerSet = false;
            }
        }
    });



    var setCalendarDate = function () {
        var dates = [], startDate, endDate, d;
        startDate = new Date($("#startDateInput").wijinputdate("option", "date"));
        endDate = new Date($("#endDateInput").wijinputdate("option", "date"));

        for (d = startDate; d <= endDate; d.setDate(d.getDate() + 1)) {
            dates.push(new Date(d));
        }
        $("#calendar1").wijcalendar("option", "selectedDates", dates);
    }


    $("#endDateInput").wijinputdate({
        dateChanged: function (e, d) {
            var minDate = new Date(stockApp.minDate),
			    maxDate = new Date(stockApp.maxDate);
            if (d.date.getTime() > maxDate.getTime()) {
                $(this).wijinputdate("option", "date", maxDate);
            }
            if (d.date.getTime() < minDate.getTime()) {
                $(this).wijinputdate("option", "date", minDate);
            }
            if (!innerSet) setCalendarDate();
        }
    });

    $("#startDateInput").wijinputdate({
        dateChanged: function (e, d) {
            var minDate = new Date(stockApp.minDate),
			    maxDate = new Date(stockApp.maxDate);
            if (d.date.getTime() > maxDate.getTime()) {
                $(this).wijinputdate("option", "date", maxDate);
            }
            if (d.date.getTime() < minDate.getTime()) {
                $(this).wijinputdate("option", "date", minDate);
            }
            if (!innerSet) setCalendarDate();
        }
    });


    $("#dateApplyBtn").button().click(function () {
        var begin = $("#startDateInput").wijinputdate("option", "date"),
            end = $("#endDateInput").wijinputdate("option", "date"), f, t;
        if (begin >= end) {
            stockApp.showAlert("The start date must less then end date!");
            return false;
        }
        stockApp.beginDate = begin.toDateString();
        stockApp.endDate = end.toDateString();
        stockApp.dateChange();

        $("#showDateRange span:eq(0)").text(stockApp.beginDate +
            " - " + stockApp.endDate);

        f = stockApp.getDaysCount(stockApp.beginDate, stockApp.minDate);
        t = stockApp.getDaysCount(stockApp.endDate, stockApp.minDate);
        $("#dateRange").wijslider("values", 0, f);
        $("#dateRange").wijslider("values", 1, t);

        $("#dateRangeDialog").fadeOut();
    });

    $("#dateCancelBtn").button().click(function () {
        $("#dateRangeDialog").fadeOut();
    });

    $("#dateRangeDialog").hide();

    $("#dateRange").wijslider({
        min: stockApp.minDay,
        max: stockApp.maxDay,
        minRange: 1,
        range: true,
        step: 1,
        values: [stockApp.beginDay, stockApp.endDay],
        stop: function (event, ui) {
            stockApp.beginDay = $("#dateRange").wijslider("values", 0);
            stockApp.beginDate = stockApp.getDateFromNumber(stockApp.minDate, stockApp.beginDay);
            stockApp.endDay = $("#dateRange").wijslider("values", 1);
            stockApp.endDate = stockApp.getDateFromNumber(stockApp.minDate, stockApp.endDay);
            stockApp.dateChange();
            $("#showDateRange span:eq(0)").text(stockApp.beginDate +
                " - " + stockApp.endDate);
        },
        buttonClick: function (event, ui) {
            stockApp.beginDay = $("#dateRange").wijslider("values", 0);
            stockApp.beginDate = stockApp.getDateFromNumber(stockApp.minDate, stockApp.beginDay); ;
            stockApp.endDay = $("#dateRange").wijslider("values", 1);
            stockApp.endDate = stockApp.getDateFromNumber(stockApp.minDate, stockApp.endDay);
            stockApp.dateChange();
            $("#showDateRange span:eq(0)").text(stockApp.beginDate +
                " - " + stockApp.endDate);
        }
    });

    $("#showDateRange span:eq(0)").text(stockApp.beginDate +
                " - " + stockApp.endDate);
    /* End Date range */

    /* alertDialog*/
    $("#alertDialog").wijdialog({
        autoOpen: false,
        height: 180,
        width: 400,
        modal: true,
        buttons: {
            Ok: function () {
                $(this).wijdialog("close");
            }
        },
        captionButtons: {
            pin: { visible: false },
            refresh: { visible: false },
            toggle: { visible: false },
            minimize: { visible: false },
            maximize: { visible: false }
        }
    });

    /* Chart */
    $("#stockHistory").wijlinechart({
        animation: {
            duration: 500,
            direction: "vertical"
        },
        showChartLabels: false,
        legend: {
            visible: false
        },
        seriesTransition: {
            duration: 500,
            direction: "vertical"
        },
        height: 300,
        hint: {
            contentStyle: { "font-size": "24pt", stroke: "none" },
            content: function () {
                return this.data.lineSeries.label + " : " + this.y.toFormatString(2);
            }
        },
        header: {
            text: "Stock History",
            visible: false
        },
        seriesStyles: [{ stroke: "#5F83B9", opacity: 0.9, "stroke-width": "3"}],
        seriesHoverStyles: [{ stroke: "#5F83B9", opacity: 1, "stroke-width": "4"}]
    });

    $("#stockFullHistory").wijlinechart({
        animation: {
            duration: 500,
            direction: "vertical"
        },
        height: 140,
        showChartLabels: false,
        header: {
            text: "Stock History",
            visible: false
        },
        legend: {
            visible: false
        },
        seriesStyles: [{ stroke: "#5F83B9", opacity: 0.9, "stroke-width": "3"}],
        seriesHoverStyles: [{ stroke: "#5F83B9", opacity: 1, "stroke-width": "4"}]
    });
    stockApp.loadStocks();
};

/* End Chart */

/* Grid */
var _numberParser = {
    parseDOM: function (value, culture, format, nullString) {
        return this.parse(value.innerHTML, culture, format, nullString);
    },
    parse: function (value, culture, format, nullString) {
        if (typeof (value) === "number") return value;
        if (!value || (value === "N/A") || (value === nullString)) {
            return null;
        }
        return NaN;
    },
    toStr: function (value, culture, format, nullString) {
        return (value === null) ? "N/A" : value.toFormatString();
    }
}

var _getInnerHtml = function (value) {
    var content = $("<div class=\"cell-right\">"), img = $("<img>"),
	span = $("<span></span>").html("N/A").appendTo(content);
    img.hide();
    return content;
}

stockApp.loadStocks = function () {

    stockApp.updateProgress("Loading Stocks...", 40);
    $.ajax({
        url: "Stocks/StockSymbols",
        data: { symbols: stockApp.symbols },
        dataType: "json",
        success: function (data) {
            stockApp.data = data;
            $("#stockList").wijgrid({
                data: stockApp.data,
                allowSorting: true,
                columns: [
                        { dataKey: "Symbol", width: 100 },
                        { dataKey: "Name" },
                        { dataKey: "Ask", width: 200, dataType: "number", visible: true, dataParser: _numberParser },
                        { dataKey: "Bid", width: 200, dataType: "number", visible: true, dataParser: _numberParser },
                        { dataKey: "LastSale", width: 200, dataType: "number", visible: true, dataParser: _numberParser },
                        { dataKey: "Valid", visible: false },
						{ headerText: "Delete", width: 150 }
                    ],
                selectionChanged: function (e, args) {
                    stockApp.currentSymbol =
$("#stockList").wijgrid("selection").selectedCells().item(0).value();
                    stockApp.stockChange();
                },
                cellStyleFormatter: function (args) {
                    var c = args.$cell, $btn;
                    if ((args.column.dataKey === "Bid" ||
                        args.column.dataKey === "Ask" ||
                        args.column.dataKey === "LastSale") &&
                        args.state === 1 && args.row.dataRowIndex !== -1) {
                        var content, value = args.row.data["LastSale"];
                        content = _getInnerHtml(value);
                        c.children("div.wijmo-wijgrid-innercell:eq(0)")
                            .wrapInner("<div class='cell-left'></div>")
                            .append(content).addClass("cell_" + args.row.data.Symbol +
                            "_" + args.column.dataKey);
                    }
                    else if (args.column.headerText === "Delete" &&
                        args.state === 1 && args.row.dataRowIndex !== -1) {
                        if (!c.find("button").length) {
                            $btn = $("<button>Delete</button>").button().click(function () {
                                var data = args.row.data, symbol = data.Symbol,
								source = $("#stockList").wijgrid("data"),
								l = source.length;
                                for (var i = 0; i < l; i++) {
                                    if (source[i].Symbol === symbol) {
                                        stockApp.data.splice(i, 1);
                                        source.splice(i, 1);
                                        $("#stockList").wijgrid("ensureControl", true);
                                        var regStr = symbol + ",?";
                                        var reg = new RegExp();
                                        reg.compile(regStr);
                                        stockApp.symbols = stockApp.symbols.replace(reg,
'');
                                        stockApp.saveSymbols();
                                        return;
                                    }
                                }

                            }).appendTo(c.children("div.wijmo-wijgrid-innercell:eq(0)"));
                        }
                    }
                }
            });
            stockApp.autoUpdate();
        }
    });
};
/* End Grid */

stockApp.loadStockHistory = function () {

    $.ajax({
        url: "Stocks/StockSymbolHistoryByDates",
        data: { symbol: stockApp.currentSymbol, startDate: stockApp.beginDate, endDate: stockApp.endDate, key: Math.random() },
        dataType: "json",
        success: function (data) {
            var stockSeriesList = [];
            var stockDates = [];
            var stockPoints = [];
            if (data && data.length > 1) {
                for (var i = 0; i < data.length; i++) {
                    stockDates.push(new Date(data[i].DateString));
                    stockPoints.push(data[i].Close);
                }
                var stockSeries = {
                    label: data[0].Symbol,
                    legendEntry: true,
                    data: {
                        x: stockDates,
                        y: stockPoints
                    },
                    markers: {
                        visible: true,
                        type: "circle"
                    }
                };
                stockSeriesList.push(stockSeries);
                $("#stockHistory").wijlinechart("option", "seriesList", stockSeriesList);
            }
            else {
                stockApp.showAlert("No stock data for this timespan.");
            }
        }
    });
};

stockApp.loadStockFullHistory = function () {
    stockApp.updateProgress("Loading History Data...", 80);
    $.ajax({
        url: "Stocks/StockSymbolHistoryByDates",
        dataType: "json",
        data: { symbol: stockApp.currentSymbol, startDate: stockApp.minDate, endDate: stockApp.maxDate, key: Math.random() },
        success: function (data) {
            var stockSeriesList = [];
            var stockDates = [];
            var stockPoints = [];

            if (data && data.length) {
                for (var i = 0; i < data.length - 1; i++) {
                    stockDates.push(new Date(data[i].DateString));
                    stockPoints.push(data[i].Close);
                }
                var stockSeries = {
                    label: data[i].Symbol,
                    legendEntry: true,
                    data: {
                        x: stockDates,
                        y: stockPoints
                    },
                    markers: {
                        visible: false,
                        type: "circle"
                    }
                };
                stockSeriesList.push(stockSeries);
                $("#stockFullHistory").wijlinechart("option", "seriesList", stockSeriesList);
            }

            stockApp.updateProgress("Finished Loading", 100);
        }
    });
};

stockApp.showAlert = function (txt) {
    var dialog = $("#alertDialog");
    if (txt) {
        dialog.html(txt);
    }
    dialog.wijdialog("open");
}

stockApp.loadStockSummary = function () {
    var toStr = function (val, n) {
        var a = 2, formatStr;
        if (n !== undefined) {
            a = n;
        }
        if (typeof val === "number") {
            formatStr = val.toFormatString(a);
        }
        else if (val !== null) {
            formatStr = val.toString();
        }
        return val !== null ? formatStr : "N/A";
    }
    $.ajax({
        url: "Stocks/StockSymbol",
        data: { symbol: stockApp.currentSymbol },
        dataType: "json",
        success: function (data) {
            var changeText,
                lastTrade = toStr(data.LastSale),
                tradeTime = data.DateString.toLocaleString(),
                prevClose = toStr(data.Close),
                open = toStr(data.Open),
                name = toStr(data.Name),
                symbol = data.Symbol.toString(),
                bid = toStr(data.Bid),
                oneYear = toStr(data.OneyrTargetPrice),
                ask = toStr(data.Ask),
                dayLow = toStr(data.DayLow),
                dayHigh = toStr(data.DayHigh),
                yearLow = toStr(data.YearLow),
                yearHigh = toStr(data.YearHigh),
                volume = toStr(data.Volume, 0),
                avgVol = toStr(data.AverageDailyVolume, 0),
                marketCap = toStr(data.MarketCapitalization),
                pe = toStr(data.PE),
                EPS = toStr(data.EarningsShare),
                divYield = toStr(data.DividendYield),
                img, change = $("#summaryChange");


            $("#summaryLastTrade").text(lastTrade);
            $("#summaryTradeTime").text(tradeTime);
            $("#summaryPrevClose").text(prevClose);
            $("#summaryOpen").text(open);
            $("#summaryBid").text(bid);
            $("#summary1y").text(oneYear);

            $("#summaryAsk").text(ask);
            $("#summaryDayLow").text(dayLow);
            $("#summaryDayHigh").text(dayHigh);
            $("#summaryYearLow").text(yearLow);
            $("#summaryYearHight").text(yearHigh);
            $("#summaryVolume").text(volume);
            $("#summaryAvgVol").text(avgVol);
            $("#summaryMarketCap").text(marketCap);
            $("#summaryPE").text(pe);
            $("#summaryEPS").text(EPS);
            $("#summaryDivYield").text(divYield);
            $("#corpName").text(name);
            $("#symbolName").text(symbol);

            changeText = data.Change + "(" +
                data.ChangePercent + ")";
            change.children("span:eq(0)").text(changeText);
            img = $("#summaryChange>img:eq(0)");
            if (data.Change > 0) {
                change.removeClass().addClass("green");
                img.attr("src", "images/up.png");
                img.show();
            }
            else if (data.Change < 0) {
                change.removeClass().addClass("red");
                img.attr("src", "images/down.png");
                img.show();
            }
            else {
                change.removeClass()
                img.hide();
            }
        }
    });
};

// auto update
stockApp.autoUpdate = function () {
    var timeSpan = stockApp.timeSpan;

    if (!stockApp.isRefresh) {
        window.setTimeout(function () {
            $.ajax({
                url: "Stocks/StockSymbols",
                data: { symbols: stockApp.symbols },
                dataType: "json",
                success: function (data) {
                    stockApp.data = data;
                    stockApp.updateGrid(data);
                    stockApp.isRefresh = false;
                    stockApp.autoUpdate();
                },
                error: function () {
                    stockApp.isRefresh = false;
                    stockApp.autoUpdate();
                }
            });
            stockApp.loadStockSummary();
        }, timeSpan);
    }
    stockApp.isRefresh = true;
};

stockApp.updateGrid = function (data) {
    $.each(data, function (i, n) {

        var symbol = n.Symbol;
        stockApp.updateCell(symbol, "Ask", n);
        stockApp.updateCell(symbol, "Bid", n);
        stockApp.updateCell(symbol, "LastSale", n);
    });
};

stockApp.updateCell = function (symbol, key, data) {
    var cell = $("#stockList").find(".cell_" + symbol + "_" + key + ":eq(0)"),
        left = cell.children(".cell-left:eq(0)"),
        right = cell.children(".cell-right:eq(0)"),
        old = parseFloat(left.text()),
        val = data[key], span, img, diff;

    left.text(val !== null ? val.toFormatString(2) : "N/A");
    img = right.children("img:eq(0)");
    span = right.children("span:eq(0)");

    if (!isNaN(old) && val !== null) {
        diff = old - val;
        span.text(diff.toFormatString(2));
        if (diff > 0) {
            right.removeClass("red").addClass("green");
            img.show();
            img.attr("src", "/images/down.png");
        }
        else if (diff < 0) {
            right.removeClass("green").addClass("red");
            img.show();
            img.attr("src", "/images/up.png");
        }
        else {
            right.removeClass("red").removeClass("green")
            img.hide();
        }
    }
    else {
        span.text("N/A");
        right.removeClass("red").removeClass("green");
        img.hide();
    }
};

stockApp.dateChange = function () {
    stockApp.loadStockHistory();
};

stockApp.stockChange = function () {
    stockApp.loadStockFullHistory();
    stockApp.loadStockHistory();
    stockApp.loadStockSummary();
};

stockApp.getDaysCount = function (from, to) {
    var f = new Date(from), t = new Date(to);
    return (f.getTime() - t.getTime()) / (24 * 60 * 60 * 1000);
};

stockApp.getDateFromNumber = function (f, n) {
    var d = new Date(f), t;
    t = d.setDate(d.getDate() + n);
    return d.toDateString();
};

stockApp.updateProgress = function (msg, prg) {
    if (!stockApp.initialized) {
        $("#loadingOverlay .progress-label").text(msg);
        $("#loadProgress").wijprogressbar("option", "value", prg);
        if (prg === 100) {
            stockApp.initialized = true;
            $("#loadingOverlay").hide("slide", { direction: 'up', easing: 'easeOutExpo' }, 1200);
        }
    }
};

stockApp.saveSymbols = function () {
    amplify.store("Symbols", stockApp.symbols);
};

stockApp.loadSymbols = function () {
    var symbols;
    stockApp.symbols = "MSFT,GOOG,YHOO,AAPL,INTC,NVDA,ORCL,GE,AMD";
    symbols = amplify.store("Symbols");
    if (symbols) {
        stockApp.symbols = symbols;
    }

    stockApp.currentSymbol = stockApp.symbols.split(",", 1)[0];
};

///show n decimal places and the thousands are comma’d.
/// n=3 "1283987" to "1,283,987.000"
Number.prototype.toFormatString = function (n) {
    var a = this, num = Math.round(a * Math.pow(10, n)) / Math.pow(10, n),
	renum = num.toString(), r1, r2, r3,
	re = new RegExp();
    re.compile("(\\d)(\\d{3})(,|$)");

    if (n > 0) {
        if (num == parseInt(num)) {
            renum += ".";
            for (var i = 0; i < n; i++) {
                renum += "0";
            }
        }
        else {
            len = parseInt(a).toString().length + n + 1 - num.toString().length;
            if (len > 0) {
                for (var i = 0; i < len; i++) {
                    renum += "0";
                }
            }
        }
    }
    else {
        renum = parseInt(num).toString();
    }

    if (!/^(\+|-)?(\d+)(\.\d+)?$/.test(renum)) { return renum.toString(); }
    r1 = RegExp.$1, r2 = RegExp.$2, r3 = RegExp.$3

    while (re.test(r2)) r2 = r2.replace(re, "$1,$2$3");
    renum = r1 + "" + r2 + "" + r3;
    return renum;
}