<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="RPM.aspx.cs" Inherits="ControlExplorer.C1RadialGauge.RPM" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="Wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script type="text/javascript">
		function face (ui) {
			var set = ui.canvas.set();
			var circle = ui.canvas.circle(ui.origin.x, ui.origin.y, ui.r);
			circle.attr({ "stroke": "#474747", "stroke-width": 3, fill: "#fff" });
			set.push(circle);
			var circle2 = ui.canvas.circle(ui.origin.x, ui.origin.y, 100);
			circle2.attr({ fill: "#060606" });
			set.push(circle2);
			return set;
		}
	</script>
	
	<Wijmo:C1RadialGauge runat="server" ID="Gauge1" Width="500" Height="500" Value="468" Max="1200" StartAngle="270" SweepAngle="240">
		<Labels Offset="-5">
			<LabelStyle FontSize="15pt" FontWeight="800" Fill-Color="#000"></LabelStyle>
		</Labels>
		<Pointer Width="16" Length="0.95">
			<PointerStyle>
				<Fill LinearGradientAngle="340" ColorBegin="#FB7800" ColorEnd="#C00100" Type="LinearGradient"></Fill>
			</PointerStyle>
		</Pointer>
		<Cap>
			<PointerCapStyle>
				<Fill Color="#C00100"></Fill>
			</PointerCapStyle>
		</Cap>
		<TickMajor Factor="8" Offset="0" Interval="100" Position="Inside" >
			<TickStyle Height="4">
				<Fill Color="#333333"></Fill>
			</TickStyle>
		</TickMajor>
		<TickMinor Factor="3" Visible="true" Offset="10" Interval="25" Position="Inside">
			<TickStyle Height="1">
				<Fill Color="#333333"></Fill>
			</TickStyle>
		</TickMinor>
		<Face Template="face"></Face>
		<Ranges>
			<Wijmo:GaugelRange StartWidth="73" EndWidth="73" StartValue="1000" EndValue="1200" StartDistance="0.575" EndDistance="0.575">
				<RangeStyle>
					<Fill LinearGradientAngle="40" ColorBegin="#FB7800" ColorEnd="#C00100" Type="LinearGradient"></Fill>
				</RangeStyle>
			</Wijmo:GaugelRange>
			<Wijmo:GaugelRange StartWidth="10" EndWidth="1" StartValue="625" EndValue="1175" StartDistance="0.75" EndDistance="0.8">
				<RangeStyle>
					<Fill Color="#333333"></Fill>
				</RangeStyle>
			</Wijmo:GaugelRange>
		</Ranges>
	</Wijmo:C1RadialGauge>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample uses the <b>Face</b>'s <b>Template</b> and <b>Range</b> properties to customize the appearance of the gauge.</p>
</asp:Content>
