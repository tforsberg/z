<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="HalfCircle.aspx.cs" Inherits="ControlExplorer.C1RadialGauge.HalfCircle" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="Wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript">

	function sector(cx, cy, r, startAngle, endAngle, params) {
		var x1 = cx + r * Math.cos(-startAngle * rad),
				x2 = cx + r * Math.cos(-endAngle * rad),
				y1 = cy + r * Math.sin(-startAngle * rad),
				y2 = cy + r * Math.sin(-endAngle * rad);
		return paper.path(["M", cx, cy, "L", x1, y1, "A", r, r, 0, +(endAngle - startAngle > 180), 0, x2, y2, "z"]).attr(params);
	}

	function face (ui) {
		var a = ui.canvas.path($.wijraphael.sector(ui.origin.x, ui.origin.y, ui.r, 0, 180)),
                        b = ui.canvas.path($.wijraphael.sector(ui.origin.x, ui.origin.y, ui.r / 6, 180, 0)),
                        style = {
                        	fill: "#E0E8EF",
                        	stroke: "#E0E8EF"
                        };
		a.attr(style);
		b.attr(style);
		//return ui.canvas.image(url, ui.origin.x - ui.r, ui.origin.y - ui.r, ui.r * 2, ui.r * 2);
	}
</script>
<Wijmo:C1RadialGauge runat="server" ID="Gauge1" Value="100" StartAngle="10" SweepAngle="160" Max="100" 
Radius="190" >
	<Labels Offset="35">
		<LabelStyle FontSize="12pt" FontWeight="800">
			<Fill Color="#1E395B"></Fill>
		</LabelStyle>
	</Labels>
	<TickMajor Position="Center" Interval="25" Visible="true" Factor="3"
		Offset="30">
			<TickStyle Stroke="#1E395B" Height="2" Width="20">
				<Fill Color="#1E395B"></Fill>
			</TickStyle>
	</TickMajor>
	<TickMinor Position="Inside" Interval="5" Visible="true" Offset="30">
		<TickStyle Stroke="#1E395B" Height="1" Width="10">
			<Fill Color="#1E395B"></Fill>
		</TickStyle>
	</TickMinor>
	<Ranges>
		<Wijmo:GaugelRange StartWidth="2" EndWidth="5" StartValue="0" EndValue="10" StartDistance="0.6" EndDistance="0.58">
			<RangeStyle Stroke="#7BA0CC" StrokeWidth="0">
				<Fill Color="#7BA0CC">
				</Fill>				
			</RangeStyle>
		</Wijmo:GaugelRange>
		<Wijmo:GaugelRange StartWidth="5" EndWidth="20" StartValue="10" EndValue="125" StartDistance="0.58" EndDistance="0.54">
			<RangeStyle Stroke="#FFFFFF" StrokeWidth="0">
				<Fill ColorBegin="#B4D5F0" ColorEnd="#B4D5F0" 
					Type="LinearGradient">
				</Fill>				
			</RangeStyle>
		</Wijmo:GaugelRange>
		<Wijmo:GaugelRange StartWidth="20" EndWidth="25" StartValue="125" EndValue="150" StartDistance="0.54" EndDistance="0.5">
			<RangeStyle Stroke="#7BA0CC" StrokeWidth="0">				
				<Fill Color="#7BA0CC" >
				</Fill>				
			</RangeStyle>
		</Wijmo:GaugelRange>
	</Ranges>

<Animation Duration="2000" Easing="EaseOutBack"></Animation>

	<Face Template="face"></Face>
	<Pointer Length="0.8">
		<PointerStyle Stroke="#BF551C">
			<Fill Color="#BF551C"></Fill>            
		</PointerStyle>
	</Pointer>
	<Cap>
		<PointerCapStyle Stroke="#7F9CAD">
			<Fill Color="#7F9CAD"></Fill>        
		</PointerCapStyle>
	</Cap>
</Wijmo:C1RadialGauge>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample demonstrates how to use the <b>Face</b> and <b>Range</b> properties to create a half circle-shaped interactive C1RadialGauge control.</p>
</asp:Content>
