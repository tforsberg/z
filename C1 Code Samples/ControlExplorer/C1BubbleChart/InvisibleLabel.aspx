<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="InvisibleLabel.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.InvisibleLabel" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<wijmo:C1BubbleChart runat="server" ID="BubbleChart1" MinimumSize="3" MaximumSize="15" Height="475" Width = "756">
	<Axis>
		<X Text=""></X>
		<Y Text="Total Hardware" Compass="West"></Y>
	</Axis>
	<Hint>
		<Content Function="hint" />
	</Hint>
	<Header Text="Hardware Distribution"></Header>
	<SeriesHoverStyles>
		<wijmo:ChartStyle Opacity="0.8"></wijmo:ChartStyle>
	</SeriesHoverStyles>
	<SeriesList>
		<wijmo:BubbleChartSeries Label="West" LegendEntry="true" InvisibleMarkLabels="1,4">
			<Data>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="5" />
						<wijmo:ChartXData DoubleValue="14" />
						<wijmo:ChartXData DoubleValue="20" />
						<wijmo:ChartXData DoubleValue="18" />
						<wijmo:ChartXData DoubleValue="22" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="5500" />
						<wijmo:ChartYData DoubleValue="12200" />
						<wijmo:ChartYData DoubleValue="60000" />
						<wijmo:ChartYData DoubleValue="24400" />
						<wijmo:ChartYData DoubleValue="32000" />
					</Values>
				</Y>
				<Y1 DoubleValues="3,12,53,10,50" />
			</Data>
		</wijmo:BubbleChartSeries>
	</SeriesList>
</wijmo:C1BubbleChart>
<script type="text/javascript">
	function hint() {
		return this.data.label + ' x:' + this.x + ',y:' + this.y + ",y1:" + this.data.y1;
	}
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample uses <b>BubbleChartSeries</b> property with <b>InvisibleMarkLabels</b> to hide some of the individual markers</p>
</asp:Content>
