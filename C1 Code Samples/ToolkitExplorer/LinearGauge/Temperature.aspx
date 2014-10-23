<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Temperature.aspx.cs" Inherits="ToolkitExplorer.LinearGauge.Temperature" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gauge"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Temperature Gauge</h2>
    <asp:Panel ID="linearGauge" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all">
    </asp:Panel>
    <wijmo:C1LinearGaugeExtender runat="server" TargetControlID="linearGauge" ID="LinearGaugeExtender1" Width="40" Height="400" Orientation="Vertical" 
	Value="50" XAxisLength="0.95" XAxisLocation="0.02">
        <Labels Visible="False">
        <LabelStyle FontSize="10pt" FontWeight="800">
            <Fill Color="#5A5A5A"></Fill>
        </LabelStyle>
	</Labels>
	<TickMajor Factor="2">
        <TickStyle Width="0" Opacity="0.2">
            <Fill Color="#000000"></Fill>
        </TickStyle>
	</TickMajor>
	<TickMinor Position="Center" Visible="true" Interval="5">
        <TickStyle Opacity="0.2">
            <Fill Color="#000000"></Fill>
        </TickStyle>
	</TickMinor>
	<Pointer Shape="Tri" Width="4">
        <PointerStyle Opacity="0.8">
            <Fill Color="#000000"></Fill>
        </PointerStyle>
	</Pointer>
<Animation Duration="2000" Easing="EaseOutBack" Enabled="False"></Animation>
	<Face>
        <FaceStyle>
            <Fill Type="LinearGradient" ColorBegin="#DEDEDE" ColorEnd="#CDCDCD" LinearGradientAngle="180"></Fill>
        </FaceStyle>
	</Face>
	<Ranges>
		<Wijmo:GaugelRange StartValue="0" EndValue="50" StartDistance="0.9" EndDistance="0.9" StartWidth="0.85" EndWidth="0.85">
            <RangeStyle StrokeWidth="0">
                <Fill Type="LinearGradient" ColorBegin="#CC00CC" ColorEnd="#AA00AA" LinearGradientAngle="180"></Fill>
            </RangeStyle>
		</Wijmo:GaugelRange>
	</Ranges>
		<Animation Enabled="false" />
    </wijmo:C1LinearGaugeExtender>
 <button id="btn" type="button">
				Change</button>
<script type="text/javascript">
	$(document).ready(function () {
		var gaugeEle = $("#<%= linearGauge.ClientID %>"),
			state = 0;
		// the jQuery 1.9 remove the old toggle method and add toggle effect.
		$("#btn").button().click(function () {
			if (state === 0) {
				gaugeEle.wijlineargauge("option", "ranges", [
				{
					startValue: 0,
					endValue: 100,
					startDistance: 0.9,
					endDistance: 0.9,
					startWidth: 0.85,
					endWidth: 0.85,
					style: {
						fill: "180-#FF0000-#CC0000",
						stroke: "none"
					}
				}
				]).wijlineargauge("redraw");
				state = 1;
			}
			else {
				gaugeEle.wijlineargauge("option", "ranges", [
				{
					startValue: 0,
					endValue: 10,
					startDistance: 0.9,
					endDistance: 0.9,
					startWidth: 0.85,
					endWidth: 0.85,
					style: {
						fill: "180-#0099FF-#0066CC",
						stroke: "none"
					}
				}
				]).wijlineargauge("redraw");
				state = 0;
			}
		})
	});
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This demo shows how to use C1LinearGauge create an linear gauge on webpage.</p>
</asp:Content>
