<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.Dialog.Animation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Dialog"
	TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<style>
		.settingcontainer .settingcontent li label
		{
			width:120px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<cc1:C1Dialog ID="dialog" runat="server" Width="550px" Height="240px" Title="Animation">
				<Content>
					<h2>Dialog</h2>
					<br />
					<span>This is the default dialog which is useful for displaying information. The dialog
                window can be moved, resized and closed with the 'x' icon.</span>
				</Content>
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
		This sample illustrates how to set the animation for opening, closing, expanding, and
        collapsing the <strong>C1Dialog </strong>control.
	</p>
	<p>
	Set the following properties to support this feature:</p>
    <ul>
		<li><b>ExpandingAnimation</b></li>
		<li><b>CollapsingAnimation</b></li>
		<li><b>Show</b></li>
		<li><b>Hide</b></li>
	</ul>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<asp:UpdatePanel ID="UpdatePanel2" runat="server">
		<ContentTemplate>
			<div class="settingcontainer">
				<div class="settingcontent">
					<ul>
						<li class="fullwidth">
							<asp:Button ID="btnShow" runat="server" Width="100" Text="Show Dialog" OnClick="btnShow_Click" />
							<asp:Button ID="btnHide" runat="server" Width="100" Text="Hide Dialog" OnClick="btnHide_Click" />
						</li>
						<li class="fullwidth">
							<label for="showingEffectTypes">
								Show Animation
							</label>
							<asp:DropDownList ID="showEffectTypes" runat="server" OnSelectedIndexChanged="showEffectTypes_SelectedIndexChanged">
								<asp:ListItem Value="blind" Selected="True">Blind</asp:ListItem>
								<asp:ListItem Value="bounce">Bounce</asp:ListItem>
								<asp:ListItem Value="clip">Clip</asp:ListItem>
								<asp:ListItem Value="drop">Drop</asp:ListItem>
								<asp:ListItem Value="explode">Explode</asp:ListItem>
								<asp:ListItem Value="fade">Fade</asp:ListItem>
								<asp:ListItem Value="fold">Fold</asp:ListItem>
								<asp:ListItem Value="highlight">Highlight</asp:ListItem>
								<asp:ListItem Value="puff">Puff</asp:ListItem>
								<asp:ListItem Value="pulsate">Pulsate</asp:ListItem>
								<asp:ListItem Value="scale">Scale</asp:ListItem>
								<asp:ListItem Value="size">Size</asp:ListItem>
								<asp:ListItem Value="slide">Slide</asp:ListItem>
							</asp:DropDownList>
						</li>
						<li class="fullwidth">
							<label for="showingEffectTypes">
								Hide Animation
							</label>
							<asp:DropDownList ID="hideEffectTypes" runat="server" OnSelectedIndexChanged="hideEffectTypes_SelectedIndexChanged">
								<asp:ListItem Value="blind">Blind</asp:ListItem>
								<asp:ListItem Value="bounce">Bounce</asp:ListItem>
								<asp:ListItem Value="clip">Clip</asp:ListItem>
								<asp:ListItem Value="drop">Drop</asp:ListItem>
								<asp:ListItem Value="explode" Selected="True">Explode</asp:ListItem>
								<asp:ListItem Value="fade">Fade</asp:ListItem>
								<asp:ListItem Value="fold">Fold</asp:ListItem>
								<asp:ListItem Value="highlight">Highlight</asp:ListItem>
								<asp:ListItem Value="puff">Puff</asp:ListItem>
								<asp:ListItem Value="pulsate">Pulsate</asp:ListItem>
								<asp:ListItem Value="scale">Scale</asp:ListItem>
								<asp:ListItem Value="size">Size</asp:ListItem>
								<asp:ListItem Value="slide">Slide</asp:ListItem>
							</asp:DropDownList>
						</li>
						<li class="fullwidth">
							<label for="showingEffectTypes">
								Expand Animation
							</label>
							<asp:DropDownList ID="expandEffectTypes" runat="server" OnSelectedIndexChanged="expandEffectTypes_SelectedIndexChanged">
								<asp:ListItem Value="blind">Blind</asp:ListItem>
								<asp:ListItem Value="bounce">Bounce</asp:ListItem>
								<asp:ListItem Value="clip">Clip</asp:ListItem>
								<asp:ListItem Value="drop">Drop</asp:ListItem>
								<asp:ListItem Value="explode">Explode</asp:ListItem>
								<asp:ListItem Value="fade">Fade</asp:ListItem>
								<asp:ListItem Value="fold">Fold</asp:ListItem>
								<asp:ListItem Value="highlight" Selected="True">Highlight</asp:ListItem>
								<asp:ListItem Value="puff">Puff</asp:ListItem>
								<asp:ListItem Value="pulsate">Pulsate</asp:ListItem>
								<asp:ListItem Value="scale">Scale</asp:ListItem>
								<asp:ListItem Value="size">Size</asp:ListItem>
								<asp:ListItem Value="slide">Slide</asp:ListItem>
							</asp:DropDownList>
						</li>
						<li class="fullwidth">
							<label for="showingEffectTypes">
								Collapse Animation
							</label>
							<asp:DropDownList ID="collapseEffectTypes" runat="server" OnSelectedIndexChanged="collapseEffectTypes_SelectedIndexChanged">
								<asp:ListItem Value="blind">Blind</asp:ListItem>
								<asp:ListItem Value="bounce">Bounce</asp:ListItem>
								<asp:ListItem Value="clip">Clip</asp:ListItem>
								<asp:ListItem Value="drop">Drop</asp:ListItem>
								<asp:ListItem Value="explode">Explode</asp:ListItem>
								<asp:ListItem Value="fade">Fade</asp:ListItem>
								<asp:ListItem Value="fold">Fold</asp:ListItem>
								<asp:ListItem Value="highlight">Highlight</asp:ListItem>
								<asp:ListItem Value="puff" Selected="True">Puff</asp:ListItem>
								<asp:ListItem Value="pulsate">Pulsate</asp:ListItem>
								<asp:ListItem Value="scale">Scale</asp:ListItem>
								<asp:ListItem Value="size">Size</asp:ListItem>
								<asp:ListItem Value="slide">Slide</asp:ListItem>
							</asp:DropDownList>
						</li>
					</ul>
				</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
