<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="FullSize.aspx.cs" Inherits="ToolkitExplorer.LightBox.FullSize" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<asp:Panel ID="Panel1" runat="server">
		<a id="lightbox" href="http://lorempixum.com/1600/1200/sports/1" rel="wijlightbox;player=img">
			<img src="http://lorempixum.com/120/90/sports/1" title="Sports 1" alt="Sports 1" /></a>	
	</asp:Panel>

	<wijmo:C1LightBoxExtender ID="Panel1_C1LightBoxExtender" runat="server" 
		TargetControlID="Panel1" Player="Img" DialogButtons="Close, FullSize"  
		TextPosition="TitleOverlay" Modal="true">
	</wijmo:C1LightBoxExtender>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This sample demonstrates the full-size feature of the C1LightBox.
</p>

<p>
The <b>DialogButtons</b> property determines the visibility of dialog box control buttons, which is a enum property with the following possible values:
</p>
<ul>
<li>None - No dialog box buttons are displayed.</li>
<li>Close - Displays the Close button.</li>
<li>FullSize - Dsiplays the FullSize button.</li>
</ul>

<p>
If the FullSize button is displayed, then the user can expand the Lightbox to conver the entire window by clicking the FullSize button.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
