<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="DateTime.aspx.cs" Inherits="LineChart_DateTime" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type="text/javascript">
		function hintContent() {
			return this.y;
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:Panel ID="linechart" runat="server" Height="475" Width = "756" CssClass="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1LineChartExtender ShowChartLabels="false" runat = "server" 
		ID="LineChartExtender1" TargetControlID="linechart">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Header Text="World of Warcraft Players by Region"></Header>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="8" Opacity="1" />
			<wijmo:ChartStyle StrokeWidth="8" Opacity="1" />
			<wijmo:ChartStyle StrokeWidth="8" Opacity="1" />
		</SeriesHoverStyles>
		<SeriesList>
			<wijmo:LineChartSeries Label="North America">
				<Markers Visible="True">
				</Markers>
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2005-07-01" />
							<wijmo:ChartXData DateTimeValue="2005-08-01" />
							<wijmo:ChartXData DateTimeValue="2005-10-01" />
							<wijmo:ChartXData DateTimeValue="2005-12-01" />
							<wijmo:ChartXData DateTimeValue="2006-03-01" />
							<wijmo:ChartXData DateTimeValue="2006-12-01" />
							<wijmo:ChartXData DateTimeValue="2008-01-01" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1100000" />
							<wijmo:ChartYData DoubleValue="1400000" />
							<wijmo:ChartYData DoubleValue="1700000" />
							<wijmo:ChartYData DoubleValue="2000000" />
							<wijmo:ChartYData DoubleValue="2500000" />
						</Values>
					</Y>
				</Data>
			</wijmo:LineChartSeries>
			<wijmo:LineChartSeries Label="Europe">
				<Markers Visible="True">
				</Markers>
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2005-07-01" />
							<wijmo:ChartXData DateTimeValue="2005-08-01" />
							<wijmo:ChartXData DateTimeValue="2005-10-01" />
							<wijmo:ChartXData DateTimeValue="2005-12-01" />
							<wijmo:ChartXData DateTimeValue="2006-03-01" />
							<wijmo:ChartXData DateTimeValue="2006-07-01" />
							<wijmo:ChartXData DateTimeValue="2006-12-01" />
							<wijmo:ChartXData DateTimeValue="2008-01-01" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="900000" />
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1500000" />
							<wijmo:ChartYData DoubleValue="2000000" />
						</Values>
					</Y>
				</Data>
			</wijmo:LineChartSeries>
			<wijmo:LineChartSeries Label="Asia">
				<Markers Visible="True">
				</Markers>
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2005-07-01" />
							<wijmo:ChartXData DateTimeValue="2005-08-01" />
							<wijmo:ChartXData DateTimeValue="2005-10-01" />
							<wijmo:ChartXData DateTimeValue="2006-03-01" />
							<wijmo:ChartXData DateTimeValue="2006-09-01" />
							<wijmo:ChartXData DateTimeValue="2006-12-01" />
							<wijmo:ChartXData DateTimeValue="2008-01-01" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1500000" />
							<wijmo:ChartYData DoubleValue="2000000" />
							<wijmo:ChartYData DoubleValue="2400000" />
							<wijmo:ChartYData DoubleValue="3700000" />
							<wijmo:ChartYData DoubleValue="4000000" />
							<wijmo:ChartYData DoubleValue="4500000" />
							<wijmo:ChartYData DoubleValue="5500000" />
						</Values>
					</Y>
				</Data>
			</wijmo:LineChartSeries>
		</SeriesList>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#afe500" StrokeWidth="5" Opacity="0.8" />
			<wijmo:ChartStyle Stroke="#959595" StrokeWidth="5" Opacity="0.8" />
			<wijmo:ChartStyle Stroke="#2d2d2d" StrokeWidth="5" Opacity="0.8" />
		</SeriesStyles>
		<Footer Compass="South" Visible="False"></Footer>
		<Legend>
			<Size Width="30" Height="3"></Size>
		</Legend>
		<Axis>
			<Y Visible="False" Compass="West">
				<Labels TextAlign="Center"></Labels>
				<GridMajor Visible="True"></GridMajor>
			</Y>
		</Axis>
	</wijmo:C1LineChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>The C1LineChartExtender supports DateTime values as its series data.</p><br/>
	<p>DateTimeValues property is used to support DateTime values for the chart.  Except DateTimeValues, there are also other two properties: DoubleValues and StringValues.
	These three properties represents different type values(DateTime, Double and String).</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

