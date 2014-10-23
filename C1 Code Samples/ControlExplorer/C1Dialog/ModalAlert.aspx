<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="ModalAlert.aspx.cs" Inherits="Dialog_ModalAlert" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Dialog"
	TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<script type="text/javascript">
		function btnClick() {
			$(this).c1dialog("close");
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<cc1:C1Dialog ID="dialog" runat="server" Width="550px" Height="240px" Modal="true"
		Stack="True" CloseText="Close" Title="Upload file">
		<Content>
			<p>
				<span class="ui-icon ui-icon-circle-check"></span>Your files have uploaded successfully!
			</p>
		</Content>
		<ExpandingAnimation Duration="400">
		</ExpandingAnimation>
		<Buttons>
			<cc1:DialogButton OnClientClick="btnClick" Text="OK" />
		</Buttons>
		<CaptionButtons>
			<Pin Visible="False" />
			<Refresh Visible="False" />
			<Toggle Visible="False" />
			<Minimize Visible="False" />
			<Maximize Visible="False" />
		</CaptionButtons>
		<CollapsingAnimation Duration="300" />
	</cc1:C1Dialog>

	<script type="text/javascript">
		function showDialog() {
			$('#<%=dialog.ClientID%>').c1dialog('open');
		}
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample illustrates how to use a modal <strong>C1Dialog </strong>as an alertdialog 
        box.
	</p>
	<ul>
		<li>This feature is enabled if the <b>Modal</b> property is set to True. </li>
		<li>The <b>Buttons</b> property adds buttons on the bottom of this dialog box.</li>
		<li>The <b>CaptionButtons</b> property determines the visibility of the caption bar buttons.</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<div class="settingcontainer">
		<div class="settingcontent">
			<ul>
				<li>
					<input type="button" value="Show Alert" style="width: 100px" onclick="showDialog()" /></li>
			</ul>
		</div>
	</div>
</asp:Content>
