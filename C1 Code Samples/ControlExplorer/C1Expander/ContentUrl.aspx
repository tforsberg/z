<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ContentUrl.aspx.cs" Inherits="ControlExplorer.C1Expander.ContentUrl" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Expander"
	TagPrefix="C1Expander" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style type="text/css" media="all">
		.ui-expander-content 
		{
			height: 400px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<C1Expander:C1Expander runat="server" ID="C1Expander3" ContentUrl="http://www.componentone.com/">
		<Header>
			www.componentone.com (click to collapse/expand)
		</Header>
		<Content>
			
		</Content>
	</C1Expander:C1Expander>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample demonstrates how to load content from an external website into an expander content panel.</p>
	<p>The <strong>ContentUrl </strong>property determines the URL to the external content. 
	The URL can be absolute or relative when content is located on the same website.</p>
	<p>In this sample the <strong>ContentUrl</strong> property of the <strong>C1Expander</strong> is set to "http://www.componentone.com/".</p>
	<p>Note that the height of the content panel is set to 400px using CSS.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
