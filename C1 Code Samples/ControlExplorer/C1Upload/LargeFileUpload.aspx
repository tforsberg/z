<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="LargeFileUpload.aspx.cs" Inherits="ControlExplorer.C1Upload.LargeFileUpload" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Upload" tagprefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Upload ID="C1Upload1" runat="server" ShowUploadedFiles="true" MaximumFiles="1" Width="300px"  />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>ASP.NET by default allows the maximum file size upload to be 4 MB. If you use a third-party ASP.NET File Upload to upload large files and you receive a notification that the upload has failed due to the maximum file size limit, then the respective component does not support large file uploads.</p>

    <p>In order to override the maximum file size restriction, you need to modify the web.config file and enable the file upload process to handle larger files. With <strong>C1Upload</strong> you can quickly upload files over 4 MB. </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
