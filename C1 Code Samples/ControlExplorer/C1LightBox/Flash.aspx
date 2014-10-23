<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Flash.aspx.cs" Inherits="ControlExplorer.C1LightBox.Flash" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<wijmo:C1LightBox ID="C1LightBox1" runat="server" TextPosition="Outside" ControlsPosition="Outside" ShowCounter="false">
    <Items>
        <wijmo:C1LightBoxItem ID="LightBoxItem1" 
            ImageUrl="~/C1LightBox/images/small/happygirl.png" 
            LinkUrl="~/C1LightBox/movies/skip.swf" Title="Happy Girl" 
            Text="Happy Girl"/>
        <wijmo:C1LightBoxItem ID="LightBoxItem2" 
            ImageUrl="~/C1LightBox/images/small/caveman.png" 
            LinkUrl="~/C1LightBox/movies/caveman.swf" Text="Cave Man" 
            Title="Cave Man" />
        <wijmo:C1LightBoxItem ID="LightBoxItem3" 
            ImageUrl="~/C1LightBox/images/small/oldman.png" 
            LinkUrl="~/C1LightBox/movies/old_man.swf" Text="Old Man" Title="Old Man" />
    </Items>
</wijmo:C1LightBox>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This sample demonstrates displaying SWF content in the <strong>C1LightBox</strong>.
</p>

<p>
<strong>C1LightBox</strong> creates the Flash Object automatically if the URL points to a SWF file.
</p>

<p>
For URLs that don't explicitly show the file links, we can set the <b>Player</b> property to SWF to force using the Flash Object as content player.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
