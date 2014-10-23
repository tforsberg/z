<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1SiteMap.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1SiteMap" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

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

        .wijmo-c1sitemap-node-level2 img {
            width:20px;
            height:20px;
            margin-right:3px;
            background: #f16b0f;
        }
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1SiteMap ID="C1SiteMap1" runat="server">
        <Nodes>
            <wijmo:C1SiteMapNode Text="C1Controls" NavigateUrl="#">
                <Nodes>
                    <wijmo:C1SiteMapNode Text="Charts" NavigateUrl="#" >
                        <Nodes>
                            <wijmo:C1SiteMapNode Text="Bar Chart" NavigateUrl="~/C1BarChart/OverView.aspx" ImageUrl="~/explore/css/images/icons/widget/BarChart.png" />
                            <wijmo:C1SiteMapNode Text="Bubble Chart" NavigateUrl="~/C1BubbleChart/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/BubbleChart.png" />
                            <wijmo:C1SiteMapNode Text="Line Chart" NavigateUrl="~/C1LineChart/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/LineChart.png" />
                            <wijmo:C1SiteMapNode Text="SCatter Chart" NavigateUrl="~/C1ScatterChart/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/ScatterChart.png" />
                            <wijmo:C1SiteMapNode Text="Pie Chart" NavigateUrl="~/C1PieChart/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/PieChart.png" />
                        </Nodes>
                    </wijmo:C1SiteMapNode>
                    <wijmo:C1SiteMapNode Text="Inputs"  NavigateUrl="#">
                        <Nodes>
                            <wijmo:C1SiteMapNode Text="Date Input" NavigateUrl="~/C1InputDate/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/InputDate.png" />
                            <wijmo:C1SiteMapNode Text="Number Input" NavigateUrl="~/C1InputNumber/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/InputNumber.png" />
                            <wijmo:C1SiteMapNode Text="Text Input" NavigateUrl="~/C1InputText/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/InputText.png" />
                            <wijmo:C1SiteMapNode Text="Masked Input" NavigateUrl="~/C1InputMask/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/InputMask.png" />
                            <wijmo:C1SiteMapNode Text="Event Calendar" NavigateUrl="~/C1EventsCalendar/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/EventsCalendar.png" />
                        </Nodes>
                    </wijmo:C1SiteMapNode>
                    <wijmo:C1SiteMapNode Text="Data"  NavigateUrl="#">
                        <Nodes>
                            <wijmo:C1SiteMapNode Text="Grid View" NavigateUrl="~/C1GridView/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/GridView.png" />
                            <wijmo:C1SiteMapNode Text="Menu" NavigateUrl="~/C1Menu/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/Menu.png" />
                            <wijmo:C1SiteMapNode Text="Tree View" NavigateUrl="~/C1TreeView/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/TreeView.png" />
                            <wijmo:C1SiteMapNode Text="Editor" NavigateUrl="~/C1Editor/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/Editor.png" />
                            <wijmo:C1SiteMapNode Text="Super Panel" NavigateUrl="~/C1SuperPanel/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/SuperPanel.png" />
                        </Nodes>
                    </wijmo:C1SiteMapNode>
                    <wijmo:C1SiteMapNode Text="Others"  NavigateUrl="#">
                        <Nodes>
                            <wijmo:C1SiteMapNode Text="Carousel" NavigateUrl="~/C1Carousel/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/Carousel.png" />
                            <wijmo:C1SiteMapNode Text="Excel" NavigateUrl="~/C1Excel/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/Excel.png" />
                            <wijmo:C1SiteMapNode Text="PDF" NavigateUrl="~/C1PDF/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/PDF.png" />
                            <wijmo:C1SiteMapNode Text="Tabs" NavigateUrl="~/C1Tabs/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/Tabs.png" />
                            <wijmo:C1SiteMapNode Text="Upload" NavigateUrl="~/C1Upload/Overview.aspx" ImageUrl="~/explore/css/images/icons/widget/Upload.png" />
                        </Nodes>
                    </wijmo:C1SiteMapNode>
                </Nodes>
            </wijmo:C1SiteMapNode>
        </Nodes>
        <LevelSettings>
            <wijmo:C1SiteMapLevelSetting Level="1">
                <ListLayout RepeatColumns="2" />
            </wijmo:C1SiteMapLevelSetting>
        </LevelSettings>
    </wijmo:C1SiteMap>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1SiteMap</strong> provides a convenient way to organize and list your site map nodes. 
        You can add the site map nodes manually, or by data binding. You can customize the layout by level settings, 
        and customize the node content by template. You will learn how to do this from other samples in this section.
    </p>
</asp:Content>
