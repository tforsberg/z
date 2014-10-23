<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomDates.aspx.cs" Inherits="ControlExplorer.C1Calendar.CustomDates" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        function customizeDate($daycell, date, dayType, hover, preview) {
            if (date.getMonth() === 11 && date.getDate() === 25) {
                var $img = $('<div></div>').width(16).height(16).css('background-image', 'url(images/xmas.png)');

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
    <wijmo:C1Calendar ID="C1Calendar1" runat="server" DisplayDate="2011-12-01" OnClientCustomizeDate="customizeDate">
    </wijmo:C1Calendar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1Calendar </strong>supports customizing the display of each date cells on the client.
    </p>
    <p>
        The date cell customization is achieved by implementing the client side call back function specified by the <b>OnClientCustomizeDate</b> property.
    </p>
    <p>
        The arguments of the call back function are:
    </p>
        <ul>
            <li>$daycell - jQuery object that represents table cell of the date to be customized. </li>
            <li>date - Date of the cell. </li>
            <li>dayType - Type of the day. </li>
            <li>hover- Whether mouse is over the day cell. </li>
            <li>preview - Whether rendering in preview container. </li>
        </ul>
    <p>
        In this sample, we associate an image with Christmas. It is also useful if you want to highlight some custom dates with your own styles (custom CSS etc.).
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
