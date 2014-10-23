<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DataBinding.aspx.cs" Inherits="ControlExplorer.C1SiteMap.DataBinding" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1SiteMapDataSource" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1SiteMap" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .fixWidth tr td { width: 33%; }
                
        .wijmo-c1sitemap-node a {
            font-weight: normal;
        }

        .wijmo-c1sitemap-node-level0 a {
            font-size: 1.3em;
            font-weight: bold;
        }

        .wijmo-c1sitemap-node-level1 a {
            font-size: 1.1em;
            font-weight: bold;
        }

        .wijmo-c1sitemap-node-level2 a {
            font-size: 1.1em;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <wijmo:C1SiteMap ID="C1SiteMap1" runat="server" DataSourceID="SiteMapDataSource1" OnNodeDataBound="C1SiteMap1_NodeDataBound">
                <defaultlevelsetting maxnodes="3">
                </defaultlevelsetting>
                <LevelSettings>
                    <wijmo:C1SiteMapLevelSetting Level="1">
                        <ListLayout RepeatColumns="2" />
                    </wijmo:C1SiteMapLevelSetting>
                </LevelSettings>
                <DataBindings>
                    <wijmo:C1SiteMapNodeBinding Level="0" TextField="Title" NavigateUrlField="NavigateUrl" />
                    <wijmo:C1SiteMapNodeBinding Level="1" TextField="Title" NavigateUrlField="NavigateUrl" />
                    <wijmo:C1SiteMapNodeBinding Level="2" TextField="Title" NavigateUrlField="NavigateUrl" />
                    <wijmo:C1SiteMapNodeBinding Level="3" TextField="Title" NavigateUrlField="NavigateUrl" />
                </DataBindings>
            </wijmo:C1SiteMap>

            <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />

            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/menu_structure.xml"></asp:XmlDataSource>

            <wijmo:C1SiteMapDataSource ID="C1SiteMapDataSource1" runat="server" SiteMapFile="~/web1.sitemap" />

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li style="width:450px;">
                            <asp:RadioButtonList runat="server" CssClass="fixWidth" ID="RblDataSource" RepeatDirection="Horizontal" AutoPostBack="true"
                                OnSelectedIndexChanged="RblDataSource_SelectedIndexChanged" Width="100%">
                                <asp:ListItem Text="SiteMapDataSource" Value="SiteMapDataSource" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="C1SiteMapDataSource" Value="C1SiteMapDataSource"></asp:ListItem>
                                <asp:ListItem Text="XmlDataSource" Value="XmlDataSource"  ></asp:ListItem>
                            </asp:RadioButtonList>
                        </li>
                    </ul>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1SiteMap</strong> supports binding to all kinds of hierarchical datasources. 
        This sample shows that you can bind to <strong>C1SiteMapDataSource</strong>, <strong>SiteMapDataSource</strong>, <strong>XMLDataSource</strong>, etc. 
        You can also binding to a hierarchical datasource programatically by setting the <strong>DataSource</strong> property.
    </p>
    <p>
        At the server side, you can listen to the <strong>NodeDataBound</strong> event to do some changes once the node get databound.
    </p>
    <p>
        At design time, you can use <strong>C1SiteMapDataSource</strong> control to add a new site map file, or edit exising site map files.
    </p>
</asp:Content>
