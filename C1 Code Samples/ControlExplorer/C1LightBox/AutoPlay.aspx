<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="AutoPlay.aspx.cs" Inherits="ControlExplorer.C1LightBox.AutoPlay" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<wijmo:C1LightBox ID="C1LightBox1" runat="server" Player="Img" ShowNavButtons="false" AutoPlay="true">
    <Items>
        <wijmo:C1LightBoxItem ID="LightBoxItem1" Title="Sport1" Text="Sport1"
            ImageUrl="http://lorempixum.com/120/90/sports/1" 
            LinkUrl="http://lorempixum.com/600/400/sports/1" />
        <wijmo:C1LightBoxItem ID="LightBoxItem2" Title="Sport2" Text="Sport2"
            ImageUrl="http://lorempixum.com/120/90/sports/2" 
            LinkUrl="http://lorempixum.com/600/400/sports/2" />
        <wijmo:C1LightBoxItem ID="C1LightBoxItem3" Title="Sport3" Text="Sport3"
            ImageUrl="http://lorempixum.com/120/90/sports/3" 
            LinkUrl="http://lorempixum.com/600/400/sports/3" />
        <wijmo:C1LightBoxItem ID="C1LightBoxItem4" Title="Sport4" Text="Sport4"
            ImageUrl="http://lorempixum.com/120/90/sports/4" 
            LinkUrl="http://lorempixum.com/600/400/sports/4" />
    </Items>
</wijmo:C1LightBox>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This sample demonstrates the auto-play feature of <strong>C1LightBox</strong>.
</p>

<p>
LightBox automatically cycles through pages in order when the <b>AutoPlayer</b> property is set True.
</p>

<p>
The <b>Delay</b> property determines how long each page is displayed. When the last page is reached, by default the LightBox continues cycling from the first page again. You can disable this loop by setting
the <b>Loop</b> property to False.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
