<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Speedometer.aspx.cs" Inherits="ToolkitExplorer.RadialGauge.Speedometer" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gauge"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function face(ui) {
            var set = ui.canvas.set();
            var circle = ui.canvas.circle(ui.origin.x, ui.origin.y, ui.r);
            circle.attr({ "stroke": "#8f8f8f", "stroke-width": 3, fill: "#e2e2e2" });
            set.push(circle);
            var circle2 = ui.canvas.circle(ui.origin.x, ui.origin.y, ui.r - 14);
            circle2.attr({ "stroke": "#717171", "stroke-width": 2, fill: "270-#a6a6a6-#efefef" });
            set.push(circle2);
            return set;
        }
    </script>
    <asp:Panel ID="radialGauge" Height="475" Width="756" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all">
    </asp:Panel>
    <wijmo:C1RadialGaugeExtender runat="server" ID="RadialGaugeExtender1" TargetControlID="radialGauge" Value="90" StartAngle="300" SweepAngle="300">
		<Labels Offset="42">
            <LabelStyle FontSize="15pt" >
                <Fill Color="#000000"></Fill>
			</LabelStyle>
		</Labels>
		<Pointer Length="0.8" Width="4">
            <PointerStyle Stroke="#FFFFFF" StrokeWidth="1.5">
                <Fill Type="LinearGradient" ColorBegin="White" LinearGradientAngle="180"></Fill>
            </PointerStyle>
		</Pointer>
		<Cap>
            <PointerCapStyle Stroke="#555b6b">
                <Fill Type="LinearGradient" ColorBegin="#777D8D" ColorEnd="#555B6B" LinearGradientAngle="270"></Fill>
            </PointerCapStyle>
		</Cap>
		<TickMajor Factor="4" Offset="44" Position="Inside">
            <TickStyle Stroke="#555b6b" StrokeWidth="4">
                <Fill Color="#555B6B"></Fill>
            </TickStyle>
		</TickMajor>
		<TickMinor Visible="true" Offset="44" Interval="2" Position="Inside">
            <TickStyle Stroke="#606779" StrokeWidth="1.5">
                <Fill Color="#606779"></Fill>
            </TickStyle>
		</TickMinor>

<Animation Duration="2000" Easing="EaseOutBack"></Animation>

		<Face Template="face">
		</Face>
		<Ranges>
			<Wijmo:GaugelRange StartWidth="10" EndWidth="10" StartValue="0" EndValue="100" 
				StartDistance="0.64" EndDistance="0.64" Width="0">
                <RangeStyle StrokeWidth="0">
					<Fill Color="#555B6B">
					</Fill>
                </RangeStyle>
			</Wijmo:GaugelRange>
			<Wijmo:GaugelRange EndDistance="0.58" EndValue="60" EndWidth="10" 
				StartDistance="0.58" StartValue="40" StartWidth="10">
                <RangeStyle Stroke="#F9FF49" StrokeWidth="1.5">
					<Fill ColorBegin="#F8FF01" ColorEnd="#F8FF26" LinearGradientAngle="90" 
						Type="LinearGradient">
					</Fill>
                </RangeStyle>
			</Wijmo:GaugelRange>
			<Wijmo:GaugelRange EndDistance="0.58" EndValue="80" EndWidth="10" 
				StartDistance="0.58" StartValue="60" StartWidth="10">
                <RangeStyle Stroke="#FFC365" StrokeWidth="1.5">
					<Fill ColorBegin="#FF9E01" ColorEnd="#FFB135" LinearGradientAngle="90" 
						Type="LinearGradient">
					</Fill>
				</RangeStyle>
			</Wijmo:GaugelRange>
			<Wijmo:GaugelRange EndDistance="0.58" EndValue="100" EndWidth="10" 
				StartDistance="0.58" StartValue="80" StartWidth="10">
                <RangeStyle Stroke="#FF0A03" StrokeWidth="1.5">
					<Fill ColorBegin="#FF0F03" ColorEnd="#D40A00" LinearGradientAngle="180" 
						Type="LinearGradient">
					</Fill>
				</RangeStyle>
			</Wijmo:GaugelRange>
		</Ranges>
    </wijmo:C1RadialGaugeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample use <b>Range</b> and <b>Face</b> property</p>
</asp:Content>
