<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    Inherits="Sparkline_Overview" CodeBehind="Overview.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Sparkline"
    TagPrefix="C1Sparkline" %>
<%@ Register assembly="mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h3>Line</h3>
    <C1Sparkline:C1Sparkline ID="Sparkline1" runat="server">
        <SeriesList>
            <C1Sparkline:SparklineSeries Data="33, 11, 15, 26, 16, 27, 37, -13, 8, -8, -3, 17, 0, 22, -13, -29, 19, 8">
            </C1Sparkline:SparklineSeries>
        </SeriesList>
    </C1Sparkline:C1Sparkline>
    <h3>Area</h3>
    <C1Sparkline:C1Sparkline ID="Sparkline2" runat="server">
        <SeriesList>
            <C1Sparkline:SparklineSeries Type="Area" Data="33, 11, 15, 26, 16, 27, 37, -13, 8, -8, -3, 17, 0, 22, -13, -29, 19, 8">
            </C1Sparkline:SparklineSeries>
        </SeriesList>
    </C1Sparkline:C1Sparkline>
    <h3>Column</h3>
    <C1Sparkline:C1Sparkline ID="Sparkline3" runat="server">
        <SeriesList>
            <C1Sparkline:SparklineSeries Type="Column" Data="33, 11, 15, 26, 16, 27, 37, -13, 8, -8, -3, 17, 0, 22, -13, -29, 19, 8">
            </C1Sparkline:SparklineSeries>
        </SeriesList>
    </C1Sparkline:C1Sparkline>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates the default <strong>C1Sparkline</strong> control behavior.
    </p>
    <p>
        The <strong>C1Sparkline</strong> allows you to show an inline minichart with data bindings.
        Set the <strong>Type</strong> property to Line or Area to change the sparkline chart type. 
        The default value for the <strong>Type</strong> property is Line.
    </p>
</asp:Content>
