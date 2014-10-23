<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="MinMax.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.MinMax" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	

<wijmo:C1BubbleChart runat="server" ID="BubbleChart1" MinimumSize="1" Height="475" Width = "756">

<Footer Compass="South" Visible="False"></Footer>

	<Legend Visible="False"></Legend>

	<Axis>
		<X Text="2012">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			<TickMajor Position="Inside">
			</TickMajor>
		</X>
		<Y Text="Stock price" Compass="West">
			<Labels TextAlign="Far">
			</Labels>
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
		</Y>
	</Axis>
	<Hint>
		<Content Function="hint" />
		<Style Stroke="#000000" StrokeWidth="10">
		</Style>
		<HintStyle Stroke="#000000" StrokeWidth="10">
		</HintStyle>
	</Hint>
	<Header Text="Apple Inc. stock prices and capitalization (2012)"></Header>

<Animation Duration="500" Easing="EaseOutElastic"></Animation>
	<SeriesList>
		<wijmo:BubbleChartSeries Label="AAPL" LegendEntry="true">
			<Data>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="Jan" />
						<wijmo:ChartXData StringValue="Feb" />
						<wijmo:ChartXData StringValue="Mar" />
						<wijmo:ChartXData StringValue="Apr" />
						<wijmo:ChartXData StringValue="May" />
						<wijmo:ChartXData StringValue="Jun" />
						<wijmo:ChartXData StringValue="Jul" />
						<wijmo:ChartXData StringValue="Aug" />
						<wijmo:ChartXData StringValue="Sep" />
						<wijmo:ChartXData StringValue="Oct" />
						<wijmo:ChartXData StringValue="Nov" />
						<wijmo:ChartXData StringValue="Dec" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="443.95" />
						<wijmo:ChartYData DoubleValue="527.55" />
						<wijmo:ChartYData DoubleValue="583.09" />
						<wijmo:ChartYData DoubleValue="567.95" />
						<wijmo:ChartYData DoubleValue="561.87" />
						<wijmo:ChartYData DoubleValue="567.97" />
						<wijmo:ChartYData DoubleValue="594.00" />
						<wijmo:ChartYData DoubleValue="649.76" />
						<wijmo:ChartYData DoubleValue="651.58" />
						<wijmo:ChartYData DoubleValue="581.47" />
						<wijmo:ChartYData DoubleValue="574.27" />
						<wijmo:ChartYData DoubleValue="522.16" />
					</Values>
				</Y>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="394.55" />
						<wijmo:ChartY1Data DoubleValue="460.05" />
						<wijmo:ChartY1Data DoubleValue="508.30" />
						<wijmo:ChartY1Data DoubleValue="587.58" />
						<wijmo:ChartY1Data DoubleValue="533.47" />
						<wijmo:ChartY1Data DoubleValue="534.08" />
						<wijmo:ChartY1Data DoubleValue="570.05" />
						<wijmo:ChartY1Data DoubleValue="582.79" />
						<wijmo:ChartY1Data DoubleValue="621.26" />
						<wijmo:ChartY1Data DoubleValue="601.95" />
						<wijmo:ChartY1Data DoubleValue="514.61" />
						<wijmo:ChartY1Data DoubleValue="498.40" />
					</Values>
				</Y1>
			</Data>
		</wijmo:BubbleChartSeries>
	</SeriesList>
</wijmo:C1BubbleChart>
	<script>
		function hint() {
			return "" + this.data.label + " \n" + "Stock price: " + Globalize.format(this.y, "c2") + "\n"
				 + "Capitalization: " + this.data.y1 + "B";
		}
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>This demo shows how to change bubbles size range. Use <strong>MinimumSize</strong> and <strong>MaximumSize</strong> properties to adjust 
	bubbles diametre to the values you need!
</p>
<h3>Test the features</h3>
<ul>
    <li>Go to the 'Sources' tab to see how to setup bubbles size range.</li>
</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
