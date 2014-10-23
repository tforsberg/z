<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="ModalConfirm.aspx.cs" Inherits="Dialog_ModalConfirm" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Dialog"
	TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<script type="text/javascript">
		function delClick() {
			$(this).c1dialog("close");
		}
		function cancelClick() {
			$(this).c1dialog("close");
		}

		function showDialog() {
			$('#<%=dialog.ClientID%>').c1dialog('open');
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<cc1:C1Dialog ID="dialog" runat="server" Resizable="false" Width="400" Height="220" Title="Download complete"
		Modal="True" CloseText="Close">
		<Content>
			<p>
				<span class="ui-icon ui-icon-alert"></span>
				These items will be permanently deleted and cannot be recovered. Are you sure?
			</p>
		</Content>
		<ExpandingAnimation Duration="400" />
		<CollapsingAnimation Duration="300" />
		<Buttons>
			<cc1:DialogButton OnClientClick="delClick" Text="Delete all items" />
			<cc1:DialogButton OnClientClick="cancelClick" Text="Cancel" />
		</Buttons>
		<CaptionButtons>
			<Pin Visible="false" />
			<Refresh Visible="False" />
			<Toggle Visible="False" />
			<Minimize Visible="False" />
			<Maximize Visible="False" />
		</CaptionButtons>
	</cc1:C1Dialog>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample illustrates how to use a modal <strong>C1Dialog </strong>control to create a confirmation dialog box.
	</p>
	<ul>
		<li>This feature is enabled if the <b>Modal</b> property is set to True. </li>
		<li>The <b>Buttons</b> property adds buttons on the bottom of this dialog box.</li>
		<li>The property <b>CaptionButtons</b> determines the visibility of the caption bar buttons.</li>
	</ul>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<div class="settingcontainer">
		<div class="settingcontent">
			<ul>
				<li>
					<input type="button" value="Show Confirm" onclick="showDialog()" style="width:100px" /></li>
			</ul>
		</div>
	</div>
</asp:Content>
