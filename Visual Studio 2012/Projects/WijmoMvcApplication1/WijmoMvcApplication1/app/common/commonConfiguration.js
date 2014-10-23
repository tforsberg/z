var Application;
(function (Application) {
    /// <reference path="../../scripts/typings/angularjs/angular.d.ts" />
    (function (Shared) {
        'use strict';

        //-------STARTING COMMON MODULE----------
        // NB! script for this file must get loaded before the "child" script files
        // THIS CREATES THE ANGULAR CONTAINER NAMED 'common', A BAG THAT HOLDS SERVICES
        // CREATION OF A MODULE IS DONE USING ...module('moduleName', []) => retrieved using ...module.('...')
        // Contains services:
        //  - common
        //  - logger
        //  - spinner
        var commonModule = angular.module('common', []);

        // THIS IS A PROVIDER THAT ALLOWS YOU TO SET CONFIGURATIONS THAT ARE RUN INN CONFIG_PHASE, BEFORE
        // THE APPLICATION LIFE-CYCLE ENTERS THE RUN PHASE AND SERVICES ARE INSTANSIATED
        // Must configure the common service and set its
        // events via the commonConfigProvider
        commonModule.provider('commonConfig', function () {
            //This runs at the config phase of the application, before the "run" phase
            this.config = {};

            this.$get = function () {
                return {
                    config: this.config
                };
            };
        });
    })(Application.Shared || (Application.Shared = {}));
    var Shared = Application.Shared;
})(Application || (Application = {}));
//# sourceMappingURL=commonConfiguration.js.map
