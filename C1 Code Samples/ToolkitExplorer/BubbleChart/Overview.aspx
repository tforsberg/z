<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Overview.aspx.cs" Inherits="ToolkitExplorer.BubbleChart.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel runat="server" ID="panel1">
	</asp:Panel>
	<wijmo:C1BubbleChartExtender runat="server" ID="bubbleChart1" TargetControlID="panel1">
		<SeriesList>
			<wijmo:BubbleChartSeries Label="West">
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
					<Y1 DoubleValues="3,12,33,10,42" />
				</Data>
			</wijmo:BubbleChartSeries>
		</SeriesList>
	</wijmo:C1BubbleChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample shows how to use C1BubbleChart to create a simple bubble chart. Bubble
		charts are useful for displaying 3 dimensions of data.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
