'use strict';

var app = angular.module('app');

app.controller('chartZoomCtrl', function appCtrl($scope) {

    // data context
    $scope.ctx = {
        chart: null,
        pts1: [],
        pts2: []
    };

    var ptsCount = 160;
    for (var i = 0; i < ptsCount; i++) {
        $scope.ctx.pts1.push({ x: 2 * Math.sin(0.16 * i), y: 2 * Math.cos(0.12 * i) });
        $scope.ctx.pts2.push({ x: Math.sin(0.1 * i), y: Math.cos(0.15 * i) });
    }

    var down = false;
    var isZoomed = false;
    var start = null;
    var end = null;
    var hostEl = null;
    var chart = null;
    var offset = null;
    var selection = null;

    function mouseDown(e) {
        if (!isZoomed) {
            down = true;
            e.preventDefault();
        }
    }

    function mouseMove(e, pt) {
        if (down) {
            if (isZoomed) {
                end = pt;

                // update selection rectangle
                var w = pt.x - start.x;
                var h = pt.y - start.y;

                if (w >= 0) {
                    selection.css('left',  start.x - offset.left).width(w);
                } else {
                    selection.css('left', pt.x - offset.left).width(-w);
                }
                if (h >= 0) {
                    selection.css('top', start.y - offset.top).height(h);
                } else {
                    selection.css('top', pt.y - offset.top).height(-h);
                }
            } else {
                selection.css('visibility', 'visible');
                offset = selection.offset();

                start = pt;

                isZoomed = true;
                $scope.$apply();
            }
            e.preventDefault();
        }
    }

    function mouseUp(e) {
        hostEl = chart.hostElement;
        down = false;
        if (end) {
            selection.css('visibility', 'hidden').width(0).height(0).css('left', 0).css('top', 0);

            var host = $(hostEl);
            offset = host.offset();
            offset.left = offset.left + parseInt(host.css('padding-left'));
            offset.top = offset.top + parseInt(host.css('padding-top'));

            // convert screen to data coordinates
            var min = new wijmo.Point(start.x - offset.left, start.y - offset.top);
            var max = new wijmo.Point(end.x - offset.left, end.y - offset.top);
            var p1 = chart.pointToData(min);
            var p2 = chart.pointToData(max);

            // update axes
            chart.beginUpdate();
            chart.axisX.min = Math.min(p1.x, p2.x);
            chart.axisY.min = Math.min(p1.y, p2.y);
            chart.axisX.max = Math.max(p1.x, p2.x);
            chart.axisY.max = Math.max(p1.y, p2.y);
            chart.endUpdate();

            end = start = null;

            e.preventDefault();
        }
    }

    $scope.$watch('ctx.chart', function () {
        if ($scope.ctx.chart) {
            chart = $scope.ctx.chart;
            chart.axisY.style = {};

            // no tooltips
            chart.tooltip.content = null;
            hostEl = chart.hostElement;
            selection = $(plotSelection);

            $scope.resetZoom = function () {

                // set min and max to null/undefined to enable the default scaling
                chart.beginUpdate();
                chart.axisX.min = null;
                chart.axisY.min = null;
                chart.axisX.max = null;
                chart.axisY.max = null;
                chart.endUpdate();
                isZoomed = false;
            };

            $scope.canResetZoom = function () {
                return isZoomed;
            };

            if ('ontouchstart' in window) {

                hostEl.ontouchstart = function (e) {
                     mouseDown(e);
                    e.preventDefault();
                }

                hostEl.ontouchmove = function (e) {
                    mouseMove(e, new wijmo.Point(e.changedTouches[0].pageX,e.changedTouches[0].pageY));
                    e.preventDefault();
                }

                hostEl.ontouchend = function (e) {
                    mouseUp(e);
                    e.preventDefault();
                }

            } else {
                hostEl.onmousedown = function (e) {
                    mouseDown(e);
                }
                hostEl.onmousemove = function (e) {
                    mouseMove(e, new wijmo.Point(e.pageX, e.pageY));
                }
                hostEl.onmouseup = function (e) {
                    mouseUp(e);
                }
            }
        }
    });
});
