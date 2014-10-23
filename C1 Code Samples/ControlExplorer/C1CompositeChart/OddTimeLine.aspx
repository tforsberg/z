<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="OddTimeLine.aspx.cs" Inherits="ControlExplorer.C1CompositeChart.OddTimeLine" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		function hint() {
			return this.label + '\n ' + this.y + '';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1CompositeChart runat="server" Width="756" Height="475" ID="CompositeChart1" ShowChartLabels="false">
		<Axis>
			<Y Visible="false" Text="Visitors" Compass="West">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</Y>
			<X>
				<GridMajor Visible="false"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</X>
		</Axis>

<Footer Compass="South" Visible="False"></Footer>

		<Legend Visible="false"></Legend>
		<Hint>
			<Content Function="hint" />
		</Hint>
		<SeriesList>
			<wijmo:CompositeChartSeries Label="2010" LegendEntry="True" Type="Column">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2010-01-01" />
							<wijmo:ChartXData DateTimeValue="2010-02-01" />
							<wijmo:ChartXData DateTimeValue="2010-03-01" />
							<wijmo:ChartXData DateTimeValue="2010-04-01" />
							<wijmo:ChartXData DateTimeValue="2010-05-01" />
							<wijmo:ChartXData DateTimeValue="2010-06-01" />
							<wijmo:ChartXData DateTimeValue="2010-07-01" />
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
						</Values>
					</Y>
				</Data>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Label="2010" LegendEntry="True" Type="Line">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2010-01-01" />
							<wijmo:ChartXData DateTimeValue="2010-02-01" />
							<wijmo:ChartXData DateTimeValue="2010-03-01" />
							<wijmo:ChartXData DateTimeValue="2010-04-01" />
							<wijmo:ChartXData DateTimeValue="2010-05-01" />
							<wijmo:ChartXData DateTimeValue="2010-06-01" />
							<wijmo:ChartXData DateTimeValue="2010-07-01" />
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
						</Values>
					</Y>
				</Data>
				<LineMarkers Visible="true">
				</LineMarkers>
			</wijmo:CompositeChartSeries>
		</SeriesList>
		<Header Text="Traffic"></Header>

	</wijmo:C1CompositeChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>The <b>C1CpmpositeChart</b> allows you to draw multiple types of charts in one canvas simultaneously.</p>
</asp:Content>
