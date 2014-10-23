<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Level.aspx.cs" Inherits="ControlExplorer.C1LinearGauge.Level" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="Wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
 <style type="text/css">
        .wijmo-wijlineargauge svg, .wijmo-wijlineargauge vml 
        {
            background: #000;
            border-radius: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<Wijmo:C1LinearGauge runat="server" ID="Gauge1" Width="400" Height="50" Value="50">
<TickMajor Position="Center" Factor="3">
<TickStyle>
    <Fill Color="#efefef"></Fill>
</TickStyle>
</TickMajor>
<TickMinor Position="Center" Visible="true">
    <TickStyle>
        <Fill Color="#efefef"></Fill>
    </TickStyle>
</TickMinor>
<Pointer Length="1" Width="20" Shape="Tri">
    <PointerStyle Stroke="#FB7800" Opacity="0.8">
        <Fill LinearGradientAngle="180" ColorBegin="#FB7800" ColorEnd="#C00100" Type="LinearGradient"></Fill>
    </PointerStyle>
</Pointer>

<Animation Duration="2000" Easing="EaseOutBack"></Animation>
	<Face>
        <FaceStyle StrokeWidth="0" Stroke="Black">
            <Fill Color="Black"></Fill>
        </FaceStyle>
	</Face>
</Wijmo:C1LinearGauge>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample use <b>TickMarker</b>, <b>TickMinor</b> and <b>Pointer</b> properties to customize how the linear gauge looks.</p>
</asp:Content>
