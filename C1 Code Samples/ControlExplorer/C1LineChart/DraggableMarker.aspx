<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeBehind="DraggableMarker.aspx.cs" Inherits="C1LineChart_DraggableMarker" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1LineChart ID="C1LineChart1" ShowChartLabels="false" runat="server" Height="475" Width="756" >
        <Animation Enabled="false" />
        <SeriesTransition Enabled="false" />
        <Hint Enable="false"></Hint>
        <Footer Compass="South" Visible="False"></Footer>
        <Legend Visible="false">
            <Size Width="30" Height="3"></Size>
        </Legend>
        <Axis>
            <X Min="1" Max="5" AutoMin="false" AutoMax="false"></X>
            <Y Min="0" Max="50" AutoMin="false" AutoMax="false" Compass="West"></Y>
        </Axis>
        <SeriesList>
            <wijmo:LineChartSeries>
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData DoubleValue="1" />
                            <wijmo:ChartXData DoubleValue="2" />
                            <wijmo:ChartXData DoubleValue="3" />
                            <wijmo:ChartXData DoubleValue="4" />
                            <wijmo:ChartXData DoubleValue="5" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartXData DoubleValue="10" />
                            <wijmo:ChartXData DoubleValue="30" />
                            <wijmo:ChartXData DoubleValue="5" />
                            <wijmo:ChartXData DoubleValue="50" />
                            <wijmo:ChartXData DoubleValue="20" />
                        </Values>
                    </Y>
                </Data>
                <Markers Visible="true" Type="Circle"></Markers>
            </wijmo:LineChartSeries>
        </SeriesList>
    </wijmo:C1LineChart>

    <script type="text/javascript">


            var canvas, isMouseDown, markerIndex, virtualPath, lineChart, lineChartWidget, canvas, canvasBounds, pathArr,
                previousPointArr, nextPointArr, lineStyle, valX, valY;
            var xValue = [1, 2, 3, 4, 5], yValue = [10, 30, 5, 50, 20];
            var seriesList = [{
                data: {
                    x: xValue,
                    y: yValue
                },
                markers: {
                    visible: true,
                    type: "circle"
                }
            }];


            $(document).ready(function () {

                lineChart = $("#<%= C1LineChart1.ClientID %>");
                lineChart.c1linechart("option", "mouseDown", function (e, data) {
                    //Check if the mouse is clicking a linechart marker,
                    //if true, get marker info and previous/next markers position.
                    if (data.type !== "marker")
                        return;
                    isMouseDown = true;
                    markerIndex = data.index;
                    lineStyle = data.lineSeries.lineStyle;
                    var markers = data.lineSeries.lineMarkers;
                    if (markerIndex === 0) {
                        previousPointArr = ["0 0M"];
                    } else {
                        var previousMarker = markers[markerIndex - 1];
                        previousPointArr = [previousMarker.attr("cx"), previousMarker.attr("cy"), "L"];
                    }
                    if (markerIndex === xValue.length - 1) {
                        nextPointArr = ["M0 0"];
                    } else {
                        var nextMarker = markers[markerIndex + 1];
                        nextPointArr = ["L", nextMarker.attr("cx"), nextMarker.attr("cy")];
                    }
                });

                //Get linechart widget
                lineChartWidget = lineChart.data("wijmo-c1linechart");
                canvas = lineChartWidget.canvas;
                canvasBounds = lineChartWidget.canvasBounds;

                lineChart.bind("mouseup", function () {
                    isMouseDown = false;
                    //If virtual path exists, remove it and reset seriesList to repaint the chart.
                    if (virtualPath) {
                        virtualPath.remove();
                        virtualPath = null;
                    }
                    xValue[markerIndex] = valX;
                    yValue[markerIndex] = valY;
                    lineChart.c1linechart("option", "seriesList", seriesList);
                }).bind("mousemove", function (e) {
                    if (!isMouseDown)
                        return;
                    //Render a virtual path according to the mouse position
                    var elePos = lineChart.offset(),
                        mousePos = {
                            left: e.pageX - elePos.left,
                            top: e.pageY - elePos.top
                        }, currentPoint;

                    if (mousePos.left >= canvasBounds.startX &&
                            mousePos.left <= canvasBounds.endX &&
                            mousePos.top >= canvasBounds.startY &&
                            mousePos.top <= canvasBounds.endY) {
                        //If mouse is moving inside plot area, create the virtual path.
                        //Plot area is the area inside axes.
                        var width = canvasBounds.endX - canvasBounds.startX,
                            height = canvasBounds.endY - canvasBounds.startY,
                            axis = lineChartWidget.options.axis,
                        minX = axis.x.min,
                        minY = axis.y.min,
                        maxX = axis.x.max,
                        maxY = axis.y.max,
                        kx = width / (maxX - minX),
                        ky = height / (maxY - minY),
                        X = mousePos.left,
                        Y = mousePos.top;

                        //Calculate the x value and y value to reset and repaint the chart when mouseup.
                        valX = (X - canvasBounds.startX) / kx + minX;
                        valY = (canvasBounds.endY - Y) / ky + minY;
                        pathArr = $.merge($.merge(["M"], previousPointArr), $.merge([mousePos.left, mousePos.top], nextPointArr));
                        if (virtualPath) {
                            virtualPath.attr({ "path": pathArr.join(" ") });
                        } else {
                            var copiedStyle = $.extend(true, {}, lineStyle);
                            delete copiedStyle.path;
                            delete copiedStyle.fill;
                            virtualPath = canvas.path(pathArr.join(" ")).attr(copiedStyle);
                        }
                    } else {
                        //Cancel the operation if mouse is moving out of plot area.
                        isMouseDown = false;
                        //Remove virtual path
                        if (virtualPath) {
                            virtualPath.remove();
                            virtualPath = null;
                        }
                    }
                }).bind("mouseout", function (e) {
                    var elePos = lineChart.offset(),
                        width = lineChart.width(),
                        height = lineChart.height(),
                        mousePos = {
                            left: e.pageX - elePos.left,
                            top: e.pageY - elePos.top
                        }, currentPoint, valX, valY;
                    if (mousePos.left > 0 &&
                            mousePos.left < width &&
                            mousePos.top > 0 &&
                            mousePos.top < height) {
                        return;
                    }
                    //Remove virtual path
                    isMouseDown = false;
                    if (virtualPath) {
                        virtualPath.remove();
                        virtualPath = null;
                    }
                });
            });

    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    Click and drag on the markers to move them.
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>
