<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Logarithmic.aspx.cs" Inherits="ControlExplorer.C1LinearGauge.Logarithmic" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="Wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <Wijmo:C1LinearGauge runat="server" ID="Gauge1" Value="50" Height="60px"
        Width="400px">
        <Labels>
            <LabelStyle FontSize="12pt" FontWeight="800">
                <Fill Color="#1E395B"></Fill>
            </LabelStyle>
        </Labels>
        <Pointer Shape="Rect" Length="0.5">
            <PointerStyle Stroke="#1E395B">
                <Fill Color="#1E395B"></Fill>
            </PointerStyle>
        </Pointer>
        <TickMajor Position="Inside" Factor="2" Interval="20">
            <TickStyle StrokeWidth="0">
                <Fill Color="#1E395B"></Fill>
            </TickStyle>
        </TickMajor>
        <TickMinor Visible="true" Interval="4" Position="Inside">
            <TickStyle StrokeWidth="0">
                <Fill Color="#1E395B"></Fill>
            </TickStyle>
        </TickMinor>

        <Animation Duration="2000" Easing="EaseOutBack"></Animation>
        <Face>
            <FaceStyle Stroke="#7BA0CC" StrokeWidth="4">
                <Fill ColorBegin="White" ColorEnd="#D9E3F0" LinearGradientAngle="270"
                    Type="LinearGradient">
                </Fill>
            </FaceStyle>
        </Face>
    </Wijmo:C1LinearGauge>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <asp:CheckBox ID="ckxLogarithmic" runat="server" Text="Islogarithmic" AutoPostBack="true" OnCheckedChanged="ckxLogarithmic_CheckedChanged" />
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>This sample shows how to create non-uniform tick marks with the <b>Islogarithmic</b> and <b>LogarithmicBase</b> properties.</p>
</asp:Content>
