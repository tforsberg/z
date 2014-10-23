<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Localization.aspx.cs" Inherits="ControlExplorer.C1EventsCalendar.Localization" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1EventsCalendar"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1EventsCalendar runat="server" ID="C1EventCalendar1" Culture="de-De" Width="100%">
		<Localization agendaTimeFormat="{0:hh:mm tt} - {1:hh:mm tt}" buttonToday="heute"
			 buttonWeekView="Woche" buttonDayView="Tag" buttonMonthView="Monat"
			 buttonListView="Liste" buttonDelete="löschen" buttonOK="OK" buttonCancel="stornieren"
			 labelAllDay="ganztägig" labelToday="Heute" labelName="name" labelStarts="beginnt"
			 labelEnds="endet" labelLocation="lage" labelRepeat="repetieren" labelCalendar="kalender"
			 labelDescription="sorte" textNewEvent="neues Ereignis" repeatNone="keiner"
			 repeatDaily="täglich" repeatWorkDays="Tag der Arbeit" repeatWeekly="Jede Woche"
			 repeatMonthly="Jeden Monat" repeatYearly="jährlich" />
		<DayViewHeaderFormat Day="ganztägige Ereignisse" Week="{0:d dddd}" List="{0:d dddd}" />
	</wijmo:C1EventsCalendar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
				This sample demonstrates how to localize the events calendar.
			</p>
			<p>Properties used in the sample:</p>
			<ul>
				<li><strong>Culture</strong> - Culture name, e.g. "de-DE". Date and time formatting depends on the Culture property.</li>
				<li><strong>Localization</strong> - use the localization option in order to localize text which not depends on Culture property.</li>
				<li><strong>DayViewHeaderFormat</strong> - format of the text for the day header in the day/week or list view.</li>
			</ul>
</asp:Content>
