<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	Inherits="Sparkline_NegativeValues" CodeBehind="NegativeValues.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Sparkline"
	TagPrefix="C1Sparkline" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h3>Value axis off</h3>
	<C1Sparkline:C1Sparkline ID="Sparkline1" runat="server">
        <SeriesList>
            <C1Sparkline:SparklineSeries Type="Area">
            </C1Sparkline:SparklineSeries>
        </SeriesList>
	</C1Sparkline:C1Sparkline>
    <h3>Value axis on</h3>
    <C1Sparkline:C1Sparkline ID="Sparkline2" runat="server" ValueAxis="true">
        <SeriesList>
            <C1Sparkline:SparklineSeries Type="Area">
            </C1Sparkline:SparklineSeries>
        </SeriesList>
	</C1Sparkline:C1Sparkline>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates the value axis option of <strong>C1Sparkline</strong> control.
	</p>
	<p>
		The <strong>C1Sparkline</strong> allows you to show a value axis to distinguish negative from positive.
		Set the <strong>ValueAxis</strong> property to true will do this.
	</p>
</asp:Content>
