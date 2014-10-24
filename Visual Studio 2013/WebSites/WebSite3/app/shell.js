define(function (require) {
    var router = require('plugins/router');

    return {
        router: router,
        activate: function () {
            router.map([
                { route: '', title: 'Home', moduleId: 'home', nav: true },
                { route: 'rainier', title: 'Mount Rainier', moduleId: 'rainier', nav: true },
                { route: 'todd', title: 'Todd', moduleId: 'todd', nav: true }
            ]).buildNavigationModel();

            return router.activate();
        }
    };
});
