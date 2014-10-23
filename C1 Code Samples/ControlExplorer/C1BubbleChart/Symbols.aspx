<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Symbols.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.Symbols" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
	function hint () {
		return this.data.y1 + "%";
	}
</script>

<wijmo:C1BubbleChart runat="server" ID="BubbleChart1" Height="475" Width = "756" Legend-Visible="false">
	<Axis>
		<X Text=""></X>
		<Y Text="Percent" Compass="West"></Y>
	</Axis>
	<Hint>
		<Content Function="hint" />
	</Hint>
	<Header Text="Browser Wars"></Header>
	<SeriesHoverStyles>
		<wijmo:ChartStyle Opacity="0.5"></wijmo:ChartStyle>
	</SeriesHoverStyles>
	<ChartLabel Position="Outside"></ChartLabel>
	<SeriesList>
		<wijmo:BubbleChartSeries Label="Market Share" LegendEntry="true">
			<Data>
				<X>
					<Values>
						<wijmo:ChartXData StringValue ="Chrome" />
						<wijmo:ChartXData StringValue="Firefox" />
						<wijmo:ChartXData StringValue="IE" />
						<wijmo:ChartXData StringValue="Opera" />
						<wijmo:ChartXData StringValue="Safari" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="22.9" />
						<wijmo:ChartYData DoubleValue="39.7" />
						<wijmo:ChartYData DoubleValue="30.5" />
						<wijmo:ChartYData DoubleValue="4.0" />
						<wijmo:ChartYData DoubleValue="2.2" />
					</Values>
				</Y>
				<Y1 DoubleValues="22.9,39.7,30.5,4.0,2.2" />
			</Data>
			<Markers>
				<Symbol>
					<wijmo:BubbleChartSymbol Index="0" Url="images/chrome.png" />
					<wijmo:BubbleChartSymbol Index="1" Url="images/firefox.png" />
					<wijmo:BubbleChartSymbol Index="2" Url="images/ie.png" />
					<wijmo:BubbleChartSymbol Index="3" Url="images/opera.png" />
					<wijmo:BubbleChartSymbol Index="4" Url="images/safari.png" />
				</Symbol>
			</Markers>
		</wijmo:BubbleChartSeries>
	</SeriesList>
</wijmo:C1BubbleChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>Want to use custom marker for your bubble chart? <strong>C1BubbleChart</strong> 
	allows you to use any image for this! Just use <b>BubbleChartSymbol.Url</b> to 
	customize image displayed as a bubble. The images are scaled automatically by the chart.</p>
	<h3>Test the features</h3>
	<ul>
		<li>Note bubbles have different icons according to the presenting information</li>
		<li>Go to the 'Sources' tab to see how to setup custom markers for your series</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
