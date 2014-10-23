<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ContentUrl.aspx.cs" Inherits="Expander.ContentUrl" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Expander"
	TagPrefix="Expander" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style type="text/css" media="all">
		.ui-expander-content 
		{
			height: 400px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <asp:Panel ID="Panel1" runat="server">
                <h3>
                    www.yahoo.com (click to collapse/expand)</h3>
                <div>
                </div>
            </asp:Panel>
			<Expander:C1ExpanderExtender ID="Panel1_ExpanderExtender" runat="server" TargetControlID="Panel1"
				ContentUrl="http://www.componentone.com/">
			</Expander:C1ExpanderExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample demonstrates how to load content from an external web site into expander content panel.</p>
	<p>&nbsp;</p>
	<p>The ContentUrl property determines the URL to the external content. 
	Url can be absolute or relative when content is locates on the same web site./p>
	<p>In this sample the ContentUrl property of the C1ExpanderExtender is set to "http://www.componentone.com/".</p>
	<p>Note, height of the content panel is set to 400px using css.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
