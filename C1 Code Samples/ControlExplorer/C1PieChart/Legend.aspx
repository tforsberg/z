<%@ Page Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeBehind="Legend.aspx.cs" Inherits="ControlExplorer.C1PieChart.Legend" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="update1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <wijmo:C1PieChart runat="server" ID="C1PieChart1" Radius="180" Height="450" Width="756" CssClass="ui-widget ui-widget-content ui-corner-all">
                <Hint>
                    <Content Function="hintContent" />
                </Hint>
                <Animation Enabled="false" />
                <Legend Visible="true" Text="Countries" Compass="North" Orientation="Horizontal">
                    <Size Width="15" Height="10" />
                </Legend>
                <Header Text="Top 5 countries with highest population">
                </Header>
                <SeriesList>
                    <wijmo:PieChartSeries Label="China" Data="1387" Offset="15" LegendEntry="true">
                    </wijmo:PieChartSeries>
                    <wijmo:PieChartSeries Label="India" Data="1255" Offset="0" LegendEntry="true">
                    </wijmo:PieChartSeries>
                    <wijmo:PieChartSeries Label="USA" Data="320" Offset="0" LegendEntry="true">
                    </wijmo:PieChartSeries>
                    <wijmo:PieChartSeries Label="Indonesia" Data="250" Offset="0" LegendEntry="true">
                    </wijmo:PieChartSeries>
                    <wijmo:PieChartSeries Label="Brasil" Data="200" Offset="0" LegendEntry="true">
                    </wijmo:PieChartSeries>
                    <wijmo:PieChartSeries Label="Other world" Data="3770" Offset="0" LegendEntry="true">
                    </wijmo:PieChartSeries>
                </SeriesList>
                <Footer Compass="South" Visible="False">
                </Footer>
                <Axis>
                    <Y Visible="False" Compass="West">
                        <Labels TextAlign="Center">
                        </Labels>
                        <GridMajor Visible="True">
                        </GridMajor>
                    </Y>
                </Axis>
            </wijmo:C1PieChart>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <div>
        <h3>Test the features</h3>
        <ul>
            <li>Note the legend on the top of the chart</li>
            <li>Click series items in the legend to toggle their visibility on the chart surface.</li>
            <li>Play with legend options in the panel below to see its behavior.</li>
            <li>Go to the 'Sources' tab to see how to setup chart legend through widget initialization </li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
    <asp:UpdatePanel ID="update2" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li class="fullwidth">
                            <label>Legend enabled </label>
                            <asp:CheckBox ID="cb1" AutoPostBack="true" Checked="true" runat="server" />
                        </li>
                        <li class="fullwidth">
                            <h3>Legend position:</h3>
                        </li>
                        <li class="fullwidth">
                            <label>Compass</label>
                            <asp:DropDownList ID="cbbCompass" AutoPostBack="true" runat="server">
                                <asp:ListItem Text="North" Value="north" Selected="true" />
                                <asp:ListItem Text="East" Value="east" />
                                <asp:ListItem Text="South" Value="south" />
                                <asp:ListItem Text="West" Value="west" />
                            </asp:DropDownList>
                            <label>Orientation </label>
                            <asp:DropDownList ID="ccbOrientation" AutoPostBack="true" runat="server">
                                <asp:ListItem Text="Horizontal" Value="horizontal" Selected="true" />
                                <asp:ListItem Text="Vertical" Value="vertical" />
                            </asp:DropDownList>
                        </li>
                    </ul>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        function hintContent() {
            return this.data.label + " : " + Globalize.format(this.value / this.total, "p2");
        }
    </script>
</asp:Content>
