<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Negative.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.Negative" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
	function hint () {
		return 'x:' + this.x + ',y:' + this.y + ",y1:" + this.data.y1;
	}
</script>
<wijmo:C1BubbleChart runat="server" ID="BubbleChart1" MinimumSize="3" MaximumSize="15" Height="475" Width = "756">
	<Axis>
		<X Origin="0" Text=""></X>
		<Y Origin="0" Text="" Compass="West"></Y>
	</Axis>
	<Hint>
		<Content Function="hint" />
	</Hint>
	<Header Text="Hardware Distribution"></Header>
	<ChartLabel Position="Outside"></ChartLabel>
	<SeriesList>
		<wijmo:BubbleChartSeries Label="West" LegendEntry="true">
			<Data>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="-5" />
						<wijmo:ChartXData DoubleValue="14" />
						<wijmo:ChartXData DoubleValue="20" />
						<wijmo:ChartXData DoubleValue="18" />
						<wijmo:ChartXData DoubleValue="22" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="-5500" />
						<wijmo:ChartYData DoubleValue="12200" />
						<wijmo:ChartYData DoubleValue="60000" />
						<wijmo:ChartYData DoubleValue="24400" />
						<wijmo:ChartYData DoubleValue="32000" />
					</Values>
				</Y>
				<Y1 DoubleValues="3,12,33,10,42" />
			</Data>
		</wijmo:BubbleChartSeries>
	</SeriesList>
</wijmo:C1BubbleChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>The bubble chart can handle negative x and y axis values. This sample demonstrates rendering negative and positive numbers in the same chart.</p>
</asp:Content>
