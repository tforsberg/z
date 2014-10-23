<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="SimulateData.aspx.cs" Inherits="C1LineChart_SimulateData" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1LineChart runat="server" ID="C1LineChart1" ShowChartLabels="False" Shadow="False" Height="475" Width="756">
        <Animation Enabled="False" />
        <SeriesTransition Enabled="false" />
        <Footer Compass="South" Visible="False"></Footer>
        <Legend Visible="false">
            <Size Width="30" Height="3"></Size>
        </Legend>
        <Hint Enable="false"></Hint>
        <Header Text="Wijmo Awesomeness"></Header>
        <Axis>
            <Y Visible="False" Compass="West" Min="0" Max="100" AutoMin="false" AutoMax="false">
                <Labels TextAlign="Center"></Labels>
                <GridMajor Visible="True"></GridMajor>
            </Y>
        </Axis>
        <SeriesStyles>
            <wijmo:ChartStyle StrokeWidth="3" Stroke="#00a6dd" />
        </SeriesStyles>
    </wijmo:C1LineChart>
    <script type="text/javascript">
        var duration = 5000;
        var idx = 10;
        var intervalRadomData = null;
        $(document).ready(function () {
            setTimeout(function () {
                animateChart();
                intervalRadomData = setInterval(function () {
                    $("#<%= C1LineChart1.ClientID %>").c1linechart("addSeriesPoint", 0, { x: idx++, y: createRandomValue() }, true);
    	                animateChart();
    	            }, duration);
    	        }, 1000);
    	    });

            function animateChart() {
                var path = $("#<%= C1LineChart1.ClientID %>").c1linechart("getLinePath", 0),
				markers = $("#<%= C1LineChart1.ClientID %>").c1linechart("getLineMarkers", 0),
				box = path.getBBox(),
				width = 756 / 10,
				anim = Raphael.animation({ transform: Raphael.format("...t{0},0", -width) }, duration);
            path.animate(anim);
            if (path.shadow) {
                var pathShadow = path.shadow;
                pathShadow.animate(anim);
            }
            markers.animate(anim);
            var rect = box.x + " " + (box.y - 5) + " " + box.width + " " + (box.height + 10);
            path.wijAttr("clip-rect", rect);
            markers.attr("clip-rect", rect);
        }

        function createRandomValue() {
            var val = Math.round(Math.random() * 100);
            return val;
        }

        function dispose() {
            if (intervalRadomData) {
                clearInterval(intervalRadomData);
                intervalRadomData = null;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>This sample simulates streaming data using the <b>addSeriesPoint</b>, <b>getLinePath</b> and <b>getLineMarkers</b> methods.</p>
    <p>The following client-side methods are used in this sample.</p>
    <ul>
        <li><strong>addSeriesPoint -</strong>&nbsp; for adding a new point to the series.</li>
        <li><strong>getLinePath</strong> - for retrieving the specified line info.</li>
        <li><strong>getLineMarkers </strong>- for retrieving the specified marker info.</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

