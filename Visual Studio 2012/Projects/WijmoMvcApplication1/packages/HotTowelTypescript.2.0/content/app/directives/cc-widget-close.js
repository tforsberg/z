/// <reference path="../app.ts" />
/// <reference path="../../scripts/typings/angularjs/angular.d.ts" />
/// <reference path="../../scripts/typings/jquery/jquery.d.ts" />
'use strict';
var App;
(function (App) {
    (function (Directives) {
        

        var CcWidgetClose = (function () {
            function CcWidgetClose() {
                this.restrict = "A";
                this.template = '<i class="fa fa-remove"></i>';
                this.link = function (scope, element, attrs) {
                    attrs.$set('href', '#');
                    attrs.$set('wclose');
                    element.click(close);

                    function close(e) {
                        e.preventDefault();
                        element.parent().parent().parent().hide(100);
                    }
                };
            }
            CcWidgetClose.directiveId = 'ccWidgetClose';
            return CcWidgetClose;
        })();

        // Register in angular app
        App.app.directive(CcWidgetClose.directiveId, [function () {
                return new CcWidgetClose();
            }]);
    })(App.Directives || (App.Directives = {}));
    var Directives = App.Directives;
})(App || (App = {}));
//# sourceMappingURL=cc-widget-close.js.map
