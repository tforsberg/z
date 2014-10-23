<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="ExpandDirection.aspx.cs" Inherits="ControlExplorer.Accordion.ExpandDirection" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Accordion"
	TagPrefix="Accordion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <asp:Panel ID="Panel1" runat="server">
                <h3>
                    1</h3>
                <div>
                    <p>
                        Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque.
                        Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a
                        nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada.
                        Vestibulum a velit eu ante scelerisque vulputate.
                    </p>
                </div>
                <h3>
                    2</h3>
                <div>
                    <p>
                        Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus
                        hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum
                        tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
                    </p>
                </div>
                <h3>
                    3</h3>
                <div>
                    <p>
                        Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus
                        pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque
                        semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
                        nisi, eu iaculis leo purus venenatis dui.
                    </p>
                </div>
                <h3>
                    4</h3>
                <div>
                    <p>
                        Cras dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada
                        fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et
                        ultrices posuere cubilia Curae; Aenean lacinia mauris vel est.
                    </p>
                    <p>
                        Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus. Class
                        aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
                    </p>
                </div>
            </asp:Panel>
			<Accordion:C1AccordionExtender ID="Panel1_C1AccordionExtender" runat="server" TargetControlID="Panel1"
				ExpandDirection="Bottom">
			</Accordion:C1AccordionExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		The sample shows how to change the direction of the expanding content area from the client side.
	</p>
	<p>&nbsp;</p>
	<p>
		The <b>expandDirection</b> option is used to switch expand direction:
<pre class="controldescription-code">
&lt;script type="text/javascript" language="javascript"&gt;
	function setExpandDirection(direction) {
		// clear fixed padding values that was assigned 
		// during vertical animation.
		// Note, this is not needed when you use the server 
		// side ExpandDirection property.
		$("#&lt;%=Panel1.ClientID%&gt; &gt; .ui-accordion-content")
							.css("paddingTop", "")
							.css("paddingBottom", "");
		// change expandDirection option.
		$("#&lt;%=Panel1.ClientID%&gt;").wijaccordion("option", 
								"expandDirection", direction);
 
	}
&lt;/script&gt;
</pre>

	</p>
	<p>&nbsp;</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<script type="text/javascript" language="javascript">
	function setExpandDirection(direction) {
		// clear fixed padding values that was assigned 
		// during vertical animation.
		// Note, this is not needed when you use the server 
		// side ExpandDirection property.
		$("#<%=Panel1.ClientID%> > .ui-accordion-content")
							.css("paddingTop", "")
							.css("paddingBottom", "");
		// change expandDirection option.
		$("#<%=Panel1.ClientID%>").wijaccordion("option", 
								"expandDirection", direction);

	}
</script>
    <fieldset class="radio">
        <legend>Select expand direction</legend>
		<label><input type="radio" name="accordionExpanDirection" value="top" onclick="setExpandDirection('top');" />top</label>
		<label><input type="radio" name="accordionExpanDirection" value="right" onclick="setExpandDirection('right');" />right</label>
		<label><input type="radio" name="accordionExpanDirection" value="bottom" onclick="setExpandDirection('bottom');" checked="checked" />bottom</label>
		<label><input type="radio" name="accordionExpanDirection" value="left" onclick="setExpandDirection('left');" />left</label>
    </fieldset>
</asp:Content>
