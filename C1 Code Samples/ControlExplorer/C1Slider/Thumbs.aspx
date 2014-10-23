<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Thumbs.aspx.cs" Inherits="ControlExplorer.C1Slider.Thumbs" %>

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
        Thumbs</h2>
    <wijmo:C1Slider runat="server" ID="C1Slider1" Max="500" Range="false" Min="0" Step="50" Orientation="Horizontal" Values="400,40" Width="300px" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1Slider</strong> supports bounds settings where a user can input two values that indicate the upper and lower bound.</p>
    <p>
        Bound setting is allowed if the <strong>Value</strong> property is set to two bounds - for example, &quot;400,40&quot; - and the <strong>Range</strong> property is set to <strong>False</strong>.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
