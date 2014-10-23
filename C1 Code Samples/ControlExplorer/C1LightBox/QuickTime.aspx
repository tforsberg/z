<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="QuickTime.aspx.cs" Inherits="ControlExplorer.C1LightBox.QuickTime" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox"
    TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<wijmo:C1LightBox ID="C1LightBox1" runat="server" Player="Qt" TextPosition="Outside" ControlsPosition="Outside" ShowCounter="false">
	<Items>
		<wijmo:C1LightBoxItem ID="LightBoxItem1" Title="Despicable Me" Text="Despicable Me" 
			ImageUrl="~/C1LightBox/images/small/quicktime.png" 
			LinkUrl="http://trailers.apple.com/movies/universal/despicableme/despicableme-tlr1_r640s.mov?width=640&height=360" />
	</Items>
</wijmo:C1LightBox>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">

<p>
<strong>C1LightBox</strong> supports hosting media that could be played by QuickTime.
</p>

<p>
If the URL is the file with following extension, QuickTime Object will be used to play them by default. They are ".dv", ".mov", ".moov", ".movie", ".mp4", ".avi", ".mpg", ".mpeg".
</p>

<p>
You can also force the LightBox to use the QuickTime explicitly by setting the <b>Player</b> property to "Qt".
</p>

</asp:Content>
