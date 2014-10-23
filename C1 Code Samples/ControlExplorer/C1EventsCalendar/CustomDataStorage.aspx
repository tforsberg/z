<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomDataStorage.aspx.cs" Inherits="ControlExplorer.C1EventsCalendar.CustomDataStorage" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1EventsCalendar"
	TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    <script src="../explore/js/amplify.core.min.js" type="text/javascript"></script>
    <script src="../explore/js/amplify.store.min.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1EventsCalendar runat="server" ID="C1EventsCalendar1" Width="100%"  Height="475px"></wijmo:C1EventsCalendar>

    <script type="text/javascript">
    	$(document).ready(function () {
    		var c1eventscalendar = $("#<%=C1EventsCalendar1.ClientID%>");

    		c1eventscalendar.c1eventscalendar("option", "dataStorage",
			{
				addEvent: _updateEvent,
				updateEvent: _updateEvent,
				deleteEvent: function (obj, successCallback, errorCallback) {
					window.setTimeout(function () {
						var curCalStore = amplify.store("calendarstore_" + obj.calendar);
						if (!curCalStore) {
							curCalStore = {};
						}
						if (curCalStore[obj.id]) {
							delete curCalStore[obj.id];
						}
						amplify.store("calendarstore_" + obj.calendar, curCalStore);
						successCallback()
					}, 400); //simulate server delay
					//errorCallback("Unable to delete event");
				},
				loadEvents: function (visibleCalendars,
											successCallback, errorCallback) {

					var i, j, events = [];
					window.setTimeout(function () {
						for (i = 0; i < visibleCalendars.length; i++) {

							var curCalStore = amplify.store("calendarstore_" + visibleCalendars[i]);
							if (!curCalStore) {
								curCalStore = {};
								amplify.store("calendarstore_" + visibleCalendars[i], curCalStore);
							}
							for (j in curCalStore) {
								events.push(curCalStore[j]);
							}
						}
						successCallback(events);
					}, 500);
					//errorCallback("unable to load events");
				},
				addCalendar: _updateCalendar,
				updateCalendar: _updateCalendar,
				deleteCalendar: function (obj, successCallback, errorCallback) {
					successCallback();
					//errorCallback("Unable to delete calendar");
				}/*,
				loadCalendars: function (successCallback, errorCallback) {
					var calendars = [{ name: "My", id: "My", color: "red" },
									 { name: "Work", id: "Work", color: "blue"}];
					successCallback(calendars);
				}*/
			});

    	});

    	function _updateEvent(obj, successCallback, errorCallback) {
    		window.setTimeout(function () {
    			var curCalStore = amplify.store("calendarstore_" + obj.calendar);
    			if (!curCalStore) {
    				curCalStore = {};
    			}
    			curCalStore[obj.id] = obj;
    			amplify.store("calendarstore_" + obj.calendar, curCalStore);
    			successCallback()
    		}, 400); //simulate server delay
    		//errorCallback("Unable to save event");
    	}

    	function _updateCalendar(obj, successCallback, errorCallback) {
    		successCallback();
    		//errorCallback("Unable to save calendar");
    	}
	</script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
			<p>
				This sample demonstrates how to implement custom data storage for the events calendar.
			</p>
			<p>The sample uses the <b>amplify.store</b> library in order to implement local data storage.</p>
			<p>Options used in the sample include the following:</p>
			<ul>
			<li><strong>dataStorage</strong> - use this option in order to implement the custom data storage layer.</li>
			<li><strong>visibleCalendars</strong> - array of the calendar names that need to be shown.</li>			
			</ul>
</asp:Content>
