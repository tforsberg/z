var finance;
(function (finance) {
    /**
    * Represents the period to be shown in the chart.
    */
    (function (ChartPeriod) {
        ChartPeriod[ChartPeriod["YTD"] = 0] = "YTD";
        ChartPeriod[ChartPeriod["m6"] = 1] = "m6";
        ChartPeriod[ChartPeriod["m12"] = 2] = "m12";
        ChartPeriod[ChartPeriod["m24"] = 3] = "m24";
        ChartPeriod[ChartPeriod["m36"] = 4] = "m36";
        ChartPeriod[ChartPeriod["All"] = 5] = "All";
    })(finance.ChartPeriod || (finance.ChartPeriod = {}));
    var ChartPeriod = finance.ChartPeriod;

    /**
    * Represents a portfolio composed of items.
    * Each item corresponds to a company and includes the amount of shares
    * purchase and the purchase price.
    */
    var Portfolio = (function () {
        function Portfolio() {
            this._chartPeriod = 2 /* m12 */;
            // raise event when items change
            // (on a timeout to avoid too many updates)
            this.itemsChanged = new wijmo.Event();
            // initialize items collection/view
            this._items = new wijmo.collections.ObservableArray();
            this._cv = new wijmo.collections.CollectionView(this._items);
            this._cv.collectionChanged.addHandler(this.viewChanged.bind(this));

            // load the portfolio from storage
            this.loadItems();

            // if we have no items, add a few now
            if (this._items.length == 0) {
                this.addItem('AMZN', true, 10, 295);
                this.addItem('AAPL', true, 10, 570);
                this.addItem('GOOG', true, 10, 520);
                this.addItem('FB');
                this.addItem('GM');
            }

            // save portfolio when unloading
            var self = this;
            window.addEventListener('unload', function () {
                self.saveItems();
            });
        }
        Portfolio.prototype.viewChanged = function () {
            var self = this;
            if (!self._updating) {
                self._updating = true;
                if (self._toChange) {
                    clearTimeout(self._toChange);
                }
                self._toChange = setTimeout(function () {
                    self.updateChartData();
                    self.itemsChanged.raise(self);
                    self._cv.refresh();
                    self._updating = false;
                    //console.log('raised itemsChanged');
                }, 250);
            }
        };

        Object.defineProperty(Portfolio.prototype, "view", {
            // gets the view with the portfolio items
            get: function () {
                return this._cv;
            },
            enumerable: true,
            configurable: true
        });

        Object.defineProperty(Portfolio.prototype, "chartPeriod", {
            // gets or sets the chart period
            get: function () {
                return this._chartPeriod;
            },
            set: function (value) {
                this._chartPeriod = value;
                this.updateChartData();
                this.viewChanged();
            },
            enumerable: true,
            configurable: true
        });

        // gets the chart start date based on the current date and chart period
        Portfolio.prototype.getChartStartDate = function () {
            var dt = new Date();
            switch (this.chartPeriod) {
                case 5 /* All */:
                    return new Date(2005, 1, 1);
                case 0 /* YTD */:
                    return new Date(dt.getFullYear(), 0, 1);
                case 1 /* m6 */:
                    dt.setMonth(dt.getMonth() - 6);
                    return dt;
                case 2 /* m12 */:
                    dt.setFullYear(dt.getFullYear() - 1);
                    return dt;
                case 3 /* m24 */:
                    dt.setFullYear(dt.getFullYear() - 2);
                    return dt;
                case 4 /* m36 */:
                    dt.setFullYear(dt.getFullYear() - 3);
                    return dt;
            }

            // unknown period, use the last 12 months
            dt.setFullYear(dt.getFullYear() - 1);
            return dt;
        };

        // add new item
        Portfolio.prototype.addNewItem = function () {
            if (this.newItemSymbol != null) {
                this.addItem(this.newItemSymbol);
                this.newItemSymbol = null;
            }
        };
        Portfolio.prototype.canAddNewItem = function () {
            return this.newItemSymbol && this.indexOf(this.newItemSymbol) < 0;
        };
        Object.defineProperty(Portfolio.prototype, "newItemSymbol", {
            get: function () {
                return this._newItemSymbol;
            },
            set: function (value) {
                this._newItemSymbol = value;
            },
            enumerable: true,
            configurable: true
        });

        Object.defineProperty(Portfolio.prototype, "cost", {
            // gets the cost paid for the shares in the portfolio
            get: function () {
                var cost = 0, items = this._cv.items;
                for (var i = 0; i < items.length; i++) {
                    var item = items[i];
                    var s = item.shares;
                    var p = item.purchasePrice;
                    if (s && p) {
                        cost += s * p;
                    }
                }
                return cost > 0 ? cost : null;
            },
            enumerable: true,
            configurable: true
        });

        Object.defineProperty(Portfolio.prototype, "value", {
            // gets the market value of the shares in the portfolio
            get: function () {
                var value = 0, items = this._cv.items;
                for (var i = 0; i < items.length; i++) {
                    var item = items[i];
                    var s = item.shares;
                    var p = item.lastPrice;
                    if (s && p) {
                        value += s * p;
                    }
                }
                return value > 0 ? value : null;
            },
            enumerable: true,
            configurable: true
        });

        Object.defineProperty(Portfolio.prototype, "gain", {
            // gets the gain earned with the shares in the portfolio
            get: function () {
                var v = this.value;
                var c = this.cost;
                return v && c ? v - c : null;
            },
            enumerable: true,
            configurable: true
        });

        Object.defineProperty(Portfolio.prototype, "gainPercent", {
            // gets the percentage gain earned with the shares in the portfolio
            get: function () {
                var v = this.value;
                var c = this.cost;
                return v && c ? v / c - 1 : null;
            },
            enumerable: true,
            configurable: true
        });

        // load items from local storage
        Portfolio.prototype.loadItems = function () {
            try  {
                var data = localStorage != null ? localStorage[Portfolio.STGKEY] : null;
                if (data != null && JSON != null) {
                    data = JSON.parse(data);
                    this.chartPeriod = data.chartPeriod;
                    for (var i = 0; i < data.items.length; i++) {
                        var item = data.items[i];
                        this.addItem(item.symbol, item.chart, item.shares, item.purchasePrice);
                    }
                    if (data.sort) {
                        var sd = new wijmo.collections.SortDescription(data.sort.property, data.sort.ascending);
                        this.view.sortDescriptions.push(sd);
                    }
                }
            } catch (err) {
            }
        };

        // save items to local storage
        Portfolio.prototype.saveItems = function () {
            try  {
                if (localStorage != null && JSON != null) {
                    var data = {
                        chartPeriod: this.chartPeriod,
                        sort: null,
                        items: []
                    };
                    if (this.view.sortDescriptions.length > 0) {
                        var sd = this.view.sortDescriptions[0];
                        data.sort = { property: sd.property, ascending: sd.ascending };
                    }
                    for (var i = 0; i < this._cv.items.length; i++) {
                        var item = this._cv.items[i];
                        var newItem = {
                            symbol: item.symbol,
                            chart: item.chart,
                            shares: item.shares,
                            purchasePrice: item.purchasePrice
                        };
                        data.items.push(newItem);
                    }
                    localStorage[Portfolio.STGKEY] = JSON.stringify(data);
                }
            } catch (err) {
            }
        };

        // add an item to the portfolio
        Portfolio.prototype.addItem = function (symbol, chart, shares, purchasePrice) {
            if (typeof chart === "undefined") { chart = true; }
            if (typeof shares === "undefined") { shares = null; }
            if (typeof purchasePrice === "undefined") { purchasePrice = null; }
            if (symbol) {
                var index = this.indexOf(symbol);
                if (index < 0) {
                    var item = new PortfolioItem(this, symbol, chart, shares, purchasePrice);
                    this._items.push(item);
                }
            }
        };

        // remove an item from the portfolio
        Portfolio.prototype.removeItem = function (symbol) {
            var index = this.indexOf(symbol);
            if (index > -1) {
                this._items.splice(index, 1);
            }
        };

        // gets the index of an item in the portfolio given a symbol
        Portfolio.prototype.indexOf = function (symbol) {
            if (symbol) {
                symbol = symbol.toUpperCase();
                for (var i = 0; i < this._items.length; i++) {
                    if (this._items[i].symbol == symbol) {
                        return i;
                    }
                }
            }
            return -1;
        };

        // get a company from the global cache or load it if necessary
        Portfolio.prototype.getCompany = function (symbol) {
            var self = this, c = Portfolio._companyCache[symbol];

            // company not in cache? create now
            if (c == null) {
                // create and store in cache
                c = new Company(symbol);
                Portfolio._companyCache[symbol] = c;

                // get company name
                $.get('StockInfo.ashx?name=' + symbol, function (result) {
                    c.name = result;
                    self.viewChanged();

                    //console.log('got ' + c.symbol + 'name: ' + c.name);
                    // get company prices
                    $.get('StockInfo.ashx?prices=' + symbol, function (result) {
                        // store prices
                        var lines = result.split('\r');
                        for (var i = 0; i < lines.length; i++) {
                            var items = lines[i].split('\t');
                            if (items.length == 2) {
                                var date = new Date($.trim(items[0]).replace(/-/g, '/')), price = parseFloat(items[1]);
                                c.prices.push({ date: date, price: price });
                            }
                        }
                        self.viewChanged();
                        //console.log('got ' + c.prices.length + ' prices for ' + c.name);
                    });
                });
            }
            return c;
        };

        // updates the chart data for all items
        Portfolio.prototype.updateChartData = function () {
            for (var i = 0; i < this._items.length; i++) {
                this._items[i].updateChartData();
            }
        };
        Portfolio.STGKEY = 'invxItems';
        Portfolio._companyCache = {};
        return Portfolio;
    })();
    finance.Portfolio = Portfolio;

    /**
    * Represents a portfolio item.
    * Each item corresponds to a company and includes the amount of shares
    * purchase and the purchase price.
    */
    var PortfolioItem = (function () {
        function PortfolioItem(portfolio, symbol, chart, shares, purchasePrice) {
            this._chartData = [];
            this._portfolio = portfolio;
            this._chart = chart;
            this._shares = shares;
            this._purchasePrice = purchasePrice;
            this._company = portfolio.getCompany(symbol);
        }
        Object.defineProperty(PortfolioItem.prototype, "symbol", {
            get: function () {
                return this._company.symbol;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "name", {
            get: function () {
                return this._company.name;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "color", {
            get: function () {
                return this._company.color;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "chart", {
            get: function () {
                return this._chart;
            },
            set: function (value) {
                if (this._chart != value) {
                    this._chart = value;
                    this._portfolio.viewChanged();
                }
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "chartData", {
            get: function () {
                return this._chartData;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "lastPrice", {
            get: function () {
                if (this._company && this._company.prices && this._company.prices.length > 0) {
                    var p = this._company.prices;
                    return p[0].price;
                }
                return null;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "change", {
            get: function () {
                if (this._company && this._company.prices && this._company.prices.length > 1) {
                    var p = this._company.prices;
                    return p[0].price - p[1].price;
                }
                return null;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "changePercent", {
            get: function () {
                if (this._company && this._company.prices && this._company.prices.length > 1) {
                    var p = this._company.prices;
                    if (p[1].price != 0) {
                        return p[0].price / p[1].price - 1;
                    }
                }
                return null;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "shares", {
            get: function () {
                return this._shares;
            },
            set: function (value) {
                value = value * 1;
                if (value <= 0 || isNaN(value)) {
                    value = null;
                }
                this._shares = value;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "purchasePrice", {
            get: function () {
                return this._purchasePrice;
            },
            set: function (value) {
                value = value * 1;
                if (value <= 0 || isNaN(value)) {
                    value = null;
                }
                this._purchasePrice = value;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "costBasis", {
            get: function () {
                var s = this._shares, p = this._purchasePrice;
                return s && p ? s * p : null;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "marketValue", {
            get: function () {
                var s = this._shares, p = this.lastPrice;
                return s && p ? s * p : null;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "gain", {
            get: function () {
                var c = this.costBasis, v = this.marketValue;
                return c && v ? v - c : null;
            },
            enumerable: true,
            configurable: true
        });
        Object.defineProperty(PortfolioItem.prototype, "gainPercent", {
            get: function () {
                var v = this.marketValue, c = this.costBasis;
                return v && c ? v / c - 1 : null;
            },
            enumerable: true,
            configurable: true
        });

        // updates the data to be shown on the chart
        PortfolioItem.prototype.updateChartData = function () {
            var firstValue = null, chartData = [], prices = this._company.prices, startDate = this._portfolio.getChartStartDate();

            for (var i = prices.length - 1; i >= 0; i--) {
                var p = prices[i];

                // skip entries that are not within the period
                if (p.date.getTime() < startDate.getTime()) {
                    continue;
                }

                // set price
                if (firstValue == null) {
                    firstValue = p.price;
                }
                var change = (p.price / firstValue) - 1;
                chartData.push({ date: p.date, price: p.price, change: change });
            }

            // save chart data
            this._chartData = chartData;
            //console.log('updated chart data for ' + this.symbol + ' ' + this.chartData.length + ' items');
        };
        return PortfolioItem;
    })();
    finance.PortfolioItem = PortfolioItem;

    /**
    * Represents a publicly traded company.
    * The class contains the company name, ticker symbol, price history,
    * and the color used to represent the company in the UI.
    */
    var Company = (function () {
        function Company(symbol) {
            this.prices = [];
            this.symbol = symbol;
            this.color = Company._palette[Company._ctr % Company._palette.length];
            Company._ctr++;
        }
        Company._palette = [
            '#3366CC', '#DC3912', '#FF9900', '#109618', '#990099', '#3B3EAC', '#0099C6',
            '#DD4477', '#66AA00', '#B82E2E', '#316395', '#994499', '#22AA99', '#AAAA11',
            '#6633CC', '#E67300', '#8B0707', '#329262', '#5574A6', '#3B3EAC', '#000000',
            '#FFBE00', '#94D752', '#00B652', '#00B6EF', '#0075C6', '#002263', '#73359C',
            '#B53D9C', '#BD3D6B', '#AD65BD', '#DE6D33', '#FFB638', '#CE6DA5', '#FF8E38',
            '#525D6B', '#FF8633', '#739ADE', '#B52B15', '#F7CF2B', '#ADBAD6', '#737D84',
            '#424452', '#737DA5', '#9CBACE', '#D6DB7B', '#FFDB7B', '#BD8673', '#8C726B',
            '#424C22', '#A5B694', '#F7A642', '#E7BE2B', '#D692A5', '#9C86C6', '#849EC6',
            '#4A2215', '#3892A5', '#FFBA00', '#C62B2B', '#84AA33', '#944200', '#42598C',
            '#383838', '#6BA2B5', '#CEAE00', '#8C8AA5', '#738663', '#9C9273', '#7B868C',
            '#15487B', '#4A82BD', '#C6504A', '#9CBA5A', '#8465A5', '#4AAEC6', '#F79642',
            '#6B656B', '#CEBA63', '#9CB284', '#6BB2CE', '#6386CE', '#7B69CE', '#A578BD',
            '#332E33', '#F77D00', '#382733', '#15597B', '#4A8642', '#63487B', '#C69A5A',
            '#636984', '#D6604A', '#CEB600', '#28AEAD', '#8C7873', '#8CB28C', '#0E924A'
        ];
        Company._ctr = 0;
        return Company;
    })();
    finance.Company = Company;
})(finance || (finance = {}));
//# sourceMappingURL=portfolio.js.map
