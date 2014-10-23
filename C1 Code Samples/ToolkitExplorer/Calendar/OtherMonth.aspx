<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="OtherMonth.aspx.cs" Inherits="Calendar_OtherMonth" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Calendar" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

	<asp:Panel ID="Panel1" runat="server">
	</asp:Panel>

	<wijmo:C1CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Panel1" ShowOtherMonthDays="false" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
Dates of adjacent months could be hidden in month view.
</p>

<p>
To hide the dates belong to other month in a month view, you can set the <b>ShowOtherMonthDays</b> property to false.
</p>

<p>
By default, the <b>ShowOtherMonthDays</b> property is true, in which the dates of other month are still selectable.
</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
