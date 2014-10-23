<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="AjaxCallback.aspx.cs" Inherits="ControlExplorer.C1ToolTip.AjaxCallback" %>

<%@ Register Namespace="C1.Web.Wijmo.Controls.C1ToolTip" Assembly="C1.Web.Wijmo.Controls.3" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="targetContainer">
        <ul class="ui-helper-reset ui-widget-header ui-corner-all" style="padding: 1em;">
            <li class="tooltip"><a href="#">Anchor1</a></li>
            <li class="tooltip"><a href="#">Anchor2</a></li>
            <li class="tooltip"><a href="#">Anchor3</a></li>
            <li class="tooltip"><a href="#">Anchor4</a></li>
        </ul>
    </div>
    <wijmo:C1ToolTip runat="server" ID="Tooltip1" TargetSelector="#targetContainer a" EnableCallBackMode="True" OnOnAjaxUpdate="Tooltip1_OnAjaxUpdate">
    </wijmo:C1ToolTip>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample shows how to set tooltip content via AJAX.</p>
    <p>
        The following properties/events are used in this sample.</p>
    <ul>
        <li>EnableCallBackMode</li>
        <li>OnOnAjaxUpdate</li>
    </ul>
    <p>
        This sample sets the <strong>EnableCallBackMode</strong> property to True to enable the callback to populate content. Then the <strong>OnOnAjaxUpdate</strong> event is used to set tooltip's content in server-side code.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
