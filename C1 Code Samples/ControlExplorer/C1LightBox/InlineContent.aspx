<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="InlineContent.aspx.cs" Inherits="ControlExplorer.C1LightBox.InlineContent" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<wijmo:C1LightBox ID="C1LightBox1" runat="server" TextPosition="Outside" ControlsPosition="Outside" Player="Inline">
    <Items>
        <wijmo:C1LightBoxItem ID="LightBoxItem1" Title="Abstract 1" Text="Abstract 1"
            ImageUrl="http://lorempixel.com/200/150/abstract/1" 
            LinkUrl="#content-1" />
        <wijmo:C1LightBoxItem ID="LightBoxItem2" Title="Abstract 2" Text="Abstract 2"
            ImageUrl="http://lorempixel.com/200/150/abstract/1" 
            LinkUrl="#content-2" />
        <wijmo:C1LightBoxItem ID="C1LightBoxItem3" Title="Abstract 3" Text="Abstract 3"
            ImageUrl="http://lorempixel.com/200/150/abstract/1" 
            LinkUrl="#content-3" />
    </Items>
</wijmo:C1LightBox>

<div id="content-1" style="display:none;">
    <p>This is inline content opened in wijlightbox.</p>
    <p>Our new web stack is the ultimate kit for web development. We have tools that range from pure client-side development to robust server-side development all powered by our core technology: Wijmo. This studio will help your team take on any style of web development all while using a single framework. We have you covered from WebForms to MVC and from client-side to server-side programming.</p>
</div>
 
 
<div id="content-2" style="display:none;">
    <p>As we see modern browsers launching new versions, we hear a lot about HTML5. HTML5 is a working spec from the W3C that is defining a revolution in how we develop web apps. When comes to data visualization, we believe that Scalable Vector Graphics (SVG) and HTML5 are the future of the Web. Learn more about how ComponentOne is utilizing HTML5 & SVG!</p>
</div>
 
<div id="content-3" style="display:none;">
    <p>Greetings earthlings, start building a better web with Wijmo.</p>
    <p>Wijmo is a complete kit of over 30 UI widgets with everything from interactive menus to rich charts. If you know jQuery, you know Wijmo. Complete with documentation and professional support, every widget is hand-crafted and includes premium themes.</p>
</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
The <strong>C1Lightbox</strong> control can disaply text content in a popup interface without ever leaving the page to view media.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
