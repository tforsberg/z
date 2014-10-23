<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Overlap.aspx.cs" Inherits="ToolkitExplorer.BubbleChart.Overlap" %>

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
		<ChartLabel ChartLabelFormatString="c2">
		</ChartLabel>
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
			<wijmo:BubbleChartSeries Label="Toyota">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="2006" />
							<wijmo:ChartXData DoubleValue="2007" />
							<wijmo:ChartXData DoubleValue="2008" />
							<wijmo:ChartXData DoubleValue="2009" />
							<wijmo:ChartXData DoubleValue="2010" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="5" />
							<wijmo:ChartYData DoubleValue="6" />
							<wijmo:ChartYData DoubleValue="8" />
							<wijmo:ChartYData DoubleValue="7" />
							<wijmo:ChartYData DoubleValue="8.5" />
						</Values>
					</Y>
					<Y1 DoubleValues="4, 4.4, 5.1, 5.5, 5.7" />
				</Data>
			</wijmo:BubbleChartSeries>
			<wijmo:BubbleChartSeries Label="General Motors">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="2006" />
							<wijmo:ChartXData DoubleValue="2007" />
							<wijmo:ChartXData DoubleValue="2008" />
							<wijmo:ChartXData DoubleValue="2009" />
							<wijmo:ChartXData DoubleValue="2010" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="3" />
							<wijmo:ChartYData DoubleValue="4" />
							<wijmo:ChartYData DoubleValue="6" />
							<wijmo:ChartYData DoubleValue="7.5" />
							<wijmo:ChartYData DoubleValue="8" />
						</Values>
					</Y>
					<Y1 DoubleValues="2, 2.5, 3, 4, 5" />
				</Data>
			</wijmo:BubbleChartSeries>
			<wijmo:BubbleChartSeries Label="Volkswagon">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="2006" />
							<wijmo:ChartXData DoubleValue="2007" />
							<wijmo:ChartXData DoubleValue="2008" />
							<wijmo:ChartXData DoubleValue="2009" />
							<wijmo:ChartXData DoubleValue="2010" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="4" />
							<wijmo:ChartYData DoubleValue="5" />
							<wijmo:ChartYData DoubleValue="6.5" />
							<wijmo:ChartYData DoubleValue="7.3" />
							<wijmo:ChartYData DoubleValue="6.6" />
						</Values>
					</Y>
					<Y1 DoubleValues="2, 2.5, 4.5, 6, 5.5" />
				</Data>
			</wijmo:BubbleChartSeries>
			<wijmo:BubbleChartSeries Label="Hyundai">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="2006" />
							<wijmo:ChartXData DoubleValue="2007" />
							<wijmo:ChartXData DoubleValue="2008" />
							<wijmo:ChartXData DoubleValue="2009" />
							<wijmo:ChartXData DoubleValue="2010" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="6" />
							<wijmo:ChartYData DoubleValue="1" />
							<wijmo:ChartYData DoubleValue="5" />
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="4" />
						</Values>
					</Y>
					<Y1 DoubleValues="2, 3, 4.5, 1.5, 1" />
				</Data>
			</wijmo:BubbleChartSeries>
			<wijmo:BubbleChartSeries Label="Ford">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DoubleValue="2006" />
							<wijmo:ChartXData DoubleValue="2007" />
							<wijmo:ChartXData DoubleValue="2008" />
							<wijmo:ChartXData DoubleValue="2009" />
							<wijmo:ChartXData DoubleValue="2010" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="6" />
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="3" />
							<wijmo:ChartYData DoubleValue="4.6" />
							<wijmo:ChartYData DoubleValue="5" />
						</Values>
					</Y>
					<Y1 DoubleValues="4.5, 4, 3.8, 3, 2" />
				</Data>
			</wijmo:BubbleChartSeries>
		</SeriesList>
	</wijmo:C1BubbleChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample shows that we can click the legend to show/hide the bubble series.
	</p>
</asp:Content>
