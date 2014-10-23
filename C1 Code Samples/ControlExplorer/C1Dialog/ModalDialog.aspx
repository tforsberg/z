<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="True"
	CodeBehind="ModalDialog.aspx.cs" Inherits="ControlExplorer.C1Window.ModalDialog" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Dialog"
	TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<cc1:C1Dialog ID="dialog" runat="server" Width="400px" Height="180px" Modal="true"
				Stack="True" CloseText="Close" Title="Model dialog">
				<Content>
					<p>
						Adding the modal overlay screen makes the dialog look more prominent because it
                dims out the page content.
					</p>
				</Content>
				<ExpandingAnimation Duration="400" />
				<CollapsingAnimation Duration="300" />
			</cc1:C1Dialog>
		</ContentTemplate>
	</asp:UpdatePanel>
	<script type="text/javascript">
		// there is a issue when the dialog is inside of an update panel, and the panel is inside of another widget, which sets relative position.
		// there is a workaround for this issue, firstly init the outer widget.
		$("#ctl00_ctl00_MainContent_WidgetTabs").c1tabs();
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		Adding the modal overlay screen makes the dialog look more prominent because it
        dims out the page content.
	</p>
	<p>
		This feature is enabled when the <b>Modal</b> property is set to True .
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<asp:UpdatePanel ID="UpdatePanel2" runat="server">
		<ContentTemplate>
			<div class="settingcontainer">
				<div class="settingcontent">
					<ul>
						<li>
							<asp:Button runat="server" ID="btnShow" Text="Show Dialog" Width="100" OnClick="btnShow_Click" /></li>
					</ul>
				</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
