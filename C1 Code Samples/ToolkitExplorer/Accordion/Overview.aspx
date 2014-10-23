<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	Inherits="ControlExplorer.Accordion.Accordion_Overview" CodeBehind="Overview.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Accordion"
	TagPrefix="Accordion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
<style type="text/css" media="all">
.sampleAccordion .ui-accordion-content
{
	height: 150px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<asp:Panel ID="Panel1" CssClass="sampleAccordion" runat="server">
		<div>
			Step 1</div>
		<div>
			<h1>Step 1</h1>
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ac lacus ac nibh viverra faucibus. Mauris non vestibulum dui</div>
		<div>
			Step 2</div>
		<div>
			<h1>Step 2</h1>
			Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ante ipsum primis in faucibus.</div>
		<div>
			Step 3</div>
		<div>
			<h1>Step 3</h1>Sed facilisis placerat commodo. Nam odio dolor, viverra eu blandit in, hendrerit eu arcu. In hac habitasse platea dictumst.</div>
		<div>
			Step 4</div>
		<div>
			<h1>Step 4</h1>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ac lacus ac nibh viverra faucibus. Mauris non vestibulum dui.</div>
	</asp:Panel>
	<Accordion:C1AccordionExtender ID="Panel1_C1AccordionExtender" runat="server" TargetControlID="Panel1">
	</Accordion:C1AccordionExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates the default C1AccordionExtender behavior.
	</p>
	<p>&nbsp;</p>
	<p>
		The first accordion pane in this sample is expanded by default (the SelectedIndex property value is 0).  
	</p>
	<p>&nbsp;</p>
	<p>
		If you wish to expand another accordion pane then, please, set the SelectedIndex property to the appropriate accordion pane.
	</p>
	Note. you can set the SelectedIndex property to -1 if you want to collapse 
		all panes, e.g:
<pre class="controldescription-code">
&lt;Accordion:C1AccordionExtender runat="server"
			ID="Panel1_C1AccordionExtender" 			
			TargetControlID="Panel1"
			SelectedIndex="-1"&gt;
&lt;/Accordion:C1AccordionExtender&gt;
</pre>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">

</asp:Content>
