<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	Inherits="Expander_Overview" CodeBehind="Overview.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Expander"
	TagPrefix="C1Expander" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<C1Expander:C1Expander runat="server" ID="Expander1">
		<Header>
			Header
		</Header>
		<Content>
			Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.
			Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,
			cursus in.
		</Content>
	</C1Expander:C1Expander>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates the default <strong>C1Expander </strong>control behavior.
	</p>
	<p>
		The <strong>C1Expander </strong>allows you to show or hide embedded or external content within
		an expanding panel.
		Set the <strong>Expanded</strong> property to False if you wish to collapse the content panel. 
		The default value for the <strong>Expanded</strong> property is True.
	</p>

</asp:Content>
