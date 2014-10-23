<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="StackedPercentageBar.aspx.cs" Inherits="BarChart_StackedPercentageBar" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type = "text/javascript">
		function hintContent() {
			return this.data.label + '\n ' + this.y + '';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:Panel ID="barchart" runat="server" Height="475" Width = "756" CssClass="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1BarChartExtender runat = "server" Stacked="true" Is100Percent="true" ID="BarChartExtender1"
		TargetControlID="barchart">
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
	</wijmo:C1BarChartExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
		The C1BarChartExtender supports stacked its bar and show as a percentage bar.
	</p>
	<p>
		Percentage stacked Bar is allowed if the "Stacked" and "Is100Percent" property is set to true.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>
