<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeBehind="OverView.aspx.cs" Inherits="C1LineChart_OverView" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>
        The <strong>C1LineChart</strong> allows you to create customized line charts. The samples in this section highlight some of the unique features of the chart, and they will help you get started with <strong>C1LineChart</strong>.
    </p>
    <p>
        The source in this sample will show you how to add a header to the chart, how to format the axes, how to add chart labels, and how to populate the chart with data.
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>
