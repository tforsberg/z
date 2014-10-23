<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="PostbackEvents.aspx.cs" Inherits="ControlExplorer.C1Expander.PostbackEvents" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Expander"
	TagPrefix="C1Expander" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<h2>
		The C1Expander inside an UpdatePanel:</h2>
	<asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="100" runat="server">
		<ProgressTemplate><div style="margin-top:20px;">Refreshing UpdatePanel1...</div></ProgressTemplate>
	</asp:UpdateProgress>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>
			<h3>
				<asp:Label ID="Label1" runat="server" Text=""></asp:Label></h3>
			<C1Expander:C1Expander runat="server" ID="C1Expander1" OnExpandedChanged="C1Expander1_OnExpandedChanged">
				<Header>
					Header
				</Header>
				<Content>
					Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.
					Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,
					cursus in.
				</Content>
			</C1Expander:C1Expander>
		</ContentTemplate>
	</asp:UpdatePanel>

	<h2>
		The C1Expander outside of the UpdatePanel:</h2>
	<h3>
		<asp:Label ID="Label2" runat="server" Text=""></asp:Label></h3>
	<C1Expander:C1Expander runat="server" ID="C1Expander2" OnExpandedChanged="C1Expander2_OnExpandedChanged">
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

	<p>This sample demonstrates the behavior of the <strong>C1Expander</strong> control during full and partial page postback.</p>
	<p>This sample page includes two expander controls. 
		The first expander control is located inside an <strong>UpdatePanel</strong>, and 
		the 
		server-side <strong>ExpandedChanged </strong>event is set to "C1Expander1_OnExpandedChanged".
		The second expander control is located outside of the <strong>UpdatePanel</strong>,
		and the server-side <strong>ExpandedChanged</strong> event is set to "C1Expander2_OnExpandedChanged".</p>
	<p>
	When the<strong> ExpandedChanged</strong> event handler is added, the <strong>C1Expander
		</strong>control posts back to the server whenever the content pane is expanded 
		or collapsed. Note, if you wish execute postback without using the <strong>ExpandedChanged</strong> event, you can set the 
		<strong>AutoPostBack </strong>property to True.
	</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
