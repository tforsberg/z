<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Dark.aspx.cs" Inherits="BarChart_Dark" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type = "text/javascript">
		function hintContent() {
			return this.data.label + '\n ' + this.y + '';
		}
		function pageLoad() {
			$("#<%= barchart.ClientID %>").wijbarchart("option", "hint", { content: hintContent });
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<asp:Panel ID="barchart" runat="server" Height="500" style="background: #242529" class="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1BarChartExtender runat = "server" ID="BarChartExtender1" Shadow="false"
		TargetControlID="barchart">

<Footer Compass="South" Visible="False"></Footer>

		<Legend Visible="false"></Legend>
		<TextStyle FontWeight="bold" FontSize="15pt">
			<Fill Color="#b2b2b2"></Fill>
		</TextStyle>
		<Axis>
			<Y>
				<Labels>
					<Style FontSize="11pt">
						<Fill Color="#242529">
						</Fill>
					</Style>
				</Labels>
				<GridMajor>
					<Style Stroke="#353539" StrokeDashArray="- ">
					</Style>
				</GridMajor>
			</Y>
			<X>
				<Labels>
					<Style FontSize="11pt">
						<Fill Color="#7f7f7f">
						</Fill>
					</Style>
				</Labels>
			</X>
		</Axis>
		<Header Text="Concurrent Steam Users (most recent 48 hours)"></Header>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#ff7800" Opacity="0.8">
				<Fill Type="LinearGradient" LinearGradientAngle="180" ColorBegin="#ff9900" ColorEnd="#ff6600"></Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="1.5" Opacity="1" />
		</SeriesHoverStyles>
		<SeriesList>
			<wijmo:BarChartSeries Label="US" LegendEntry="true">
				<Data>
					<X StringValues="10/27/2010 11:48:00, 10/27/2010 13:47:00, 10/27/2010 15:46:00, 10/27/2010 17:45:00, 10/27/2010 19:44:00, 10/27/2010 21:43:00, 10/27/2010 23:41:00, 10/28/2010 1:40:00, 10/28/2010 3:39:00, 10/28/2010 5:38:00, 10/28/2010 7:37:00, 10/28/2010 9:36:00, 10/28/2010 11:35:00, 10/28/2010 13:34:00, 10/28/2010 15:33:00" />
					<Y DoubleValues="2665513, 2300921, 1663229, 1622528, 1472847, 1354026, 1348909, 1514946, 1746392, 2020481, 2312976, 2539210, 2657505, 2369938, 1869805" />
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
	</wijmo:C1BarChartExtender>
</asp:Content>