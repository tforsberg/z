<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1LinearGauge.Overview" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="Wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<Wijmo:C1LinearGauge runat="server" ID="Gauge" Value="50" Width="400px" 
		Height="100px">
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
		</Wijmo:C1LinearGauge>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This demo shows how to use <strong>C1LinearGauge</strong> to create a linear gauge on a webpage.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
