'use strict';

var app = angular.module('app');

// input controller: provides a list of countries and some input values
app.controller('inputCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {

        // data
        today: new Date(),
        pi: Math.PI,
        departureDate: new Date(),
        returnDate: new Date(),
        passengers: 1,
        price: 0,
        tax: .085,

        // controls
        cmb1: null,
        cmb2: null,
        ac1: null,
        ac2: null,
        acAsync: null,
        listBox1: null,
        listBox2: null,
        listBox3: null,

        // culture
        culture: 'en'
    };

    // handle menu clicks: this method gets invoked when the menu's itemClicked event fires
    $scope.menuItemClicked = function (sender, args) {
        var menu = sender;
        alert('Thanks for selecting option ' + menu.selectedIndex + ' from menu **' + menu.header + '**!');
    }

    // handle menu commands: this command is used in menu items
    $scope.changeValueCommand = {
        executeCommand: function (parm) {
            if (wijmo.isNumber(parm)) {
                $scope.ctx.passengers += parm;
            } else {
                $scope.ctx.passengers = 1; // reset
            }
            $scope.$apply('ctx.passengers');
        },
        canExecuteCommand: function (parm) {
            if (wijmo.isNumber(parm)) {
                var val = $scope.ctx.passengers + parm;
                return val >= 0 && val <= 100;
            }
            return true;
        }
    }

    // when the culture changes, load the new culture, apply, and invalidate
    $scope.$watch('ctx.culture', function () {
        $.ajax({
            url: 'scripts/vendor/wijmo.culture.' + $scope.ctx.culture + '.js',
            dataType: 'script',
            success: function (data) {
                eval(data);

                // culture applied, now load translations
                $.ajax({
                    url: 'translations/strings.' + $scope.ctx.culture + '.js',
                    dataType: 'json',
                    async: false,
                    success: function (data) {
                        $scope.i18n = data;

                        // show changes
                        $scope.$apply();
                        invalidateWijmoControls(document.body);
                    }
                });
            },
        });
    });

    // invalidate all Wijmo controls on the page
    function invalidateWijmoControls(e) {
        var ctl = wijmo.Control.getControl(e);
        if (ctl) {
            ctl.invalidate();
        }
        if (e.children) {
            for (var i = 0; i < e.children.length; i++) {
                invalidateWijmoControls(e.children[i]);
            }
        }
    }

    // model data

    // as an array
    $scope.ctx.countries = [
        'Afghanistan', 'Albania', 'Algeria', 'American Samoa', 'Andorra', 'Angola', 'Anguilla', 'Antigua', 'Argentina', 'Armenia',
        'Aruba', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize',
        'Benin', 'Bermuda', 'Bhutan', 'Bolivia', 'Bonaire', 'Bosnia', 'Botswana', 'Brazil', 'Brunei', 'Bulgaria', 'Burkina Faso', 'Burundi',
        'Cambodia', 'Cameroon', 'Canada', 'Canary Islands', 'Cape Verde', 'Cayman Islands', 'Central African Republic', 'Chad', 'Channel Islands',
        'Chile', 'China', 'Christmas Island', 'Cocos Island', 'Colombia', 'Comoros', 'Congo', 'Cook Islands', 'Costa Rica', "Cote D'Ivoire",
        'Croatia', 'Cuba', 'Curacao', 'Cyprus', 'Czech Republic', 'Denmark', 'Djibouti', 'Dominica', 'Dominican Republic', 'East Timor', 'Ecuador',
        'Egypt', 'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia', 'Ethiopia', 'Falkland Islands', 'Faroe Islands', 'Fiji', 'Finland',
        'France', 'French Guiana', 'French Polynesia', 'French Southern Ter', 'Gabon', 'Gambia', 'Georgia', 'Germany', 'Ghana', 'Gibraltar',
        'Great Britain', 'Greece', 'Greenland', 'Grenada', 'Guadeloupe', 'Guam', 'Guatemala', 'Guinea', 'Guyana', 'Haiti', 'Honduras',
        'Hong Kong', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran', 'Iraq', 'Ireland', 'Isle of Man', 'Israel', 'Italy', 'Jamaica', 'Japan',
        'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati', 'Korea North', 'Korea South', 'Kuwait', 'Kyrgyzstan', 'Laos', 'Latvia', 'Lebanon', 'Lesotho',
        'Liberia', 'Libya', 'Liechtenstein', 'Lithuania', 'Luxembourg', 'Macau', 'Macedonia', 'Madagascar', 'Malaysia', 'Malawi', 'Maldives',
        'Mali', 'Malta', 'Marshall Islands', 'Martinique', 'Mauritania', 'Mauritius', 'Mayotte', 'Mexico', 'Midway Islands', 'Moldova', 'Monaco',
        'Mongolia', 'Montserrat', 'Morocco', 'Mozambique', 'Myanmar', 'Nambia', 'Nauru', 'Nepal', 'Netherland Antilles', 'Netherlands', 'Nevis',
        'New Caledonia', 'New Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'Niue', 'Norfolk Island', 'Norway', 'Oman', 'Pakistan', 'Palau Island',
        'Palestine', 'Panama', 'Papua New Guinea', 'Paraguay', 'Peru', 'Philippines', 'Pitcairn Island', 'Poland', 'Portugal', 'Puerto Rico',
        'Qatar', 'Republic of Montenegro', 'Republic of Serbia', 'Reunion', 'Romania', 'Russia', 'Rwanda', 'St Barthelemy', 'St Eustatius',
        'St Helena', 'St Kitts-Nevis', 'St Lucia', 'St Maarten', 'Saipan', 'Samoa', 'Samoa American', 'San Marino', 'Saudi Arabia', 'Scotland',
        'Senegal', 'Serbia', 'Seychelles', 'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands', 'Somalia', 'South Africa',
        'Spain', 'Sri Lanka', 'Sudan', 'Suriname', 'Swaziland', 'Sweden', 'Switzerland', 'Syria', 'Tahiti', 'Taiwan', 'Tajikistan', 'Tanzania',
        'Thailand', 'Togo', 'Tokelau', 'Tonga', 'Trinidad Tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Turks & Caicos Is', 'Tuvalu', 'Uganda',
        'Ukraine', 'United Arab Emirates', 'United Kingdom', 'United States of America', 'Uruguay', 'Uzbekistan', 'Vanuatu', 'Vatican City State',
        'Venezuela', 'Vietnam', 'Virgin Islands (British)', 'Virgin Islands (USA)', 'Wake Island', 'Yemen', 'Zaire', 'Zambia', 'Zimbabwe'
    ];

    // as an ICollectionView
    var items = [];
    for (var i = 0; i < $scope.ctx.countries.length; i++) {
        var c = $scope.ctx.countries[i];
        items.push({ id: i, country: c, length: c.length });
    }
    $scope.ctx.items = new wijmo.collections.CollectionView(items);
    $scope.ctx.items.moveCurrentToPosition(-1);

    // as a collection of HTML items
    $scope.ctx.htmlItems = [];
    for (var i = 0; i < 100; i++) {
        $scope.ctx.htmlItems.push('item <b>' + (i + 1) + '</b> of 100');
    }

    // function to retrieve companies using web service
    var cache = {};
    $scope.ctx.getCompanies = function (query, max, callback) {

        // try getting the result from the cache
        var result = cache[query];
        if (result) {
            callback(result);
            return;
        }

        // not in cache, get from server
        var params = { query: query, max: max };
        $.getJSON('companycatalog.ashx', params, function (response) {

            // add 'SymbolName' property to result
            var items = [];
            for (var i = 0; i < response.length; i++) {
                var c = response[i];
                c.SymbolName = c.Symbol + ': ' + c.Name;
            }

            // store result in cache
            cache[query] = response;

            // and return the result
            callback(response);
        })
        .fail(function (error) {
            console.log('error: ' + error.responseText);
            cache[query] = null; // << no point in trying this query again
            callback(null);
        });
    }
    // start service so there's no delay when the user starts typing
    var params = { query: 'start', max: 0 };
    $.getJSON('companycatalog.ashx', params);
});
