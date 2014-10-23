<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="FullSize.aspx.cs" Inherits="ControlExplorer.C1LightBox.FullSize" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<wijmo:C1LightBox ID="C1LightBox1" runat="server" Player="Img" DialogButtons="Close, FullSize"  
		TextPosition="TitleOverlay" Modal="true">
	<Items>
		<wijmo:C1LightBoxItem ID="LightBoxItem1" Title="Sport1" Text="Sport1" 
			ImageUrl="http://lorempixum.com/120/90/sports/1" 
			LinkUrl="http://lorempixum.com/1600/1200/sports/1" />
	</Items>
</wijmo:C1LightBox>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This sample demonstrates the full-size feature of the <strong>C1LightBox</strong> control.
</p>

<p>
The <b>DialogButtons</b> property determines the visibility of dialog box control buttons, which is a enum property with the following possible values:
</p>
<ul>
<li>None - No dialog box buttons are displayed.</li>
<li>Close - Displays the Close button.</li>
<li>FullSize - Displays the FullSize button.</li>
</ul>

<p>
If the FullSize button is displayed, then the user can expand the Lightbox to conver the entire window by clicking the FullSize button.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
