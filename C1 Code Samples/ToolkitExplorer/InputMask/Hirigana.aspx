<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Hirigana.aspx.cs" Inherits="ControlExplorer.C1InputMask.Hiragana" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    	<asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
    <wijmo:C1InputMaskExtender ID="C1InputMask1" TargetControlID="TextBox1" runat="server" FormatMode="Advanced" MaskFormat="\Ｊ{5}">
    </wijmo:C1InputMaskExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how you can use the <b>MaskFormat</b> property and <b>FormatMode</b> property to allow input the hirigana character.
    </p>
</asp:Content>
