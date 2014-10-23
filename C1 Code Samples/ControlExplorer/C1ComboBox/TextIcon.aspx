<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="TextIcon.aspx.cs" Inherits="ControlExplorer.C1ComboBox.TextIcon" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1ComboBox runat="server" ID="ComboBox1" Width="400px">
		<ItemsTemplate>
			<img src="<%# DataBinder.Eval(Container.DataItem, "Path") %>" /><label><%# DataBinder.Eval(Container.DataItem, "Name") %></label>
		</ItemsTemplate>
	</wijmo:C1ComboBox>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
<p>This demo shows how to show icons in ComboBox item.</p>
</asp:Content>
