<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="ContentUrl.aspx.cs" Inherits="Dialog_ContentUrl" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Dialog"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <cc1:C1Dialog ID="dialog" runat="server" Width="760px" Height="460px" Stack="True"
        CloseText="Close" Title="Wijmo" ContentUrl="http://www.wijmo.com">
        <CollapsingAnimation>
            <Animated Effect="blind" />
        </CollapsingAnimation>
    </cc1:C1Dialog>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample shows a dialog box with a inner iFrame that links to another URL.
    </p>
    <p>The <b>ContentUrl</b> property sets a URL string that specifies the URL for the iFrame
            element inside of a <strong>C1Dialog</strong> control.
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
