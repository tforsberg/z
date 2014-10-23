<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.Accordion.Animation" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Accordion"
	TagPrefix="Accordion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <h3>
                Animation with Easing</h3>
			<asp:Panel ID="Panel1" runat="server">
                <div>
                    <h3>
                        <a href="#">First</a></h3>
                    <div>
                        <p>
                            Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque.
                            Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a
                            nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada.
                            Vestibulum a velit eu ante scelerisque vulputate.
                        </p>
                    </div>
                </div>
                <div>
                    <h3>
                        <a href="#">Second</a></h3>
                    <div>
                        <p>
                            Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus
                            hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum
                            tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
                        </p>
                    </div>
                </div>
                <div>
                    <h3>
                        <a href="#">Third</a></h3>
                    <div>
                        <p>
                            Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus
                            pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque
                            semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
                            nisi, eu iaculis leo purus venenatis dui.
                        </p>
                    </div>
                </div>
            </asp:Panel>
			<Accordion:C1AccordionExtender ID="Panel1_C1AccordionExtender" runat="server" TargetControlID="Panel1"
			 Animated-Effect="easeInOutCirc" Header="h3">
			</Accordion:C1AccordionExtender>
            <h3>
                Animation Disabled</h3>
			<asp:Panel ID="Panel2" runat="server">
                <div>
                    <h3>
                        <a href="#">First</a></h3>
                    <div>
                        <p>
                            Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque.
                            Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a
                            nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada.
                            Vestibulum a velit eu ante scelerisque vulputate.
                        </p>
                    </div>
                </div>
                <div>
                    <h3>
                        <a href="#">Second</a></h3>
                    <div>
                        <p>
                            Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus
                            hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum
                            tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
                        </p>
                    </div>
                </div>
                <div>
                    <h3>
                        <a href="#">Third</a></h3>
                    <div>
                        <p>
                            Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus
                            pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque
                            semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
                            nisi, eu iaculis leo purus venenatis dui.
                        </p>
                    </div>
                </div>
            </asp:Panel>
			<Accordion:C1AccordionExtender ID="C1AccordionExtender2" runat="server" TargetControlID="Panel2"
			 Animated-Disabled="true" Header="h3">
			</Accordion:C1AccordionExtender>
            <h3>
                Custom Animation</h3>
            <asp:Panel ID="Panel3" runat="server">
                <div>
                    <h3>
                        <a href="#">First</a></h3>
                    <div>
                        <p>
                            Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque.
                            Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a
                            nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada.
                            Vestibulum a velit eu ante scelerisque vulputate.
                        </p>
                    </div>
                </div>
                <div>
                    <h3>
                        <a href="#">Second</a></h3>
                    <div>
                        <p>
                            Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus
                            hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum
                            tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
                        </p>
                    </div>
                </div>
                <div>
                    <h3>
                        <a href="#">Third</a></h3>
                    <div>
                        <p>
                            Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus
                            pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque
                            semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
                            nisi, eu iaculis leo purus venenatis dui.
                        </p>
                    </div>
                </div>
            </asp:Panel>
			<Accordion:C1AccordionExtender ID="C1AccordionExtender3" runat="server" TargetControlID="Panel3"
			 Animated-Effect="custom1" Header="h3">
			</Accordion:C1AccordionExtender>
			<br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		The sample demonstrates how to use different animation effects.</p>
	<p>&nbsp;</p>
	<p>
		The Animated property is used in order to change the animation effect.</p>
	<p>&nbsp;</p>
	<p>
		For the first accordion the Animated-Effect property is set to "easeInOutCirc" in
		order to change easing effect.</p>
	<p>
		For the second accordion the Animated-Disabled property is set to true and animation
		is disabled.</p>
	<p>
		For the third accordion we are using our own custom animation effect. The Animated-Effect
		property is set to "custom1". Please, note "custom1" effect is defined using client
		side script as follows:
<pre class="controldescription-code">
	$(document).ready(function () {
		jQuery.wijmo.wijaccordion.animations.custom1 = function (options) {
			this.slide(options, {
				easing: options.down ? "easeOutBounce" : "swing",
				duration: options.down ? 1000 : 200
			});
		}
	});			
</pre>


		Available options(options parameter) for the animation function include:
		<ul>
			<li>down – If true, indicates that the index of the pane should be expanded higher than
				the index of the pane that must be collapsed. </li>
			<li>horizontal – If true, indicates that the accordion have a horizontal orientation
				(when the expandDirection is left or right). </li>
			<li>rightToLeft – If true, indicates that the content element is located before the
				header element (top and left expand direction). </li>
			<li>toShow – jQuery object that contains the content element(s) should be shown.
			</li>
			<li>toHide –jQuery object that contains the content element(s) should be hidden.
			</li>
		</ul>
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
