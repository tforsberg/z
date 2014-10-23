<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1Editor.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Editor"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1Editor runat="server" ID="Editor1" Width="760" Height="530"  Text="The Insert tab contains groups of commands that enable end-users to insert items, such as images or paragraph breaks, into the text editor. Underneath the Format tab are four groups – Tables, Breaks, Forms, and Special – that house closely related tasks. " ></wijmo:C1Editor>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		Author and manage HTML content on any Web page with the <strong>C1Editor</strong> control. This intuitive
		Microsoft Word-like editor allows you to edit in your preferred style: design, code, or split view.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
