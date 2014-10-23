<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	Inherits="Sparkline_Animation" CodeBehind="Animation.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Sparkline"
	TagPrefix="C1Sparkline" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h3>Linear - 500</h3>
	<C1Sparkline:C1Sparkline ID="Sparkline1" runat="server">
        <Animation Easing="linear" Duration="500" />
        <SeriesList>
            <C1Sparkline:SparklineSeries>
            </C1Sparkline:SparklineSeries>
        </SeriesList>
	</C1Sparkline:C1Sparkline>
    <h3>Bounce - 2000</h3>
    <C1Sparkline:C1Sparkline ID="Sparkline2" runat="server">
        <Animation Easing="bounce" />
        <SeriesList>
            <C1Sparkline:SparklineSeries Type="Area">
            </C1Sparkline:SparklineSeries>
        </SeriesList>
	</C1Sparkline:C1Sparkline>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates the animation capabilities of <strong>C1Sparkline</strong> control.
	</p>
	<p>
		The <strong>C1Sparkline</strong> allows you to customize the animation behavior like <strong>Duration</strong> and <strong>Easing</strong>.
	</p>
</asp:Content>
