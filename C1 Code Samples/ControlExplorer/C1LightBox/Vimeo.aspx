<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Vimeo.aspx.cs" Inherits="ControlExplorer.C1LightBox.Vimeo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<wijmo:C1LightBox ID="C1LightBox1" runat="server" Player="Iframe" TextPosition="Outside" ControlsPosition="Outside" >
	<Items>
		<wijmo:C1LightBoxItem ID="LightBoxItem1" Title="Mindrelic - time lapse summer/autumn 2009"
			ImageUrl="~/C1LightBox/images/small/mindrelic.png" 
			LinkUrl="http://player.vimeo.com/video/8087882" />
		<wijmo:C1LightBoxItem ID="LightBoxItem2" Title="Rochester NY timelapse"
			ImageUrl="~/C1LightBox/images/small/rochester.png" 
			LinkUrl="http://player.vimeo.com/video/5244737" />
		<wijmo:C1LightBoxItem ID="C1LightBoxItem3" Title="Lightning test"
			ImageUrl="~/C1LightBox/images/small/lightning.png" 
			LinkUrl="http://player.vimeo.com/video/5085363" />
		<wijmo:C1LightBoxItem ID="C1LightBoxItem4" Title="Quick preview of Iceflow"
			ImageUrl="~/C1LightBox/images/small/iceflow.png" 
			LinkUrl="http://player.vimeo.com/video/19746784" />
	</Items>
</wijmo:C1LightBox>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This is a video content sample with source from Vimeo.
</p>

<p>
This sample uses an iframe to host the external content, so the <b>Player</b> property is set to "Iframe".
</p>

<p>
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
