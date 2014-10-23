<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Range.aspx.cs" Inherits="ControlExplorer.C1Slider.Range" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Slider" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .header2
        {
            margin-bottom: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="header2">
        Range</h2>
    <wijmo:C1Slider runat="server" ID="C1Slider1" DragFill="false" Max="500" Range="true" Min="0" Step="2" Orientation="Horizontal" Values="100,400" Width="300px" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1Slider</strong> supports capturing a range of values with two drag handles.</p>
    <p>
        A range with two drag handles is allowed if the following properties are set to corresponding values:
    </p>
    <ul>
        <li>Range: true</li>
        <li>Values</li>
    </ul>
    <p>
        The space between the handles is filled with a different background color to indicate those values are selected.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
