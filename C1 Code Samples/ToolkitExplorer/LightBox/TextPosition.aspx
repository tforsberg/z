<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="TextPosition.aspx.cs" Inherits="ToolkitExplorer.LightBox.TextPosition" %>
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
        TargetControlID="Panel1" Player="Img">
    </wijmo:C1LightBoxExtender>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This sample demonstrates the possible position or style of text section supported by C1LightBox.
</p>

<p>
To change the position or style of the text section, simply change the <strong>TextPosition</strong> property to one of the following values:
</p>

<ul>
<li>None - No text is displayed.</li>
<li>Inside - Displays the text description inside the content container, side by side with the content.</li>
<li>Outside - Displays the text description outside the content container.</li>
<li>Overlay - Displays the text description inside the content container overlaying the content. </li>
<li>TitleOverlay - Displays the text description inside the content container overlaying the title only.</li>
</ul>

<p>
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">

<script type="text/javascript">
    $(function () {
        $('#textposition').change(function () {
            $("#<%=Panel1.ClientID%>").wijlightbox('option', 'textPosition', $(this).val());
        });

    });
</script>

<div class="demo-options">
<!-- Begin options markup -->
	<h6>
        Text Position:</h6>
			<select id="textposition">
                <option value="inside" selected='true'>inside</option>
                <option value="outside">outside</option>
                <option value="overlay">overlay</option>
                <option value="titleOverlay">titleOverlay</option>
				<option value="none">none</option>
            </select>
<!-- End options markup -->
</div>

</asp:Content>
