<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ExpandDirection.aspx.cs" Inherits="ControlExplorer.C1Accordion.ExpandDirection" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Accordion"
	TagPrefix="C1Accordion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
	<C1Accordion:C1Accordion ID="C1Accordion1" runat="server">
		<Panes>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane1" runat="server">
				<Header>1</Header>
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
				<Header>2</Header>
				<Content>
					<p>
						Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus
						hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum
						tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane3" runat="server">
				<Header>3</Header>
				<Content>
					<p>
						Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus
						pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque
						semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
						nisi, eu iaculis leo purus venenatis dui.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="C1AccordionPane4" runat="server">
				<Header>4</Header>
				<Content>
					<p>
						Cras dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada
						fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et
						ultrices posuere cubilia Curae; Aenean lacinia mauris vel est.
					</p>
					<p>
						Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus. Class
						aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
					</p>
				</Content>
			</C1Accordion:C1AccordionPane>
		</Panes>
	</C1Accordion:C1Accordion>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample shows how to change the direction of the expanding content area from the client side and server side.
	</p>
	<p>
		For client side, the <b>expandDirection</b> option is used to switch the direction in which an accordion pane expands:

<pre class="controldescription-code">
&lt;script type="text/javascript" language="javascript"&gt;
	function setExpandDirection(direction) {
		// clear fixed padding values that was assigned 
		// during vertical animation.
		// Note, this is not needed when you use the server 
		// side ExpandDirection property.
		$("#&lt;%=C1Accordion1.ClientID%&gt; &gt; .ui-accordion-content")
				.css("paddingTop", "")
				.css("paddingBottom", "");
		// Change the expandDirection option.
		$("#&lt;%=C1Accordion1.ClientID%&gt;")
					.c1accordion("option", "expandDirection", direction);
	}
&lt;/script&gt;
</pre>
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<script type="text/javascript">
	function setExpandDirection(direction) {
		// clear fixed padding values that was assigned 
		// during vertical animation.
		// Note, this is not needed when you use the server 
		// side ExpandDirection property.
		$("#<%=C1Accordion1.ClientID%> > .ui-accordion-content")
				.css("paddingTop", "")
				.css("paddingBottom", "");
		// Change the expandDirection option.
		$("#<%=C1Accordion1.ClientID%>")
					.c1accordion("option", "expandDirection", direction);
	}

	$(function() {
		$("#<%=CSExpandDirectionDDL.ClientID%>").change(function(event) {
			setExpandDirection($(event.target).find("option:selected").text());
		});
	});
</script>
<div class="settingcontainer">
<div class="settingcontent">
<ul>
	<li class="fullwidth"><label style="width:250px">Select Expand Direction(Client-side):</label>
		<asp:DropDownList ID="CSExpandDirectionDDL" runat="server"></asp:DropDownList>
	</li>
	<li class="fullwidth">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
			<ContentTemplate>
        <label style="width:250px">Select Expand Direction(Server-side):</label>
		    <asp:DropDownList ID="SSExpandDirectionDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SSExpandDirectionDDL_SelectedIndexChanged"></asp:DropDownList>
			</ContentTemplate>
		</asp:UpdatePanel>
	</li>
</ul>
</div>
</div>
</asp:Content>
