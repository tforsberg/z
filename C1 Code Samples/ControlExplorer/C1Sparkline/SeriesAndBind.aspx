<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	Inherits="Sparkline_SeriesAndBind" CodeBehind="SeriesAndBind.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Sparkline"
	TagPrefix="C1Sparkline" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<C1Sparkline:C1Sparkline ID="Sparkline1" runat="server">
        <SeriesList>
            <C1Sparkline:SparklineSeries Bind="score" />
        </SeriesList>
	</C1Sparkline:C1Sparkline>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates the usage of <strong>C1Sparkline</strong> data series in which you can bind value to one property.
	</p>
	<p>
		The <strong>C1Sparkline</strong> allows you to add multiple data series.
		Each series can be bound to a property of the data object specified by <strong>Bind</strong> property, and can have unique chart type set by <strong>Type</strong> property of <strong>SparklineSeries</strong>.
	</p>
</asp:Content>
