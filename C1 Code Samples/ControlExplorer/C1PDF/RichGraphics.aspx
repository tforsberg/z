<%@ Page Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="RichGraphics.aspx.cs" Inherits="ControlExplorer.C1PDF.RichGraphics" %>

<asp:Content ID="content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:LinkButton ID="btnexport" runat="server" Text="Create PDF" OnClick="btnexport_Click" Font-Underline="true" />
</asp:Content>

<asp:Content ID="content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>ComponentOne PDF</strong> creates documents using commands that are similar to those provided by the .NET Graphics class, and the same objects (fonts, colors, rectangles, points, etc.).
         The main difference is that <strong>C1Pdf</strong> always uses points as units, while the .NET Graphics class uses pixels by default and allows you to switch to other coordinate systems with transforms.
         This demo requires <strong>Adobe Reader</strong> to view the PDF.
    </p>
</asp:Content>
