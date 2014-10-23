<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Position.aspx.cs" Inherits="ControlExplorer.Menu.Position" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Menu"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <input type="button" id="btn1" value="click here" />
    <asp:Panel ID="Panel1" runat="server">
        <ul id="wijmenu1">
            <li><a href="#">Breaking News</a></li>
            <li><a href="#">Entertainment</a></li>
            <li><a href="#">Finance</a></li>
            <li><a href="#">Food &#38; Cooking</a></li>
            <li><a href="#">Lifestyle</a>
                <ul>
                    <li><a href="#">submenu</a></li></ul>
            </li>
            <li><a href="#">News</a></li>
            <li><a href="#">Politics</a></li>
            <li><a href="#">Sports</a></li>
        </ul>
    </asp:Panel>
    <wijmo:C1MenuExtender ID="MenuExtender1" runat="server" Trigger="#btn1" Orientation="Vertical"
        TargetControlID="Panel1" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample demonstrates how the <strong>Position</strong> property can be used to determine
	where a menu opens relative to a trigger, such as a button that is clicked to open
	the menu.</p>
	<p>The following properties are used in this sample.</p>
	<ul>
		<li><strong>Position</strong> - Where to position the control relative to another document element.  This property is based on the jQuery UI position widget.</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">   
    <div class="option-row">
                    <label>
                        My</label>
                    <select id="my1">
                        <option value="left">left</option>
                        <option value="center">center</option>
                        <option value="right">right</option>
                    </select>
                    <select id="my2">
                        <option value="top">top</option>
                        <option value="center">center</option>
                        <option value="bottom">bottom</option>
                    </select>
                </div>
                <div class="option-row">
                    <label>
                        At</label>
                    <select id="at1">
                        <option value="left">left</option>
                        <option value="center">center</option>
                        <option value="right">right</option>
                    </select>
                    <select id="at2">
                        <option value="top">top</option>
                        <option value="center">center</option>
                        <option value="bottom" selected="selected">bottom</option>
                    </select>
                </div>
             <script type="text/javascript">
                 $(document).ready(function () {
                     $("#my1,#my2,#at1,#at2").change(function () {
                         $("#<%=Panel1.ClientID %>").wijmenu("option", "position", { my: $("#my1").val() + " " + $("#my2").val(), at: $("#at1").val() + " " + $("#at2").val() });
                     });
                 });
    </script>
</asp:Content>
