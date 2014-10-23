<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CloseBehavior.aspx.cs" Inherits="ControlExplorer.C1ToolTip.CloseBehavior" %>

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
    <h3 class="ui-helper-reset ui-widget-header ui-corner-all" style="padding: 1em;">
        <asp:HyperLink ID="HyperLink1" runat="server" ToolTip="tooltip" CssClass="link ui-widget ui-corner-all">Anchor</asp:HyperLink>
    </h3>

            <wijmo:C1ToolTip runat="server" ID="Tooltip1" TargetSelector="#HyperLink1">
            </wijmo:C1ToolTip>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates different close behavior options.
    </p>
    <p>
        The <strong>CloseBehavior</strong> client-side property is used in this sample.
    </p>
    <p>
        The property has three options:
    </p>
    <ul>
        <li><strong>auto</strong> - indicates that the tooltip will be closed after mouse out of the target.</li>
        <li><strong>none</strong> - indicates that the tooltip will never be closed unless done so with code.</li>
        <li><strong>sticky</strong> - indicates that the tooltip will never be closed after mouse out of the target except clicking the close button or writing code to close it.</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <label>Close Behavior:</label>
                    <asp:DropDownList ID="closeBehavior" runat="server">
                        <asp:ListItem Selected="True" Text ="Auto" Value="auto"></asp:ListItem>
                        <asp:ListItem Text ="None" Value="none"></asp:ListItem>
                        <asp:ListItem Text ="Sticky" Value="sticky"></asp:ListItem>
                    </asp:DropDownList>
                </li>
            </ul>
        </div>
    </div>        
    <script id="scriptInit" type="text/javascript">
        $(document).ready(function () {
            $("#<%=closeBehavior.ClientID %>").change(function () {
                $("#<%=HyperLink1.ClientID %>").c1tooltip("option", "closeBehavior", $("#<%=closeBehavior.ClientID %>").val());
            });

        });
    </script>
</asp:Content>
