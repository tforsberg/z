<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeBehind="Area.aspx.cs" Inherits="C1LineChart_Area" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        function hintContent() {
            return this.y + '%';
        }
        function pageLoad() {

            var resizeTimer = null;

            $(window).resize(function () {
                window.clearTimeout(resizeTimer);
                resizeTimer = window.setTimeout(function () {
                    var jqLine = $("#<%= C1LineChart1.ClientID %>"),
						width = jqLine.width(),
						height = jqLine.height();

                    if (!width || !height) {
                        window.clearTimeout(resizeTimer);
                        return;
                    }

                    jqLine.c1linechart("redraw", width, height);
                }, 250);
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1LineChart ID="C1LineChart1" ShowChartLabels="false" runat="server" Height="475" Width="756" Type="Area">
        <Animation Enabled="false" />
        <Hint>
            <Content Function="hintContent" />
        </Hint>
        <Footer Compass="South" Visible="False"></Footer>
        <Legend>
            <Size Width="30" Height="3"></Size>
        </Legend>
        <Axis>
            <X AnnoFormatString="MM/yyyy"></X>
        </Axis>
    </wijmo:C1LineChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>The<strong> C1LineChart </strong>supports <strong>Area Types</strong> to display lines as filled areas. The <strong>Type</strong> property is used to display either Area or Line chart types.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

