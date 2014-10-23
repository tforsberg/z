<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	Inherits="Sparkline_MultipleSeries" CodeBehind="MultipleSeries.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Sparkline"
	TagPrefix="C1Sparkline" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<C1Sparkline:C1Sparkline ID="Sparkline1" runat="server">
        <Animation Duration="800" />
        <SeriesList>
            <C1Sparkline:SparklineSeries Bind="Score" Type="Area">
                <SeriesStyle Fill-Color="Orange" Stroke="Orange"></SeriesStyle>
            </C1Sparkline:SparklineSeries>
            <C1Sparkline:SparklineSeries Bind="Mood">
                <SeriesStyle StrokeWidth="2"></SeriesStyle>
            </C1Sparkline:SparklineSeries>
        </SeriesList>
	</C1Sparkline:C1Sparkline>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates showing multiple data series simultaneously in <strong>C1Sparkline</strong> control.
	</p>
	<p>
		The <strong>C1Sparkline</strong> allows you to overlay multiple data series.
		Each series can be bound to a property of the data object specified by <strong>Bind</strong> property, and can have unique chart type set by <strong>Type</strong> property of <strong>SparklineSeries</strong>.
	</p>
</asp:Content>
