<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1Calendar_QuickNav" Codebehind="QuickNav.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<wijmo:C1Calendar ID="C1Calendar1" runat="server" NavButtons="Quick">
</wijmo:C1Calendar>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
<p>
<strong>C1Calendar</strong> supports quick navigation.
</p>
<p>
To enable quick navigation, you can set the <b>NavButtons</b> property to 'Quick'.
The <b>QuickNavSteps</b> property determines the number of months to jump over when users click one of the quick navigation buttons. The default value is 12, so the calendar will skip forward a full year by default.
</p>

<p>
If you don't want any of the navigation buttons to be displayed, could set the <b>NavButtons</b> property to 'None'.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

