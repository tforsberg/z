'use strict';
var Application;
(function (Application) {
    (function (Controllers) {
        var controllerId = 'sidebar';
        angular.module('app').controller(controllerId, [
            '$route', 'config', 'routes',
            function ($route, config, routes) {
                return new Sidebar($route, config, routes);
            }
        ]);

        var Sidebar = (function () {
            //using shortcut syntax on private variables in the constructor
            function Sidebar($route, config, routes) {
                this.$route = $route;
                this.config = config;
                this.routes = routes;
                this.activate();
            }
            Sidebar.prototype.isCurrent = function (route) {
                if (!route.config.title || !this.$route.current || !this.$route.current.title) {
                    return '';
                }
                var menuName = route.config.title;
                return this.$route.current.title.substr(0, menuName.length) === menuName ? 'current' : '';
            };
            Sidebar.prototype.navClick = function () {
            };

            Sidebar.prototype.activate = function () {
                this.getNavRoutes();
            };

            Sidebar.prototype.getNavRoutes = function () {
                this.navRoutes = this.routes.filter(function (r) {
                    return r.config.settings && r.config.settings.nav;
                }).sort(function (r1, r2) {
                    return r1.config.settings.nav - r2.config.settings.nav;
                });
            };
            return Sidebar;
        })();
        Controllers.Sidebar = Sidebar;
    })(Application.Controllers || (Application.Controllers = {}));
    var Controllers = Application.Controllers;
})(Application || (Application = {}));
//# sourceMappingURL=sidebar.js.map
