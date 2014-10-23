<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Customize.aspx.cs" Inherits="ControlExplorer.C1Editor.Customize" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Editor"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1Editor runat="server" ID="Editor1" Width="760" Height="530">
	</wijmo:C1Editor>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	 <strong>C1Editor</strong> supports toolbar customization. 
	 The Ribbon-like UI can be modified by adding/removing <strong>TabPages</strong>, <strong>RibbonGroups</strong>, and <strong>Buttons</strong>. In this sample we've added a "Customize Tab" tab with image browser capability.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
