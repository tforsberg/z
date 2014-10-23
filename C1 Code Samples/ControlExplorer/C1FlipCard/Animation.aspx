<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    Inherits="FlipCard_Animation" CodeBehind="Animation.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1FlipCard"
    TagPrefix="C1FlipCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <C1FlipCard:C1FlipCard ID="FlipCard1" runat="server">
        <Animation Direction="Vertical" Duration="800" />
        <FrontSide>
            This is the <em>front</em> side of the FlipCard.<br />
            This card is flipping <em>vertically</em>.
        </FrontSide>
        <BackSide>
            This is the <em>back</em> side of the FlipCard.<br />
            This card is flipping <em>vertically</em>.
        </BackSide>
    </C1FlipCard:C1FlipCard>
    <br />
    <C1FlipCard:C1FlipCard ID="C1FlipCard2" runat="server" TriggerEvent="MouseEnter">
        <Animation Duration="800" />
        <FrontSide>
            This is the <em>front</em> side of the FlipCard.<br />
            This card is triggered by <em>MouseEnter</em>.
        </FrontSide>
        <BackSide>
            This is the <em>back</em> side of the FlipCard.<br />
            This card is triggered by <em>MouseEnter</em>.
        </BackSide>
    </C1FlipCard:C1FlipCard>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates the usage of animation options of <strong>C1FlipCard</strong> control.
    </p>
    <p>
        The <strong>C1FlipCard</strong> allows you to set properties like <strong>TriggerEvent</strong>, <strong>Direction</strong>, and <strong>Duration</strong>.
    </p>
</asp:Content>
