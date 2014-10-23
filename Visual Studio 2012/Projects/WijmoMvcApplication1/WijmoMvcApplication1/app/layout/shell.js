/// <reference path="../common/common.ts" />
'use strict';
var Application;
(function (Application) {
    (function (Controllers) {
        var controllerId = 'shell';
        angular.module('app').controller(controllerId, [
            '$rootScope', 'common', 'config',
            function ($rootScope, common, config) {
                return new Shell($rootScope, common, config);
            }
        ]);

        var Shell = (function () {
            //#endregion
            function Shell($rootScope, common, config) {
                //#region Variables
                this.busyMessage = 'Please wait...';
                this.isBusy = true;
                this.spinnerOperations = {
                    radius: 40,
                    lines: 7,
                    length: 0,
                    width: 30,
                    speed: 1.7,
                    corners: 1.0,
                    trail: 100,
                    color: '#F58A00'
                };
                this.common = common;
                this.config = config;
                this.$rootScope = $rootScope;

                this.activate();
                this.registerEvents();
            }
            Shell.prototype.toggleSpinner = function (on) {
                this.isBusy = on;
            };

            Shell.prototype.activate = function () {
                var logger = this.common.logger.getLogFn(serviceId, 'success');
                logger('Hot Towel Angular loaded!', null, true);

                this.common.activateController([], controllerId);
            };

            Shell.prototype.registerEvents = function () {
                var _this = this;
                var events = this.config.events;
                this.$rootScope.$on('$routeChangeStart', function (event, next, current) {
                    _this.toggleSpinner(true);
                });

                this.$rootScope.$on(events.controllerActivateSuccess, function (data) {
                    _this.toggleSpinner(false);
                });

                this.$rootScope.$on(events.spinnerToggle, function (data) {
                    _this.toggleSpinner(data.show);
                });
            };
            return Shell;
        })();
        Controllers.Shell = Shell;
    })(Application.Controllers || (Application.Controllers = {}));
    var Controllers = Application.Controllers;
})(Application || (Application = {}));
//# sourceMappingURL=shell.js.map
