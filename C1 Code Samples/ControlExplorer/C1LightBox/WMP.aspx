<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="WMP.aspx.cs" Inherits="ControlExplorer.C1LightBox.WMP" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<wijmo:C1LightBox ID="C1LightBox1" runat="server" Player="Wmp" MaxWidth="600" MaxHeight="450"  TextPosition="Outside" ControlsPosition="Outside" >
	<Items>
		<wijmo:C1LightBoxItem ID="LightBoxItem1" Title="Movie" Text="Movie played by Windows Media Player" 
			ImageUrl="~/C1LightBox/images/small/mediaplayer.png" 
			LinkUrl="~/C1LightBox/movies/sample.mpeg" />
	</Items>
</wijmo:C1LightBox>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
<strong>C1LightBox</strong> supports hosting media played by Windows Media Player.
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
