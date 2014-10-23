<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomEditEvent.aspx.cs" Inherits="ControlExplorer.C1EventsCalendar.CustomEditEvent" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1EventsCalendar"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		function beforeShowDialog(e, args) {
			{
				// *** Variant 1:  create custom dialog for new events:
				var dlg = $(".customEventDialogSample"),
						targetCell = args.targetCell;
				eventData = args.data;
				if (eventData.prevData) {
					// show custom dialog only for new events
					return true;
				}
				if (!dlg.length) {
					// create custom dialog content
					dlg = $("<div class=\"customEventDialogSample ui-widget-content ui-corner-all\"" +
					" style=\"width: 300px; height: 300px; z-index: 999; position: absolute; top: 0px; left: 0px;\">" +
					"<label class=\"dialogCaption\"></label>" +
					"<hr/>" +
					"Subject: <input type=\"text\" name=\"subject\" class=\"inputSubject\" value=\"\">" +
					"<hr/>" +
					"<a href=\"#\" class=\"cancelButton\">Cancel</a>" +
					"<a href=\"#\" class=\"saveButton\">Save</a></div>");
					$(document.body).append(dlg);

					dlg.wijpopup({
						autoHide: true
					});
					dlg.find(".cancelButton").button().click(function () {
						dlg.wijpopup("hide");
					});
					dlg.find(".saveButton").button().click(function () {
						var evcal = $("#<%= C1EventCalendar1.ClientID %>");
						eventData.subject = dlg.find(".inputSubject").val();

						if (!eventData.prevData) {
							// add new event
							evcal.c1eventscalendar("addEvent", eventData,
								function () { /*alert("Event added.") */ },
								function (err) { alert("(Add event) Error:" + err) });
						} else {
							evcal.c1eventscalendar("updateEvent", eventData,
							function () { /*alert("Event updated.") */ },
								function (err) { alert("(Update event) Error:" + err) });
						}
						dlg.wijpopup("hide");
					});


				}

				// bind event to dialog controls:
				dlg.find(".dialogCaption").html(eventData.prevData ? "Edit event dialog caption" : "Add event dialog caption");
				dlg.find(".inputSubject").val(eventData.subject);

				// show dialog using wijpopup widget:
				dlg.wijpopup("show",
				{
					of: targetCell,
					my: "left center",
					at: "right center",
					offset: "0 0",
					collision: "fit"
				});
				return false; // prevent built-in dialog to be shown.
			}
		}

	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1EventsCalendar runat="server" ID="C1EventCalendar1" OnClientBeforeEditEventDialogShow="beforeShowDialog" Width="100%">
	</wijmo:C1EventsCalendar>
	<script type="text/javascript">
		$(document).ready(function () {
			var evcal = $("#<%= C1EventCalendar1.ClientID %>");
			evcal.c1eventscalendar({
				editEventDialogTemplate: "<div class=\"" +
					"customdialog-sample wijmo-wijev-event-dialog ui-widget-content ui-corner-all\">" +
					"<ul class=\"wijmo-wijev-brief-content\">" +
					"<li style=\"color: red;\"><label>Subject:</label>" +
					"<input type=\"text\" name=\"subject\" class=\"wijmo-wijev-subject\" value=\"\">" +
					"<div class=\"wijmo-wijev-color-button\">" +
					"<div class=\"wijmo-wijev-color ui-wijmo-wijev-event-color-default\">&nbsp;</div>" +
					"</div>" +
					"</li>" +
					"<li><label for=\"_alldaybtn\">all-day</label>" +
					"<input type=\"checkbox\" class=\"wijmo-wijev-allday\" id=\"_alldaybtn\" />" +
					"</li>" +
					"<li><label>Starts</label>" +
					"<input type=\"text\" class=\"wijmo-wijev-start\" value=\"\">" +
					"<input type=\"text\" class=\"wijmo-wijev-start-time\" value=\"\">" +
					"</li>" +
					"<li><label>Ends</label>" +
					"<input type=\"text\" class=\"wijmo-wijev-end\" value=\"\">" +
					"<input type=\"text\" class=\"wijmo-wijev-end-time\" value=\"\">" +
					"</li>" +
					"</ul>" +
					"<ul class=\"wijmo-wijev-detailed-content ui-corner-all\">" +
					"<li><label>Location</label>" +
					"<input type=\"text\" class=\"wijmo-wijev-location\" value=\"\"></li>" +
					"<li><label>Repeat</label>" +
					"<select class=\"wijmo-wijev-repeat\">" +
					"<option value=\"none\">None</option>" +
					"<option value=\"daily\">Every Day</option>" +
					"<option value=\"workdays\">Work days</option>" +
					"<option value=\"weekly\">Every Week</option>" +
					"<option value=\"monthly\">Every Month</option>" +
					"<option value=\"yearly\">Every Year</option>" +
					"</select></li>" +
					"<li><label>Calendar</label>" +
						"<select class=\"wijmo-wijev-calendar\"></select></li>" +
					"<li class=\"wijmo-wijev-description-item\"><label>Description</label>" +
						"<textarea class=\"wijmo-wijev-description\" /></li>" +
					"</ul>" +
					"<div class=\"footer\">" +
					"<a href=\"#\" class=\"wijmo-wijev-delete\">Delete</a>" +
					"<a href=\"#\" class=\"wijmo-wijev-save\">OK</a>" +
					"<a href=\"#\" class=\"wijmo-wijev-cancel\">Cancel</a>" +
					"</div>" +
					"<div class=\"wijmo-wijev-angle\"></div>" +
					"</div>"
			});
		});
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
	The sample demonstrates how to create new custom event dialog.</p>
</asp:Content>
