<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.C1Expander.Animation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Expander"
	TagPrefix="C1Expander" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script id="scriptInit" type="text/javascript">
		$(document).ready(function () {
			jQuery.wijmo.wijexpander.animations.custom1 = function (options) {
				this.slide(options, {
					easing: "easeOutExpo",
					duration: 900
				});
			}
			jQuery.wijmo.wijexpander.animations.custom2 = function (options) {
				if (options.expand)
					options.content.show("puff", options, 300);
				else
					options.content.hide("explode", options, 300);
			}
		});
	</script>
	<h4>
		Default expander animation</h4>

	<C1Expander:C1Expander runat="server" ID="C1Expander1">
		<Header>
			Header
		</Header>
		<Content>
			Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.
			Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,
			cursus in.
		</Content>
	</C1Expander:C1Expander>
	<br />
	<h4>
		Custom expander animation</h4>
	<C1Expander:C1Expander runat="server" ID="C1Expander2" Animated-Effect="custom1" Expanded="false">
		<Header>
			Header
		</Header>
		<Content>
			Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.
			Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,
			cursus in.
		</Content>
	</C1Expander:C1Expander>

	<br />
	<h4>
		Custom animation using jQuery effects</h4>
	<C1Expander:C1Expander runat="server" ID="C1Expander3" Animated-Effect="custom2" Expanded="false">
		<Header>
			Header
		</Header>
		<Content>
			Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.
			Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,
			cursus in.
		</Content>
	</C1Expander:C1Expander>
	
	<br />
	<h4>
		Disabled animation</h4>
	<C1Expander:C1Expander runat="server" ID="C1Expander4" Animated-Disabled="true" Expanded="false">
		<Header>
			Header
		</Header>
		<Content>
			Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.
			Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,
			cursus in.
		</Content>
	</C1Expander:C1Expander>

	
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates how to use different animation effects.
		The <strong>Animated </strong>property is used to change the animation effect.</p>
    <p>
		The following expander animations are demonstrated:</p>
    <ul>
        <li>The first expander demonstrates default expand/collapse animation effect.</li>
        <li>The second expander demonstrates custom animation (custom1) with "easeOutExpo" easing and duration of 900ms.</li>
        <li>The third expander demonstrates custom animation(custom2) using jQuery effects. 
		The "puff" effect is used as the expand animation and "explode" as the collapse animation.
	    </li>
        <li>For the fourth expander animation is disabled. 
		<strong>The Animated.Disabled</strong> property is set to True. </li>
    </ul>
	<p>
	The following is implementation code for the custom1 and custom2 animations:</p>
<pre class="controldescription-code">
	&lt;script id="script1" type="text/javascript"&gt;
		$(document).ready(function () {
			jQuery.wijmo.wijexpander.animations.custom1 = function (options) {
				this.slide(options, {
					easing: "easeOutExpo",
					duration: 900
				});
			}
			jQuery.wijmo.wijexpander.animations.custom2 = function (options) {
				if (options.expand)
					options.content.show("puff", options, 300);
				else
					options.content.hide("explode", options, 300);
			}
		});
	&lt;/script&gt;
</pre>
	<p>
		The following options(options parameter) are available for the animation function:
		</p>
		<ul>
			<li><strong>expand </strong>- If True, the content element is expanded.</li>
			<li><strong>horizontal </strong>- If True, the expander is horizontally orientated (when 
                <strong>expandDirection</strong> is left or right).</li>
			<li><strong>content </strong>- The jQuery object that contains content element to be expanded or collapsed. </li>
		</ul>
	
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
