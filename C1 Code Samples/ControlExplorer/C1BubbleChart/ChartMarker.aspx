<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ChartMarker.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.ChartMarker" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<wijmo:C1BubbleChart runat="server" ID="BubbleChart1" MinimumSize="3" MaximumSize="15" Height="475" Width = "756" ShowChartLabels="False">

<Footer Compass="South" Visible="False"></Footer>

	<Axis>
		<X Text="Income">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
		</X>
		<Y Text="Life Expectancy" Compass="West">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
		</Y>
	</Axis>
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
			<Markers Type="Tri">
			</Markers>
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
			<Markers Type="InvertedTri">
			</Markers>
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
			<Markers Type="Box">
			</Markers>
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
			<Markers Type="Diamond">
			</Markers>
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
			<Markers Type="Cross">
			</Markers>
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
	</SeriesList>
	<Header Text="Wealth & Health of Nations - 2010"></Header>
	<Hint>
		<Content Function="hint" />
	</Hint>
</wijmo:C1BubbleChart>
	<script type="text/javascript">
		function hint() {
			return this.data.label;
		}
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>This sample uses the SeriesList's <b>Markers</b> property to define the type of marker used. 
The marker type can be set to Circle, Tri, InvertedTri, Box, Diamond or Cross.</p>
<h3>Test the features</h3>
<ul>
	<li>Note the chart legend points have different icons according to selected marker type</li>
	<li>Click series items in the legend to toggle their visibility on the chart surface.</li>
	<li>Go to the 'Sources' tab to see how to setup series markers through widget initialization </li>
</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
