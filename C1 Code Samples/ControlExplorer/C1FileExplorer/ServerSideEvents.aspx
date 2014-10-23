<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ServerSideEvents.aspx.cs" Inherits="ControlExplorer.C1FileExplorer.ServerSideEvents" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1FileExplorer" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <cc1:C1FileExplorer ID="C1FileExplorer1" runat="server" InitPath="~/C1FileExplorer/Example" SearchPatterns="*.jpg,*.png,*.jpeg,*.gif" >
    </cc1:C1FileExplorer>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1FileExplorer</strong> provides one server side event <strong>ItemCommand</strong>, 
        it will be fired before performing any file/folder operation at the server side.
    </p>
    <p>
        This command takes a parameter of type <strong>C1FileExplorerEventArgs</strong>, 
        which carries related paths and other necessary information for current command. 
    </p>
    <p>
        If you want to cancel current command, just set <strong>args.Cancel</strong> as true.
    </p>
    <p>
        Please refer the source code tab for detailed information.
    </p>
</asp:Content>
