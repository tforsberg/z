/***********************************************************************************
* viewModel class.
*/
function viewModel(scope) {
    if (typeof scope === "undefined") { scope = null; }
    this.companies = [];
    this.updating = 0;
    this.chartSeries = [];
    this.chartStyles = [];
    this.chartHoverStyles = [];
    this.chartVisible = false;
    this.scope = null;
    var self = this;

    self.scope = scope;
    self.portfolio = new portfolio(this);
    self.setMinDate(6);

    // populate company array
    $.get("StockInfo.ashx", function (result) {
        var lines = result.split("\r");
        for(var i = 0; i < lines.length; i++) {
            var items = lines[i].split("\t");
            if(items.length == 2) {
                var c = new company(self, $.trim(items[0]), $.trim(items[1]));
                self.companies.push(c);
            }
        }

        // load/initialize the portfolio after loading companies
        self.portfolio.loadItems();
        self.updateView();
    });

    // save portfolio when window closes
    $(window).unload(function () {
        self.portfolio.saveItems();
    });

    // create a list of options for the auto-complete:
    // the options are items with 'value' and 'label' properties;
    // the 'value' is the company symbol, the 'label' is the name;
    // these are shown in the auto-complete drop-down.
    this.autoCompleteSource = function (request, response) {
        var options = self.getSymbolMatches(request);
        return response(options);
    };

    // function called when the user selects an item from our auto-complete:
    // the 'ui' parameter is the object selected, and corresponds to one
    // of the options described above; we want to store the company symbol
    // which is the item's 'value' property.
    this.autoCompleteClose = function (event, ui) {
        self.portfolio.newSymbol = ui.item.value;
        self.updateView();
    };
}

// palette used to show items in grids/charts
viewModel.palette = [
    "#FFBE00", "#94D752", "#00B652", "#00B6EF", "#0075C6", "#002263", "#73359C", // Standard
    "#B53D9C", "#BD3D6B", "#AD65BD", "#DE6D33", "#FFB638", "#CE6DA5", "#FF8E38", // Opulent
    "#525D6B", "#FF8633", "#739ADE", "#B52B15", "#F7CF2B", "#ADBAD6", "#737D84", // Oriel
    "#424452", "#737DA5", "#9CBACE", "#D6DB7B", "#FFDB7B", "#BD8673", "#8C726B", // Origin
    "#424C22", "#A5B694", "#F7A642", "#E7BE2B", "#D692A5", "#9C86C6", "#849EC6", // Paper
    "#4A2215", "#3892A5", "#FFBA00", "#C62B2B", "#84AA33", "#944200", "#42598C", // Solstice
    "#383838", "#6BA2B5", "#CEAE00", "#8C8AA5", "#738663", "#9C9273", "#7B868C", // Technic
    "#15487B", "#4A82BD", "#C6504A", "#9CBA5A", "#8465A5", "#4AAEC6", "#F79642", // Office
    "#6B656B", "#CEBA63", "#9CB284", "#6BB2CE", "#6386CE", "#7B69CE", "#A578BD", // Apex
    "#332E33", "#F77D00", "#382733", "#15597B", "#4A8642", "#63487B", "#C69A5A", // Aspect
    "#636984", "#D6604A", "#CEB600", "#28AEAD", "#8C7873", "#8CB28C", "#0E924A"  // Civic
];

// update view to reflect changes in the model
viewModel.prototype.updateView = function () {
    this.portfolio.newSymbolChanged();
    var items = this.portfolio.items;
    for(var i = 0; i < items.length; i++) {
        var item = items[i];
        item.company = this.findCompany(item.symbol);
        item.updatePrices();
    }
    this.updateChartData();
    try {
        this.scope.$digest();
    } catch (err) { }
}

// find a company from a symbol
viewModel.prototype.findCompany = function (symbol) {
    var c = this.companies;
    for(var i = 0; i < c.length; i++) {
        if(c[i].symbol == symbol) {
            return c[i];
        }
    }
    return null;
}

// update chart series and styles
viewModel.prototype.updateChartData = function () {
    var seriesList = [], stylesList = [], hoverStylesList = [];
    var items = this.portfolio.items;
    for(var i = 0; i < items.length; i++) {
        var item = items[i];
        if(item.chart && item.company != null) {
            var series = item.company.getChartSeries();
            seriesList.push(series);
            var style = {
                stroke: item.getColor(),
                'stroke-width': 2
            };
            stylesList.push(style);
            var hoverStyle = {
                stroke: item.getColor(),
                'stroke-width': 6
            };
            hoverStylesList.push(hoverStyle);
        }
    }
    this.chartVisible = seriesList.length > 0;
    this.chartStyles = stylesList;
    this.chartHoverStyles = hoverStylesList;
    this.chartSeries = seriesList;
}

// get color for showing amounts (positive = green, negative = red, zero = black)
viewModel.prototype.getAmountColor = function (amount) {
    return amount < 0.01 ? "#D84874" : amount > 0.01 ? "#279972" : "black";
}

// build options for jQuery auto-complete widget
viewModel.prototype.getSymbolMatches = function (request) {
    var terms = request.term.toLowerCase().split(" ");
    var options = [];
    var maxItems = 12;

    // scan all companies
    for (var i = 0; i < this.companies.length && options.length < maxItems; i++) {

        // see if this company contains all terms
        var item = this.companies[i];
        var matchItem = (item.symbol + ": " + item.name).toLowerCase();
        var match = true;
        for (var j = 0; j < terms.length && match; j++) {
            if (matchItem.indexOf(terms[j]) < 0) {
                match = false;
            }
        }

        // if it does, then highlight the matches and add to options array
        if (match) {
            var label = item.symbol + ":   " + item.name;
            for (var j = 0; j < terms.length; j++) {
                if (terms[j].length > 1) {
                    // replace skipping tag content
                    // http://stackoverflow.com/questions/4236712/complex-html-string-replace-function/4240683#4240683
                    var rx = new RegExp("(?![^<>]*>)(" + terms[j] + ")", "gi");
                    //var rx = new RegExp(terms[j], "gi");
                    label = label.replace(rx, function (match) {
                        return "<span class='match'>" + match + "</span>";
                    });
                }
            }
            var ac = { value: item.symbol, label: label };
            options.push(ac);
        }
    }

    // return options array
    return options;
}

// set the starting date for the chart (between today - months and today)
viewModel.prototype.setMinDate = function (months) {
    var date = new Date();
    if(months <= 0) {
        var year = date.getFullYear();
        date = new Date(year, 0, 1);
    } else {
        var month = date.getMonth() - months;
        date.setMonth(month);
    }
    this.minDate = date;
    this.updateView();
}
