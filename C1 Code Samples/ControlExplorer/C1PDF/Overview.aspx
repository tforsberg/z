<%@ Page Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1PDF.Overview" %>

<asp:Content ID="content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LinkButton ID="btnexport" runat="server" OnClick="btnexport_Click" Text="Create PDF" Font-Underline="true" />
</asp:Content>

<asp:Content ID="content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        Create Adobe PDF documents from your apps using <strong>ComponentOne PDF</strong> for .NET. The benefit of creating PDFs from your .NET apps is that you can essentially create databound PDF documents. 
        This sample creates a Pdf file with NorthWind product information. Each product category is placed on a separate page and added to an outline structure with bookmarks.
    </p>
</asp:Content>
