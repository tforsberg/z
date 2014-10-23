<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="CustomDates.aspx.cs" Inherits="Calendar_CustomDates" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Calendar" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

	<asp:Panel ID="Panel1" runat="server">
	</asp:Panel>

	<wijmo:C1CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Panel1" DisplayDate="2010/12/10" OnClientCustomizeDate="doCustomize" />

	<script type="text/javascript">

		function doCustomize($daycell, date, dayType, hover, preview) {
			if (date.getMonth() === 11 && date.getDate() === 24) {
				var $img = $('<div></div>').width(16).height(16).css('background-image', 'url(Images/xmas.png)');

				$daycell.attr('align', 'right').empty().append($img);

				if ($daycell.hasClass('ui-datepicker-current-day')) {
					$daycell.css('background-color', '#aaa');
				} else
					$daycell.css('background-color', hover ? 'lightgray' : '');
				return true;
			}

			return false;
		}
	</script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
C1CalendarExtender supports customization on rendering.
</p>

<p>
Date cell customization is achieved by specifying the client side function name in <b>OnClientCustomizeDate</b> property.
</p>

<p>
In this sample, calendar displays a ever-green tree image on the Christmas day.
</p>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
