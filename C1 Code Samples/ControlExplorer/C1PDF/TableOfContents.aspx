<%@ Page Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="TableOfContents.aspx.cs" Inherits="ControlExplorer.C1PDF.TableOfContents" %>

<asp:Content ID="content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LinkButton ID="exportbtn" runat="server" Text="Create PDF" OnClick="exportbtn_Click" Font-Underline="true" />

</asp:Content>

<asp:Content ID="content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample creates a document with a table of contents. It keeps a list of bookmarks added to the document as it is created.
       When the document is complete, the sample uses the list to create a table of contents page with local links to each topic. Finally,
       the table of contents is moved to the start of the document using the <strong>Pages</strong> collection. This demo requires <strong>Adobe Reader</strong> to view the PDF.
    </p>
</asp:Content>
