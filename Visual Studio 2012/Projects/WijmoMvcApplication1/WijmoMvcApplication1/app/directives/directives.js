'use strict';
var App;
(function (App) {
    (function (Directives) {
        //    var app = angular.module('app');
        //#region ccImgperson
        App.app.directive('ccImgPerson', ['config', ccImgPerson]);

        function ccImgPerson(config) {
            return {
                link: link,
                restrict: 'A'
            };

            function link(scope, element, attrs) {
            }
        }
    })(App.Directives || (App.Directives = {}));
    var Directives = App.Directives;
})(App || (App = {}));
//# sourceMappingURL=directives.js.map
