'use strict';

// declare app module
var app = angular.module('app');

// app controller
app.controller('appCtrl', function appCtrl($scope, $location) {
    var now = new Date(),
        minDate = new Date(now.getFullYear(), now.getMonth(), now.getDate()),
        maxDate = wijmo.DateTime.addMonths(minDate, 3),
        firebaseAppUrl = 'https://sweltering-fire-8302.firebaseio.com/';

    // variables exposed to view
    $scope.ctx = {
        appDate: null,
        appSlot: null,
        userApps: [],
        minDate: wijmo.Globalize.format(minDate, 'yyyy-MM-dd'),
        maxDate: wijmo.Globalize.format(maxDate, 'yyyy-MM-dd'),
        schedule: getSchedule(),
        slots: [
            // morning
            { hour: 8, header: '8:00 - 9:00 am' },
            { hour: 9, header: '9:00 - 10:00 am' },
            { hour: 10, header: '10:00 - 11:00 am' },
            { hour: 11, header: '11:00 am - noon' },
            // afternoon
            { hour: 13, header: '1:00 - 2:00 pm' },
            { hour: 14, header: '2:00 - 3:00 pm' },
            { hour: 15, header: '3:00 - 4:00 pm' },
            { hour: 16, header: '4:00 - 5:00 pm' },
        ]
    };

    // function to navigate to different views
    $scope.gotoView = function(view) {
        $location.path('#/' + view);
    };

    // function to format dates in the calendar to show availability
    $scope.itemFormatter = function (date, element) {
        var available = !wijmo.hasClass(element, 'wj-state-selected') && isDateAvailable(date);
        wijmo.toggleClass(element, 'date-available', available);
    };

    // watch for changes in the appointment date
    $scope.$watch('ctx.appDate', function () {
        updateView();
    });

    // book the appointment at the selected date and time
    $scope.bookIt = function () {

        // ensure user is logged in
        var user = $scope.auth.user;
        if (!user) {
            $location.path('/login');
            return;
        }

        // book the appointment
        var date = $scope.ctx.appDate,
            slot = $scope.ctx.appSlot,
            apps = $scope.ctx.schedule;
        if (date && slot && apps) {

            // add new appointment
            // NOTE: Some OAuth providers (Twitter) do not provide the user's e-mail address,
            // so we don't count on that here and use 'uid' instead. If we used only Facebook 
            // and Google for authentication, it would be possible to get the e-mail and use 
            // that for making appointments and contacting the customers.
            var app = apps.addNew();
            app.date = new Date(date.getFullYear(), date.getMonth(), date.getDate(), slot.hour);
            app.customer = user.uid;
            apps.commitNew();

            // ensure the date is valid, update slots
            updateView();
        }
    }

    // remove an appointment
    $scope.unbookIt = function (app) {
        var apps = $scope.ctx.schedule;
        apps.remove(app);
        if (!apps.items.length) {
            $scope.gotoView('book');
        }
    }

    // gets the FirebaseCollectionView with appointments
    function getSchedule() {

        // connect to appointments in Firebase db
        var url = firebaseAppUrl + '/appointments',
            dataTypes = [{ name: /date/, type: wijmo.DataType.Date }];
        var view = new wijmo.data.FirebaseCollectionView(url, dataTypes, function () {
            updateView(); // update view when the collection changes
        });

        // sort by date
        var sd = new wijmo.collections.SortDescription('date', true);
        view.sortDescriptions.push(sd);

        // return the view
        return view;
    };

    // ensure that the date selected is valid, update slots
    function updateView() {

        // select a date that is valid and available
        var date = $scope.ctx.appDate;
        if (!date || date < minDate) {
            date = minDate;
        }
        while (date && !isDateAvailable(date)) {
            date = wijmo.DateTime.addDays(date, 1);
        }
        $scope.ctx.appDate = date;

        // update the slots
        updateSlots();

        // invalidate calendar (in case the date hasn't changed)
        if ($scope.ctx.calendar) {
            $scope.ctx.calendar.invalidate();
        }

        // let Angular update the view
        if (!$scope.$$phase) {
            $scope.$apply();
        }
    };

    // get the slot for a given hour
    function getSlot(hour) {
        var slots = $scope.ctx.slots;
        for (var i = 0; i < slots.length; i++) {
            if (slots[i].hour == hour) {
                return slots[i];
            }
        }
        return null;
    }

    // update slots available for this date
    function updateSlots() {
        var slots = $scope.ctx.slots,
            apps = $scope.ctx.schedule.items,
            date = $scope.ctx.appDate;

        // free up all the slots
        for (var i = 0; i < slots.length; i++) {
            slots[i].customer = null;
        }

        // add customers to slots
        for (var i = 0; i < apps.length; i++) {
            var app = apps[i];
            if (wijmo.DateTime.sameDate(date, app.date)) {
                var slot = getSlot(app.date.getHours());
                if (slot) {
                    slot.customer = app.customer;
                }
            }
        }

        // update current user's appointments
        var userApps = [];
        if ($scope.auth.user) {
            for (var i = 0; i < apps.length; i++) {
                var app = apps[i];
                if (app.customer == $scope.auth.user.uid) {
                    userApps.push(app);
                }
            }
        }
        $scope.ctx.userApps = userApps;

        // no slot selected
        $scope.ctx.appSlot = null;
    }

    // check if a date is available
    function isDateAvailable(date) {

        // check valid range
        if (date < minDate || date > maxDate) {
            return false;
        }

        // weekends are never available
        var weekday = date.getDay();
        if (weekday == 0 || weekday == 6) {
            return false;
        }

        // count the appointments for this date
        var appCnt = 0;
        if ($scope.ctx.schedule) {
            var apps = $scope.ctx.schedule.items;
            for (var i = 0; i < apps.length; i++) {
                var app = apps[i];
                if (wijmo.DateTime.sameDate(date, app.date)) {
                    appCnt++;
                }
            }
        }

        // return true if we have any slots left
        return appCnt < $scope.ctx.slots.length;
    };

    // create reference to firebase app, user authorization object
    // for details, see https://www.firebase.com/docs/web/guide/user-auth.html
    var firebase = new Firebase(firebaseAppUrl);
    $scope.auth = new FirebaseSimpleLogin(firebase, function (error, user) {

        // save user into 'auth' object for easy access
        $scope.auth.user = user;

        // get user's friendly name
        if (user) {
            user.firstName = user.displayName ? user.displayName.split(' ')[0] : user.username;
        }

        // switch to book view after logging in
        if (!error) {
            $scope.gotoView('book');
        }

        // and update view to show current appointments etc.
        updateView();
    });

    // log in using Firebase user authorization object
    $scope.login = function (provider) {
        $scope.auth.login(provider, { rememberMe: true });
    }

});
