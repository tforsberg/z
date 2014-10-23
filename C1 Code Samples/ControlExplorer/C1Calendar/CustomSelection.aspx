<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1Calendar_CustomSelection" Codebehind="CustomSelection.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<wijmo:C1Calendar ID="C1Calendar1" runat="server" OnClientBeforeSelect="beforeSelect">
</wijmo:C1Calendar>
	<h4>Selected dates:</h4>
	<ul id="msg" style="margin-left:20px;max-height:100px; overflow:auto"></ul>
	<script>
		function beforeSelect(e, data) {
			var id = "#<%=C1Calendar1.ClientID%>";
			//get selected Dates.
			var selDates = $(id).c1calendar('option', 'selectedDates'),
				selected = false,
				list;
			$.each(selDates, function (i, d) {
				if (data.date.getFullYear() === d.getFullYear() &&
						data.date.getMonth() === d.getMonth() &&
						data.date.getDate() === d.getDate()) {
					selected = true;
					return false;
				}
			});

			if (selected) {
				$(id).c1calendar('unSelectDate', data.date);
			} else {
				$(id).c1calendar('selectDate', data.date);
			}

			list = $("#msg").empty();
			selDates = $(id).c1calendar('option', 'selectedDates');
			$.each(selDates, function (i, d) {
				var li = $("<li/>");
				li.text(d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate());
				list.append(li);
			});

			return false;
		}
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
<p>
	This sample demonstrates how to customize the selection behavior by using the 
	beforeSelect event and selectedDates array.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>