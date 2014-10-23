<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="AutoSize.aspx.cs" Inherits="ToolkitExplorer.LightBox.AutoSize" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<asp:Panel ID="Panel1" runat="server">
		<a href="http://lorempixum.com/600/400/sports/1" rel="wijlightbox[stock];player=img">
			<img src="http://lorempixum.com/120/90/sports/1" title="Sports 1" alt="Sports 1" /></a> 
		<a href="http://lorempixum.com/600/400/sports/2" rel="wijlightbox[stock];player=img">
			<img src="http://lorempixum.com/120/90/sports/2" title="Sports 2" alt="Sports 2" /></a> 
		<a href="http://lorempixum.com/600/400/sports/3" rel="wijlightbox[stock];player=img">
			<img src="http://lorempixum.com/120/90/sports/3" title="Sports 3" alt="Sports 3" /></a> 
		<a href="http://lorempixum.com/600/400/sports/4" rel="wijlightbox[stock];player=img">
			<img src="http://lorempixum.com/120/90/sports/4" title="Sports 4" alt="Sports 4" /></a>
	</asp:Panel>

	<wijmo:C1LightBoxExtender ID="Panel1_C1LightBoxExtender" runat="server" 
		TargetControlID="Panel1" Player="Img" TextPosition="TitleOverlay" AutoSize="true" KeyNav="true">
	</wijmo:C1LightBoxExtender>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
C1LightBox can resize automatically according to the content image's width and height. This makes sure images are displayed with the correct width/height ratio.
</p>

<p>
Enabled automatic resizing by setting the <b>AutoSize</b> property to True.
</p>

<p>
The <b>ResizeAnimation</b> property determines the animation effect when the container changes the size. <b>ResizeAnimation.Animated</b> property supports the following values:

</p>
<ul>
<li><strong>None</strong> - No animation.</li>
<li><strong>Wh</strong> - Resize the width in advance of height.</li>
<li><strong>Hw</strong> - Resize the height in advance of width.</li>
<li><strong>Sync</strong> - Resize both the width and height at the same time.</li>
</ul>
<p>
Please notice that the auto-size feature only works for Image content.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
