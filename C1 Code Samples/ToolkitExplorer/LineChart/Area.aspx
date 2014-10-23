<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Area.aspx.cs" Inherits="ToolkitExplorer.LineChart.Area" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type = "text/javascript">
		function hintContent() {
			return this.y;
		}
	</script></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="linechart" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all" Height="475" Width = "756">
	</asp:Panel>
	<wijmo:C1LineChartExtender ShowChartLabels="false" runat = "server" ID="LineChartExtender1" 
		TargetControlID="linechart" Type="Area">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Header Text="World of Warcraft Players by Region"></Header>
		<SeriesHoverStyles>
			<wijmo:ChartStyle Opacity="1" />
			<wijmo:ChartStyle Opacity="1" />
			<wijmo:ChartStyle Opacity="1" />
		</SeriesHoverStyles>
		<SeriesList>
			<wijmo:LineChartSeries Label="Asia">
				<Markers Visible="True">
				</Markers>
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2005-07-01" />
							<wijmo:ChartXData DateTimeValue="2005-08-01" />
							<wijmo:ChartXData DateTimeValue=" 2005-10-01" />
							<wijmo:ChartXData DateTimeValue="2006-03-01" />
							<wijmo:ChartXData DateTimeValue="2006-09-01" />
							<wijmo:ChartXData DateTimeValue="2006-12-01" />
							<wijmo:ChartXData DateTimeValue="2008-01-01" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1500000" />
							<wijmo:ChartYData DoubleValue="2000000" />
							<wijmo:ChartYData DoubleValue="2400000" />
							<wijmo:ChartYData DoubleValue="3700000" />
							<wijmo:ChartYData DoubleValue="4000000" />
							<wijmo:ChartYData DoubleValue="4500000" />
							<wijmo:ChartYData DoubleValue="5500000" />
						</Values>
					</Y>
				</Data>
			</wijmo:LineChartSeries>
			<wijmo:LineChartSeries Label="North America">
				<Markers Visible="True">
				</Markers>
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2005-07-01" />
							<wijmo:ChartXData DateTimeValue="2005-08-01" />
							<wijmo:ChartXData DateTimeValue=" 2005-10-01" />
							<wijmo:ChartXData DateTimeValue="2005-12-01" />
							<wijmo:ChartXData DateTimeValue="2006-03-01" />
							<wijmo:ChartXData DateTimeValue="2006-12-01" />
							<wijmo:ChartXData DateTimeValue="2008-01-01" />
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
			</wijmo:LineChartSeries>
			<wijmo:LineChartSeries Label="Europe">
				<Markers Visible="True">
				</Markers>
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2005-07-01" />
							<wijmo:ChartXData DateTimeValue="2005-08-01" />
							<wijmo:ChartXData DateTimeValue=" 2005-10-01" />
							<wijmo:ChartXData DateTimeValue="2005-12-01" />
							<wijmo:ChartXData DateTimeValue="2006-03-01" />
							<wijmo:ChartXData DateTimeValue="2006-07-01" />
							<wijmo:ChartXData DateTimeValue="2006-12-01" />
							<wijmo:ChartXData DateTimeValue="2008-01-01" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="900000" />
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1000000" />
							<wijmo:ChartYData DoubleValue="1500000" />
							<wijmo:ChartYData DoubleValue="2000000" />
						</Values>
					</Y>
				</Data>
			</wijmo:LineChartSeries>
		</SeriesList>
		<Footer Compass="South" Visible="False"></Footer>
		<Legend>
			<Size Width="30" Height="3"></Size>
		</Legend>
		<Axis>
			<Y Visible="False" Compass="West">
				<Labels TextAlign="Center"></Labels>
				<GridMajor Visible="True"></GridMajor>
			</Y>
		</Axis>
	</wijmo:C1LineChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>The wijlinechart supports area types to display lines as filled areas. The type option is used to display either Area or Line chart types.</p>
</asp:Content>
