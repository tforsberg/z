<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CalloutFilled.aspx.cs" Inherits="ControlExplorer.C1ToolTip.CalloutFilled" %>

<%@ Register Namespace="C1.Web.Wijmo.Controls.C1ToolTip" Assembly="C1.Web.Wijmo.Controls.3" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .link
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server" >
    <h3 class="ui-helper-reset ui-widget-header ui-corner-all" style="padding: 1em;">
        <asp:HyperLink runat="server" ID="HyperLink1" ToolTip="tooltip" CssClass="link ui-widget ui-corner-all">Anchor</asp:HyperLink>
    </h3>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <wijmo:C1ToolTip runat="server" ID="Tooltip1" CalloutFilled="False" TargetSelector="#HyperLink1">
            </wijmo:C1ToolTip>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1Tooltip</strong> supports showing a solid box for the callout.</p>
    <p>
        The <strong>CalloutFilled</strong> server-side property is used in this samples.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li>
                            <asp:CheckBox ID="calloutFilled" runat="server" Text="CalloutFilled" AutoPostBack="true" OnCheckedChanged="calloutFilled_CheckedChanged" />
                        </li>
                    </ul>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
