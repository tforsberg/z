<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="IFrame.aspx.cs" Inherits="ToolkitExplorer.LightBox.IFrame" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<asp:Panel ID="Panel1" runat="server">
		<a href="http://www.componentone.com" rel="wijlightbox[stock]">
			<img src="images/small/componentone.png" alt="ComponentOne"</a> 
		<a href="http://www.microsoft.com" rel="wijlightbox[stock]">
			<img src="images/small/microsoft.png" alt="Microsoft" /></a> 
	</asp:Panel>

	<wijmo:C1LightBoxExtender ID="Panel1_C1LightBoxExtender" runat="server" 
		TargetControlID="Panel1" Player="Iframe" MaxWidth="960" MaxHeight="600">
	</wijmo:C1LightBoxExtender>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
C1LightBox supports displaying the content of URL in an iframe.
</p>

<p>
This is enabled by setting the <b>Player</b> property to Iframe.
</p>

<p>
In this sample, LightBox hosts the Yahoo, ComponentOne and Microsoft websites.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
