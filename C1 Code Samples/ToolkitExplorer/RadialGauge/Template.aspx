<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Template.aspx.cs" Inherits="ToolkitExplorer.RadialGauge.Template" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gauge"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function face(ui) {
            var url = "gaugeFace.PNG";
            return ui.canvas.image(url, ui.origin.x - ui.r, ui.origin.y - ui.r, ui.r * 2, ui.r * 2);
        }

        function pointer(startLocation, pointerInfo) {
            return dawnArrow(this, startLocation, pointerInfo);
        }

        function dawnArrow(canvas, startLocation, pointerInfo) {
            var x = startLocation.x, arrow,
                y = startLocation.y,
                height = pointerInfo.width,
                width = pointerInfo.length,
                x1 = x,
			    y1 = y + height / 2,
                x2 = x + 15,
                y2 = y - 10,
                x3 = x + 15,
                y3 = y,
			    x4 = x + width,
			    y4 = y,
			    x5 = x + width,
			    y5 = y + height,
                x6 = x + 15,
                y6 = y + height,
                x7 = x + 15,
                y7 = y + height + 10,
			    arrPath = ["M", x1, y1, "L", x2, y2, "L", x3, y3, "L", x4, y4, "L", x5, y5, "L", x6, y6, "L", x7, y7, "z"];
            arrow = canvas.path(arrPath.concat(" "));
            arrow.attr({
                fill: "#6DC5D8",
                stroke: "#6DC5D8"
            });
            return arrow;
        }
    </script>
    <asp:Panel ID="radialGauge" Height="475" Width="756" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all">
    </asp:Panel>
    <wijmo:C1RadialGaugeExtender runat="server" ID="RadialGaugeExtender1" TargetControlID="radialGauge"
        Value="100" Max="150" StartAngle="-45" SweepAngle="270">
        <Labels Offset="-30">
        <LabelStyle Stroke="#556A7C">
            <Fill Color="#556A7C"></Fill>
        </LabelStyle>
	</Labels>
	<TickMinor Position="Inside" Interval="2" Visible="true" Offset="0">
        <TickStyle Stroke="#556A7C">
            <Fill Color="#556A7C"></Fill>
        </TickStyle>
	</TickMinor>
	<TickMajor Position="Center" Interval="10" Visible="true">
        <TickStyle Stroke="#556A7C">
            <Fill Color="#556A7C"></Fill>
        </TickStyle>
	</TickMajor>
	<Ranges>
		<Wijmo:GaugelRange StartWidth="15" EndWidth="20" StartValue="20" EndValue="50" StartDistance="1" EndDistance="1">
            <RangeStyle Stroke="#BC8A8E">
                <Fill Color="#BC8A8E"></Fill>
            </RangeStyle>
		</Wijmo:GaugelRange>
		<Wijmo:GaugelRange StartWidth="25" EndWidth="30" StartValue="100" EndValue="130" StartDistance="0.95" EndDistance="0.95">
            <RangeStyle Stroke="#58A85E">
                <Fill Color="#58A85E"></Fill>
            </RangeStyle>
		</Wijmo:GaugelRange>
	</Ranges>
	<Face Template="face"></Face>
	<Pointer Template="pointer">
        <PointerStyle Stroke="#BF551C">
            <Fill Color="#BF551C"></Fill>
        </PointerStyle>
	</Pointer>
	<Cap BehindPointer="false">
        <PointerCapStyle Stroke="#6DC5D8">
            <Fill Color="#6DC5D8"></Fill>
        </PointerCapStyle>
	</Cap>
    </wijmo:C1RadialGaugeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to use <b>Template</b> property.</p>
</asp:Content>
