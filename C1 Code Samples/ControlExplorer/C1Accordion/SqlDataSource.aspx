<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="SqlDataSource.aspx.cs" Inherits="ControlExplorer.Accordion.SqlDataSource" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Accordion" TagPrefix="C1Accordion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
		<C1Accordion:C1Accordion runat="server"
			ID="C1Accordion1" Width="80%"
			DataSourceID="SqlDataSource1">
		</C1Accordion:C1Accordion>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" ProviderName="<%$ ConnectionStrings:SQLConnectionString.ProviderName %>" SelectCommand="SELECT [CategoryName], [Description] FROM [Categories]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to bind SqlDataSource to the <strong>C1Accordion</strong> control.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
