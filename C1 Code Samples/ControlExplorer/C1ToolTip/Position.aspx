<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Position.aspx.cs" Inherits="ControlExplorer.C1ToolTip.Position" %>

<%@ Register Namespace="C1.Web.Wijmo.Controls.C1ToolTip" Assembly="C1.Web.Wijmo.Controls.3" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
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
        This sample illustrates how to use the <strong>position</strong> option to change where the tooltip appears.
    </p>
    <p>
        The server-side <strong>Position</strong> property is used in this sample to change the position of the tooltip.
    </p>
    <p>
        Selecting a position in the drop-down list and clicking the <strong>apply</strong> button, then hover the link to see the position of the tooltip.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li>
                            <label>My:</label>
                            <asp:DropDownList ID="myLeft" runat="server">
                                <asp:ListItem>Left</asp:ListItem>
                                <asp:ListItem>Center</asp:ListItem>
                                <asp:ListItem>Right</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li>
                            <asp:DropDownList ID="myTop" runat="server">
                                <asp:ListItem>Top</asp:ListItem>
                                <asp:ListItem>Center</asp:ListItem>
                                <asp:ListItem>Bottom</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li>
                            <label>At:</label>
                            <asp:DropDownList ID="atLeft" runat="server">
                                <asp:ListItem>Left</asp:ListItem>
                                <asp:ListItem>Center</asp:ListItem>
                                <asp:ListItem>Right</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li>
                            <asp:DropDownList ID="atTop" runat="server">
                                <asp:ListItem>Top</asp:ListItem>
                                <asp:ListItem>Center</asp:ListItem>
                                <asp:ListItem>Bottom</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                    </ul>
                </div>
                <div class="settingcontrol">
                    <asp:Button ID="apply" runat="server" Text="Apply" OnClick="apply_Click" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
