<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1Slider.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Slider" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .sliderContainer
        {
        }
        .layout
        {
            float: left;
            margin: 0 10px;
        }
        .layout h6{
            margin-bottom:10px;
        }
        .header2
        {
            margin-bottom: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="sliderContainer ui-helper-clearfix">
        <div class="layout">
            <h6 class="header2">
                Horizontal Slider</h6>
            <wijmo:C1Slider runat="server" ID="C1Slider1" Value="50" Orientation="Horizontal" Width="200px" />
        </div>
        <div class="layout">
            <h6>Vertical Slider</h6>
            <wijmo:C1Slider runat="server" ID="C1Slider2" Value="50" Orientation="Vertical" Height="200px" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1Slider</strong> provides a simple, familiar way for end-users to choose a value in a predefined range.
    </p>
    <p>
        You can control the orientation and apperance of the control via the <strong>Orientation</strong> property.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
