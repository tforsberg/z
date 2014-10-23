<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ToolkitExplorer.EventsCalendar.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1EventsCalendar" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<asp:Panel ID="Panel1" runat="server" Width="100%">
	</asp:Panel>

	<wijmo:C1EventsCalendarExtender ID="C1EventsCalendarExtender1" runat="server" 
		TargetControlID="Panel1" SelectedDate="2011-11-15" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
			<p>
				This sample demonstrates the default <strong>C1EventsCalendarExtender</strong> behavior.
			</p>
			<p>&nbsp;</p>
			<p>
				The <strong>C1EventsCalendarExtender</strong> control is a fully functional schedule that allows users to add, edit, and manage their appointments.  
			</p>
			<p>
				By default the C1EventsCalendarExtender uses offline data source, so you can easily 
				add this control to your page without additional configuration.
			</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
