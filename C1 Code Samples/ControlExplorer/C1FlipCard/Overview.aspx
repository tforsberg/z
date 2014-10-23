<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    Inherits="FlipCard_Overview" CodeBehind="Overview.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1FlipCard"
    TagPrefix="C1FlipCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <C1FlipCard:C1FlipCard ID="FlipCard1" runat="server">
        <FrontSide>
            This is the <em>front</em> side of the FlipCard.
        </FrontSide>
        <BackSide>
            This is the <em>back</em> side of the FlipCard. 
        </BackSide>
    </C1FlipCard:C1FlipCard>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates the default <strong>C1FlipCard</strong> control behavior.
    </p>
    <p>
        The <strong>C1FlipCard</strong> allows you to show a panel with two sides that can flip between each other.
        Set the <strong>CurrentSide</strong> property to Front or Back to change the showing side. 
        The default value for the <strong>CurrentSide</strong> property is Front.
    </p>
</asp:Content>
