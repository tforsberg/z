<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Selection.aspx.cs" Inherits="Calendar_Selection" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Calendar" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

	<asp:Panel ID="Panel1" runat="server">
	</asp:Panel>

	<wijmo:C1CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Panel1" ShowWeekDays="true" ShowWeekNumbers="true" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
CalendarExtender supports variant selection options.
</p>

<p>
Date selection is allowed on different cells on month view by setting the <b>SelectionMode<b> property. <b>SelectionMode<b> property is an object that contains five boolean type child properties, they are:
</p>

<ul>
<li>Day</li>
<li>Days</li>
<li>WeekDay</li>
<li>WeekNumber</li>
<li>Month</li>
</ul>

<p>
For example, if we set the <b>SelectionMode.WeekDay<b> to true, then the week day cell is selectable.
If we want the week number selectable, we have to both set the <b>SelectionMode.WeekNumber<b> and <b>ShowWeekDays<b> properties to true.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">

	<div class="demo-options">
		<!-- Begin options markup -->
		<div class="option-row">
			<input type="checkbox" name="selectionmode" id="day" value="day" />Day
			<input type="checkbox" name="selectionmode" id="days" value="days" />Days
			<input type="checkbox" name="selectionmode" id="weekDay" value="weekDay" />Week Day
			<input type="checkbox" name="selectionmode" id="weekNumber" value="weekNumber" />Week
			Number
			<input type="checkbox" name="selectionmode" id="month" value="month" />Month
		</div>
		<!-- End options markup -->
	</div>


	<script type="text/javascript">
		$(function () {
			$.each(["day", "days", "weekDay", "weekNumber", "month"], function (i, name) {
				$("#" + name).attr("checked", !!$('#<%=Panel1.ClientID %>').wijcalendar("option", "selectionMode")[name]);
			});

			$("input[type=checkbox]").change(function () {
				var chk = $(this);
				var selMode = $('#<%=Panel1.ClientID %>').wijcalendar("option", "selectionMode");
				selMode[chk.val()] = chk[0].checked;
				$('#<%=Panel1.ClientID %>').wijcalendar("option", "selectionMode", selMode);
			});
		});
	</script>

</asp:Content>

