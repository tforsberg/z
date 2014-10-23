<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="TimeLine.aspx.cs" Inherits="ControlExplorer.C1CompositeChart.TimeLine" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		function hint() {
			return this.label + '\n ' + this.y + '';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1CompositeChart Width="756" Height="475" runat="server" ID="CompositeChart1" ShowChartLabels="false">
		<Axis>
<X>
<GridMajor Visible="False"></GridMajor>

<GridMinor Visible="False"></GridMinor>
</X>

			<Y Text="Visitors" AutoMin="false" Min="500000" Compass="West" Visible="false">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</Y>
		</Axis>

<Footer Compass="South" Visible="False"></Footer>

		<Legend Visible="false"></Legend>
		<Hint>
			<Content Function="hint" />
		</Hint>
		<Header Text="Traffic"></Header>
		<SeriesList>
			<wijmo:CompositeChartSeries Type="Column" Label="2010" LegendEntry="true">
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
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1100000" />
							<wijmo:ChartYData DoubleValue="1400000" />
							<wijmo:ChartYData DoubleValue="1700000" />
							<wijmo:ChartYData DoubleValue="2000000" />
							<wijmo:ChartYData DoubleValue="2500000" />
							<wijmo:ChartYData DoubleValue="1900000" />
							<wijmo:ChartYData DoubleValue="1700000" />
							<wijmo:ChartYData DoubleValue="1400000" />
							<wijmo:ChartYData DoubleValue="1100000" />
							<wijmo:ChartYData DoubleValue="1600000" />
						</Values>
					</Y>
				</Data>
<CandlestickSeries LegendEntry="True"></CandlestickSeries>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Type="Line" Label="2010" LegendEntry="true">
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
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1100000" />
							<wijmo:ChartYData DoubleValue="1400000" />
							<wijmo:ChartYData DoubleValue="1700000" />
							<wijmo:ChartYData DoubleValue="2000000" />
							<wijmo:ChartYData DoubleValue="2500000" />
							<wijmo:ChartYData DoubleValue="1900000" />
							<wijmo:ChartYData DoubleValue="1700000" />
							<wijmo:ChartYData DoubleValue="1400000" />
							<wijmo:ChartYData DoubleValue="1100000" />
							<wijmo:ChartYData DoubleValue="1600000" />
						</Values>
					</Y>
				</Data>
				<LineMarkers Visible="true">
				</LineMarkers>
<CandlestickSeries LegendEntry="True"></CandlestickSeries>
			</wijmo:CompositeChartSeries>
		</SeriesList>
	</wijmo:C1CompositeChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>The <b>C1CpmpositeChart</b> allows you to draw multiple types of charts in one canvas simultaneously.</p>
</asp:Content>
