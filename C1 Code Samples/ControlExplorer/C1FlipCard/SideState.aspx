<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    Inherits="FlipCard_SideState" CodeBehind="SideState.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1FlipCard"
    TagPrefix="C1FlipCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <C1FlipCard:C1FlipCard ID="FlipCard1" runat="server" Width="50" Height="50" OnSideChanged="FlipCard1_SideChanged">
        <FrontSide>BOY</FrontSide>
        <BackSide>GIRL</BackSide>
    </C1FlipCard:C1FlipCard>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Post" OnClick="Button1_Click" />
    <br />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates using <strong>C1FlipCard</strong> control as a checkbox / switcher.
    </p>
    <p>
        The <strong>C1FlipCard</strong> has two states since it has two different sides. The state can be determined by checking the <strong>CurrentSide</strong> property on server post back. Also, when this state gets changed, the <strong>SideChanged</strong> server event will be raised.
    </p>
</asp:Content>
