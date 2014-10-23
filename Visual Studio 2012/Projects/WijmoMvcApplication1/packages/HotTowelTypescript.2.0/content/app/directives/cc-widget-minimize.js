/// <reference path="../app.ts" />
/// <reference path="../../scripts/typings/angularjs/angular.d.ts" />
/// <reference path="../../scripts/typings/jquery/jquery.d.ts" />
'use strict';
var App;
(function (App) {
    (function (Directives) {
        

        var CcWidgetMinimize = (function () {
            function CcWidgetMinimize() {
                this.restrict = "A";
                this.template = '<i class="fa fa-chevron-up"></i>';
                this.link = function (scope, element, attrs) {
                    //$('body').on('click', '.widget .wminimize', minimize);
                    attrs.$set('href', '#');
                    attrs.$set('wminimize');
                    element.click(minimize);

                    function minimize(e) {
                        e.preventDefault();
                        var $wcontent = element.parent().parent().next('.widget-content');
                        var iElement = element.children('i');
                        if ($wcontent.is(':visible')) {
                            iElement.removeClass('fa fa-chevron-up');
                            iElement.addClass('fa fa-chevron-down');
                        } else {
                            iElement.removeClass('fa fa-chevron-down');
                            iElement.addClass('fa fa-chevron-up');
                        }
                        $wcontent.toggle(500);
                    }
                };
            }
            CcWidgetMinimize.directiveId = 'ccWidgetMinimize';
            return CcWidgetMinimize;
        })();

        //References angular app
        App.app.directive(CcWidgetMinimize.directiveId, [function () {
                return new CcWidgetMinimize();
            }]);
    })(App.Directives || (App.Directives = {}));
    var Directives = App.Directives;
})(App || (App = {}));
//# sourceMappingURL=cc-widget-minimize.js.map
