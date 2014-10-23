<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="ColumnBar.aspx.cs" Inherits="BarChart_ColumnBar" %>
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
	<wijmo:C1BarChartExtender runat = "server" ID="BarChartExtender1" Horizontal="false"
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
	<p>
		The C1BarChartExtender supports converting bar chart to a column chart.
	</p>
	<p>
		Set "Horizontal" property of C1BarChartExtender to false to convert a bar chart to a column chart.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>
