/// <reference path="../app.ts" />
/// <reference path="../../scripts/typings/angularjs/angular.d.ts" />
/// <reference path="../../scripts/typings/jquery/jquery.d.ts" />
'use strict';
var App;
(function (App) {
    (function (Directives) {
        

        var CcWidgetHeader = (function () {
            function CcWidgetHeader() {
                this.restrict = "A";
                this.templateUrl = '/app/layout/widgetheader.html';
                this.scope = {
                    'title': '@',
                    'subtitle': '@',
                    'rightText': '@',
                    'allowCollapse': '@'
                };
                // controller = ()=>{};
                this.link = function (scope, element, attrs) {
                    attrs.$set('class', 'widget-head');
                };
            }
            CcWidgetHeader.directiveId = 'ccWidgetHeader';
            return CcWidgetHeader;
        })();

        //References angular app
        App.app.directive(CcWidgetHeader.directiveId, [function () {
                return new CcWidgetHeader();
            }]);
    })(App.Directives || (App.Directives = {}));
    var Directives = App.Directives;
})(App || (App = {}));
//# sourceMappingURL=cc-widget-header.js.map
