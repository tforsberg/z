<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" 
	CodeFile="StackedPercentageBar.aspx.cs" Inherits="C1BarChart_StackedPercentageBar" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type="text/javascript">
		function hintContent() {
			return this.data.label + '\n' + this.y + '';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1BarChart runat = "server" Stacked="true" Is100Percent="true" ID="C1BarChart1" Height="475" Width = "756">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Axis>
			<Y Text="Total Hardware" Compass="West"></Y>
			<X Text=""></X>
		</Axis>
		<Header Text="Hardware Distribution"></Header>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#afe500" Opacity="0.8">
				<Fill Color="#c3ff00"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#959595" Opacity="0.8">
				<Fill Color="#a6a6a6"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#2d2d2d" Opacity="0.8">
				<Fill Color="#333333"></Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="1.5" Opacity="1" />
			<wijmo:ChartStyle StrokeWidth="1.5" Opacity="1" />
			<wijmo:ChartStyle StrokeWidth="1.5" Opacity="1" />
		</SeriesHoverStyles>
		<SeriesList>
			<wijmo:BarChartSeries Label="West" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Desktops" />
							<wijmo:ChartXData StringValue="Notebooks" />
							<wijmo:ChartXData StringValue="AIO" />
							<wijmo:ChartXData StringValue="Tablets" />
							<wijmo:ChartXData StringValue="Phones" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="5" />
							<wijmo:ChartYData DoubleValue="3" />
							<wijmo:ChartYData DoubleValue="4" />
							<wijmo:ChartYData DoubleValue="7" />
							<wijmo:ChartYData DoubleValue="2" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="Central" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Desktops" />
							<wijmo:ChartXData StringValue="Notebooks" />
							<wijmo:ChartXData StringValue="AIO" />
							<wijmo:ChartXData StringValue="Tablets" />
							<wijmo:ChartXData StringValue="Phones" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="3" />
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="1" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="East" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Desktops" />
							<wijmo:ChartXData StringValue="Notebooks" />
							<wijmo:ChartXData StringValue="AIO" />
							<wijmo:ChartXData StringValue="Tablets" />
							<wijmo:ChartXData StringValue="Phones" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="3" />
							<wijmo:ChartYData DoubleValue="4" />
							<wijmo:ChartYData DoubleValue="4" />
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="5" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
	</wijmo:C1BarChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
		The <strong>C1BarChart </strong>supports a stacked bar and a shown-as-a-percentage bar.
	</p>
	<p>
		A shown-as-percentage stacked Bar is allowed if the <strong>Stacked</strong> and 
		<strong>Is100Percent</strong> properties are set to True.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

