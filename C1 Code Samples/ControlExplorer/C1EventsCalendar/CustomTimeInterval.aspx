<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomTimeInterval.aspx.cs" Inherits="ControlExplorer.C1EventsCalendar.CustomTimeInterval" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1EventsCalendar"
	TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<wijmo:C1EventsCalendar runat="server" ID="C1EventsCalendar1" Width="100%"  Height="475px" TimeInterval="60" TimeIntervalHeight="25" TimeRulerInterval="120"></wijmo:C1EventsCalendar>
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
</asp:Content>
