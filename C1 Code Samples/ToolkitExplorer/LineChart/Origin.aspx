<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Origin.aspx.cs" Inherits="ToolkitExplorer.LineChart.Origin" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		function hintContent() {
			return this.data.lineSeries.label + '\n' +
						this.x + '\n' + this.y + '';
		}
		function pageLoad() {
			var resizeTimer = null;

			$(window).resize(function () {
				window.clearTimeout(resizeTimer);
				resizeTimer = window.setTimeout(function () {
					var jqLine = $("#<%= linechart.ClientID %>"),
						width = jqLine.width(),
						height = jqLine.height();

					if (!width || !height) {
						window.clearTimeout(resizeTimer);
						return;
					}

					jqLine.wijlinechart("redraw", width, height);
				}, 250);
			});
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="linechart" runat="server" Height="475" Width = "756" CssClass="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1LineChartExtender ShowChartLabels="false" runat = "server" 
		ID="LineChartExtender1" TargetControlID="linechart">
		<Hint OffsetY="-10">
			<Content Function="hintContent" />
			<ContentStyle FontSize="10pt"></ContentStyle>
		</Hint>
		<Header Text="Stocks Trends">
			<TextStyle>
				<Fill Color="#fafafa"></Fill>
			</TextStyle>
		</Header>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="4" />
		</SeriesHoverStyles>
		<SeriesList>
			<wijmo:LineChartSeries Label="My Stocks" FitType="Spline" LegendEntry="true">
				<Markers Visible="True" Type="Circle">
				</Markers>
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2010-03-01" />
							<wijmo:ChartXData DateTimeValue="2010-06-01" />
							<wijmo:ChartXData DateTimeValue="2010-09-01" />
							<wijmo:ChartXData DateTimeValue="2010-12-01" />
							<wijmo:ChartXData DateTimeValue="2011-03-01" />
							<wijmo:ChartXData DateTimeValue="2011-06-01" />
							<wijmo:ChartXData DateTimeValue="2011-09-01" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="-6.1" />
							<wijmo:ChartYData DoubleValue="-10.4" />
							<wijmo:ChartYData DoubleValue="-2.8" />
							<wijmo:ChartYData DoubleValue="1.1" />
							<wijmo:ChartYData DoubleValue="2.1" />
							<wijmo:ChartYData DoubleValue="-1.6" />
							<wijmo:ChartYData DoubleValue="6.2" />
						</Values>
					</Y>
				</Data>
			</wijmo:LineChartSeries>
		</SeriesList>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#afe500" StrokeWidth="3" />
		</SeriesStyles>
		<Footer Compass="South" Visible="False"></Footer>
		<Legend Visible="false">
			<Size Width="30" Height="3"></Size>
		</Legend>
		<Axis>
			<X>
				<Labels>
					<AxisLabelStyle FontSize="11pt" Rotation="-45">
						<Fill Color="#7f7f7f"></Fill>
					</AxisLabelStyle>
				</Labels>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#7f7f7f"></TickStyle>
				</TickMajor>
			</X>
			<Y Compass="West" Visible="true" Origin="0">
				<Labels TextAlign="Center">
					<AxisLabelStyle FontSize="11pt">
						<Fill Color="#7f7f7f"></Fill>
					</AxisLabelStyle>
				</Labels>
				<GridMajor Visible="True">
					<GridStyle Stroke="#353539" StrokeDashArray="- "></GridStyle>
				</GridMajor>
				<TickMajor Position="Outside">
					<TickStyle  Stroke="#7f7f7f"></TickStyle>
				</TickMajor>
				<TickMinor Position="Outside">
					<TickStyle Stroke="#7f7f7f"></TickStyle>
				</TickMinor>
			</Y>
		</Axis>
	</wijmo:C1LineChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
			<p>
				The wijlinechart supports negative values and can display them nicely using the origin option for each axis. The origin option tell the axis where to draw its starting point. This is optimal for displaying positive and negative values on the same chart.
			</p>
</asp:Content>
