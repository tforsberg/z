<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="RequireOpenedPane.aspx.cs" Inherits="ControlExplorer.Accordion.RequireOpenedPane" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Accordion"
	TagPrefix="Accordion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="Panel1" runat="server">
		<h3>
			<a href="#">Section 1</a></h3>
		<div>
			<p>
				Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque.
				Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a
				nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada.
				Vestibulum a velit eu ante scelerisque vulputate.
			</p>
		</div>
		<h3>
			<a href="#">Section 2</a></h3>
		<div>
			<p>
				Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus
				hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum
				tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
			</p>
		</div>
		<h3>
			<a href="#">Section 3</a></h3>
		<div>
			<p>
				Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus
				pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque
				semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
				nisi, eu iaculis leo purus venenatis dui.
			</p>
		</div>
		<h3>
			<a href="#">Section 4</a></h3>
		<div>
			<p>
				Cras dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada
				fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et
				ultrices posuere cubilia Curae; Aenean lacinia mauris vel est.
			</p>
		</div>
	</asp:Panel>
	<Accordion:C1AccordionExtender ID="Panel1_C1AccordionExtender" runat="server" TargetControlID="Panel1"
		RequireOpenedPane="false">
	</Accordion:C1AccordionExtender>
	<br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The C1AccordionExtender has the ability to change default behavior and allows to open the multiple panes at once.</p>
	<p>&nbsp;</p>
	<p>
		When the RequireOpenedPane property is set to true then clicking a header 
		will close the currently opened pane, leaving the remaining panes
		closed.	When the RequireOpenedPane property is set to false then 
		clicking a header will not close the currently opened panes.
	</p>	
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
