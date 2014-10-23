<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1InputText.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <wijmo:C1InputText runat="server" Format="A" Text="ABC"></wijmo:C1InputText>
    </p>
    <br />
    <p>
        <strong>Options: </strong>Format='A'
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1InputText</strong> can input text to the control according to the specified format.
    </p>
    <p>
        In this example, the default value is "ABC"; only upper case alphabet(A-Z) can be inputed to the control;
                If input the lower case alphabet, it will be converted to upper case alphabet, others will not be accepeted.
    </p>
</asp:Content>
