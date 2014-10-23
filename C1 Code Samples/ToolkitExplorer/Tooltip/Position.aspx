<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Position.aspx.cs" Inherits="ControlExplorer.Tooltip.Position" %>

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
    <asp:HyperLink ID="HyperLink1" Style="position:absolute; left: 600px; top: 300px;
        color: red; font-weight: bolder;" runat="server" ToolTip="tooltip">tooltip</asp:HyperLink>
    <wijmo:C1TooltipExtender ID="TooltipExtender1" runat="server" CloseBehavior="Sticky"
        TargetControlID="HyperLink1">
    </wijmo:C1TooltipExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how to use the <strong>position</strong> option to change where the tooltip appears.</p>
    <p>
        The client-side <strong>position</strong> property is used in this sample to change the position of the tooltip.</p>
    <p>
        Selecting a position in the drop-down list and clicking the <strong>apply</strong> button, then hover the link to see the position of the tooltip.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<%--    <div style="height: 70px">
        <div style="width: 180px; float: left;">
            <span style="padding-right: 10px;">my:</span>
            <asp:DropDownList ID="my1" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="my2" runat="server">
            </asp:DropDownList>
            <br />
            <span style="padding-right: 14px;">at:</span>
            <asp:DropDownList ID="at1" runat="server">
            </asp:DropDownList>
            <asp:DropDownList ID="at2" runat="server">
            </asp:DropDownList>
        </div>
    </div>
    <div>
        <asp:Button ID="btnApply" runat="server" Text="Apply" OnClick="btnApply_Click" /></div>--%>
 <div style="height: 70px">
        <div style="width: 180px; float: left;">
            <span style="padding-right: 10px;">my:</span><select id="my1">
                <option value="left">left</option>
                <option value="center">center</option>
                <option value="right">right</option>
            </select>
            <select id="my2">
                <option value="top">top</option>
                <option value="center">center</option>
                <option value="bottom" selected="selected">bottom</option>
            </select>
            <br />
            <span style="padding-right: 14px;">at:</span><select id="at1">
                <option value="left">left</option>
                <option value="center">center</option>
                <option value="right" selected="selected">right</option>
            </select>
            <select id="at2">
                <option value="top">top</option>
                <option value="center">center</option>
                <option value="bottom">bottom</option>
            </select>
        </div>
    </div>
    <input type="button" onclick="applyPosition();" value="apply" />
    <script id="scriptInit" type="text/javascript">
        function applyPosition() {
            $("#<%=HyperLink1.ClientID %>").wijtooltip("option", "position", { my: $("#my1").val() + " " + $("#my2").val(), at: $("#at1").val() + " " + $("#at2").val() });
        };
    </script>
</asp:Content>
