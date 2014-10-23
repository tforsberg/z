<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1BarChart_DrillDown" Codebehind="DrillDown.aspx.cs" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1BarChart runat = "server" ID="C1BarChart1" Height="475" Width = "756" ChartLabelFormatString="p2" Horizontal="False">

<Footer Compass="South" Visible="False"></Footer>

		<Legend Visible="False"></Legend>
		<Axis>
			<Y Text="" Compass="West" AnnoFormatString="p2">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</Y>
			<X Text="">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</X>
		</Axis>
		<Header Text="Browsers Distribution"></Header>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#7fc73c" Opacity="0.8">
				<Fill Color="#8ede43"></Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="1.5" Opacity="1" />
		</SeriesHoverStyles>
		<SeriesList>
			<wijmo:BarChartSeries Label="Browser brands" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="MSIE" />
							<wijmo:ChartXData StringValue="Firefox" />
							<wijmo:ChartXData StringValue="Chrome" />
							<wijmo:ChartXData StringValue="Safari" />
							<wijmo:ChartXData StringValue="Opera" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="0.5511" />
							<wijmo:ChartYData DoubleValue="0.2163" />
							<wijmo:ChartYData DoubleValue="0.1194" />
							<wijmo:ChartYData DoubleValue="0.0715" />
							<wijmo:ChartYData DoubleValue="0.0214" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
	</wijmo:C1BarChart>
<script id="scriptInit" type="text/javascript">
	var drillDwonData = {
		MSIE: {
			label: "MSIE",
			legendEntry: true,
			data: { x: ['MSIE 6.0', 'MSIE 7.0', 'MSIE 8.0', 'MSIE 9.0'], y: [0.1085, 0.0735, 0.3306, 0.0281] }
		},
		Firefox: {
			label: "Firefox",
			legendEntry: true,
			data: { x: ['Firefox 2.0', 'Firefox 3.0', 'Firefox 3.5', 'Firefox 3.6', 'Firefox 4.0'], y: [0.002, 0.0083, 0.0158, 0.1312, 0.0543] }
		},
		Chrome: {
			label: "Chrome",
			legendEntry: true,
			data: { x: ['Chrome 5.0', 'Chrome 6.0', 'Chrome 7.0', 'Chrome 8.0', 'Chrome 9.0', 'Chrome 10.0', 'Chrome 11.0', 'Chrome 12.0', ], y: [0.0012, 0.0019, 0.0012, 0.0036, 0.0032, 0.0991, 0.005, 0.0022] }
		},
		Safari: {
			label: "Safari",
			legendEntry: true,
			data: {
				x: ['Safari 5.0', 'Safari 4.0', 'Safari Win 5.0', 'Safari 4.1', 'Safari/Maxthon', 'Safari 3.1', 'Safari 4.1'], y: [0.0455, 0.0142, 0.0023, 0.0021, 0.0020, 0.0019, 0.0014]
			}
		},
		Opera: {
			label: "Opera",
			legendEntry: true,
			data: { x: ['Opera 9.x', 'Opera 10.x', 'Opera 11.x'], y: [0.0032, 0.0037, 0.0165] }
		}
	},
	seriesList = [{
		label: "Browser brands",
		legendEntry: true,
		data: { x: ['MSIE', 'Firefox', 'Chrome', 'Safari', 'Opera'], y: [0.5511, 0.2163, 0.1194, 0.0715, 0.0214] }
	}];
	var chartClientId = "#<%=C1BarChart1.ClientID%>";
	$(document).ready(function () {
		var drawBrands = function (e, data) {
			$(chartClientId).c1barchart("option", "click", drawVersions);
			$(chartClientId).c1barchart("option", "seriesList", seriesList);
		}

		var drawVersions = function (e, data) {
			var key = data.x, series = drillDwonData[key];
			$(chartClientId).c1barchart("option", "click", drawBrands);
			$(chartClientId).c1barchart("option", "seriesList", [series]);
		}

		$(chartClientId).c1barchart("option", "click", drawVersions);
	});
</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
		This sample illustrates how the drill down functionality of the chart can be used.
	</p>
	<p>
		You need bind client-side click event to the chart. The javascript code:
	<pre class="controldescription-code">var chartClientId = "#&lt;%=C1BarChart1.ClientID%&gt;";
$(document).ready(function () {
	var drawBrands = function (e, data) {
		$(chartClientId).c1barchart("option", "click", drawVersions);
		$(chartClientId).c1barchart("option", "seriesList", seriesList);
	}

	var drawVersions = function (e, data) {
		var key = data.x, series = drillDwonData[key];
		$(chartClientId).c1barchart("option", "click", drawBrands);
		$(chartClientId).c1barchart("option", "seriesList", [series]);
	}

	$(chartClientId).c1barchart("option", "click", drawVersions);
});</pre></p>
<h3>Test the features</h3>
<ul>
    <li>Click on any column to see more details about the selected product.</li>
    <li>In detailed view click on any column again to return back.</li>
    <li>Note that percentage on 'y' axis changes according to chart values.</li>
</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

