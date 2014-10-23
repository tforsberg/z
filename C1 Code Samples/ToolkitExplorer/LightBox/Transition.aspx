<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Transition.aspx.cs" Inherits="ToolkitExplorer.LightBox.Transition" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="Panel1" runat="server">
        <a href="http://lorempixum.com/600/400/abstract/1" rel="wijlightbox[stock];player=img">
			<img src="http://lorempixum.com/120/90/abstract/1" title="abstract 1" alt="abstract 1" /></a> 
		<a href="http://lorempixum.com/600/400/abstract/2" rel="wijlightbox[stock];player=img">
			<img src="http://lorempixum.com/120/90/abstract/2" title="abstract 2" alt="abstract 2" /></a> 
		<a href="http://lorempixum.com/600/400/abstract/3" rel="wijlightbox[stock];player=img">
			<img src="http://lorempixum.com/120/90/abstract/3" title="abstract 3" alt="abstract 3" /></a> 
		<a href="http://lorempixum.com/600/400/abstract/4" rel="wijlightbox[stock];player=img">
			<img src="http://lorempixum.com/120/90/abstract/4" title="abstract 4" alt="abstract 4" /></a>
    </asp:Panel>

    <wijmo:C1LightBoxExtender ID="Panel1_C1LightBoxExtender" runat="server" 
        TargetControlID="Panel1" Player="Img" TextPosition="TitleOverlay">
    </wijmo:C1LightBoxExtender>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This sample demonstrates animation effects when transitioning from one page to the next.
</p>

<p>
You can change the animation style by setting the <b>TransAnimation.Animated</b> property with the following values:
</p>

<ul>
<li>None - No animation.</li>
<li>Slide - Slide animation.</li>
<li>Fade - Fade animation.</li>
</ul>


<p>
<b>TransAnimation.Easing</b> determines the easing style to animate.
<b>TransAnimation.Duration</b> determines the time span to animate.
</p>


<p>
For the slide animation, you can also change the slide direction by setting the <b>SlideDirection</b> property to "Horizontal" or "Vertical". 
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">

<script type="text/javascript">
    $(function () {

        $('.option').change(function () {
            $("#<%=Panel1.ClientID%>").wijlightbox('option', {
                transAnimation: { animated: $('#animation').val() },
                slideDirection: $('#direction').val()
            });
        });


    });
</script>

<div class="demo-options">
<!-- Begin options markup -->
	<label>Animation</label><select id="animation" class='option'>
				<option value="fade" selected='true'>fade</option>
				<option value="slide">slide</option>
				<option value="none">none</option>
			</select>
						
	<label>Slide Direction</label><select id="direction" class='option'>
				<option value="horizontal" selected='true'>horizontal</option>
				<option value="vertical">vertical</option>
			</select>
<!-- End options markup -->
</div>

</asp:Content>
