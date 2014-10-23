﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1LightBox.Overview" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<wijmo:C1LightBox ID="C1LightBox1" runat="server" Player="Img">
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
The <strong>C1Lightbox</strong> control is used to display images and content in a popup interface without ever leaving the page to view media.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
