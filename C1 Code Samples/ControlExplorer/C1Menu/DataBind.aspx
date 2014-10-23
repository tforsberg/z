<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DataBind.aspx.cs" Inherits="ControlExplorer.C1Menu.DataBind" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Menu"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        div#ctl00_ctl00_MainContent_WidgetTabs_ctl00 {
            overflow: visible;
            overflow-y: visible;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Menu runat="server" ID="Menu1" DataSourceID="XmlDataSource1"></wijmo:C1Menu>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server"
        DataFile="~/App_Data/menu_structure.xml" XPath="/root/menuitem"></asp:XmlDataSource>
    <asp:SiteMapDataSource runat="server" ID="SiteMapDataSource1" ShowStartingNode="false" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1Menu</strong> supports binding to a data source, such as an XML, SiteMap, 
    or you can even read data from an Access data source and create the <strong>C1Menu</strong> hierarchy dynamically.
    </p>
    <p>The following properties are used in this sample</p>
    <ul>
        <li>DataSourceID</li>
    </ul>
    <p>
        In this sample, if you check the <strong>XmlDataSource</strong> radio button, then the 
    <strong>C1Menu</strong> is bound to a XML data source, otherwise, a SiteMapDataSource.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth">
                    <label>Select DataBinding Source</label>
                </li>
                <li>
                    <asp:RadioButtonList runat="server" ID="RblDataSource" RepeatDirection="Horizontal" AutoPostBack="true"
                        OnSelectedIndexChanged="RblDataSource_SelectedIndexChanged">
                        <asp:ListItem Text="XmlDataSource" Value="XmlDataSource" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="SiteMapDataSource" Value="SiteMapDataSource"></asp:ListItem>
                    </asp:RadioButtonList>
                </li>
            </ul>
        </div>
    </div>

</asp:Content>
