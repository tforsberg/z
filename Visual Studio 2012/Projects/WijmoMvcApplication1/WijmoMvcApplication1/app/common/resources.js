var Application;
(function (Application) {
    (function (Shared) {
        var Resources = (function () {
            function Resources() {
            }
            Resources.errorPrefix = '[HT Error] ';
            return Resources;
        })();
        Shared.Resources = Resources;
    })(Application.Shared || (Application.Shared = {}));
    var Shared = Application.Shared;
})(Application || (Application = {}));
//# sourceMappingURL=resources.js.map
