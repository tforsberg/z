<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="ComboRegression.aspx.cs" Inherits="ToolkitExplorer.CompositeChart.ComboRegression" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		function hintContent() {
			return this.label + ": x=" + this.x + ', y=' + this.y + '';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="CompositeChart1" runat="server" Height="475" Width="756">
	</asp:Panel>
	<wijmo:C1CompositeChartExtender runat="server" ID="C1CompositeChartExtender1" TargetControlID="CompositeChart1"
		>
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Axis>
			<X Text="" AutoMax = "false" AutoMin = "false" Max = "6" Min = "-0.5"></X>
			<Y Text="y values" Compass="West"></Y>
		</Axis>
		<Header Text="Scatter plot with regression line"></Header>
		<SeriesList>
			<wijmo:CompositeChartSeries Label="Observations" LegendEntry="true" Type = "Scatter" ScatterMarkerType ="Circle">
				<Data>
					<X DoubleValues="0, 1, 2, 3, 4, 5" />
					<Y DoubleValues="1, 1.5, 2.8, 3.5, 3.9, 4.2" />
				</Data>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Label="Regression Line" LegendEntry="true" Type = "Line">
				<Data>
					<X DoubleValues="0, 5" />
					<Y DoubleValues="1.11, 4.51" />
				</Data>
			</wijmo:CompositeChartSeries>
		</SeriesList>
	</wijmo:C1CompositeChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
<p>
	This sample demonstrates a Scatter Plot with a regression line to indicate the trend (regression) line.
</p>
</asp:Content>
