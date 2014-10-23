<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1Calendar_MinMaxRange" Codebehind="MinMaxRange.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<wijmo:C1Calendar ID="C1Calendar1" runat="server" MinDate="2011-5-8" MaxDate="2011-5-25" DisplayDate="2011-5-1">
</wijmo:C1Calendar>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
<p>
<strong>C1Calendar</strong> supports restricted date selection.
</p>

<p>
The selectable range is determined by the <b>MinDate</b> and <b>MaxDate</b> properties.
</p>

<p>
The <b>MaxDate</b> value should be larger than the <b>MinDate</b> value.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

