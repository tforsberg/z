<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Range.aspx.cs" Inherits="Calendar_Range" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Calendar" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

	<asp:Panel ID="Panel1" runat="server">
	</asp:Panel>

	<wijmo:C1CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Panel1"
		DisplayDate="2011-01-18" MaxDate="2011-01-27" MinDate="2011-01-10"  />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
Selection on dates can be restricted in particular range.
</p>

<p>
The selectable range is determined by the <b>MinDate</b> and <b>MaxDate</b> properties.
</p>

<p>
<b>MaxDate</b> value should be larger than the <b>MinDate/<b> value.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

