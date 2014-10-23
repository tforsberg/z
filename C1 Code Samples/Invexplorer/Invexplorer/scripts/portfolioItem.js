/***********************************************************************************
* portfolioItem class.
*/
function portfolioItem(portfolio, symbol, chart, shares, unitCost) {
    if (typeof chart === "undefined") { chart = false; }
    this.portfolio = portfolio;
    this.symbol = symbol;
    this.chart = chart;
    this.shares = shares;
    this.unitCost = unitCost;
    this.company = portfolio.viewModel.findCompany(symbol);
    if(this.company != null) {
        this.company.updatePrices();
    }
}

// update chart when 'chart' property changes
portfolioItem.prototype.chartChanged = function () {
    this.portfolio.viewModel.updateView();
}

// remove this item from the portfolio
portfolioItem.prototype.remove = function () {
    this.portfolio.removeItem(this);
}

// computed values
portfolioItem.prototype.getValue = function () {
    var value = this.lastPrice * this.shares;
    return value == 0 ? "" : value;
}
portfolioItem.prototype.getCost = function () {
    var cost = this.unitCost * this.shares;
    return cost == 0 ? "" : cost;
}
portfolioItem.prototype.getChangePercent = function () {
    return this.change == 0 || this.lastPrice == 0
        ? "" 
        : this.change / this.lastPrice * 100;
}
portfolioItem.prototype.getGain = function () {
    var value = this.lastPrice * this.shares;
    var cost = this.unitCost * this.shares;
    return cost == 0 || value == 0 ? "" : value - cost;
}
portfolioItem.prototype.getGainPercent = function () {
    var value = this.lastPrice * this.shares;
    var cost = this.unitCost * this.shares;
    return cost == 0 || value == 0 ? "" : (value - cost) / cost * 100;
}
portfolioItem.prototype.getColor = function () {
    var index = this.portfolio.items.indexOf(this);
    var palette = viewModel.palette;
    return index > -1 ? palette[index % palette.length] : "black";
}
portfolioItem.prototype.getAmountColor = function (amount) {
    return amount < -0.01 ? "#D84874" : amount > +0.01 ? "#279972" : "black";
}
portfolioItem.prototype.getRowColor = function () {
    return this.chart ? "#fcfcf0" : "transparent";
}

// update chart data when prices array changes
portfolioItem.prototype.updatePrices = function () {
    if(this.company != null) {
        var prices = this.company.prices;
        if(prices.length > 1) {
            this.lastPrice = prices[0].price;
            this.change = prices[0].price - prices[1].price;
        }
    }
}
