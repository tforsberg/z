<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	Inherits="ControlExplorer.Accordion.Accordion_Overview" CodeBehind="Overview.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Accordion"
	TagPrefix="C1Accordion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<C1Accordion:C1Accordion runat="server" ID="C1Accordion1" Width="80%">
		<Panes>
			<C1Accordion:C1AccordionPane ID="Accordion1Pane1" runat="server">
				<Header>
					Step 1
				</Header>
				<Content>
					<h1>
						Step 1</h1>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ac lacus ac nibh
					viverra faucibus. Mauris non vestibulum dui
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="Accordion1Pane2" runat="server">
				<Header>
					Step 2
				</Header>
				<Content>
					<h1>
						Step 2</h1>
					Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
					Curae; Vestibulum ante ipsum primis in faucibus.
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="Accordion1Pane3" runat="server">
				<Header>
					Step 3
				</Header>
				<Content>
					<h1>
						Step 3</h1>
					Sed facilisis placerat commodo. Nam odio dolor, viverra eu blandit in, hendrerit
					eu arcu. In hac habitasse platea dictumst.
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="Accordion1Pane4" runat="server" Expanded="True">
				<Header>
					Step 4
				</Header>
				<Content>
					<h1>
						Step 4</h1>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ac lacus ac nibh
					viverra faucibus. Mauris non vestibulum dui.
				</Content>
			</C1Accordion:C1AccordionPane>
		</Panes>
	</C1Accordion:C1Accordion>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates the default <strong>C1Accordion </strong>control behavior.
	</p>
	<p>
		The first accordion pane in this sample is expanded by default (the <strong>SelectedIndex
		</strong>property value is zero).  
	</p>
	<p>
		If you wish to expand another accordion pane then, please, set the <strong>SelectedIndex
		</strong>property to the appropriate accordion pane.
	</p>
	<p>Note that you can set the <strong>SelectedIndex</strong> property to -1 if you want to collapse 
		all panes, e.g:
<pre class="controldescription-code">
&lt;C1Accordion:C1Accordion runat="server" 
			ID="C1Accordion1" 
			SelectedIndex="-1"&gt;
</pre></p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
