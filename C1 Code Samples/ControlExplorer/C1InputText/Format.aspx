<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Format.aspx.cs" Inherits="ControlExplorer.C1InputText.Format" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <wijmo:C1InputText ID="C1InputText1" runat="server" Format="9"></wijmo:C1InputText>
    </p>
    <br />
    <p>
        <strong>Format:</strong> 9
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how you can use the <b>Format</b> property to allow only input numbers (0-9).
    </p>
</asp:Content>
