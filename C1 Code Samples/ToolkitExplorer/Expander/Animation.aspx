<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.Expander.Animation" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Expander"
	TagPrefix="Expander" %>
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
	<asp:Panel ID="Panel1" runat="server">
		<h3>
			Header</h3>
		<div>
			Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.
			Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,
			cursus in.
		</div>
	</asp:Panel>
	<Expander:C1ExpanderExtender ID="Panel1_ExpanderExtender" runat="server" TargetControlID="Panel1">
	</Expander:C1ExpanderExtender>
	<h4>
		Custom expander animation</h4>
	<asp:Panel ID="Panel2" runat="server">
		<div>
			Header</div>
		<div>
			Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.
			Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,
			cursus in.
		</div>
	</asp:Panel>
	<Expander:C1ExpanderExtender ID="ExpanderExtender2" runat="server" TargetControlID="Panel2"
		Animated-Effect="custom1" Expanded="false"></Expander:C1ExpanderExtender>
	<h4>
		Custom animation using jQuery effects</h4>
	<asp:Panel ID="Panel3" runat="server">
		<div>
			Header</div>
		<div>
			Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.
			Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,
			cursus in.
		</div>
	</asp:Panel>
	<Expander:C1ExpanderExtender ID="ExpanderExtender3" runat="server" TargetControlID="Panel3"
		Animated-Effect="custom2"></Expander:C1ExpanderExtender>
	<h4>
		Disabled animation</h4>
	<asp:Panel ID="Panel4" runat="server">
		<div>
			Header</div>
		<div>
			Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.
			Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,
			cursus in.
		</div>
	</asp:Panel>
	<Expander:C1ExpanderExtender ID="ExpanderExtender4" runat="server" TargetControlID="Panel4"
		Animated-Disabled="true"></Expander:C1ExpanderExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		The sample demonstrates how to use different animation effects.</p>
	<p>&nbsp;</p>
	<p>
		The Animated property is used in order to change the animation effect.</p>
	<p>&nbsp;</p>
	<p>
		The first expander demonstrates default expand/collapse animation effect.</p>
	<p>
		The second expander demonstrates custom animation (custom1) with "easeOutExpo" easing and duration of 900ms.</p>
	<p>
		The third expander demonstrates custom animation(custom2) using jQuery effects. 
		"puff" effect is used for expand animation and "explode" for the collapse animation.
	</p>
	<p>
		For the fourth expander the animation is disabled. 
		The Animated-Disabled property is set to true.
	</p>
	Following is implementation code for the custom1 and custom2 animations:
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

		Following options(options parameter) are available for the animation function:
		<ul>
			<li>expand - value of true indicates that content element must be expanded.. </li>
			<li>horizontal - value of true indicates that expander is horizontally orientated (when expandDirection is left or right).</li>
			<li>content - jQuery object that contains content element to be expanded or collapsed. </li>
		</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
