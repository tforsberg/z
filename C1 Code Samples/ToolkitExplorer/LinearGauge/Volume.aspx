<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Volume.aspx.cs" Inherits="ToolkitExplorer.LinearGauge.Volume" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gauge"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<style type="text/css">
.gauge
{
    float:left;
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <asp:Panel ID="linearGauge" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all gauge">
    </asp:Panel>
    <Wijmo:C1LinearGaugeExtender runat="server" ID="LinearGaugeExtender1" Width="40" Height="400" 
		TargetControlID="linearGauge" Value="50" 
		Orientation="Vertical" XAxisLength="1" XAxisLocation="0.01">
		<TickMajor Factor="2" Visible="True" Offset="0" Interval="50">
    <TickStyle Opacity="0.4" StrokeWidth="0">
        <Fill Color="#000000">
		</Fill>
    </TickStyle>
</TickMajor>

<TickMinor Visible="False" Offset="0" Interval="5"></TickMinor>

<Pointer Length="0.5" Width="4" Offset="0">
</Pointer>

		<Labels Visible="False">
		</Labels>

<Animation Duration="2000" Easing="EaseOutBack" Enabled="False"></Animation>
		<Face>
            <FaceStyle StrokeWidth="0" Width="0"></FaceStyle>
		</Face>
		<Ranges>
			<Wijmo:GaugelRange EndDistance="0.8" EndValue="60" EndWidth="0.5" 
				StartDistance="0.8" StartValue="0" StartWidth="0">
                    <RangeStyle StrokeWidth="0">
                        <Fill ColorBegin="#0FFF03" ColorEnd="#0AD400" LinearGradientAngle="90" 
						Type="LinearGradient">
					</Fill>
                    </RangeStyle>
			</Wijmo:GaugelRange>
			<Wijmo:GaugelRange EndDistance="0.8" EndValue="85" EndWidth="0.6" 
				StartDistance="0.8" StartValue="60" StartWidth="0.5">
                    <RangeStyle StrokeWidth="0">
                        <Fill ColorBegin="#F8FF01" ColorEnd="#F8FF27" LinearGradientAngle="90" 
						Type="LinearGradient">
					</Fill>
                    </RangeStyle>
			</Wijmo:GaugelRange>
			<Wijmo:GaugelRange EndDistance="0.8" EndValue="100" EndWidth="0.7" 
				StartDistance="0.8" StartValue="85" StartWidth="0.6">
                    <RangeStyle StrokeWidth="0">                        
					    <Fill ColorBegin="#FF0F03" ColorEnd="#D40A00" LinearGradientAngle="90" 
						    Type="LinearGradient">
					    </Fill>
                    </RangeStyle>
			</Wijmo:GaugelRange>
		</Ranges>
	</Wijmo:C1LinearGaugeExtender>
	<div id="slider" style="height: 390px; float: left"></div>
</div>
		<script type="text/javascript">
			$(document).ready(function () {
				var gaugeEle = $("#<%= linearGauge.ClientID %>");
				$("#slider").slider({
					orientation: "vertical",
					value: gaugeEle.wijlineargauge("option", "value"),
					change: function (event, ui) {
						gaugeEle.wijlineargauge("option", "value", ui.value);
					}
				});
			});
		</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample use an jquery ui slider and C1RadialGauge to show the interactive between them.</p>
</asp:Content>
