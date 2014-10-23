<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="MaxLength.aspx.cs" Inherits="ControlExplorer.C1InputText.MaxLength" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <wijmo:C1InputText ID="C1InputText1" runat="server" MaxLength="5" Text="12345"></wijmo:C1InputText>
    </p>
    <br />
    <p>
        <strong>MaxLength:</strong> 5
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how you can use the <b>MaxLength</b> property to allow only input 5 character.
    </p>
</asp:Content>
