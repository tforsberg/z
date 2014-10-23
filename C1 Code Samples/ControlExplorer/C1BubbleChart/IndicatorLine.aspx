<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="IndicatorLine.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.IndicatorLine" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<wijmo:C1BubbleChart runat="server" ID="C1BubbleChart1" MinimumSize="3" MaximumSize="15" Height="475" Width = "756">
	<Indicator Visible="true"></Indicator>
	<ChartLabel ChartLabelFormatString="c2'kkk'"></ChartLabel>
<Footer Compass="South" Visible="False"></Footer>
	<Legend Compass="South" Orientation="Horizontal" Text="Countries">
	</Legend>
	<Axis>
		<X Text="Exports">
<GridMajor Visible="False"></GridMajor>

<GridMinor Visible="False"></GridMinor>
		</X>
		<Y Text="Units Sold in Billions" Compass="West">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
		</Y>
	</Axis>
	<Hint OffsetY="-10">
		<Content Function="hint" />
		<ContentStyle FontSize="10">
		</ContentStyle>
	</Hint>

<Animation Duration="500" Easing="EaseOutElastic"></Animation>

	<SeriesList>
		<wijmo:BubbleChartSeries Label="Toyota" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="4" />
						<wijmo:ChartY1Data DoubleValue="4.4" />
						<wijmo:ChartY1Data DoubleValue="5.1" />
						<wijmo:ChartY1Data DoubleValue="5.5" />
						<wijmo:ChartY1Data DoubleValue="5.7" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="2006" />
						<wijmo:ChartXData DoubleValue="2007" />
						<wijmo:ChartXData DoubleValue="2008" />
						<wijmo:ChartXData DoubleValue="2009" />
						<wijmo:ChartXData DoubleValue="2010" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="5" />
						<wijmo:ChartYData DoubleValue="6" />
						<wijmo:ChartYData DoubleValue="8" />
						<wijmo:ChartYData DoubleValue="7" />
						<wijmo:ChartYData DoubleValue="8.5" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="General Motors" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="2" />
						<wijmo:ChartY1Data DoubleValue="2.5" />
						<wijmo:ChartY1Data DoubleValue="3" />
						<wijmo:ChartY1Data DoubleValue="4" />
						<wijmo:ChartY1Data DoubleValue="5" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="2006" />
						<wijmo:ChartXData DoubleValue="2007" />
						<wijmo:ChartXData DoubleValue="2008" />
						<wijmo:ChartXData DoubleValue="2009" />
						<wijmo:ChartXData DoubleValue="2010" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="3" />
						<wijmo:ChartYData DoubleValue="4" />
						<wijmo:ChartYData DoubleValue="6" />
						<wijmo:ChartYData DoubleValue="7.5" />
						<wijmo:ChartYData DoubleValue="8" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="Volkswagon" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="2" />
						<wijmo:ChartY1Data DoubleValue="3" />
						<wijmo:ChartY1Data DoubleValue="4.5" />
						<wijmo:ChartY1Data DoubleValue="1.5" />
						<wijmo:ChartY1Data DoubleValue="1" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="2006" />
						<wijmo:ChartXData DoubleValue="2007" />
						<wijmo:ChartXData DoubleValue="2008" />
						<wijmo:ChartXData DoubleValue="2009" />
						<wijmo:ChartXData DoubleValue="2010" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="6" />
						<wijmo:ChartYData DoubleValue="1" />
						<wijmo:ChartYData DoubleValue="5" />
						<wijmo:ChartYData DoubleValue="2" />
						<wijmo:ChartYData DoubleValue="4" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="Hyundai" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="7.7" />
						<wijmo:ChartY1Data DoubleValue="4.8" />
						<wijmo:ChartY1Data DoubleValue="7.2" />
						<wijmo:ChartY1Data DoubleValue="1.4" />
						<wijmo:ChartY1Data DoubleValue="6.1" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="2006" />
						<wijmo:ChartXData DoubleValue="2007" />
						<wijmo:ChartXData DoubleValue="2008" />
						<wijmo:ChartXData DoubleValue="2009" />
						<wijmo:ChartXData DoubleValue="2010" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="17.62" />
						<wijmo:ChartYData DoubleValue="10.98" />
						<wijmo:ChartYData DoubleValue="16.47" />
						<wijmo:ChartYData DoubleValue="3.2" />
						<wijmo:ChartYData DoubleValue="13.95" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="Ford" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="4.5" />
						<wijmo:ChartY1Data DoubleValue="4" />
						<wijmo:ChartY1Data DoubleValue="3.8" />
						<wijmo:ChartY1Data DoubleValue="3" />
						<wijmo:ChartY1Data DoubleValue="2" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="2006" />
						<wijmo:ChartXData DoubleValue="2007" />
						<wijmo:ChartXData DoubleValue="2008" />
						<wijmo:ChartXData DoubleValue="2009" />
						<wijmo:ChartXData DoubleValue="2010" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="6" />
						<wijmo:ChartYData DoubleValue="2" />
						<wijmo:ChartYData DoubleValue="3" />
						<wijmo:ChartYData DoubleValue="4.6" />
						<wijmo:ChartYData DoubleValue="5" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
	</SeriesList>

	<Header Text="Sales Trends in Top-Selling WorldWide Cars"></Header>
</wijmo:C1BubbleChart>
	<script type="text/javascript">
		function hint() {
			//Check if multiple data points are on one axis entry. For example, multiple data entries for a single date.  
			// Hint for Indicator line 
			if ($.isArray(this)) {
				var content = "";
				//Multiple entries of data on this point, so we need to loop through them to create the hint content. 
				for (var i = 0; i < this.length; i++) {
					// Format y value as percent with two decimals (12.39%).  
					content += this[i].label + ': ' + Globalize.format(this[i].y / 100, 'p2') + '\n';
				}
				return content;
			}
				// Hint for Tooltip 
			else {
				//Only a single data point, so we return a formatted version of it. "/n" is a line break. 

				return this.data.label + '\n' +
					// Format y value as percent with two decimals (12.39%).  
					this.x + ': ' + Globalize.format(this.y / 100, 'p2');
			}
		}
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>The <strong>C1BubbleChart</strong> allows you to both a concrete value of a bubble and values of all bubble with same 'X' value</p>
<p>The source in this sample will show you how to setup indicator and tootips</p>
<h3>Test the features</h3>
<ul>
    <li>Hover over a data point to see the tooltip.</li>
    <li>Mouse down and drag across the chart surface to see the Indicator Line and the values it highlights.</li>
</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
