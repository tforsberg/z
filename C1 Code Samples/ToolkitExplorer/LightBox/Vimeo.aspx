<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Vimeo.aspx.cs" Inherits="ToolkitExplorer.LightBox.Vimeo" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="Panel1" runat="server">
        <a title="Mindrelic - time lapse summer/autumn 2009" href="http://player.vimeo.com/video/8087882" rel="wijlightbox;player=iframe"><img class=border alt="" src="images/small/mindrelic.png"></a>
		<a title="Rochester NY timelapse" href="http://player.vimeo.com/video/5244737" rel="wijlightbox;player=iframe"><img class=border alt="" src="images/small/rochester.png"></a>
		<a title="Lightning test" href="http://player.vimeo.com/video/5085363" rel="wijlightbox;player=iframe"><img class=border alt="" src="images/small/lightning.png"></a>
		<a title="Quick preview of Iceflow" href="http://player.vimeo.com/video/19746784" rel="wijlightbox;player=iframe"><img class=border alt="" src="images/small/iceflow.png"></a>
    </asp:Panel>

    <wijmo:C1LightBoxExtender ID="Panel1_C1LightBoxExtender" runat="server" 
        TargetControlID="Panel1" Player="Iframe" TextPosition="Outside" ControlsPosition="Outside">
    </wijmo:C1LightBoxExtender>


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
