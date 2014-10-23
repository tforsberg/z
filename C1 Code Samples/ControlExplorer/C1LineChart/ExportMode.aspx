<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="True" Inherits="C1LineChart_ExportMode" CodeBehind="ExportMode.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<%@ Register Src="../ChartCore/ExportMode.ascx" TagName="ExportPanel" TagPrefix="ExportPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<wijmo:C1LineChart runat="server" ID="C1LineChart1" ShowChartLabels="False" Height="475" Width="756">
        <SeriesTransition Duration="2000"></SeriesTransition>

        <Animation Duration="2000"></Animation>

        <SeriesStyles>
            <wijmo:ChartStyle StrokeWidth="4" Stroke="#5DA5DA">
            </wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="4" Stroke="#FAA43A">
            </wijmo:ChartStyle>
        </SeriesStyles>
        <SeriesHoverStyles>
            <wijmo:ChartStyle StrokeWidth="4">
            </wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="4">
            </wijmo:ChartStyle>
        </SeriesHoverStyles>
        <Header Text="2010 Sales Revenue">
        </Header>
        <Footer Compass="South" Visible="False">
        </Footer>
        <Legend Visible="true"></Legend>

        <Axis>
            <X>
                <GridMajor Visible="True"></GridMajor>
                <GridMinor Visible="False"></GridMinor>
            </X>

            <Y Visible="False" Compass="West" Text="USD (thousands)" Min="0" Max="4000" AutoMin="false" AutoMax="false" AnnoFormatString="n0">
                <Labels TextAlign="Center"></Labels>
                <GridMajor Visible="True"></GridMajor>
                <GridMinor Visible="False"></GridMinor>
            </Y>
        </Axis>

        <Hint OffsetY="-10">
            <Content Function="hintContent" />
            <ContentStyle FontSize="14px"></ContentStyle>
        </Hint>
    </wijmo:C1LineChart>
    <script type="text/javascript">
        function hintContent() {
            //Check if multiple data points are on one axis entry. For example, multiple data entries for a single date. 
            if ($.isArray(this)) {
                var content = "";
                //Multiple entries of data on this point, so we need to loop through them to create the tooltip content.
                for (var i = 0; i < this.length; i++) {
                    content += this[i].lineSeries.label + ': ' + Globalize.format(this[i].y * 1000, 'c0') + '\n';
                }
                return content;
            }
            else {
                //Only a single data point, so we return a formatted version of it. "/n" is a line break.
                return this.data.lineSeries.label + '\n' +
                        //Format x as Short Month and long year (Jan 2010). Then format y value as calculated currency with no decimal ($1,983,000). 
                    Globalize.format(this.x, 'MMM yyyy') + ': ' + Globalize.format(this.y * 1000, 'c0');
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
	<p>This sample demostrates how to export <strong>C1LineChart</strong> with 2 different modes:</p>
	<ul>
		<li>Content: Sending chart markup to the service for exporting. It requires IE9 or high version
		installed on the service host. It has better performance than Options mode.</li>
		<li>Options: Sending chart widget options to the service for exporting.</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
	<ExportPanel:ExportPanel ID="ExportPanel1" runat="server" ChartType="C1LineChart" />
</asp:Content>

