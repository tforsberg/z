<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Hirigana.aspx.cs" Inherits="ControlExplorer.C1InputMask.Hiragana" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <wijmo:C1InputMask ID="C1InputMask1" runat="server" FormatMode="Advanced" MaskFormat="\Ｊ{5}">
        </wijmo:C1InputMask>
    </p>
    <p>
        <br />
        <strong>MaskFormat: </strong>\Ｊ{5}
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how you can use the <b>MaskFormat</b> property and <b>FormatMode</b> property to allow input the hirigana character.
    </p>
</asp:Content>
