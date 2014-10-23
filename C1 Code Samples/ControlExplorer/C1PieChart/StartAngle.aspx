<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.master" CodeBehind="StartAngle.aspx.cs" Inherits="ControlExplorer.C1PieChart.StartAngle" %>
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1PieChart runat = "server" StartAngle="0"  ID="C1PieChart1" Radius="180" Height="475" Width = "756" CssClass ="ui-widget ui-widget-content ui-corner-all">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
        <Animation Enabled="false" />
		<Legend Visible="false"></Legend>
		<Header Text="Steam - Mac Hardware"></Header>
		<SeriesList>
			<wijmo:PieChartSeries Label="MacBook Pro" Data="46.78" LegendEntry="true"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="iMac" Data="23.18" LegendEntry="true"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="MacBook" Data="20.25" LegendEntry="true"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="Mac Pro" Data="5.41" LegendEntry="true"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="Mac mini" Data="3.44" LegendEntry="true"></wijmo:PieChartSeries>
		</SeriesList>
	</wijmo:C1PieChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
     <div>
       <p>The source in this sample will show you how to setup chart start angle</p>
            <h3>Test the features</h3>
            <ul>
                <li>Note the first sector begins from (1;0) point of the pie</li>
                <li>Play with chart options below and watch how chart area dynamicly changes it start angle.</li>
                <li>Go to the 'Sources' tab to see how to setup chart start angle throught widget initilization </li>
            </ul>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth inlinediv">
                    <label>Radius</label>
                    <wijmo:C1Slider ID="c1Slider1"  runat="server" Width="300"  Value="1" Orientation="Horizontal" Range="false" Min="1" Max="360"
                            Step="1" />
                            <asp:TextBox ID="c1Input1" Width="100"  Text="1" runat="server">
                            </asp:TextBox>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var $c = $('#<%=C1PieChart1.ClientID%>');
            var $s = $('#<%=c1Slider1.ClientID%>');
            var $i = $('#<%=c1Input1.ClientID%>');
            function changeProperties() {
                var angle = parseFloat($i.val());
                $c.c1piechart('option', 'startAngle', angle);
            }
            $s.c1slider({
                slide: function (e, a) {
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

