<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Layout.aspx.cs" Inherits="ControlExplorer.C1SiteMap.Layout" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1SiteMapDataSource" TagPrefix="wijmo" %>

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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <wijmo:C1SiteMap ID="C1SiteMap1" runat="server" DataSourceID="C1SiteMapDataSource1" OnNodeDataBound="C1SiteMap1_NodeDataBound">
                <LevelSettings>
                    <wijmo:C1SiteMapLevelSetting Level="1" Layout="List">
                        <ListLayout RepeatColumns="2" />
                    </wijmo:C1SiteMapLevelSetting>
                    <wijmo:C1SiteMapLevelSetting Level="2" Layout="Flow" MaxNodes="5" SeparatorText="|">
                    </wijmo:C1SiteMapLevelSetting>
                </LevelSettings>
                <DefaultLevelSetting Layout="List"></DefaultLevelSetting>
            </wijmo:C1SiteMap>

            <wijmo:C1SiteMapDataSource ID="C1SiteMapDataSource1" runat="server" SiteMapFile="~/Web.sitemap" />

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li class="fullwidth">
                            <label class="settinglegend" for="ckxShowXAxis">Settings for the second level</label>
                        </li>
                        <li>
                            <label>Layout:</label>
                            <asp:DropDownList ID="cbxLevel1Layout" AutoPostBack="true" runat="server" OnSelectedIndexChanged="cbxLevel1Layout_SelectedIndexChanged">
                                <asp:ListItem Text="List" Value="List" Selected="true" />
                                <asp:ListItem Text="Flow" Value="Flow" />
                            </asp:DropDownList>
                        </li>

                        <li>
                            <label>Columns count:</label>
                            <wijmo:C1InputNumeric ID="numberLevel1ColumnCount" runat="server" Width="50px" ShowSpinner="true" MaxValue="3" MinValue="1" DecimalPlaces="0" Value="2"></wijmo:C1InputNumeric>
                        </li>
                        <li>
                            <label>Separator text:</label>
                            <wijmo:C1InputText ID="tbxLevel1SeparatorText" Enabled="false" runat="server" Text="|" Width="70px"></wijmo:C1InputText>
                        </li>
                        <li>
                            <label>Max nodes:</label>
                            <wijmo:C1InputNumeric ID="numberLevel1MaxNode" runat="server" Width="50px" ShowSpinner="true" MaxValue="10" MinValue="1" DecimalPlaces="0" Value="5"></wijmo:C1InputNumeric>
                        </li>

                        <li class="fullwidth">
                            <label class="settinglegend" for="ckxShowXAxis">Settings for the third level</label>
                        </li>
                        <li>
                            <label>Layout:</label>
                            <asp:DropDownList ID="cbxLevel2Layout" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cbxLevel2Layout_SelectedIndexChanged">
                                <asp:ListItem Text="List" Value="List" />
                                <asp:ListItem Text="Flow" Value="Flow" Selected="true" />
                            </asp:DropDownList>
                        </li>
                        <li>
                            <label>Columns count:</label>
                            <wijmo:C1InputNumeric ID="numberLevel2ColumnCount" Enabled="false" runat="server" Width="50px" ShowSpinner="true" MaxValue="3" MinValue="1" DecimalPlaces="0" Value="2"></wijmo:C1InputNumeric>
                        </li>
                        <li>
                            <label>Separator text:</label>
                            <wijmo:C1InputText ID="tbxLevel2SeparatorText" runat="server" Text="|" Width="70px"></wijmo:C1InputText>
                        </li>

                        <li>
                            <label>Max nodes:</label>
                            <wijmo:C1InputNumeric ID="numberLevel2MaxNode" runat="server" Width="50px" ShowSpinner="true" MaxValue="10" MinValue="1" DecimalPlaces="0" Value="5"></wijmo:C1InputNumeric>
                        </li>
                    </ul>
                    <div class="settingcontrol">
                        <asp:Button ID="btnApply" Text="Apply" CssClass="settingapply" runat="server" OnClick="btnApply_Click" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This demo shows how to customize the layout by <strong>LevelSettings.</strong>
    </p>
    <div>
        Some notes:
        <ul>
            <li>You can set <strong>RepeatColumns</strong> only if the level is showing as <strong>List</strong> mode.
            </li>
            <li>If the level is showing as <strong>Flow</strong> mode, it will be the last level, all nodes under this level will not be shown.
            </li>
            <li>
                <strong>SeparatorText</strong> is valid only if current level is <strong>Flow</strong> mode.
            </li>
        </ul>
    </div>
</asp:Content>
