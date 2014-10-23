<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="ControlExplorer.C1SiteMap.Template" %>

<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1SiteMap" tagprefix="wijmo" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1SiteMapDataSource" tagprefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .wijmo-c1sitemap-node a {
            font-weight: normal;
        }

        .wijmo-c1sitemap-node-level0 a {
            font-size: 1.4em;
            font-weight: bold;
        }

        .template-text{
            font-size:1.3em; 
            font-weight:bold; 
            vertical-align:top; 
            margin-top:3px; 
            display:inline-block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1SiteMapDataSource ID="C1SiteMapDataSource1" runat="server" SiteMapFile="~/web1.sitemap" />
    
    <wijmo:C1SiteMap ID="C1SiteMap1" runat="server" DataSourceID="C1SiteMapDataSource1" OnNodeDataBound="C1SiteMap1_NodeDataBound">
        <LevelSettings>
            <wijmo:C1SiteMapLevelSetting Level="1">
                <NodeTemplate>
                    <asp:Image ID="Image1" runat="server" Width="28px" Height="26px" ImageUrl="~/Images/Wijmo.png" />
                    <a href="#" class="template-text">
                        <%# Eval("description") %>
                    </a>
                </NodeTemplate>
            </wijmo:C1SiteMapLevelSetting>
            <wijmo:C1SiteMapLevelSetting Level="2" Layout="Flow"></wijmo:C1SiteMapLevelSetting>
        </LevelSettings>
    </wijmo:C1SiteMap>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This demo shows how to customize node's content by template. Please refer the source code tab for more information.
    </p>

</asp:Content>
