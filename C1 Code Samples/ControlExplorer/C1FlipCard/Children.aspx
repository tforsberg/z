<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    Inherits="FlipCard_Children" CodeBehind="Children.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1FlipCard"
    TagPrefix="C1FlipCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <C1FlipCard:C1FlipCard ID="FlipCard1" runat="server">
        <FrontSide>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/C1BubbleChart/images/chrome.png" />
        </FrontSide>
        <BackSide>
            <asp:Image ID="Image2" runat="server" ImageUrl="~/C1BubbleChart/images/firefox.png" />
        </BackSide>
    </C1FlipCard:C1FlipCard>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates the ability of <strong>C1FlipCard</strong> control to host ASP.NET Web Controls.
    </p>
    <p>
        The <strong>C1FlipCard</strong> allows you to put any content in <strong>FrontPanel</strong> or <strong>BackPanel</strong>.
    </p>
</asp:Content>
