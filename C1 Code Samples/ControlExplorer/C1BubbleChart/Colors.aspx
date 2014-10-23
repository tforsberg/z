<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Colors.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.Colors" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<wijmo:C1BubbleChart runat="server" ID="C1BubbleChart1" MinimumSize="1" Height="475" Width = "756">

<Footer Compass="South" Visible="False"></Footer>

	<Legend Text="Countries">
		<Size Width="20" />
	</Legend>
	<Axis>
		<X Text="">
<GridMajor Visible="False"></GridMajor>

<GridMinor Visible="False"></GridMinor>
		</X>
		<Y Text="Marketshare, %" Compass="West">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
		</Y>
	</Axis>
	<Hint>
		<Content Function="hint" />
	</Hint>

	<ChartLabel Visible="False">
	</ChartLabel>

<Animation Duration="500" Easing="EaseOutElastic"></Animation>

	<SeriesList>
		<wijmo:BubbleChartSeries Label="Android" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="81.07" />
						<wijmo:ChartY1Data DoubleValue="104.8" />
						<wijmo:ChartY1Data DoubleValue="122.5" />
						<wijmo:ChartY1Data DoubleValue="144.7" />
						<wijmo:ChartY1Data DoubleValue="162.1" />
						<wijmo:ChartY1Data DoubleValue="177.9" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="2012-Q1" />
						<wijmo:ChartXData StringValue="2012-Q2" />
						<wijmo:ChartXData StringValue="2012-Q3" />
						<wijmo:ChartXData StringValue="2012-Q4" />
						<wijmo:ChartXData StringValue="2013-Q1" />
						<wijmo:ChartXData StringValue="2013-Q2" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="58.19" />
						<wijmo:ChartYData DoubleValue="69.68" />
						<wijmo:ChartYData DoubleValue="74.48" />
						<wijmo:ChartYData DoubleValue="70.82" />
						<wijmo:ChartYData DoubleValue="75.99" />
						<wijmo:ChartYData DoubleValue="79.40" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="iOS" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="33.12" />
						<wijmo:ChartY1Data DoubleValue="26.0" />
						<wijmo:ChartY1Data DoubleValue="23.6" />
						<wijmo:ChartY1Data DoubleValue="43.5" />
						<wijmo:ChartY1Data DoubleValue="37.4" />
						<wijmo:ChartY1Data DoubleValue="31.9" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="2012-Q1" />
						<wijmo:ChartXData StringValue="2012-Q2" />
						<wijmo:ChartXData StringValue="2012-Q3" />
						<wijmo:ChartXData StringValue="2012-Q4" />
						<wijmo:ChartXData StringValue="2013-Q1" />
						<wijmo:ChartXData StringValue="2013-Q2" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="23.77" />
						<wijmo:ChartYData DoubleValue="17.28" />
						<wijmo:ChartYData DoubleValue="14.42" />
						<wijmo:ChartYData DoubleValue="21.29" />
						<wijmo:ChartYData DoubleValue="17.53" />
						<wijmo:ChartYData DoubleValue="14.23" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="Windows Phone" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="2.71" />
						<wijmo:ChartY1Data DoubleValue="5.4" />
						<wijmo:ChartY1Data DoubleValue="4.1" />
						<wijmo:ChartY1Data DoubleValue="6.2" />
						<wijmo:ChartY1Data DoubleValue="7.0" />
						<wijmo:ChartY1Data DoubleValue="7.4" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="2012-Q1" />
						<wijmo:ChartXData StringValue="2012-Q2" />
						<wijmo:ChartXData StringValue="2012-Q3" />
						<wijmo:ChartXData StringValue="2012-Q4" />
						<wijmo:ChartXData StringValue="2013-Q1" />
						<wijmo:ChartXData StringValue="2013-Q2" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="1.94" />
						<wijmo:ChartYData DoubleValue="3.59" />
						<wijmo:ChartYData DoubleValue="2.5" />
						<wijmo:ChartYData DoubleValue="3.03" />
						<wijmo:ChartYData DoubleValue="3.28" />
						<wijmo:ChartYData DoubleValue="3.30" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="Blackberry" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="9.94" />
						<wijmo:ChartY1Data DoubleValue="7.4" />
						<wijmo:ChartY1Data DoubleValue="9.0" />
						<wijmo:ChartY1Data DoubleValue="7.3" />
						<wijmo:ChartY1Data DoubleValue="6.3" />
						<wijmo:ChartY1Data DoubleValue="6.2" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="2012-Q1" />
						<wijmo:ChartXData StringValue="2012-Q2" />
						<wijmo:ChartXData StringValue="2012-Q3" />
						<wijmo:ChartXData StringValue="2012-Q4" />
						<wijmo:ChartXData StringValue="2013-Q1" />
						<wijmo:ChartXData StringValue="2013-Q2" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="7.13" />
						<wijmo:ChartYData DoubleValue="4.92" />
						<wijmo:ChartYData DoubleValue="5.55" />
						<wijmo:ChartYData DoubleValue="3.57" />
						<wijmo:ChartYData DoubleValue="2.95" />
						<wijmo:ChartYData DoubleValue="2.76" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="Symbian" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="12.47" />
						<wijmo:ChartY1Data DoubleValue=" 6.8" />
						<wijmo:ChartY1Data DoubleValue=" 4.4" />
						<wijmo:ChartY1Data DoubleValue=" 2.6" />
						<wijmo:ChartY1Data DoubleValue=" 0.5" />
						<wijmo:ChartY1Data DoubleValue=" 0.631" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="2012-Q1" />
						<wijmo:ChartXData StringValue="2012-Q2" />
						<wijmo:ChartXData StringValue="2012-Q3" />
						<wijmo:ChartXData StringValue="2012-Q4" />
						<wijmo:ChartXData StringValue="2013-Q1" />
						<wijmo:ChartXData StringValue="2013-Q2" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="8.95" />
						<wijmo:ChartYData DoubleValue=" 4.52" />
						<wijmo:ChartYData DoubleValue=" 2.68" />
						<wijmo:ChartYData DoubleValue=" 1.27" />
						<wijmo:ChartYData DoubleValue=" 0.24" />
						<wijmo:ChartYData DoubleValue=" 0.28" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
	</SeriesList>
	<SeriesStyles>
		<wijmo:ChartStyle FillOpacity="0.7" Stroke="#3C74D0" StrokeWidth="1">
			<Fill Color="#3C74D0">
			</Fill>
		</wijmo:ChartStyle>
		<wijmo:ChartStyle FillOpacity="0.7" Stroke="#5f9996" StrokeWidth="1">
			<Fill Color="#5f9996">
			</Fill>
		</wijmo:ChartStyle>
		<wijmo:ChartStyle FillOpacity="0.7" Stroke="#afe500" StrokeWidth="1">
			<Fill Color="#afe500">
			</Fill>
		</wijmo:ChartStyle>
		<wijmo:ChartStyle FillOpacity="0.7" Stroke="#b2c76d" StrokeWidth="1">
			<Fill Color="#b2c76d">
			</Fill>
		</wijmo:ChartStyle>
		<wijmo:ChartStyle FillOpacity="0.7" Stroke="#959595" StrokeWidth="1">
			<Fill Color="#959595">
			</Fill>
		</wijmo:ChartStyle>
	</SeriesStyles>
	<SeriesHoverStyles>
		<wijmo:ChartStyle FillOpacity="0.85" StrokeWidth="1.5">
			<Fill ColorBegin="#3C74D0" ColorEnd="#3C74D0" Type="RadialGradient">
				<ColorMiddles>
					<wijmo:ColorMiddle Color="#EEEEEE" />
				</ColorMiddles>
			</Fill>
		</wijmo:ChartStyle>
		<wijmo:ChartStyle FillOpacity="0.85" StrokeWidth="1.5">
			<Fill ColorBegin="#6aaba7" ColorEnd="#6aaba7" Type="RadialGradient">
				<ColorMiddles>
					<wijmo:ColorMiddle Color="#EEEEEE" />
				</ColorMiddles>
			</Fill>
		</wijmo:ChartStyle>
		<wijmo:ChartStyle FillOpacity="0.85" StrokeWidth="1.5">
			<Fill ColorBegin="#c3ff00" ColorEnd="#c3ff00" Type="RadialGradient">
				<ColorMiddles>
					<wijmo:ColorMiddle Color="#EEEEEE" />
				</ColorMiddles>
			</Fill>
		</wijmo:ChartStyle>
		<wijmo:ChartStyle FillOpacity="0.85" StrokeWidth="1.5">
			<Fill ColorBegin="#c7de7a" ColorEnd="#c7de7a" Type="RadialGradient">
				<ColorMiddles>
					<wijmo:ColorMiddle Color="#EEEEEE" />
				</ColorMiddles>
			</Fill>
		</wijmo:ChartStyle>
		<wijmo:ChartStyle FillOpacity="0.85" StrokeWidth="1.5">
			<Fill ColorBegin="#a6a6a6" ColorEnd="#a6a6a6" Type="RadialGradient">
				<ColorMiddles>
					<wijmo:ColorMiddle Color="#EEEEEE" />
				</ColorMiddles>
			</Fill>
		</wijmo:ChartStyle>
	</SeriesHoverStyles>
	<Header Text="Mobile OS Market Share"></Header>
</wijmo:C1BubbleChart>
	<script type="text/javascript">
		function hint() {
			return this.data.label + ' OS in ' + this.data.data.x[this.x] + '\n'
					+ this.y1 + ' millions of units' + '\n' + this.y + '% marketshare';
		}
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p><strong>C1BubbleChart</strong> is the perfect tool for data visualization. In this sample series you will 
learn how to setup chart colors. Bubble chart API provides <strong>SeriesStyles</strong> and <strong>SeriesHoverStyles</strong> 
properties that helps you to customize your chart colors any way you need.</p>
<h3>Test the features</h3>
<ul>
    <li>Note all chart bubbles are grouped in series with different colors.</li>
    <li>Go to the 'Sources' tab to see how to setup chart colors using <strong>SeriesStyles</strong> and <strong>SeriesHoverStyles</strong>  properties.</li>
</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
