<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	Inherits="Expander_Overview" CodeBehind="Overview.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Expander"
	TagPrefix="Expander" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<asp:Panel ID="Panel1" runat="server">
		<h3>
			Header</h3>
		<div>
			Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.
			Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,
			cursus in.
		</div>
	</asp:Panel>
	<Expander:C1ExpanderExtender ID="Panel1_ExpanderExtender" runat="server" TargetControlID="Panel1">
	</Expander:C1ExpanderExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates the default C1ExpanderExtender behavior.
	</p>
	<p>&nbsp;</p>
	<p>
		The C1ExpanderExtender allows you to show or hide embedded or external content within
		an expanding panel.
		Set the Expanded property to false if you wish to collapse content panel. 
		Default value for the Expanded property is true.
	</p>
</asp:Content>

