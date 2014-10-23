<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" 
	CodeFile="DateTime.aspx.cs" Inherits="C1LineChart_DateTime" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

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
					var jqLine = $("#<%= C1LineChart1.ClientID %>"),
						width = jqLine.width(),
						height = jqLine.height();

					if (!width || !height) {
						window.clearTimeout(resizeTimer);
						return;
					}

					jqLine.c1linechart("redraw", width, height);
				}, 250);
			});
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1LineChart ShowChartLabels="false" runat = "server" ID="C1LineChart1" Height="475" Width = "756">
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
	</wijmo:C1LineChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>The<strong> C1LineChart </strong>supports <strong>DateTime </strong>values as its series data.</p><br/>
	<p>The <strong>DateTimeValues</strong> property is used to support <strong>DateTime</strong> values for the chart.  You can also plot double and string values using the
    <strong>DoubleValues</strong> and <strong>StringValues</strong> properties.
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

