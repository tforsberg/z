<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Wijmo.master" CodeBehind="Radius.aspx.cs" Inherits="ControlExplorer.C1PieChart.Radius" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Slider" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <link type="text/css" rel="stylesheet" href="pieChart.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1PieChart runat="server" ID="C1PieChart1" Radius="180"  Height="475" Width = "756" CssClass ="ui-widget ui-widget-content ui-corner-all">
        <Hint OffsetX="0" OffsetY="0">
            <Content Function="hintContent"  />
        </Hint>
        <Legend Visible="false"></Legend>
        <Animation Enabled="false" />
        <Header Text="Steam - Mac Hardware">
        </Header>
        <SeriesList>
            <wijmo:PieChartSeries Label="MacBook Pro" Data="46.78" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="iMac" Data="23.18" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="MacBook" Data="20.25" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="Mac Pro" Data="5.41" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="Mac mini" Data="3.44" LegendEntry="true">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
     <div>
       <p>The source in this sample will show you how to setup chart radius</p>
            <h3>Test the features</h3>
            <ul>
                <li>Play with chart options below and watch how chart area dynamicly changes it radius.</li>
                <li>Go to the 'Sources' tab to see how to setup chart radius throught widget initilization </li>
            </ul>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth inlinediv" >
                    <label>Radius</label>
                    <wijmo:C1Slider ID="c1Slider1"  runat="server" Width="300"  Value="200" Orientation="Horizontal" Range="false" Min="50" Max="200"
                            Step="1" />
                    <asp:TextBox ID="c1Input1" Width="100"  Text="200" runat="server">
                    </asp:TextBox>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
        function hintContent() {
            return this.data.label + "\n" +
                                    "Percent of total export: " + Globalize.format(this.value / this.total, "p2");
        }
        $(document).ready(function () {
            var $s = $('#<%=c1Slider1.ClientID%>');
            var $i = $('#<%=c1Input1.ClientID%>');
            var $c = $('#<%=C1PieChart1.ClientID%>');
            function changeProperties() {
                var r = $i.val();
                if (isNaN(r)) return;
                $c.c1piechart('option', 'radius', parseFloat(r));
            }
            $s.c1slider({
                slide: function (a, a) {
                    $i.val(a.value);
                    changeProperties();
                },
                change: function (e, a) {
                    $i.val(a.value);
                    changeProperties();
                }
            });
        });
    </script>
</asp:Content>