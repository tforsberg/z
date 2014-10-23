<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentFunction.aspx.cs" MasterPageFile="~/Wijmo.Master" Inherits="ControlExplorer.C1ToolTip.ContentFunction" %>

<%@ Register Namespace="C1.Web.Wijmo.Controls.C1ToolTip" Assembly="C1.Web.Wijmo.Controls.3" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function testA() {
            return "abc";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="targetContainer">
        <asp:TextBox Height="120" runat="server" ID="textBox1" ToolTip="Textbox1"></asp:TextBox>
        <asp:TextBox Height="120" runat="server" ID="textBox2" ToolTip="Textbox2"></asp:TextBox>
        <input type="text" style="height: 120px;" />
        <input type="text" style="height: 120px;" />
    </div>
    <wijmo:C1ToolTip runat="server" ID="Tooltip1" TargetSelector="#targetContainer :input">
        <Content Function="testA" Content=""></Content>
        <Position>
            <My Top="Bottom"></My>
            <At Left="Right"></At>
        </Position>
        <Animation>
            <Animated Effect="fade"></Animated>
        </Animation>
        <ShowAnimation>
            <Animated Effect="fade"></Animated>
        </ShowAnimation>
        <HideAnimation>
            <Animated Effect="fade"></Animated>
        </HideAnimation>
    </wijmo:C1ToolTip>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how to show dynamic content populated from a client-side callback.</p>
    <p>
        The <strong>Content</strong> property is used to declare the callback function.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
