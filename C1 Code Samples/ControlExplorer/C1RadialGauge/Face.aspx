<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Face.aspx.cs" Inherits="ControlExplorer.C1RadialGauge.Face" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="Wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
	function face(ui) {
		var set = ui.canvas.set();
		var circle = ui.canvas.circle(ui.origin.x, ui.origin.y, ui.r);
		circle.attr({ "stroke": "#ccc", "stroke-width": 3, fill: "270-rgb(255,255,255)-rgb(200,200,200)" });
		set.push(circle);
		return set;
	}

</script>
<Wijmo:C1RadialGauge runat="server" ID="Gauge1" Value="50" Max="150" StartAngle="0" SweepAngle="200">
	<Labels Offset="-40">
		<Style FontSize="18pt" Fill-Color="#666"></Style>
	</Labels>
	<Pointer Width="10">
		<Style Fill-LinearGradientAngle="180" Fill-ColorBegin="#0D8ECF" Fill-ColorEnd="#1695D6" Fill-Type="LinearGradient" Stroke="#1695D6" StrokeWidth="1.5" Opacity="0.5" ></Style>
	</Pointer>
	<TickMajor Factor="3">
		<Style Fill-Color="#666"></Style>
	</TickMajor>
	<TickMinor Visible="true">
		<Style Fill-Color="#666"></Style>
	</TickMinor>
	<Face Template="face">
	</Face>
	<Ranges>
		<Wijmo:GaugelRange StartWidth="1" EndWidth="12" StartValue="40" EndValue="80" StartDistance="0.7" EndDistance="0.7">
			<Style Fill-LinearGradientAngle="90" Fill-ColorBegin="#F8FF01" Fill-ColorEnd="#F8FF27" Fill-Type="LinearGradient" Stroke="#F9FF49" StrokeWidth="1.5"></Style>
		</Wijmo:GaugelRange>
		<Wijmo:GaugelRange StartWidth="12" EndWidth="15" StartValue="80" EndValue="100" StartDistance="0.7" EndDistance="0.7">
			<Style Fill-LinearGradientAngle="90" Fill-ColorBegin="#FF9E01" Fill-ColorEnd="#FFB135" Fill-Type="LinearGradient" Stroke="#FFC365" StrokeWidth="1.5"></Style>
		</Wijmo:GaugelRange>
		<Wijmo:GaugelRange StartWidth="15" EndWidth="20" StartValue="100" EndValue="150" StartDistance="0.7" EndDistance="0.7">
			<Style Fill-LinearGradientAngle="180" Fill-ColorBegin="#FF0F03" Fill-ColorEnd="#D40A00" Fill-Type="LinearGradient" Stroke="#FF0F03" StrokeWidth="1.5"></Style>
		</Wijmo:GaugelRange>
	</Ranges>
</Wijmo:C1RadialGauge>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This demo shows how customize the gauge face</p>
</asp:Content>
