<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Donut.aspx.cs" Inherits="PieChart_Donut" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type = "text/javascript">
		function hintContent() {
		    return this.data.label + " : " + Globalize.format(this.value / this.total, "p2");
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:Panel ID="piechart" runat="server" Height="475" Width = "756" CssClass="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1PieChartExtender runat = "server" ID="PieChartExtender1" Radius="140" InnerRadius="40"
		TargetControlID="piechart" ShowChartLabels="false">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Legend Text="May 2009 - May 2010"></Legend>
		<Header Text="Steam - DX10/11 Systems (Vista/Win7 + DX10/11 GPU)"></Header>
		<SeriesList>
			<wijmo:PieChartSeries Label="DX11GPU & WIN7" Data="5.6" Offset="30"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="iMac" Data="23.18"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="DX10GPU & WIN7" Data="56.36"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="DX10/11GPU & XP" Data="16.67"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="DX9 SM2b & 3.0" Data="11.77"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="DX9 SM 2 GPU" Data="4.34"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="DX8 GPU & BELOW" Data="5.13"></wijmo:PieChartSeries>
		</SeriesList>
	</wijmo:C1PieChartExtender>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Description" ID="Content3">
	<p>
		The C1PieChartExtender supports showing as a doughnut chart.
	</p>
	<p>
		Showing as a doughnut chart is allowed by setting the <b>InnerRadius</b> property.
	</p>
</asp:Content>
