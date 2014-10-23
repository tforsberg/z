/***********************************************************************************
* portfolio class.
*/
function portfolio(viewModel) {
    this.items = [];
    this.newSymbol = "";
    this.canAddNewSymbol = false;
    this.viewModel = viewModel;
}

// save the portfolio to local storage
portfolio.prototype.saveItems = function () {
    if(localStorage != null && JSON != null) {
        var items = [];
        for(var i = 0; i < this.items.length; i++) {
            var item = this.items[i];
            var newItem = {
                symbol: item.symbol,
                chart: item.chart,
                shares: item.shares,
                unitCost: item.unitCost
            };
            items.push(newItem);
        }
        localStorage["items"] = JSON.stringify(items);
    }
}

// load the portfolio from local storage (or initializes it with a few items)
portfolio.prototype.loadItems = function () {
    var items = localStorage != null ? localStorage["items"] : null;
    if(items != null && JSON != null) {
        try  {
            items = JSON.parse(items);
            for(var i = 0; i < items.length; i++) {
                var item = items[i];
                this.addItem(item.symbol, item.chart, item.shares, item.unitCost);
            }
        } catch (err) {}
    }
    if(this.items.length == 0) {
        this.addItem("AMZN", false, 100, 200);
        this.addItem("AAPL", true, 100, 560);
        this.addItem("GE");
        this.addItem("GOOG", true, 100, 600);
        this.addItem("HPQ");
        this.addItem("IBM");
        this.addItem("MSFT");
        this.addItem("ORCL");
        this.addItem("V", true, 100, 85);
        this.addItem("YHOO", false, 100, 15);
    }
}

// add a new item to the portfolio
portfolio.prototype.addItem = function (symbol, chart, shares, unitCost) {
    if (typeof chart === "undefined") { chart = false; }
    if (typeof shares === "undefined") { shares = 0; }
    if (typeof unitCost === "undefined") { unitCost = 0; }
    var items = this.items;
    for(var i = 0; i < items.length; i++) {
        if(items[i].symbol == symbol) {
            return;
        }
    }
    var item = new portfolioItem(this, symbol, chart, shares, unitCost);
    items.push(item);
}

// remove an item from the portfolio
portfolio.prototype.removeItem = function (item) {
    var index = this.items.indexOf(item);
    if(index > -1) {
        this.items.splice(index, 1);
    }
}

// update canAddNewSymbol when newSymbol changes
portfolio.prototype.newSymbolChanged = function () {
    var newCompany = this.viewModel.findCompany(this.newSymbol);
    if(newCompany == null) {
        this.canAddNewSymbol = false;
        return;
    }
    var items = this.items;
    for(var i = 0; i < items.length; i++) {
        if(items[i].company == newCompany) {
            this.canAddNewSymbol = false;
            return;
        }
    }
    this.canAddNewSymbol = true;
}

// add a new item based on the value of newSymbol
portfolio.prototype.addNewSymbol = function () {
    var item = new portfolioItem(this, this.newSymbol, true);
    this.items.push(item);
    this.newSymbol = "";
    this.canAddNewSymbol = false;
}
