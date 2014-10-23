<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="OverView.aspx.cs" Inherits="BarChart_OverView" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type = "text/javascript">
		function hintContent() {
			return this.data.label + '\n ' + this.y + '';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:Panel ID="barchart" Height="475" Width = "756" runat="server" CssClass ="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1BarChartExtender runat = "server" ID="BarChartExtender1"
		TargetControlID="barchart">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Axis>
			<X Text=""></X>
			<Y Text="Total Hardware" Compass="West"></Y>
		</Axis>
		<Header Text="Hardware Distribution"></Header>
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
	<p>The C1BarChartExtender(wijbarchart widget at client side) allows you to create customized bar charts from various data sources. 
	The samples in this section highlight some of the unique features of this extender. 
	This particular sample demonstrates some of the basic features of the C1BarChartExtender. 
	The source in this sample will show you how to set the text of the X axis and Y axis; how to add a header to the chart; how to add label text to the legend; and how to populate the chart with data.

	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>
