<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1Calendar_Animation" Codebehind="Animation.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
				<wijmo:C1Calendar ID="C1Calendar1" runat="server">
				</wijmo:C1Calendar>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
<p>
Variant animation effects are allowed when navigating between calendar months.
</p>
<p>
Animation effects are determined via the <strong>Direction</strong>, <strong>Duration</strong>, and <strong>Easing </strong>properties.</p>
<p>
Setting the <b>Duration</b> property to 0 would disable the animation effects.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
		<asp:UpdatePanel ID="UpdatePanel2" runat="server">
			<ContentTemplate>
<div class="settingcontainer">
<div class="settingcontent">
<ul>
	<li class="fullwidth"><label class="settinglegend">Animation:</label>
	<li><label>Direction:</label>
		<asp:DropDownList ID="DirectionDdl" runat="server">
			<asp:ListItem value="Horizontal" selected="true">Horizontal</asp:ListItem>
			<asp:ListItem value="Vertical">Vertical</asp:ListItem>
		</asp:DropDownList>
	</li>
	<li>
		<label>Easing:</label>
		<asp:DropDownList id="EasingDdl" runat="server">
			<asp:ListItem value="Swing">Swing</asp:ListItem>
			<asp:ListItem value="Linear">Linear</asp:ListItem>
			<asp:ListItem value="EaseInQuad" selected="true">EaseInQuad</asp:ListItem>
			<asp:ListItem value="EaseOutQuad">EaseOutQuad</asp:ListItem>
			<asp:ListItem value="EaseInOutQuad">EaseInOutQuad</asp:ListItem>
			<asp:ListItem value="EaseInCubic">EaseInCubic</asp:ListItem>
			<asp:ListItem value="EaseOutCubic">EaseOutCubic</asp:ListItem>
			<asp:ListItem value="EaseInOutCubic">EaseInOutCubic</asp:ListItem>
			<asp:ListItem value="EaseInQuart">EaseInQuart</asp:ListItem>
			<asp:ListItem value="EaseOutQuart">EaseOutQuart</asp:ListItem>
			<asp:ListItem value="EaseInOutQuart">EaseInOutQuart</asp:ListItem>
			<asp:ListItem value="EaseInQuint">EaseInQuint</asp:ListItem>
			<asp:ListItem value="EaseOutQuint">EaseOutQuint</asp:ListItem>
			<asp:ListItem value="EaseInOutQuint">EaseInOutQuint</asp:ListItem>
			<asp:ListItem value="EaseInSine">EaseInSine</asp:ListItem>
			<asp:ListItem value="EaseOutSine">EaseOutSine</asp:ListItem>
			<asp:ListItem value="EaseInOutSine">EaseInOutSine</asp:ListItem>
			<asp:ListItem value="EaseInExpo">EaseInExpo</asp:ListItem>
			<asp:ListItem value="EaseOutExpo">EaseOutExpo</asp:ListItem>
			<asp:ListItem value="EaseInOutExpo">EaseInOutExpo</asp:ListItem>
			<asp:ListItem value="EaseInCirc">EaseInCirc</asp:ListItem>
			<asp:ListItem value="EaseOutCirc">EaseOutCirc</asp:ListItem>
			<asp:ListItem value="EaseInOutCirc">EaseInOutCirc</asp:ListItem>
			<asp:ListItem value="EaseInElastic">EaseInElastic</asp:ListItem>
			<asp:ListItem value="EaseOutElastic">EaseOutElastic</asp:ListItem>
			<asp:ListItem value="EaseInOutElastic">EaseInOutElastic</asp:ListItem>
			<asp:ListItem value="EaseInBack">EaseInBack</asp:ListItem>
			<asp:ListItem value="EaseOutBack">EaseOutBack</asp:ListItem>
			<asp:ListItem value="EaseInOutBack">EaseInOutBack</asp:ListItem>
			<asp:ListItem value="EaseInBounce">EaseInBounce</asp:ListItem>
			<asp:ListItem value="EaseOutBounce">EaseOutBounce</asp:ListItem>
			<asp:ListItem value="EaseInOutBounce">EaseInOutBounce</asp:ListItem>
		</asp:DropDownList>
	</li>
	<li>
		<label>Duration:</label>
		<asp:TextBox runat="server" ID="DurationTxt" Text="250" />
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

