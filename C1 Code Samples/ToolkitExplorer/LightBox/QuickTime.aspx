<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="QuickTime.aspx.cs" Inherits="ToolkitExplorer.LightBox.QuickTime" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="Panel1" runat="server">
        <a title="Despicable Me" rel="wijlightbox;player=qt" href="http://trailers.apple.com/movies/universal/despicableme/despicableme-tlr1_r640s.mov?width=640&height=360">
            <img src="images/small/quicktime.png" alt="Despicable Me" /></a>
    </asp:Panel>

    <wijmo:C1LightBoxExtender ID="Panel1_C1LightBoxExtender" runat="server" 
        TargetControlID="Panel1" TextPosition="Outside" ControlsPosition="Outside" ShowCounter="false">
    </wijmo:C1LightBoxExtender>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
C1LightBox supports hosting media that could be played by QuickTime.
</p>

<p>
If the URL is the file with following extension, QuickTime Object will be used to play them by default. They are ".dv", ".mov", ".moov", ".movie", ".mp4", ".avi", ".mpg", ".mpeg".
</p>

<p>
You can also force the LightBox to use the QuickTime explicitly by setting the <b>Player</b> property to "Qt".
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
