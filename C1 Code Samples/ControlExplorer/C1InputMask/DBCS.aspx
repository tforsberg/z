<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DBCS.aspx.cs" Inherits="ControlExplorer.C1InputMask.DBCS" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <wijmo:C1InputMask ID="C1InputMask1" runat="server" FormatMode="Advanced" MaskFormat="\Ａ{5}">
        </wijmo:C1InputMask>
    </p>
    <br />
    <p>
        <strong>MaskFormat: </strong>\Ａ{5}
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how you can use the <b>MaskFormat</b> property and <b>FormatMode</b> property to allow input the DBCS uppercase alphabet.
    </p>
</asp:Content>
