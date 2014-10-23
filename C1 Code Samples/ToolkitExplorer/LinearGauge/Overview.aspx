<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Overview.aspx.cs" Inherits="ToolkitExplorer.LinearGauge.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gauge"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="linearGauge" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all">
    </asp:Panel>
    <wijmo:C1LinearGaugeExtender runat="server" ID="LinearGaugeExtender1" Height="100" Width="400"  TargetControlID="linearGauge"
        Value="50">
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
		<TickMinor Position="Inside" Visible="true" Offset="-11" Interval="4" Factor="10">
            <TickStyle Width="1">
                <Fill Color="#1E395B"></Fill>
            </TickStyle>
		</TickMinor>
		<Pointer Length="0.5" Shape="Rect">
            <PointerStyle Stroke="#1E395B">
                <Fill Color="#1E395B"></Fill>
            </PointerStyle>
		</Pointer>
		<Face>
            <FaceStyle Stroke="#7BA0CC" StrokeWidth="4">
                <Fill LinearGradientAngle="270" ColorBegin="#FFFFFF" ColorEnd="#D9E3F0" Type="LinearGradient"></Fill>
            </FaceStyle>
		</Face>
		<Ranges>
		<Wijmo:GaugelRange StartValue="20" EndValue="80" StartDistance="0.85" EndDistance="0.85" StartWidth="0.5" EndWidth="0.5">
            <RangeStyle>
                <Fill LinearGradientAngle="90" ColorBegin="#3DA1D8" ColorEnd="#3A6CAC" Type="LinearGradient"></Fill>
            </RangeStyle>
		</Wijmo:GaugelRange>
		</Ranges>
    </wijmo:C1LinearGaugeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This demo shows how to use C1LinearGauge create an linear gauge on webpage.</p>
</asp:Content>
