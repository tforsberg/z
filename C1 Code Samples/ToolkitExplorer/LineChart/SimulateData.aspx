<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="SimulateData.aspx.cs" Inherits="LineChart_SimulateData" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type="text/javascript">
		var duration = 5000;
		var idx = 10;
		var intervalRadomData = null;
		function pageLoad() {

			animateChart();

			intervalRadomData = setInterval(function () {
				$("#<%= linechart.ClientID %>").wijlinechart("addSeriesPoint", 0, { x: idx++, y: createRandomValue() }, true);
				animateChart();
			}, duration);
		}

		function animateChart() {
			var path = $("#<%= linechart.ClientID %>").wijlinechart("getLinePath", 0),
				markers = $("#<%= linechart.ClientID %>").wijlinechart("getLineMarkers", 0),
				box = path.getBBox(),
				width = $("#<%= linechart.ClientID %>").wijlinechart("option", "width") / 10,
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<asp:Panel ID="linechart" runat="server" Height="475" Width = "756">
	</asp:Panel>
	<wijmo:C1LineChartExtender runat = "server" ID="LineChartExtender1" Width="756"
		TargetControlID="linechart" ShowChartLabels="False" Shadow="False">
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
	</wijmo:C1LineChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>This sample simulates streaming data using the <b>addSeriesPoint</b>, <b>getLinePath</b> and <b>getLineMarkers</b> methods.</p>
	<p>The following client side methods are used in this sample.</p>
	<ul>
		<li>addSeriesPoint for adding new point to the series</li>
		<li>getLinePath for retrieving the specified line info</li>
		<li>getLineMarkers for retrieving the specified marker info</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

