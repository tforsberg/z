<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Temperature.aspx.cs" Inherits="ControlExplorer.C1LinearGauge.Temperature" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="Wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div style="margin-left:200px;">
                <Wijmo:C1LinearGauge runat="server" ID="Gauge1" Width="50" Height="400"
                    Orientation="Vertical" Value="65" XAxisLength="0.95" XAxisLocation="0.02">
                    <Labels Visible="true">
                        <LabelStyle FontSize="10pt" FontWeight="300">
                            <Fill Color="#1E395B"></Fill>
                        </LabelStyle>
                    </Labels>
                    <TickMajor Factor="2" Position="Inside" Offset="-12">
                        <TickStyle Width="0" Opacity="0.2">
                            <Fill Color="#000000"></Fill>
                        </TickStyle>
                    </TickMajor>
                    <TickMinor Position="Inside" Visible="true" Offset="-12">
                        <TickStyle Opacity="0.2">
                            <Fill Color="#000000"></Fill>
                        </TickStyle>
                    </TickMinor>
                    <Pointer Shape="Tri" Width="4" Visible="true" Length="0.5">
                        <PointerStyle Opacity="0.8" Stroke="#434343" StrokeWidth="0.5">
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
                        <Wijmo:GaugelRange StartValue="0" EndValue="50" StartDistance="0.75" EndDistance="0.75" StartWidth="0.15" EndWidth="0.15">
                            <RangeStyle StrokeWidth="0">
                                <Fill Type="LinearGradient" ColorBegin="#CC00CC" ColorEnd="#AA00AA" LinearGradientAngle="180"></Fill>
                            </RangeStyle>
                        </Wijmo:GaugelRange>
                    </Ranges>
                </Wijmo:C1LinearGauge>
                <br />
                <asp:Button ID="btnChange" runat="server" Text="Change" Width="70px" OnClick="btnChange_OnClick" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnChange" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>This example displays a linear gauge styled to appear like a thermometer. </p>
</asp:Content>
