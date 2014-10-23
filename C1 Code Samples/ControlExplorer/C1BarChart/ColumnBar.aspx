<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" 
	CodeFile="ColumnBar.aspx.cs" Inherits="C1BarChart_ColumnBar" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1BarChart runat = "server" ID="C1BarChart1" Horizontal="false" Height="475" Width = "756">
		<Hint>
			<Content Function="hintContent" />
			<ContentStyle FontSize="14px">
				<Fill Color="#CCCCCC">
				</Fill>
			</ContentStyle>
			<Style StrokeWidth="0">
			</Style>
			<HintStyle StrokeWidth="0">
			</HintStyle>
		</Hint>
		<Footer Compass="South" Visible="False"></Footer>
		<Legend Visible="True" Compass="North" Orientation="Horizontal">
			<TextStyle StrokeWidth="0">
			</TextStyle>
		</Legend>
		<Axis>
			<X>
				<TextStyle FontWeight="normal">
				</TextStyle>

<GridMajor Visible="False"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</X>
			<Y Text="USD (thousands)" Compass="West" AnnoFormatString="n0" Max="4000" Min="0" AutoMax="False" AutoMin="False" Alignment="Far">
				<TextStyle FontWeight="normal">
				</TextStyle>

<GridMajor Visible="False"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</Y>
		</Axis>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#94C3E8">
				<Fill Color="#94C3E8">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#FBBA69">
				<Fill Color="#FBBA69">
				</Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="0">
			</wijmo:ChartStyle>
		</SeriesHoverStyles>
		<TextStyle FontSize="13px">
		</TextStyle>
		<Header Text="2014 Sales Revenue"></Header>
		<SeriesList>
			<wijmo:BarChartSeries Label="Domestic" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2014-01-01" />
							<wijmo:ChartXData DateTimeValue="2014-02-01" />
							<wijmo:ChartXData DateTimeValue="2014-03-01" />
							<wijmo:ChartXData DateTimeValue="2014-04-01" />
							<wijmo:ChartXData DateTimeValue="2014-05-01" />
							<wijmo:ChartXData DateTimeValue="2014-06-01" />
							<wijmo:ChartXData DateTimeValue="2014-07-01" />
							<wijmo:ChartXData DateTimeValue="2014-08-01" />
							<wijmo:ChartXData DateTimeValue="2014-09-01" />
							<wijmo:ChartXData DateTimeValue="2014-10-01" />
							<wijmo:ChartXData DateTimeValue="2014-11-01" />
							<wijmo:ChartXData DateTimeValue="2014-12-01" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1983" />
							<wijmo:ChartYData DoubleValue="2343" />
							<wijmo:ChartYData DoubleValue="2593" />
							<wijmo:ChartYData DoubleValue="2283" />
							<wijmo:ChartYData DoubleValue="2574" />
							<wijmo:ChartYData DoubleValue="2838" />
							<wijmo:ChartYData DoubleValue="2382" />
							<wijmo:ChartYData DoubleValue="2634" />
							<wijmo:ChartYData DoubleValue="2938" />
							<wijmo:ChartYData DoubleValue="2739" />
							<wijmo:ChartYData DoubleValue="2983" />
							<wijmo:ChartYData DoubleValue="3493" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries LegendEntry="True" Label="International">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2014-01-01" />
							<wijmo:ChartXData DateTimeValue="2014-02-01" />
							<wijmo:ChartXData DateTimeValue="2014-03-01" />
							<wijmo:ChartXData DateTimeValue="2014-04-01" />
							<wijmo:ChartXData DateTimeValue="2014-05-01" />
							<wijmo:ChartXData DateTimeValue="2014-06-01" />
							<wijmo:ChartXData DateTimeValue="2014-07-01" />
							<wijmo:ChartXData DateTimeValue="2014-08-01" />
							<wijmo:ChartXData DateTimeValue="2014-09-01" />
							<wijmo:ChartXData DateTimeValue="2014-10-01" />
							<wijmo:ChartXData DateTimeValue="2014-11-01" />
							<wijmo:ChartXData DateTimeValue="2014-12-01" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="574" />
							<wijmo:ChartYData DoubleValue="636" />
							<wijmo:ChartYData DoubleValue="673" />
							<wijmo:ChartYData DoubleValue="593" />
							<wijmo:ChartYData DoubleValue="644" />
							<wijmo:ChartYData DoubleValue="679" />
							<wijmo:ChartYData DoubleValue="593" />
							<wijmo:ChartYData DoubleValue="139" />
							<wijmo:ChartYData DoubleValue="599" />
							<wijmo:ChartYData DoubleValue="583" />
							<wijmo:ChartYData DoubleValue="602" />
							<wijmo:ChartYData DoubleValue="690" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
	</wijmo:C1BarChart>
	<script type="text/javascript">
		function hintContent() {
			//Check if multiple data points are on one axis entry. For example, multiple data entries for a single date. 
			if ($.isArray(this)) {
				var content = "";
				//Multiple entries of data on this point, so we need to loop through them to create the tooltip content.
				for (var i = 0; i < this.length; i++) {
					content += this[i].label + ': ' + Globalize.format(this[i].y * 1000, 'c0') + '\n';
				}
				return content;
			}
			else {
				//Only a single data point, so we return a formatted version of it. "/n" is a line break.
				return this.data.label + '\n' +
					//Format x as Short Month and long year (Jan 2010). Then format y value as calculated currency with no decimal ($1,983,000). 
					Globalize.format(this.x, 'MMM yyyy') + ': ' + Globalize.format(this.y * 1000, 'c0');
			}
		}
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
	The <strong>C1BarChart </strong> is commonly used as a Column Chart. In order to acheive this, simply set "Horizontal" property of <strong>C1BarChart</strong> to False. This is a Column Chart that shows data that compares annual domestic and international sales.
	</p>
	<h3>Test the features</h3>
	<ul>
	<li>
	Hover over a bar point to see the tooltip.
	</li>
	<li>
	Click series items in the legend to toggle their visibility on the chart surface.
	</li>
	<li>
	Note the formatted Dates on the x axis. The original values are Date Obects. This is done automatically by the chart to optimize display. It can also be set.
	</li>
	<li>
	Note the formatted Date and Currency values in the tooltip.
	</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

