<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="SpellChecking.aspx.cs" Inherits="ControlExplorer.C1Editor.SpellChecking" %>


<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Editor"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1Editor runat="server" ID="Editor1" Width="760" Height="530" >
	</wijmo:C1Editor>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	<strong>C1Editor</strong> includes a built-in spell checker giving end-users as-you-type spell 
	checking just like Microsoft Word (complete with red and wavy underlines) without the need to download a dictionary.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
