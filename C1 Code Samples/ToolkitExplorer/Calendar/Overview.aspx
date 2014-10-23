<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Overview.aspx.cs" Inherits="Calendar_Overview" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Calendar" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

	<asp:Panel ID="Panel1" runat="server">
	</asp:Panel>

	<wijmo:C1CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Panel1" />

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	CalendarExtender converts an ASP.NET Panel to a advanced single month or a table of months calendar, with customizable styles and navigation.
	The samples in this section will introduce you to some of the features of the CalendarExtender.
	</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>