<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DataModel.aspx.cs" Inherits="ToolkitExplorer.EventsCalendar.DataModel" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1EventsCalendar" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<script src="../explore/js/amplify.core.min.js" type="text/javascript"></script>
    <script src="../explore/js/amplify.store.min.js" type="text/javascript"></script>
    <style type="text/css">
        .top-pane
        {
            margin: 1em 0;
            padding: 1em;
        }
        .calendaractions p, 
        .addnewevent, .events-title
        {
            margin-bottom: 1em;
        }
        #eventscalendar
        {
            width: 750px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="Panel1" runat="server" Width="100%">
	</asp:Panel>
	<wijmo:C1EventsCalendarExtender ID="C1EventsCalendarExtender1" runat="server" 
		TargetControlID="Panel1" OnClientInitialized="initialized" HeaderBarVisible="false" OnClientCalendarsChanged="calendarsChanged" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
                <div class="top-pane ui-helper-clearfix ui-widget-content ui-corner-all">
                    <div class="calendaractions">
                        <h3 class="events-title">
                            Events</h3>
                        <div class="eventactions">
                            <a class="addnewevent" href="#">Add event using dialog</a>&nbsp;&nbsp;
							<a class="addneweventwithoutdialog" href="#">Add event without dialog</a>&nbsp;&nbsp;
							<a class="deleteEventsForActiveDay" href="#">Delete all events for the active day (without confirmation)</a>
                        </div>
                        <h3>
                            Calendars</h3>
                        <div class="calendarslist-container">
                            <ul class="calendarslist">
                                <li>Loading...</li>
                            </ul>
                        </div>
                        <p>
                            <a class="calendarsettings">Edit</a> <a class="deletecalendar">Delete</a>
                        </p>
                        <p>
                            <a class="addnewcalendar">Add calendar</a>
                        </p>
                    </div>
                </div>
    <script type="text/javascript">
    	function initialized(e) {
    		// load available calendars when widget is initialized
    		loadCalendarsList();
    	}
    	function calendarsChanged(e, args) {
    		// load available calendars when calendars option has been changed
    		loadCalendarsList();
    	}
    	function getEvCal() {
    		return $("#<%=Panel1.ClientID%>");
    	}
    	function onAddNewEventClick() {
    		getEvCal().wijevcal("showEditEventDialog");
    	}
    	function onAddNewEventWithoutDialogClick() {
    		var o = {};
    		o.subject = "New event";
    		o.start = new Date();
    		o.end = new Date(o.start.getTime() + 1000 * 60 * 60 * 2); // duration 2 hours
    		getEvCal().wijevcal("addEvent", o);
    	}
    	function onDeleteEventsForActiveDayClick() {
    		var now = new Date(),
					selectedDate = getEvCal().wijevcal("option", "selectedDate"),
    				start = new Date(selectedDate.getFullYear(), selectedDate.getMonth(), selectedDate.getDate()),
					end = new Date(start.getTime() + 1000 * 60 * 60 * 24),
					events, i;
    		events = getEvCal().wijevcal("getOccurrences", start, end);
    		for (i = 0; i < events.length; i++) {
    			getEvCal().wijevcal("deleteEvent", events[i]);
    		}

    	}

    	function onAddNewCalendarClick() {
    		getEvCal().wijevcal("showEditCalendarDialog");
    	}
    	function onEditCalendarClick() {
    		if ($(".calendarslist").find(".ui-selected").length > 0) {
    			var checkbox = $(".calendarslist").find(".ui-selected").find("input")[0];
    			getEvCal().wijevcal("showEditCalendarDialog", checkbox.value);
    		}
    	}
    	function onDeleteCalendarClick() {
    		if ($(".calendarslist").find(".ui-selected").length > 0) {
    			var checkbox = $(".calendarslist").find(".ui-selected").find("input")[0];
    			getEvCal().wijevcal("deleteCalendar", checkbox.value);
    		}
    	}
    	function loadCalendarsList() {
    		var calendars = getEvCal().wijevcal("option", "calendars"),
					i, c, calendarslist = $(".calendarslist");
    		calendarslist.html("");
    		calendarslist.append("<li class=\"ui-widget-content\"><label><input type=\"checkbox\" checked='true' value=\"Default\" />Default</label></li>");
    		calendarslist.append("<li class=\"ui-widget-content\"><label><input type=\"checkbox\" checked='true' value=\"Home\" />Home</label></li>");
    		calendarslist.append("<li class=\"ui-widget-content\"><label><input type=\"checkbox\" checked='true' value=\"Work\" />Work</label></li>");
    		for (i = 0, c = calendars.length; i < c; i += 1) {
    			calendarslist.append("<li class=\"ui-widget-content\"><label><input type=\"checkbox\" value=\"" + calendars[i].name + "\" />" + calendars[i].name + "</label></li>");
    		}
    		$(".calendaractions .calendarsettings").button("option", "disabled", true);
    		$(".calendaractions .deletecalendar").button("option", "disabled", true);
    	}

    	$(document).ready(function () {
    		$(".eventactions .addnewevent")/*.button()*/
					.click($.proxy(onAddNewEventClick, this));
    		$(".eventactions .addneweventwithoutdialog")/*.button()*/
					.click($.proxy(onAddNewEventWithoutDialogClick, this));
    		$(".eventactions .deleteEventsForActiveDay")/*.button()*/
					.click($.proxy(onDeleteEventsForActiveDayClick, this));
    		//

    		$(".calendaractions .addnewcalendar").button()
							.click($.proxy(onAddNewCalendarClick, this));
    		$(".calendaractions .calendarsettings").button({ disabled: true })
							.click($.proxy(onEditCalendarClick, this));
    		$(".calendaractions .deletecalendar").button({ disabled: true })
							.click($.proxy(onDeleteCalendarClick, this));

    		$(".calendarslist").selectable({
    			selected: function (event, ui) {
    				if ($(".calendarslist").find(".ui-selected").length > 0) {
    					$(".calendaractions .deletecalendar").button("option", "disabled", false);
    					if ($(".calendarslist").find(".ui-selected").length === 1) {
    						$(".calendaractions .calendarsettings").button("option", "disabled", false);
    					} else {
    						$(".calendaractions .calendarsettings").button("option", "disabled", true);
    					}
    				}
    			},
    			unselected: function (event, ui) {
    				if ($(".calendarslist").find(".ui-selected").length === 1) {
    					$(".calendaractions .calendarsettings").button("option", "disabled", false);
    				} else if ($(".calendarslist").find(".ui-selected").length < 1) {
    					$(".calendaractions .calendarsettings").button("option", "disabled", true);
    					$(".calendaractions .deletecalendar").button("option", "disabled", true);
    				}
    			}
    		});

    		$(".calendarslist").on("change", "input", function () {
    			var checkboxes = $(".calendarslist").find("input"), i,
					visibleCalendars = [];
    			for (i = 0; i < checkboxes.length; i++) {
    				if (checkboxes[i].checked) {
    					visibleCalendars.push(checkboxes[i].value);
    				}
    			}
    			getEvCal().wijevcal("option", "visibleCalendars", visibleCalendars);
    		});

    	});
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
                <p>
                    The sample demonstrates how to edit events using client side script.
                </p>
			<p>Options used in the sample:</p>
			<ul>
				<li><strong>calendars</strong> - available calendar objects array. This option is read-only.</li>
				<li><strong>selectedDate</strong> - the selected date.</li>
				<li><strong>visibleCalendars</strong> - array of the calendar names which need to be shown..</li>			
			</ul>
			<p>Client side methods used in the sample:</p>
			<ul>
				<li><strong>getOccurrences</strong> - Retrieves the array which contains the full list of Event objects in the specified time interval. Note, this method will create instances of the Event object for recurring events.</li>
				<li><strong>addEvent</strong> - add new event to a data source.</li>
				<li><strong>deleteEvent</strong> - delete event from the data source.</li>			
				<li><strong>deleteCalendar</strong> - delete existent calendar from the data source.</li>			
				<li><strong>showEditEventDialog</strong> - call this method in order to display built-in "edit event" dialog.</li>
				<li><strong>showEditCalendarDialog</strong> - call this method in order to display built-in "edit calendar" dialog.</li>								
			</ul>
			<p>
	
			</p>
</asp:Content>
