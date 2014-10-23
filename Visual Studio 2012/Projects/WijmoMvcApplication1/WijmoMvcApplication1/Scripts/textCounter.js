(function (angular) {
    'use strict';

    var app = angular.module('textCounter', []);

    var TextCounter = (function (options) {
        angular.extend(this, options);

        function TextCountResult(params) {
            this.counter = params.counter;
            this.text = params.text;
        };

        function TextCounter(options) {
            this.maxLength = options.maxLength;
            this.minLength = options.minLength;
            this.constrain = options.constrain !== null && options.constrain !== undefined;
            this.method = options.reverse !== null && options.reverse !== undefined ? "reverseCount" : "count";
        };

        TextCounter.prototype.init = function count(text) {
            return this[this.method](text);
        };

        TextCounter.prototype.count = function count(text) {
            if (!text) { return new TextCountResult({ counter: 0, text: "" })  }
            var self = this;
            return new TextCountResult({
                counter: text.length,
                text: self.constrain !== null ? self.constrainText(text, self.maxLength) : text
            });
        };

        TextCounter.prototype.reverseCount = function reverseCount(text) {
            if (!text) { return new TextCountResult({ counter: this.maxLength, text: "" }) }
            var self = this,
                returnObj = {},
                currentLength = text.length;

            if (self.constrain) {
                returnObj.counter = currentLength >= self.maxLength ? 0 : self.maxLength - currentLength;
                returnObj.text = self.constrainText(text, self.maxLength);
            } else {
                returnObj.counter = self.maxLength - currentLength;
                returnObj.text = text;
            }

            return new TextCountResult(returnObj);
        };

        TextCounter.prototype.constrainText = function constrainText(text, maxLength) {
            return text.substring(0, maxLength);
        };

        return new TextCounter(options);
    });

    TextCounter.create = function create(options) {
        return new TextCounter(options);
    };

    app.factory('TextCounter', function () {
        return TextCounter;
    });

    app.directive('textCounter', ['TextCounter', function (TextCounter) {
        return {
            replace: true,
            restrict: 'E',
            scope: {
                text: "="
            },
            template: '<span></span>',
            link: function ($scope, el, attrs) {

                var maxLength = attrs.maxLength,
                        constrain = attrs.constrain,
                        reverse = attrs.reverse;

                var options = {
                    maxLength: maxLength,
                    constrain: constrain,
                    reverse: reverse
                };

                $scope.theCounter = TextCounter.create(options)

                $scope.$watch('text', function (newDate) {
                    var returnObj = $scope.theCounter.init($scope.text);
                    $scope.text = returnObj.text;
                    el.text(returnObj.counter);
                });

            }
        }
    }]);
})(window.angular);