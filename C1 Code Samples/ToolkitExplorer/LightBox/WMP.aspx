<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="WMP.aspx.cs" Inherits="ToolkitExplorer.LightBox.WMP" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="Panel1" runat="server">
        <a id="lightbox" href="movies/sample.mpeg" rel="wijlightbox;player=wmp"   width="600" height="450">
		    <img src="images/small/mediaplayer.png" title="Movie" alt="Movie played by Windows Media Player" /></a> 
    </asp:Panel>

    <wijmo:C1LightBoxExtender ID="Panel1_C1LightBoxExtender" runat="server" 
        TargetControlID="Panel1" Player="Wmp" MaxWidth="600" MaxHeight="450"  TextPosition="Outside" ControlsPosition="Outside">
    </wijmo:C1LightBoxExtender>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
C1LightBox supports hosting media played by Windows Media Player.
</p>

<p>
If the file URL ends with the following extensions, a Windows Media Player Object will be created to play it by default: ".asf", ".avi", ".mpg", ".mpeg", ".wm", ".wmv".
</p>

<p>
You can also force the LightBox to use the Windows Media Player explicitly by setting the <b>Player</b> property to "Wmp".
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
