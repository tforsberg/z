<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="LinqDataSource.aspx.cs" Inherits="ControlExplorer.Accordion.LinqDataSource" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Accordion" TagPrefix="C1Accordion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
		<C1Accordion:C1Accordion runat="server"
			ID="C1Accordion1" Width="80%"
			DataSourceID="LinqDataSource1">
		</C1Accordion:C1Accordion>
	<asp:LinqDataSource ID="LinqDataSource1" runat="server" 
		ContextTypeName="ControlExplorer.App_Code.C1NWindClassesDataContext" 
		Select="new (CategoryName, Description)" TableName="CategoryDatas">
	</asp:LinqDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to bind LinqDataSource to the <strong>C1Accordion</strong> control.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
