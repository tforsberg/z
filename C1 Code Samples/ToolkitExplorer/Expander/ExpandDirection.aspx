<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ExpandDirection.aspx.cs" Inherits="ControlExplorer.Expander.ExpandDirection" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Expander"
	TagPrefix="Expander" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style type="text/css" media="all">
		.ui-expander-left.wijmo-wijexpander .ui-expander-header,
		.ui-expander-right.wijmo-wijexpander .ui-expander-header,
		.ui-expander-left.wijmo-wijexpander .ui-expander-header a,
		.ui-expander-right.wijmo-wijexpander .ui-expander-header a {
			width: 32px;
			text-align: center;
			text-overflow:ellipsis;
			overflow:hidden;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <asp:Panel ID="Panel1" runat="server">
                <h3>
                    header
                </h3>
                <div>                    
                    wijexpander widget allows the user to show or hide any embedded or external content by clicking on an expander header.                    
                </div>
            </asp:Panel>
			<Expander:C1ExpanderExtender ID="Panel1_ExpanderExtender" runat="server" TargetControlID="Panel1">
			</Expander:C1ExpanderExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		The sample shows how to change the direction of the expanding content area from the client side.
	</p>
	<p>&nbsp;</p>
	The <b>expandDirection</b> option is used to switch expand direction:

<pre class="controldescription-code">
&lt;script type="text/javascript" language="javascript"&gt;
	function setExpandDirection(direction) {
		$("#&lt;%=Panel1.ClientID%&gt;")
				.wijexpander("option", "expandDirection", direction);
	}
&lt;/script&gt;
</pre>
	
	<p>&nbsp;</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
                <script type="text/javascript" language="javascript">
                	function setExpandDirection(direction) {
                		$("#<%=Panel1.ClientID%>").wijexpander("option", "expandDirection", direction);

                	}    
                </script>
    <fieldset class="radio">
        <legend>Select expand direction</legend>
		<label><input type="radio" name="ExpandDirection" value="top" onclick="setExpandDirection('top');" />top</label>
		<label><input type="radio" name="ExpandDirection" value="right" onclick="setExpandDirection('right');" />right</label>
		<label><input type="radio" name="ExpandDirection" value="bottom" onclick="setExpandDirection('bottom');" checked="checked" />bottom</label>
		<label><input type="radio" name="ExpandDirection" value="left" onclick="setExpandDirection('left');" />left</label>
    </fieldset>
</asp:Content>
