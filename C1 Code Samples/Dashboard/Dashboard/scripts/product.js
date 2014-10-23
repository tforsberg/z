// product class
function product(data) {
    var self = this;

    // store raw data
    self.id = data.id;
    self.name = data.name;
    self.rank = data.rank;
    self.salesDct = data.sales;
    self.salesValues = [];

    // compute aggregates
    var sum = 0;
    var sum2 = 0;
    var count = 0;
    var min = null;
    var max = null;
    $.each(self.salesDct, function (period, value) {
        sum += value;
        sum2 += value * value;
        count++;
        min = min ? Math.min(min, value) : value;
        max = max ? Math.max(max, value) : value;
        self.salesValues.push(value);
    });
    var avg = Math.round(count > 0 ? sum / count : 0);
    self.sales = {

        // summary stats
        total: Math.round(sum),
        avg: Math.round(avg),
        stdev: Math.round(count > 0 ? Math.sqrt(sum2 / count - avg * avg) : 0),
        min: Math.round(min),
        max: Math.round(max),

        // this/prev quarter
        qThis: Math.round(self.getSales(self.getQuarter(true))),
        qPrev: Math.round(self.getSales(self.getQuarter(false)))
    };

    // target levels
    self.levels = {
        target: avg * 1.05,
        good: avg * 1.2,
        satisfactory: avg * .85,
        poor: avg - self.sales.stdev,
        critical: avg - self.sales.stdev * 0.2
    };

    // chart data
    self.chartData = [];
    $.each(this.salesDct, function (name, value) {
        if (value) {
            self.chartData.push([name, value]);
        }
    });
}

// gets the sales for a quarter, or zero if none
product.prototype.getSales = function (quarter) {
    var value = this.salesDct[quarter];
    return value ? value : 0;
}

// get the current or previous quarter IDs in the format yyyy-Qq
product.prototype.getQuarter = function (current) {
    var today = new Date();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    var qtr = Math.floor(((mm - 1) / 3) + 1);
    if (current) {
        return yyyy.toString() + "-Q" + qtr.toString();
    } else {
        return qtr == 1
            ? (yyyy - 1).toString() + "-Q4"
            : yyyy.toString() + "-Q" + (qtr - 1).toString();
    }
}
