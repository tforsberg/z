<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1BubbleChart runat="server" ID="C1BubbleChart1" Height="475" Width="756" ShowChartLabels="False">
<Animation Duration="500" Easing="EaseOutElastic"></Animation>
		<SeriesList>
			<wijmo:BubbleChartSeries Label="China" LegendEntry="True">
				<Data>
					<Y1>
						<Values>
							<wijmo:ChartY1Data DoubleValue="1340" />
						</Values>
					</Y1>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="7931" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="73" />
						</Values>
					</Y>
				</Data>
			</wijmo:BubbleChartSeries>
			<wijmo:BubbleChartSeries Label="India" LegendEntry="True">
				<Data>
					<Y1>
						<Values>
							<wijmo:ChartY1Data DoubleValue="1150" />
						</Values>
					</Y1>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="2972" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="65" />
						</Values>
					</Y>
				</Data>
			</wijmo:BubbleChartSeries>
			<wijmo:BubbleChartSeries Label="USA" LegendEntry="True">
				<Data>
					<Y1>
						<Values>
							<wijmo:ChartY1Data DoubleValue="309" />
						</Values>
					</Y1>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="42066" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="78" />
						</Values>
					</Y>
				</Data>
			</wijmo:BubbleChartSeries>
			<wijmo:BubbleChartSeries Label="Japan" LegendEntry="True">
				<Data>
					<Y1>
						<Values>
							<wijmo:ChartY1Data DoubleValue="126" />
						</Values>
					</Y1>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="30866" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="83" />
						</Values>
					</Y>
				</Data>
			</wijmo:BubbleChartSeries>
			<wijmo:BubbleChartSeries Label="Russia" LegendEntry="True">
				<Data>
					<Y1>
						<Values>
							<wijmo:ChartY1Data DoubleValue="140" />
						</Values>
					</Y1>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="14318" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="69" />
						</Values>
					</Y>
				</Data>
			</wijmo:BubbleChartSeries>
			<wijmo:BubbleChartSeries Label="Congo" LegendEntry="True">
				<Data>
					<Y1>
						<Values>
							<wijmo:ChartY1Data DoubleValue="72" />
						</Values>
					</Y1>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="374" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="48" />
						</Values>
					</Y>
				</Data>
			</wijmo:BubbleChartSeries>
			<wijmo:BubbleChartSeries Label="South Africa" LegendEntry="True">
				<Data>
					<Y1>
						<Values>
							<wijmo:ChartY1Data DoubleValue="43" />
						</Values>
					</Y1>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="9284" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="52" />
						</Values>
					</Y>
				</Data>
			</wijmo:BubbleChartSeries>
			<wijmo:BubbleChartSeries Label="Mexico" LegendEntry="True">
				<Data>
					<Y1>
						<Values>
							<wijmo:ChartY1Data DoubleValue="112" />
						</Values>
					</Y1>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="11754" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="77" />
						</Values>
					</Y>
				</Data>
			</wijmo:BubbleChartSeries>
			<wijmo:BubbleChartSeries Label="UK" LegendEntry="True">
				<Data>
					<Y1>
						<Values>
							<wijmo:ChartY1Data DoubleValue="61" />
						</Values>
					</Y1>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="31217" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="80" />
						</Values>
					</Y>
				</Data>
			</wijmo:BubbleChartSeries>
		</SeriesList>
<Header Compass="North" Text="Wealth &amp; Health of Nations - 2010"></Header>

<Footer Compass="South" Visible="False"></Footer>

<Axis>
<X Max="45000" Min="0" Text="Income">
<GridMajor Visible="False"></GridMajor>

<GridMinor Visible="False"></GridMinor>
</X>

<Y Visible="False" Compass="West" Max="100" Min="0" Text="Life Expectancy">
<Labels TextAlign="Center"></Labels>

<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
</Y>
</Axis>
		<Hint>
			<Content Function="hintContent" />
		</Hint>
	</wijmo:C1BubbleChart>
	<script>
		function hintContent() {
			return "" + this.data.label + " \nLife Expectency: " + this.y + " \nIncome: "
				+ Globalize.format(this.x, "n") + " \nPopulation: " + this.data.y1 + "M";
		}
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample shows how to use <strong>C1BubbleChart</strong> to create a simple bubble chart. Bubble
		charts are useful for displaying 3 dimensions of data.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
