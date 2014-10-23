<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" 
	CodeFile="Doughnut.aspx.cs" Inherits="C1PieChart_Donut" %>
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
	<wijmo:C1PieChart runat = "server" ID="C1PieChart1" Radius="180" InnerRadius="150" ShowChartLabels="true" Height="475" Width = "756" CssClass ="ui-widget ui-widget-content ui-corner-all">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
        <Animation Enabled="false" />
		<Legend Text="May 2009 - May 2010"></Legend>
		<Header Text="Steam - DX10/11 Systems (Vista/Win7 + DX10/11 GPU)"></Header>
		<SeriesList>
			<wijmo:PieChartSeries Label="DX11GPU & WIN7" Data="5.6"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="DX10GPU & WIN7" Data="56.36"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="DX10/11GPU & XP" Data="16.67"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="DX9 SM2b & 3.0" Data="11.77"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="DX9 SM 2 GPU" Data="4.34"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="DX8 GPU & BELOW" Data="5.13"></wijmo:PieChartSeries>
		</SeriesList>
	</wijmo:C1PieChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
		You can render the <strong>C1PieChart</strong> as a Doughnut chart by setting the <b>InnerRadius</b> property.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth inlinediv"><label>Radius</label>
                    <wijmo:C1Slider ID="c1Slider1"  runat="server"  Value="150" Orientation="Horizontal" Range="false" Min="0" Max="150"
                            Step="10" />
                            <asp:TextBox ID="c1Input1" Width="100"  Text="150" runat="server">
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
                if (isNaN(r))
                    return;
                $c.c1piechart('option', 'innerRadius', parseFloat(r));
            }
            var labels = {
                position: 'outside',
                offset: 30,
                connectorStyle: {
                    "stroke-width": 1
                }
            };
            
            $c.c1piechart('option', 'labels', labels);
            console.log($c.c1piechart('option'));
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

