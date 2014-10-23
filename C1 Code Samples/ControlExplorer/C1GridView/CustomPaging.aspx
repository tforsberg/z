<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomPaging.aspx.cs" Inherits="ControlExplorer.C1GridView.CustomPaging" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager runat="server" ID="ScriptManger1" />

	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<wijmo:C1GridView ID="C1GridView1" runat="server"
				AutogenerateColumns="true" ShowRowHeader="true" AllowPaging="false">
			</wijmo:C1GridView>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
	<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<div class="settingcontainer">
				<div class="settingcontent">
					<ul>
						<li><label>Page Size</label>
				<asp:DropDownList runat="server" ID="PageSizeDdl" OnSelectedIndexChanged="PageSizeDdl_SelectedIndexChanged" AutoPostBack="true">
					<asp:ListItem Text="5" Value="5"></asp:ListItem>
					<asp:ListItem Text="10" Value="10" Selected="True"></asp:ListItem>
					<asp:ListItem Text="25" Value="25"></asp:ListItem>
					<asp:ListItem Text="50" Value="50"></asp:ListItem>
					<asp:ListItem Text="100" Value="100"></asp:ListItem>
				</asp:DropDownList></li>
						<li>
							 <button title="first page" runat="server" id="btnFirst"><span class="ui-icon ui-icon-seek-first" /></button>
                    <button title="previous page" runat="server" id="btnPrevious"><span class="ui-icon ui-icon-seek-prev" /></button>
                    &nbsp;&nbsp;&nbsp;<%= CurrentIndex + 1 %>&nbsp;&nbsp;&nbsp;
                    <button title="next page" runat="server" id="btnNext"><span class="ui-icon ui-icon-seek-next" /></button>
                    <button title="last page" runat="server" id="btnLast"><span class="ui-icon ui-icon-seek-end" /></button>
						</li>
					</ul>
				</div>
			</div>			
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
	This sample demonstrates how you can create a pageable with a custom paginator. </p>
</asp:Content>
