<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Closebehavior.aspx.cs" Inherits="ControlExplorer.Tooltip.Closebehavior" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Tooltip"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<style type="text/css">
	#content a
	{
	    color:#000000;
	    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" ToolTip="tooltip">Anchor</asp:HyperLink>
    <wijmo:C1TooltipExtender ID="TooltipExtender1" runat="server" TargetControlID="HyperLink1">
    </wijmo:C1TooltipExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates different close behavior options.</p>
    <p>
        The <strong>closeBehavior</strong> client-side property is used in this sample.
    </p>
    <p>
        The property has three options:</p>
    <ul>
        <li><strong>auto</strong> - indicates that the tooltip will be closed after mouse out of the target.</li>
        <li><strong>none</strong> - indicates that the tooltip will never be closed unless done so with code.</li>
        <li><strong>sticky</strong> - indicates that the tooltip will never be closed after mouse out of the target except clicking the close button or writing code to close it.</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <%--<label>
        Close Behavior</label>
    <asp:DropDownList ID="ddlCloseBehavior" runat="server" AutoPostBack="true" 
        onselectedindexchanged="ddlCloseBehavior_SelectedIndexChanged">
        <asp:ListItem Text="auto" Value="auto"></asp:ListItem>
        <asp:ListItem Text="none" Value="none"></asp:ListItem>
        <asp:ListItem Text="sticky" Value="sticky"></asp:ListItem>
    </asp:DropDownList>--%>
    <label>
        Close Behavior</label>
    <select id="closeBehavior">
        <option value="auto" selected="selected">auto</option>
        <option value="none">none</option>
        <option value="sticky">sticky</option>
    </select>
    <script id="scriptInit" type="text/javascript">
        $(document).ready(function () {
            $("#closeBehavior").change(function () {
                $("#<%=HyperLink1.ClientID %>").wijtooltip("option", "closeBehavior", $("#closeBehavior").val());
            });

        });       
    </script>
</asp:Content>
