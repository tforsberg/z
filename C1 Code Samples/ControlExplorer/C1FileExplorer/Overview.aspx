<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1FileExplorer.OverView" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1FileExplorer" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <cc1:C1FileExplorer ID="C1FileExplorer1" runat="server" InitPath="~/C1FileExplorer/Example" SearchPatterns="*.jpg,*.png,*.jpeg,*.gif">
    </cc1:C1FileExplorer>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1FileExplorer</strong> completely mimics the Windows Explorer functionality and is entirely 
    built upon C1 controls. You can easily add it to your page, organize your files and folders such as <strong>creating a new folder, rename, delete or copy a folder</strong>, etc. 
    </p>
    <p>
        You can also perform these actions through keyboard, <strong>C1FileExplorer</strong> provides an interface to define custom shortcut keys.
    </p>
    <p>
        <strong>C1FileExplorer</strong> supports kinds of layout customization, you can configure how to show folder/files, such as with detailed information or just thumbnnail.
        And you may want to hide some child controls such as the toolbar, addressbox, etc.
    </p>
    <p>
        If there are too many files to list, you can just show specific folder/files by <strong>Filtering</strong>, or group them by <strong>Paging</strong>.
    </p>
    <p>
        You will learn these powerful functionalities from other samples in this section.
    </p>
</asp:Content>
