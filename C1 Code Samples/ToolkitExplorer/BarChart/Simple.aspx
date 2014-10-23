<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Simple.aspx.cs" Inherits="BarChart_Simple" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type = "text/javascript">
		function hintContent() {
			return this.data.label + '\n ' + this.y + '';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:Panel ID="barchart" Height="475" Width = "756" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1BarChartExtender runat = "server" ID="BarChartExtender1"
		TargetControlID="barchart">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Axis>
			<Y Text="Total Hardware" Compass="West"></Y>
			<X Text=""></X>
		</Axis>
		<Header Text="Console Wars"></Header>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#7fc73c" Opacity="0.8">
				<Fill Color="#8ede43"></Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="1.5" Opacity="1" />
		</SeriesHoverStyles>
		<SeriesList>
			<wijmo:BarChartSeries Label="US" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="PS3" />
							<wijmo:ChartXData StringValue="XBOX360" />
							<wijmo:ChartXData StringValue="Wii" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="12.35" />
							<wijmo:ChartYData DoubleValue="21.50" />
							<wijmo:ChartYData DoubleValue="30.56" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
	</wijmo:C1BarChartExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
		This sample illustrates a simple bar chart that compares the sales between the Nintendo Wii, the Xbox 360, and the Playstation 3.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>
