<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Globalization.aspx.cs" Inherits="ControlExplorer.C1Calendar.Globalization" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
	<ContentTemplate>
<wijmo:C1Calendar ID="C1Calendar1" runat="server">
</wijmo:C1Calendar>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
    <strong>C1Calendar</strong> displays month views in a localized style if the
    <strong>Culture </strong>property is set.
</p>
<p>
You can also set the <strong>WeekDayFormat </strong>property to determine whether the week day names are displayed in short or abbreviated format.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
			<ContentTemplate>
<div class="settingcontainer">
<div class="settingcontent">
	<ul>
		<li class="fullwidth"><label class="settinglegend">Change Culture:</label></li>
		<li class="fullwidth autoheight"><asp:RadioButtonList ID="RadioButtonList1" runat="server" 
        AutoPostBack="True" onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
    <asp:ListItem Value="zh-CN">Chinese - Simplified</asp:ListItem>
    <asp:ListItem Value="en-CA">English - Canada</asp:ListItem>
    <asp:ListItem Value="en-GB">English - United Kingdom</asp:ListItem>
    <asp:ListItem Value="en-TT">English - Trinidad and Tobago</asp:ListItem>
    <asp:ListItem Value="fr-CA">French - Canada</asp:ListItem>
    <asp:ListItem Value="fr-CH">French - Switzerland</asp:ListItem>
    </asp:RadioButtonList>
    </li>
	</ul></div>
</div>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
