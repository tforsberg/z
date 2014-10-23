<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="LoadOnDemand.aspx.cs" Inherits="ControlExplorer.C1TreeView.LoadOnDemand" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1TreeView" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SiteMapDataSource ID="SiteMapDataSource" runat="server" ShowStartingNode="False" />
    <wijmo:C1TreeView ID="C1TreeView1" ShowCheckBoxes="true" LoadOnDemand="true" DataSourceID="SiteMapDataSource" ShowExpandCollapse="true" DataBindStartLevel="0" Width="350px" runat="server">
    </wijmo:C1TreeView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1TreeView </strong>supports retrieving data (nodes) dynamically. Child nodes are loaded using AJAX when their parent is expanded.</p>
    <p>
        To enable loading data on demand, the following properties are used in this sample:</p>
    <ul>
        <li><strong>LoadOnDemand </strong>- set to True so that the <strong>C1TreeView </strong>will load only partial data.</li>
        <li><strong>DataBindStartLevel </strong>- for specifying which level to start loading dynamically.</li>
    </ul>
    <p>
        If <strong>DataBindStartLevel</strong> property is set to 0, only root nodes will be bounded at first. In turn, if 1, then both root and first-level nodes will be bound. Its default value is -1, which indicates that this property will be ignored.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
