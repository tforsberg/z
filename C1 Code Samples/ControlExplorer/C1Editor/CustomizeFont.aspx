<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" 
CodeBehind="CustomizeFont.aspx.cs" Inherits="ControlExplorer.C1Editor.CustomizeFont" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Editor"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<wijmo:C1Editor runat="server" ID="Editor1" Width="760" Height="530" FontNames="Arial,Garamond,Tahoma,Times New Roman"
	 FontSizes="10px,11px,12px,13px,14px,15px"  defaultFontName="Arial" defaultFontSize="15px"></wijmo:C1Editor>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		Author and manage HTML content on any Web page with the <strong>C1Editor</strong> control. This intuitive
		Microsoft Word-like editor allows you to edit in your preferred style: design, code, or split view.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
