<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DataBinding.aspx.cs" Inherits="ControlExplorer.C1TreeView.DataBanding" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1TreeView" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:XmlDataSource ID="XmlDataSource" runat="server" DataFile="~/App_Data/treeview_structure.xml" XPath="root/treeviewnode"></asp:XmlDataSource>
    <asp:SiteMapDataSource ID="SiteMapDataSource" runat="server" ShowStartingNode="False" />

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <wijmo:C1TreeView ID="C1TreeView1" ShowCheckBoxes="true" DataSourceID="SiteMapDataSource" ShowExpandCollapse="true" Width="350px" runat="server">
            </wijmo:C1TreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1TreeView</strong> supports data binding – you can bind to an XML or SiteMap data source, or you can read data from any data source and create the <strong>C1TreeView</strong> hierarchy dynamically.</p>
    <p>
        The following properties are used in this sample to bind <strong>C1TreeView </strong>to a data source.</p>
    <ul>
        <li><strong>DataSourceID - </strong>to specify the data source to be bound.</li>
        <li><strong>C1TreeViewNodeBinding - </strong>to determine the mapping relationship of the attributes in <strong>XmlDataSource</strong> and the data field of C1TreeView. </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li class="fullwidth"><label class="settinglegend">Select DataBinding Source:</label></li>
                        <li class="fullwidth">
                            <asp:DropDownList ID="dataSource" AutoPostBack="true" runat="server" OnSelectedIndexChanged="dataSource_SelectedIndexChanged" Width="160px">
                                <asp:ListItem>SiteMap Data Source</asp:ListItem>
                                <asp:ListItem>XML Data Source</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                    </ul>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
