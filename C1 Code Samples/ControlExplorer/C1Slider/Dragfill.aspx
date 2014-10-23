<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Dragfill.aspx.cs" Inherits="ControlExplorer.C1Slider.Dragfill" %>

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
        Dragfill</h2>
    <wijmo:C1Slider runat="server" ID="C1Slider" DragFill="true" Max="500" Height="100px" Range="true" Min="0" Step="2" Orientation="Horizontal" Values="100,400" Width="300px" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1Slider</strong> supports dragging the fill line between the two drag handles.</p>
    <p>
        Fill dragging is allowed if the following properties are set to corresponding values:</p>
    <ul>
        <li>Range: true</li>
        <li>DragFill: true</li>
        <li>Values *</li>
    </ul>
    <p>
        *The <strong>Values</strong> property is used to specify multiple handles when the <strong>Range</strong> property is set to True.</p>
    <p>
        The end-user can drag the range area, and the space between the handles will fill with a different background color to indicate those values are selected.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
