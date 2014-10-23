/***********************************************************************************
* ViewModel class.
* This class provides various types of demographic information for a given 
* location/zoom level.
* @constructor
*/
function viewModel() {

    // information sources available to views
    this.sources = {
        tapestry: new infoSource(this, "USA_Tapestry", "DOMTAP,TAPSEGNAM"),
        populationBySex: new infoSource(this, "USA_Population_by_Sex", "TOTPOP_CY,PMALE_CY,PFEMALE_CY,MALES_CY,FEMALES_CY"),
        age: new infoSource(this, "USA_Median_Age", "TOTPOP_CY,MEDAGE_CY,POP0_9,POP10_19,POP20_29,POP30_39,POP40_49,POP50_59,POP60_69,POP70_79,POP80_plus", "POP0_9,POP80_plus", "2012 Total Population Age "),
        householdIncome: new infoSource(this, "USA_Median_Household_Income", "TOTPOP_CY,MEDHINC_CY,HINCBASECY,HINC50_CY,HINC75_CY,HINC100_CY,HINC150_CY,HINC200_CY,MEDHHINC_pct_USAvg,HINC0_25,HINC25_50", "HINC50_CY,HINC200_CY", "2012 Household Income "),
        netWorth: new infoSource(this, "USA_Median_Net_Worth", "TOTPOP_CY,MEDVAL_I,MEDHINC_I,MEDNW_CY,MEDNW_I,NWBASE_CY,NW0_CY,NW15_CY,NW35_CY,NW50_CY,NW75_CY,NW100_CY,NW150_CY,NW250_CY,NW500_CY,MEDNETWORTH_pct_USAvg", "NW0_CY,NW500_CY", "2012 Net Worth "),
        homeValue: new infoSource(this, "USA_Median_Home_Value", "TOTPOP_CY,MEDVAL_CY,MEDVAL_I,MEDHINC_I,MEDNW_I,VALBASE_CY,VAL0_CY,VAL50K_CY,VAL100K_CY,VAL150K_CY,VAL200K_CY,VAL250K_CY,VAL300K_CY,VAL400K_CY,VAL1M_CY,MEDHMVAL_pct_USAvg,VAL500_1M", "VAL0_CY,VAL1M_CY", "2012 Home Value ")
        //daytimePopulation: new infoSource(this, "USA_Daytime_Population", "TOTPOP_CY,DNRATIO_CY"),
        //populationDensity: new infoSource(this, "USA_Population_Density", "TOTPOP_CY,POPDENS_CY"),
        //retailSpendingPotential: new infoSource(this, "USA_Retail_Spending_Potential", "TOTPOP_CY,MEDHINC_CY,X15001_A,X15001_I"),
        //unemploymentRate: new infoSource(this, "USA_Unemployment_Rate", "TOTPOP_CY,MEDVAL_I_12,MEDHINC_I_12,MEDNW_I_12,UNEMP_CY_12,UNEMPRT_CY_12")
    };

    // add summary information
    this.sources.age.shortList = [
        new infoValue("POP0_9,POP10_19,POP20_29", "under 30"),
        new infoValue("POP30_39,POP40_49,POP50_59", "30 to 59"),
        new infoValue("POP60_69,POP70_79,POP80_plus", "60 and over")
    ];
    this.sources.householdIncome.shortList = [
        new infoValue("HINC50_CY", "under 75k"),
        new infoValue("HINC75_CY,HINC100_CY", "75k to 150k"),
        new infoValue("HINC150_CY,HINC200_CY", "100k and above")
    ];
    this.sources.netWorth.shortList = [
        new infoValue("NW0_CY,NW15_CY,NW35_CY", "under 50k"),
        new infoValue("NW50_CY,NW75_CY,NW100_CY", "50k to 150k"),
        new infoValue("NW150_CY,NW250_CY,NW500_CY", "150k and above")
    ];
    this.sources.homeValue.shortList = [
        new infoValue("VAL50K_CY,VAL100K_CY", "under 150k"),
        new infoValue("VAL150K_CY,VAL200K_CY,VAL250K_CY,VAL300K_CY", "150k to 500k"),
        new infoValue("VAL400K_CY,VAL1M_CY", "500k and above")
    ];

    // initialize current location, extent
    this.extent = new esri.geometry.Extent({
        xmin: -10392864, ymin: 4444140,
        xmax: -7423438, ymax: 5422534,
        spatialReference: { wkid: 102100} });

    // go get the data
    this.locationName = "";
    this.onGotData = null;
    this.getData();
}
/**
* Updates the current extent.
*/
viewModel.prototype.setExtent = function (extent) {
    if (this.extent != extent) {
        var sameExtent =
            extent.xmin == this.extent.xmin && extent.ymin == this.extent.ymin &&
            extent.xmax == this.extent.xmax && extent.ymax == this.extent.ymax;
        if (!sameExtent) {
            this.extent = extent;
            this.getData();
        }
    }
}
/**
* Get the current location (lat, lon, name).
*/
viewModel.prototype.getLocation = function () {
    var ptm = this.extent.getCenter();
    var ptg = esri.geometry.webMercatorToGeographic(ptm);
    return {
        lat: ptg.y,
        lon: ptg.x,
        name: this.locationName ? this.locationName : "Please select a location within the USA.", 
        isValid: this.locationName != null };
}
/**
* Get a description for an index (100: national average, 50 is half, 200 is double, etc)
*/
viewModel.prototype.getIndexDescription = function (index) {
    var desc =
        index < 50 ? "substantially lower" :
        index < 80 ? "lower" :
        index < 100 ? "slightly lower" :
        index < 120 ? "slightly higher" :
        index < 200 ? "higher" :
        "substantially higher";
    return desc + " than the national average";
}
/**
* Inform listeners that new data has arrived.
*/
viewModel.prototype.gotData = function () {

    // get location name from age layer
    this.locationName = this.sources.age.getLocationName();

    // get dominant tapestry description
    var domTap = this.sources.tapestry.values.DOMTAP.value;
    this.domTapDescription = getTapestryDescription(domTap);

    // notify listeners of the changes
    if (this.onGotData) {
        clearTimeout(this.dataTimer);
        this.dataTimer = setTimeout(this.onGotData, 200);
    };
}
/**
* Updates the information in all InfoValues that have subscribers attached to them
* based on the location defined by a given map extent.
*/
viewModel.prototype.getData = function () {

    // update info scale
    this.infoScale = 4; // state level
    if (this.extent) {
        if (this.extent.getWidth() < 2e7) {
            this.infoScale = 3; // county level
        }
        if (this.extent.getWidth() < 2e6) {
            this.infoScale = 2; // tract level
        }
    }

    // update all infoValues
    for (member in this.sources) {
        var source = this.sources[member];
        source.getData();
    }
}


/***********************************************************************************
* infoSource class.
* The infoSource belongs to a ViewModel and provides information about a specific 
* demographic for the parent ViewModel's current extent.
* @constructor
*/
function infoSource(model, shortUrl, keys, listKeys, trimName) {
    this.model = model;         // owner model
    this.shortUrl = shortUrl;   // url used to retrieve data/tiles
    this.trimName = trimName;   // remove this part from item names
    this.values = {};           // object that contains the values
    this.list = [];             // list with range values

    // get start/end list keys
    var arr = listKeys != null ? listKeys.split(',') : null;
    var startKey = arr != null ? arr[0] : null;
    var endKey = arr != null ? arr[1] : null;

    // keys used to query/store values
    keys = "NAME,ST_ABBREV," + keys;
    var arr = keys.split(',');
    var addToList = false;
    for (var i = 0; i < arr.length; i++) {
        var key = arr[i];

        // add to values object
        var val = new infoValue(key);
        this.values[key] = val;

        // add to list
        if (!addToList && key == startKey) {
            addToList = true;
        }
        if (addToList) {
            this.list.push(val);
        }
        if (addToList && key == endKey) {
            addToList = false;
        }
    }

    // use service to get key descriptions
    var url = this.getSchemaUrl();
    var self = this;
    $.ajax({
        url: url,
        dataType: "jsonp",
        success: function (data) {
            if (data.layers) {
                var result = data.layers[1].fields;
                for (var i = 0; i < result.length; i++) {
                    var entry = result[i];
                    var iv = self.values[entry.name];
                    if (iv != null) {
                        var name = entry.alias;
                        if (name.indexOf(self.trimName) == 0) {
                            name = name.substring(self.trimName.length);
                        }
                        var pos = name.indexOf(" (Esri)");
                        if (pos > 0) {
                            name = name.substring(0, pos);
                        }
                        iv.name = name.trim();
                    }
                }
            }
        }
    });
}
/**
* Updates the information in this infoValue.
*/
infoSource.prototype.getData = function () {

    // go update the values
    if (this.model.extent) {

        // build query/fields to retrieve
        var query = new esri.tasks.Query();
        query.geometry = this.model.extent.getCenter();
        query.outFields = [];
        for (var key in this.values) {
            query.outFields.push(key);
        }

        // run query
        var url = this.getQueryUrl();
        var queryTask = new esri.tasks.QueryTask(url);
        var self = this;
        dojo.connect(queryTask, "onComplete", function (featureSet) { self.gotData(featureSet); });
        queryTask.execute(query);
    }
}
/**
* After getting values from ESRI service, store them in this infoSource.
*/
infoSource.prototype.gotData = function (featureSet) {
    if (featureSet.features.length > 0) {

        // get attributes
        var atts = featureSet.features[0].attributes;

        // update values in our data object
        for (var key in this.values) {
            var infoValue = this.values[key];
            infoValue.value = atts[key];
        }

        // update summary info values
        if (this.shortList != null) {
            for (var i = 0; i < this.shortList.length; i++) {
                var value = 0;
                var keys = this.shortList[i].key.split(",");
                for (var j = 0; j < keys.length; j++) {
                    var iv = this.values[keys[j]];
                    if (iv && iv.value) {
                        value += iv.value;
                    }
                }
                this.shortList[i].value = value;
            }
        }
    } else {

        // no data available: clear values 
        for (key in this.values) {
            var infoValue = this.values[key];
            infoValue.value = null;
        }
    }

    // inform model that we got new data
    this.model.gotData();
}
/**
* Get the location name for this info source.
*/
infoSource.prototype.getLocationName = function () {
    return this.values.NAME.value 
        ? this.values.NAME.value + ", " + this.values.ST_ABBREV.value
        : null;
}
// format used to build service urls
infoSource.prototype.URL_FORMAT =
    "http://services.arcgisonline.com:80/ArcGIS/rest/services/Demographics/SHORT_URL/MapServer";

// build url for getting the tiles for this infoSource
infoSource.prototype.getTileUrl = function () {
    return this.URL_FORMAT.replace("SHORT_URL", this.shortUrl);
}

// build url for querying data for the current scale
infoSource.prototype.getQueryUrl = function () {
    return this.getTileUrl() + "/" + this.model.infoScale;
}

// build url for querying data for the data schema
infoSource.prototype.getSchemaUrl = function () {
    return this.getTileUrl() + "/layers?f=json";
}

/***********************************************************************************
* Initializes a new instance of a infoValue.
* infoValue objects have a key, a name, and a value.
* @constructor
*/
function infoValue(key, name) {
    this.key = key;
    this.name = name ? name : "";
    this.value = 0;
}

/**************************************************************************************
* Tapestry segment descriptions from
* http://www.esri.com/library/brochures/pdfs/tapestry-segmentation.pdf
*/
function getTapestryDescription(index) {
    var desc = [
        "",
        "Mature, married, highly educated, and wealthy.",
        "Families who live in growing suburban neighborhoods.",
        "Closer to retirement than child-rearing age, 30 percent are married couples with children living at home.",
        "Busy, affluent young families",
        "Older, established, affluent neighborhoods characteristic of US coastal metropolitan areas.",
        "Cultured country life on the urban fringe: accept longer commutes to live near fewer neighbors.",
        "Affluent lifestyle in open spaces beyond the urban fringe. Forty percent are empty nesters.",
        "Enjoy single life in the big city: no home ownership or child-rearing responsibilities.",
        "Professionals who live a sophisticated, exclusive lifestyle. More than half are married-couple families.",
        "Prosperous domesticity, settled lives, especially middle-aged married couples.",
        "Upscale neighborhoods in Pacific coastal cities: more than 75% are families.",
        "A mix of Generation Xers and Baby Boomers, the youngest affluent family markets.",
        "Live in the suburbs but prefer the city lifestyle. Mostly professional couples.",
        "Enjoying the move from child-rearing to retirement.",
        "More than 70 percent are aged 55 years or older. Most residents have retired from professional occupations.",
        "Young, educated, working professionals, have a median age of 32.4 years.",
        "Married couples, many are blue-collar Baby Boomers with children aged 6–17 years.",
        "Middle-aged married couples who are comfortably settled in their single family homes in older neighborhoods.",
        "Upscale, young, affluent married couples who are starting their families.",
        "Diverse, dense neighborhoods situated primarily in the Northeast.",
        "Multicultural enclaves of young families, unique to densely populated cities in “gateway” states, primarily California.",
        "Prefer to live in older city neighborhoods. Approximately half of these households are singles.",
        "Cutting edge of urban style: young, diverse, and mobile. More than half the households are singles.",
        "A mix of household types similar to the US distribution. Approximately half of the households are composed of married-couple families.",
        "Sixty-five percent are married couples with and without children. Twenty percent are singles.",
        "The growing population of 12 million makes this the largest tapestry segment. Sixty-two percent of the households are married couple families; half of them have children.",
        "Young, educated singles, just beginning their professional careers in some of the largest US cities.",
        "Young, startup families, married couples with or without children, and single parents.",
        "Married couples with no children or singles who live alone.",
        "Mostly single seniors who live alone; a fourth is married couples with no children living at home.",
        "Pastoral settings in rural non-farm areas throughout the United States.",
        "Primarily a mix of married couple families, single parents, and singles who live alone.",
        "Scattered in suburbs across the country, these neighborhoods are found more frequently in the South and Midwest.",
        "Family is the cornerstone of life in these neighborhoods that are a mix of married couples, single parents, grandparents, and young and adult children.",
        "Located primarily in cities in “gateway” states on both US coasts; developing urban markets with a rich blend of cultures and household types.",
        "Either beginning their careers or retiring. They range in age from their 20s to 75 and older.",
        "Small, family-owned farms in the Midwest dominate this stable market.",
        "Family is central to this group; slightly more than half of the households have children.",
        "Change is the constant for this group, an  on-the-go population has a median age of 28.6 years.",
        "Young, married, and beginning parenthood. Ninety-two percent of the householders are younger than 45 years. ",
        "Growing communities in small towns in the South, Midwest, and West. Married couples and single parents are the primary household types in these areas.",
        "Found primarily in the rural South, these households consist of married couples with and without children, 87% white.",
        "Eighty percent of the householders are aged 65 years or older, 97% are white.",
        "Recently settled immigrants: more than half of the population is foreign born.",
        "Young, relatively diverse urban market; almost 80% are black.",
        "Slightly older than average, with a median age of 42.6 years; 50 percent are older than 55.",
        "The latest wave of western 'pioneers'. Nearly half were born outside the United States; 84 percent are Hispanic.",
        "Young singles who live alone and married-couple families; the median age is 33.3 years.",
        "Among the fastest growing in the nation (1.7% annually). Their median age is 53.6 years.",
        "Settled and close-knit, with a median age of 42.8 years, half of them have already retired.",
        "Married couples, single parents, and multi-generational families are the most common household types in these regions.",
        "A microcosm of urban diversity; their population is represented primarily by white, black, and Hispanic cultures.",
        "A mix of married-couple families, singles who live alone, and single-parent families. The median age for this group is 34.5 years.",
        "The smallest of all Tapestry segments, still shrinking due to urban renewal programs. The median age is 33.6 years.",
        "Most residents are aged between 18 and 34 years and live in single-person or shared households.",
        "Half of the households consist of married-couple families, 15 percent are single-parent families.",
        "With a median age of 41.3 years, this market is slightly older than the US median of 37 years.",
        "Three-quarters of the population in this family-oriented segment is Hispanic.",
        "These young families form the foundation of Hispanic life in the Southwest. Children are the center of these households.",
        "Diversity in household type and ethnicity characterizes this segment. Most of these residents are young, with a median age of 29.2 years.",
        "A diverse mix of race and ethnicity. More than half of the residents are Hispanic, mainly from Puerto Rico or the Dominican Republic.",
        "Eighty-three percent of the residents in this segment are black. Single-person and single-parent household types are predominant.",
        "Seventy-nine percent of the residents are enrolled in a college or university.",
        "Single-parent families or singles who live alone comprise most of these very young households.",
        "Four in ten householders are aged 65 years or older; the median age is 46.4 years. Most of them live alone. ",
        "Unclassified (include areas such as parks, golf courses, open spaces, or other types of undeveloped land).",
    ];
    return desc[index];
}