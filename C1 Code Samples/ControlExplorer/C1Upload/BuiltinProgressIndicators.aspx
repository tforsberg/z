<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="BuiltinProgressIndicators.aspx.cs" Inherits="ControlExplorer.C1Upload.BuiltinProgressIndicators" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Upload" tagprefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Upload ID="C1Upload1" runat="server" Width="300px" ShowUploadedFiles="true" IsSeparatorProgress="true" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        By default <strong>C1Upload </strong> features built-in progress indicators below each file being uploaded. In order to disable them you need to set the <strong>IsSeparatorProgress</strong> property to False.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
