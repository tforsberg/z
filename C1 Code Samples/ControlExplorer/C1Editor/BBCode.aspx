<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="BBCode.aspx.cs" Inherits="ControlExplorer.C1Editor.BBCode" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Editor"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1Editor runat="server" ID="Editor1" Width="760" Height="200" Mode="Bbcode" ></wijmo:C1Editor>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		The <strong>C1Editor </strong>supports Bulletin Board Code (BBCode) which is a lightweight markup language used by a number of popular forums.
	</p>
		<p>BBCode mode is allowed if the following options are set to corresponding values: </p>
	<p>
	<strong>Mode </strong>- takes effect when the value is "Bbcode".
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
