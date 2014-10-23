<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1Calendar_MultiViews" Codebehind="MultiViews.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
				<wijmo:C1Calendar ID="C1Calendar1" runat="server" MonthRows="2" MonthCols="2">
				</wijmo:C1Calendar>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
<p>
    <strong>C1Calendar </strong>can display multiple months at one time.
</p>
<p>
You can control how many months are displayed in each row and column by setting the 
    <strong>MonthRows</strong> and <strong>MonthCols</strong> properties. 
</p>
<p>
    <strong>Note</strong>: Preview and quick navigation features are not supported in multiple months view.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
			<ContentTemplate>
<div class="settingcontainer">
<div class="settingcontent">
<ul>
	<li><label>Rows</label>
		<asp:DropDownList ID="RowsDdl" runat="server" OnSelectedIndexChanged="RowsColumnsChanged" AutoPostBack="true">
			<asp:ListItem value="1">1</asp:ListItem>
			<asp:ListItem value="2" selected="true">2</asp:ListItem>
			<asp:ListItem value="3">3</asp:ListItem>
			<asp:ListItem value="4">4</asp:ListItem>
		</asp:DropDownList>
	</li>
	<li>
		<label>Columns</label>
		<asp:DropDownList ID="ColumnsDdl" runat="server" OnSelectedIndexChanged="RowsColumnsChanged" AutoPostBack="true">
			<asp:ListItem value="1">1</asp:ListItem>
			<asp:ListItem value="2" selected="true">2</asp:ListItem>
			<asp:ListItem value="3">3</asp:ListItem>
			<asp:ListItem value="4">4</asp:ListItem>
		</asp:DropDownList>
	</li>
</ul>
</div>
</div>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>

