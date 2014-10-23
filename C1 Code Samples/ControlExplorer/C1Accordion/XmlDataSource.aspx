<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="XmlDataSource.aspx.cs" Inherits="ControlExplorer.Accordion.XmlDataSource" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Accordion" TagPrefix="C1Accordion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
		<C1Accordion:C1Accordion runat="server"
			ID="C1Accordion1" Width="80%"
			DataSourceID="XmlDataSource1"
			HeaderField="CategoryName"
			ContentField="Description">
		</C1Accordion:C1Accordion>
	<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/Categories.xml" XPath="/C1NWind/Categories/Category"></asp:XmlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to bind XmlDataSource to the <strong>C1Accordion</strong> control.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
