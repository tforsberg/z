<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.C1ComboBox.Animation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
		<style type ="text/css">
			.ui-effects-explode
			{
				z-index:99999;
			}
		</style>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
	<wijmo:C1ComboBox ID="C1ComboBox1" runat="server" Width="160px">
	<ShowingAnimation Duration="1000">
	<Animated Effect="Scale" />
	</ShowingAnimation>
	<HidingAnimation Duration="1000">
	<Animated Effect="explode" />
	</HidingAnimation>
		<Items>
			<wijmo:C1ComboBoxItem Text="c++" Value="c++" />
			<wijmo:C1ComboBoxItem Text="java" Value="java" />
			<wijmo:C1ComboBoxItem Text="php" Value="php" />
			<wijmo:C1ComboBoxItem Text="coldfusion" Value="coldfusion" />
			<wijmo:C1ComboBoxItem Text="javascript" Value="javascript" />
			<wijmo:C1ComboBoxItem Text="asp" Value="asp" />
			<wijmo:C1ComboBoxItem Text="ruby" Value="ruby" />
			<wijmo:C1ComboBoxItem Text="python" Value="python" />
			<wijmo:C1ComboBoxItem Text="c" Value="c" />
			<wijmo:C1ComboBoxItem Text="scala" Value="scala" />
			<wijmo:C1ComboBoxItem Text="groovy" Value="groovy" />
			<wijmo:C1ComboBoxItem Text="haskell" Value="haskell" />
			<wijmo:C1ComboBoxItem Text="perl" Value="perl" />
		</Items>
	</wijmo:C1ComboBox>
				</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	The <strong>C1ComboBox </strong>supports animation effects when showing and hiding the dropdown.
	</p>
	<p>Showing and hiding animation is allowed if the following options are set to corresponding values: </p>
	<ul>
	<li><strong>ShowingAnimation </strong>- takes effect when the drop-down list is 
		visible.</li>
	<li><strong>HidingAnimation </strong>- takes effect when the drop-down list is 
		hidden.</li>
	</ul>
    <p>
	End-users can observe the animation effect once the  <strong>ShowingAnimation
		</strong>and <strong>HidingAnimation</strong> are set.
	</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
			<ContentTemplate>
<div class="settingcontainer">
<div class="settingcontent">
<ul>
	<li class="fullwidth"><label class="settinglegend">Animation:</label>
	<li><label>Showing Speed:</label>
		<asp:TextBox runat="server" id="ShowingSpeedTxt" text="1000" />
	</li>
	<li>
		<label>Showing Effect:</label>
			<asp:DropDownList id="ShowingEffectTypesDdl" runat="server">
				<asp:ListItem value="none">none</asp:ListItem>
				<asp:ListItem value="blind">Blind</asp:ListItem>
				<asp:ListItem value="bounce">Bounce</asp:ListItem>
				<asp:ListItem value="clip">Clip</asp:ListItem>
				<asp:ListItem value="drop">Drop</asp:ListItem>
				<asp:ListItem value="explode">Explode</asp:ListItem>
				<asp:ListItem value="fade">Fade</asp:ListItem>
				<asp:ListItem value="fold">Fold</asp:ListItem>
				<asp:ListItem value="highlight">Highlight</asp:ListItem>
				<asp:ListItem value="puff">Puff</asp:ListItem>
				<asp:ListItem value="pulsate">Pulsate</asp:ListItem>
				<asp:ListItem value="scale" selected="true">Scale</asp:ListItem>
				<asp:ListItem value="shake">Shake</asp:ListItem>
				<asp:ListItem value="size">Size</asp:ListItem>
				<asp:ListItem value="slide">Slide</asp:ListItem>
			</asp:DropDownList>
	</li>
	<li><label>Hiding Speed:</label>
		<asp:TextBox runat="server" id="HidingSpeedTxt" text="1000" />
	</li>
	<li>
		<label>Hiding Effect:</label>
			<asp:DropDownList id="HidingEffectTypesDdl" runat="server">
				<asp:ListItem value="none">none</asp:ListItem>
				<asp:ListItem value="blind">Blind</asp:ListItem>
				<asp:ListItem value="bounce">Bounce</asp:ListItem>
				<asp:ListItem value="clip">Clip</asp:ListItem>
				<asp:ListItem value="drop">Drop</asp:ListItem>
				<asp:ListItem value="explode">Explode</asp:ListItem>
				<asp:ListItem value="fade">Fade</asp:ListItem>
				<asp:ListItem value="fold">Fold</asp:ListItem>
				<asp:ListItem value="highlight">Highlight</asp:ListItem>
				<asp:ListItem value="puff">Puff</asp:ListItem>
				<asp:ListItem value="pulsate">Pulsate</asp:ListItem>
				<asp:ListItem value="scale" selected="true">Scale</asp:ListItem>
				<asp:ListItem value="shake">Shake</asp:ListItem>
				<asp:ListItem value="size">Size</asp:ListItem>
				<asp:ListItem value="slide">Slide</asp:ListItem>
			</asp:DropDownList>
	</li>
</ul>
</div>
	<div class="settingcontrol">
	<asp:Button ID="ApplyBtn" Text="Apply" CssClass="settingapply" runat="server" OnClick="ApplyBtn_Click"/>
	</div>
</div>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
