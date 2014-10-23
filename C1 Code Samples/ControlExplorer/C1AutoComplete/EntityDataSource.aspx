<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="EntityDataSource.aspx.cs" Inherits="ControlExplorer.C1AutoComplete.EntityDataSource" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1AutoComplete" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1AutoComplete ID="C1AutoComplete1" runat="server" Width="250px"
        DataSourceID="EntityDataSource1">
    </wijmo:C1AutoComplete>
	<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=C1NWindEntities"
		 DefaultContainerName="C1NWindEntities" EnableFlattening="False" EntitySetName="Products" Select="it.[ProductID], it.[ProductName]"></asp:EntityDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to bind EntityDataSource to the <strong>C1AutoComplete</strong> control.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
