<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DataBinding.aspx.cs" Inherits="ControlExplorer.Accordion.DataBinding" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Accordion" TagPrefix="C1Accordion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
		<C1Accordion:C1Accordion runat="server" ID="C1Accordion1" DataSourceID="AccessDataSource1" Width="80%">
		</C1Accordion:C1Accordion>
		<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
			DataFile="~/App_Data/C1NWind.mdb" 
			SelectCommand="SELECT [CategoryName], [Description] FROM [Categories]">
		</asp:AccessDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to bind data to the <strong>C1Accordion</strong> control.</p>
	<p>In this sample the <strong>Header </strong>and <strong>Content</strong> data fields are determined by the
		<strong>C1Accordion</strong> control automatically.</p>
	<p>But, if you wish to bind Header/Content text to a specific fields, 
		then you can use <strong>HeaderField</strong> and <strong>ContentField</strong> properties, e.g.:
<pre class="controldescription-code">
&lt;C1Accordion:C1Accordion runat="server"
			ID="C1Accordion1"
			DataSourceID="AccessDataSource1" 
			HeaderField="Description" 
			ContentField="CategoryName"&gt;
&lt;/C1Accordion:C1Accordion&gt;
</pre>
		</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
