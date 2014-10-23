<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="ChartMarker.aspx.cs" Inherits="ToolkitExplorer.BubbleChart.ChartMarker" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		function hint() {
			return 'x:' + this.x + ',y:' + this.y + ",y1:" + this.data.y1;
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel runat="server" ID="panel1" Height="475" Width="756">
	</asp:Panel>
	<wijmo:C1BubbleChartExtender runat="server" ID="bubbleChart1" TargetControlID="panel1"
		MinimumSize="3" MaximumSize="15">
		<Axis>
			<X Text="">
			</X>
			<Y Text="Total Hardware" Compass="West">
			</Y>
		</Axis>
		<Hint>
			<Content Function="hint" />
		</Hint>
		<Header Text="Hardware Distribution">
		</Header>
		<SeriesList>
			<wijmo:BubbleChartSeries Label="West" LegendEntry="true">
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
				<Markers Type="Tri">
				</Markers>
			</wijmo:BubbleChartSeries>
		</SeriesList>
	</wijmo:C1BubbleChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample uses the SeriesList's <b>Markers</b> property to define the type of
		marker used. The marker type can be set to Circle, Tri, InvertedTri, Box, Diamond
		or Cross.</p>
</asp:Content>
