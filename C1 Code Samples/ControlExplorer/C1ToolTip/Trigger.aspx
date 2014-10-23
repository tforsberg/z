<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Trigger.aspx.cs" Inherits="ControlExplorer.C1ToolTip.Trigger" %>

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
            <wijmo:C1ToolTip runat="server" ID="Tooltip1" TargetSelector="#HyperLink1" CloseBehavior="Sticky">
            </wijmo:C1ToolTip>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how to show the tooltip triggered by different events. The default behavior uses hover to trigger the tooltip.</p>
    <p>
        The following properties are used in this sample to change the trigger event of the tooltip.</p>
    <ul>
        <li><strong>CloseBehavior</strong> at server side</li>
        <li><strong>Triggers</strong> at server side</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li>
                            <label>Trigger:</label>
                            <asp:DropDownList ID="trigger" runat="server" AutoPostBack="true" OnSelectedIndexChanged="trigger_SelectedIndexChanged">
                                <asp:ListItem Selected="True">Hover</asp:ListItem>
                                <asp:ListItem>Click</asp:ListItem>
                                <asp:ListItem>Focus</asp:ListItem>
                                <asp:ListItem>RightClick</asp:ListItem>
                                <asp:ListItem>Custom</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                    </ul>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
