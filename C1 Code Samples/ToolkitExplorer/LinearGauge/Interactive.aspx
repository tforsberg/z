<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Interactive.aspx.cs" Inherits="ToolkitExplorer.LinearGauge.Interactive" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gauge"
    TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Slider"
    TagPrefix="Wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="linearGauge" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all">
    </asp:Panel>
    <Wijmo:C1LinearGaugeExtender runat="server" ID="LinearGaugeExtender1" Height="100"
        Width="400" TargetControlID="linearGauge" Value="50">
        <Animation Duration="400" />
		<Labels>
            <LabelStyle FontSize="12pt" FontWeight="800">
                <Fill Color="#1E395B"></Fill>
            </LabelStyle>
		</Labels>
		<TickMajor Position="Inside" Offset="-11" Interval="20" Factor="12">
            <TickStyle Width="2">
                <Fill Color="#1E395B"></Fill>
            </TickStyle>
		</TickMajor>
		<TickMinor Position="Inside" Offset="-11" Visible="true" Interval="4" Factor="10"> 
            <TickStyle Width="1">
                <Fill Color="#1E395B"></Fill>
            </TickStyle>
		</TickMinor>
		<Pointer Shape="Tri" Length="0.5">
            <PointerStyle Stroke="#1E395B">
                <Fill Color="#1E395B"></Fill>
            </PointerStyle>
		</Pointer>
		<Face>
            <FaceStyle StrokeWidth="4">
                <Fill LinearGradientAngle="270" ColorBegin="#FFFFFF" ColorEnd="#7BA0CC" Type="LinearGradient"></Fill>
            </FaceStyle>
		</Face>
    </Wijmo:C1LinearGaugeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
 <p>
        Drag and release the slider to change the gauge's value</p>
    <div id="slider" style="width: 400px">
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#slider").slider({
                value: $("#<%= linearGauge.ClientID %>").wijlineargauge("option", "value"),
                change: function (event, ui) {
                    $("#<%= linearGauge.ClientID %>").wijlineargauge("option", "value", ui.value);
                }
            });
        });	

    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample use an jquery ui slider and C1RadialGaugeExtender to show the interactive between them.</p>
</asp:Content>
