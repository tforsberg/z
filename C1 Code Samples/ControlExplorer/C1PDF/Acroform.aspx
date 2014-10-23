<%@ Page Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Acroform.aspx.cs" Inherits="ControlExplorer.C1PDF.Acroform" %>

<asp:Content ID="content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LinkButton ID="btnexport" Text="Create PDF" OnClick="btnexport_Click" runat="server" Font-Underline="true" />

</asp:Content>

<asp:Content ID="content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>ComponentOne PDF</strong> supports the creation of Acrobat Forms, documents that contain fields that are filled out by users.
         Fields are created using the <strong>AddField</strong> method. Several field types are supported, including text boxes, check boxes, combo boxes, radio buttons, push buttons,
         list boxes and signatures. This demo requires <strong>Adobe Reader</strong> to view the PDF.
    </p>
</asp:Content>
