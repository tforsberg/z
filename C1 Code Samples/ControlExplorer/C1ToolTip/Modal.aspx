<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Modal.aspx.cs" Inherits="ControlExplorer.C1ToolTip.Modal" %>

<%@ Register Namespace="C1.Web.Wijmo.Controls.C1ToolTip" Assembly="C1.Web.Wijmo.Controls.3" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .link
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <h3 class="ui-helper-reset ui-widget-header ui-corner-all" style="padding: 1em;">
                <asp:HyperLink runat="server" ID="HyperLink1" ToolTip="tooltip" CssClass="link ui-widget ui-corner-all">Anchor</asp:HyperLink>
            </h3>

            <wijmo:C1ToolTip runat="server" ID="Tooltip1" TargetSelector="#HyperLink1" CloseBehavior="Sticky" Modal="true">
            </wijmo:C1ToolTip>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how to create a modal tooltip. The modal tooltip must be closed to continue using the page.</p>
    <p>
        The <strong>Modal</strong> property is used in this sample to make a modal tooltip.</p>
    <p>
        When the <strong>Modal</strong> checkbox is checked, hovering over "Hover on the element" causes a modal tooltip to appear.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li>
                            <asp:CheckBox ID="modal" runat="server" Text="Modal" Checked="true" AutoPostBack="true" OnCheckedChanged="modal_CheckedChanged" />
                        </li>
                    </ul>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
