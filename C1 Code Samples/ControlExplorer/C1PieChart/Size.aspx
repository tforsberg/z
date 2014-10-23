<%@ Page Language="C#"  MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeBehind="Size.aspx.cs" Inherits="ControlExplorer.C1PieChart.Size" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Slider" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <script type="text/javascript">
        function hintContent() {
            return this.data.label + " : " + Globalize.format(this.value / this.total, "p2");
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
     <div>
       <h3>Test the features</h3>
            <ul>
                <li>Play with chart options below and watch how chart area dynamicly changes it size.</li>
                <li>Note the  chart radius adjusts to the new size</li>
                <li>Go to the 'Sources' tab to see how to setup chart size throught widget initialization </li>
            </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1PieChart runat="server" ID="C1PieChart1" Radius="180"  Height="475" Width = "756" CssClass ="ui-widget ui-widget-content ui-corner-all">
        <Hint>
            <Content Function="hintContent" />
        </Hint>
        <Legend Visible="false"></Legend>
        <Animation Enabled ="false" />
        <Header Text="Smartphones historical sales (2013-Q2)">
        </Header>
        <SeriesList>
            <wijmo:PieChartSeries Label="Android" Data="177.9" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="iOS" Data="31.9" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="Windows Phone" Data="7.4" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="Blackberry" Data="7.6" LegendEntry="true">
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
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth inlinediv">
                    <label>Width</label>
                    <wijmo:C1Slider ID="c1Slider1"  runat="server"  Orientation="Horizontal" Range="false" Min="300" Max="756"
                                Step="1" Value="756" />
                            <asp:TextBox ID="c1Input1" Width="100" runat="server"  Text="756">
                            </asp:TextBox>
                </li>
                <li class="fullwidth inlinediv">
                    <label>Height</label>
                    <wijmo:C1Slider ID="c1Slider2" runat="server"  Orientation="Horizontal" Range="false" Min="200" Max="475"
                                Step="1" Value="475" />
                            <asp:TextBox ID="c1Input2"  Width="100"  runat="server" Value="475">
                            </asp:TextBox>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var $ws = $('#<%=c1Slider1.ClientID%>');
            var $hs = $('#<%=c1Slider2.ClientID%>');
            var $wi = $('#<%=c1Input1.ClientID%>');
            var $hi = $('#<%=c1Input2.ClientID%>');
            var $c = $('#<%=C1PieChart1.ClientID%>');
            function changeProperties() {
                var h = $hi.val();
                var w = $wi.val();
                if (isNaN(h) || isNaN(w))
                    return;
                $c.c1piechart('option', 'width', parseFloat(w));
                $c.c1piechart('option', 'height', parseFloat(h));
            }
            $.each([$ws, $hs], function (index, item) {
                var $input = item == $ws ? $wi : $hi;
                item.c1slider({
                    slide: function (e, a) {
                        $input.val(a.value);
                        changeProperties();
                    },
                    change: function (e, a) {
                        $input.val(a.value);
                        changeProperties();
                    }
                });
            });
        });
    </script>
</asp:Content>