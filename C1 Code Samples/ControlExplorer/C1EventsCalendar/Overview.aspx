<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1EventsCalendar.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1EventsCalendar"
	TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<wijmo:C1EventsCalendar runat="server" ID="C1EventsCalendar1" Width="100%"  Height="475px"></wijmo:C1EventsCalendar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
			<p>
				This sample demonstrates the default <strong>C1EventsCalendar</strong> behavior.
			</p>
			<p>
				The <strong>C1EventsCalendar</strong> control is a fully functional schedule that allows users to add, edit, and manage their appointments.  
			</p>
			<p>
				By default the C1EventsCalendar uses offline data source, so you can easily 
				add this control to your page without additional configuration.
			</p>
</asp:Content>
