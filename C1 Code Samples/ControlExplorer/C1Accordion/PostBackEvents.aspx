<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="PostBackEvents.aspx.cs" Inherits="ControlExplorer.C1Accordion.AutoPostBack" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Accordion"
	TagPrefix="C1Accordion" %>
<%@ Register Src="~/ServerSideLogger.ascx" TagPrefix="uc1" TagName="ServerSideLogger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<h2>
		The C1Accordion inside an UpdatePanel:</h2>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>
			<C1Accordion:C1Accordion ID="C1Accordion1" CssClass="serversidelogger-before" runat="server" Width="300px" OnSelectedIndexChanged="C1Accordion1_OnSelectedIndexChanged">
				<Panes>
					<C1Accordion:C1AccordionPane ID="C1AccordionPane1" runat="server">
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
					<C1Accordion:C1AccordionPane ID="C1AccordionPane2" runat="server">
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
					<C1Accordion:C1AccordionPane ID="C1AccordionPane3" runat="server">
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
					<C1Accordion:C1AccordionPane ID="C1AccordionPane4" runat="server" Expanded="True">
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
			<uc1:serversidelogger runat="server" id="UpdatePanelServerSideLogger" Title="Last fired event:"/>
		</ContentTemplate>
	</asp:UpdatePanel>
	<br>
	<h2>The C1Accordion outside of the UpdatePanel:</h2>
	<C1Accordion:C1Accordion ID="C1Accordion2" CssClass="serversidelogger-before" runat="server" Width="300px" OnSelectedIndexChanged="C1Accordion2_OnSelectedIndexChanged">
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
	<uc1:serversidelogger runat="server" id="ServerSideLogger" Title="Last fired event:"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample demonstrates behavior of the <strong>C1Accordion</strong> control during full and partial page postback.</p>
	<p>The sample page consists of two accordion controls. 
		The first accordion control is located inside an UpdatePanel, and its
		server-side <strong>SelectedIndexChanged </strong>event is set to "C1Accordion1_OnSelectedIndexChanged".
		The second accordion control is located outside of the UpdatePanel, and its
		server-side <strong>SelectedIndexChanged </strong>event is set to "C1Accordion2_OnSelectedIndexChanged".</p>
	<p>
	When the<strong> SelectedIndexChanged </strong>event handler is added, the
        <strong>C1Accordion 
        </strong>posts back to the server each time the currently selected pane is changed.
	Note that if you wish execute post back without using the<strong> SelectedIndexChanged</strong> event, 
	you can set the <strong>AutoPostBack </strong>property to True.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
