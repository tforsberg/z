<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ObjectDataSource.aspx.cs" Inherits="ControlExplorer.C1AutoComplete.ObjectDataSource" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1AutoComplete" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1AutoComplete ID="C1AutoComplete1" runat="server" Width="250px"
        DataSourceID="ObjectDataSource1">
    </wijmo:C1AutoComplete>
		<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="ProductsBLL">
		</asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to bind ObjectDataSource to the <strong>C1AutoComplete</strong> control.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
