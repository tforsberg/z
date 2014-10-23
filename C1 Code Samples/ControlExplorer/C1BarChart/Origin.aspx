<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Origin.aspx.cs" Inherits="ControlExplorer.C1BarChart.Origin" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type = "text/javascript">
		function hintContent() {
			return this.data.label + '\n ' + this.y + '';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1BarChart runat = "server" ID="C1BarChart1" Height="475" Width = "756" ShowChartLabels="false">
		<Animation Duration="1000" />
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Header Text="Bar chart with negative series values"></Header>
		<Axis>
			<X Origin="2.6"></X>
			<Y Alignment="Far" Visible="true" Origin="0" Compass="West"></Y>
		</Axis>
		<SeriesList>
			<wijmo:BarChartSeries Label="s1" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="1" />
							<wijmo:ChartXData DoubleValue="2" />
							<wijmo:ChartXData DoubleValue="3" />
							<wijmo:ChartXData DoubleValue="4" />
							<wijmo:ChartXData DoubleValue="5" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="-5" />
							<wijmo:ChartYData DoubleValue="-3" />
							<wijmo:ChartYData DoubleValue="1" />
							<wijmo:ChartYData DoubleValue="7" />
							<wijmo:ChartYData DoubleValue="2" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="s2" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="1" />
							<wijmo:ChartXData DoubleValue="2" />
							<wijmo:ChartXData DoubleValue="3" />
							<wijmo:ChartXData DoubleValue="4" />
							<wijmo:ChartXData DoubleValue="5" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="-2" />
							<wijmo:ChartYData DoubleValue="-6" />
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="4" />
							<wijmo:ChartYData DoubleValue="3" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="s3" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="1" />
							<wijmo:ChartXData DoubleValue="2" />
							<wijmo:ChartXData DoubleValue="3" />
							<wijmo:ChartXData DoubleValue="4" />
							<wijmo:ChartXData DoubleValue="5" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="-3" />
							<wijmo:ChartYData DoubleValue="-5" />
							<wijmo:ChartYData DoubleValue="3" />
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="5" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
	</wijmo:C1BarChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
<p>The <strong>C1BarChart</strong> supports negative values and can display them nicely using the "Origin" property for each axis. The Origin property tell the axis where to draw its starting point. This is optimal for diaplying positive and negative values on the same chart.</p>
</asp:Content>
