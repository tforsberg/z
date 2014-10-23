<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.C1Accordion.Animation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Accordion"
	TagPrefix="C1Accordion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<h3>Animation with Easing</h3>
	<C1Accordion:C1Accordion ID="C1Accordion1" runat="server" Animated-Effect="easeInOutCirc" Width="80%">
		<Panes>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane1" runat="server">
				<Header>
					First
				</Header>
				<Content>
					<p>
						Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque.
						Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a
						nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada.
						Vestibulum a velit eu ante scelerisque vulputate.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane2" runat="server">
				<Header>
					Second
				</Header>
				<Content>
					<p>
						Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus
						hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum
						tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane3" runat="server">
				<Header>
					Third
				</Header>
				<Content>
					<p>
						Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus
						pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque
						semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
						nisi, eu iaculis leo purus venenatis dui.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
		</Panes>
	</C1Accordion:C1Accordion>
	<br />
	<h3>Disabled Animation</h3>
	<C1Accordion:C1Accordion ID="C1Accordion2" runat="server" Animated-Disabled="True" Width="80%">
		<Panes>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane4" runat="server">
				<Header>
					First
				</Header>
				<Content>
					<p>
						Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque.
						Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a
						nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada.
						Vestibulum a velit eu ante scelerisque vulputate.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane5" runat="server">
				<Header>
					Second
				</Header>
				<Content>
					<p>
						Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus
						hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum
						tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane6" runat="server">
				<Header>
					Third
				</Header>
				<Content>
					<p>
						Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus
						pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque
						semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
						nisi, eu iaculis leo purus venenatis dui.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
		</Panes>
	</C1Accordion:C1Accordion>
	<br />
	<h3>Custom Animation</h3>
	<C1Accordion:C1Accordion ID="C1Accordion3" runat="server" Animated-Effect="custom1" Width="80%">
		<Panes>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane7" runat="server">
				<Header>
					First
				</Header>
				<Content>
					<p>
						Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque.
						Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a
						nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada.
						Vestibulum a velit eu ante scelerisque vulputate.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane8" runat="server">
				<Header>
					Second
				</Header>
				<Content>
					<p>
						Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus
						hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum
						tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane9" runat="server">
				<Header>
					Third
				</Header>
				<Content>
					<p>
						Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus
						pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque
						semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
						nisi, eu iaculis leo purus venenatis dui.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
		</Panes>
	</C1Accordion:C1Accordion>
	<script id="scriptInit" type="text/javascript">
		$(document).ready(function () {
			jQuery.wijmo.wijaccordion.animations.custom1 = function (options) {
				this.slide(options, {
					easing: options.down ? "easeOutBounce" : "swing",
					duration: options.down ? 1000 : 200
				});
			}
		});
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates how to use different animation effects with the <strong>C1Accordion</strong> control.</p>
	<p>
		The <strong>Animated </strong>property is used in order to change the animation effect.</p>
	<p>
		For the first accordion, the <strong>Animated.Effect </strong>property is set to "easeInOutCirc" in
		order to change easing effect.</p>
	<p>
		For the second accordion, the Animated-Disabled property is set to True and animation
		is disabled.</p>
	<p>
		For the third accordion, we are using our own custom animation effect. The 
		<strong>Animated.Effect
		</strong>property is set to "custom1". Please, note that the "custom1" effect is defined using client-side script as follows:

<pre class="controldescription-code">
	$(document).ready(function () {
		jQuery.wijmo.wijaccordion.animations.custom1 = function (options) {
			this.slide(options, {
				easing: options.down ? "easeOutBounce" : "swing",
				duration: options.down ? 1000 : 200
			});
		}
	});	
</pre></p>
	<p>
		Available options(options parameter) for the animation function include:
	</p>
	<ul>
		<li><strong>down </strong>– If True, this indicates that the index of the pane should be expanded higher than
			the index of the pane that must be collapsed. </li>
		<li><strong>horizontal </strong>– If True, this indicates that the accordion has a horizontal orientation
			(when the expandDirection is left or right). </li>
		<li><strong>rightToLeft</strong> – If True, this indicates that the content element is located before the
			header element (top and left expand direction). </li>
		<li><strong>toShow </strong>– jQuery object that contains the content element(s) that should be shown.
		</li>
		<li><strong>toHide </strong>–jQuery object that contains the content element(s) that should be hidden.
		</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
