<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomTimeInterval.aspx.cs" Inherits="ToolkitExplorer.EventsCalendar.CustomTimeInterval" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1EventsCalendar" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="Panel1" runat="server" Width="100%">
	</asp:Panel>
	<wijmo:C1EventsCalendarExtender ID="C1EventsCalendarExtender1" runat="server" 
		TargetControlID="Panel1" TimeInterval="60" TimeIntervalHeight="25" TimeRulerInterval="120" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
			<p>
				This sample demonstrates how to change the day view time interval.
			</p>
			<p>Properties used in the sample:</p>
			<ul>
			<li><strong>TimeInterval</strong> - the time interval in minutes for the Day view.</li>
			<li><strong>TimeIntervalHeight</strong> - the Day view time interval row height in pixels.</li>
			<li><strong>TimeRulerInterval</strong> - the time ruler interval in minutes for the Day view..</li>			
			</ul>
			<p>
				
			</p>
</asp:Content>
