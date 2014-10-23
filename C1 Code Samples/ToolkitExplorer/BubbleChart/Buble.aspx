<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Buble.aspx.cs" Inherits="ToolkitExplorer.BubbleChart.Buble" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<script type="text/javascript">
	function content() {
		return this.data.label + '<br/> x:' + this.x + ',y:' + this.y + ",y1:" + this.data.y1;
	}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:Panel runat="server" ID="panel1" Height="475" Width = "756"></asp:Panel>
<wijmo:C1BubbleChartExtender runat="server" ID="bubbleChart1" TargetControlID="panel1" MinimumSize="3" MaximumSize="15">
<Axis>
		<X Text=""></X>
		<Y Text="Swoon"></Y>
	</Axis>
	<Hint>
		<Content Function="content" />
	</Hint>
	<Header Text="Michael Buble Chart"></Header>
	<SeriesHoverStyles>
		<wijmo:ChartStyle Opacity="0.5"></wijmo:ChartStyle>
	</SeriesHoverStyles>
	<ChartLabel Position="Outside">		
	</ChartLabel>
	<SeriesList>
		<wijmo:BubbleChartSeries Label="Hits" LegendEntry="true" InVisibleMarkLabels="1,4">
			<Data>
				<X DoubleValues="5,14,20,18,22" />
				<Y DoubleValues="5500, 12200, 60000,24400,32000" />
				<Y1 DoubleValues="3,12,53,10,50" />
			</Data>
			<Markers>
				<Symbol>
					<wijmo:BubbleChartSymbol Index="4" Url="images/buble.png" />
					<wijmo:BubbleChartSymbol Index="3" Url="images/buble.png" />
					<wijmo:BubbleChartSymbol Index="2" Url="images/buble.png" />
					<wijmo:BubbleChartSymbol Index="1" Url="images/buble.png" />
					<wijmo:BubbleChartSymbol Index="0" Url="images/buble.png" />
				</Symbol>
			</Markers>
		</wijmo:BubbleChartSeries>
	</SeriesList>
</wijmo:C1BubbleChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample use <b>Markers</b> to customize the gauge background image.</p>
</asp:Content>
