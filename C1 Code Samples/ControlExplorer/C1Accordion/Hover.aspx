<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Hover.aspx.cs" Inherits="ControlExplorer.C1Accordion.Hover" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Accordion"
	TagPrefix="C1Accordion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<C1Accordion:C1Accordion ID="C1Accordion1" runat="server" Event="mouseover" Width="80%">
		<Panes>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane1" runat="server">
				<Header>Section 1</Header>
				<Content>
					<p>
						Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque.
						Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a
						nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada.
						Vestibulum a velit eu ante scelerisque vulputate.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane2" runat="server">
				<Header>Section 2</Header>
				<Content>
					<p>
						Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus
						hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum
						tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane3" runat="server">
				<Header>Section 3</Header>
				<Content>
					<p>
						Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus
						pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque
						semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
						nisi, eu iaculis leo purus venenatis dui.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane4" runat="server">
				<Header>Section 4</Header>
				<Content>
					<p>
						Cras dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada
						fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et
						ultrices posuere cubilia Curae; Aenean lacinia mauris vel est.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
		</Panes>
	</C1Accordion:C1Accordion>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates how to set the event that expands the content area of the 
		<strong>C1Accordion </strong>control.
	</p>
	<p>
		The<strong> Event </strong>property is set to the "mouseover" value.
	</p>
	<p>
	Note that you can specify several events that should trigger expand action. 
	In order to do that, you just need separate events by the space character, e.g.: Event="mouseover focus".
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
