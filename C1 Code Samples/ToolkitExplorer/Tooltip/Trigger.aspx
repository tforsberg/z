<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Trigger.aspx.cs" Inherits="ControlExplorer.Tooltip.Trigger" %>

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
        This sample demonstrates how to show the tooltip triggered by different events. The default behavior uses hover to trigger the tooltip.</p>
    <p>
        The following properties are used in this sample to change the trigger event of the tooltip.</p>
    <ul>
        <li><strong>CloseBehavior</strong> at server side</li>
        <li><strong>triggers</strong> at client side</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <%--    <label>
        Trigger</label>
    <asp:DropDownList ID="ddlTrigger" runat="server" AutoPostBack="True" 
        onselectedindexchanged="ddlTrigger_SelectedIndexChanged">
        <asp:ListItem Text="hover" Value="hover"></asp:ListItem>
        <asp:ListItem Text="click" Value="click"></asp:ListItem>
        <asp:ListItem Text="focus" Value="focus"></asp:ListItem>
        <asp:ListItem Text="rightClick" Value="rightClick"></asp:ListItem>
        <asp:ListItem Text="custom" Value="custom"></asp:ListItem>
    </asp:DropDownList>--%>
    <label>
        Trigger</label>
    <select id="trigger">
        <option value="hover">hover</option>
        <option value="click">click</option>
        <option value="focus">focus</option>
        <option value="rightClick">rightClick</option>
        <option value="custom">custom</option>
    </select>
    <div>
        <input id="show" type="button" value="Show tooltip when set 'trigger' to custom" /></div>
    <script id="scriptInit" type="text/javascript">
        $(document).ready(function () {
            $("#trigger").change(function () {
                $("#<%=HyperLink1.ClientID %>").wijtooltip("option", "triggers", $("#trigger").val());
            });
            $("#show").click(function () {
                $("#<%=HyperLink1.ClientID %>").wijtooltip("show");
            });
        });        
      
    </script>
</asp:Content>
