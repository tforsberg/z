<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="QuickNav.aspx.cs" Inherits="Calendar_QuickNav" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Calendar" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

	<asp:Panel ID="Panel1" runat="server">
	</asp:Panel>

	<wijmo:C1CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Panel1" NavButtons="Quick" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
C1CalendarExtender supports quick navigation.
</p>
<p>
To enable quick navigation, you can set the <b>NavButtons</b> property to 'Quick', thus the quick navigation buttons will be displayed.
The <b>QuickNavSteps</b> property determines the number of months to jump over, default value is 12.
</p>

<p>
If you don't want any of the navigation buttons been displayed, could set the <b>NavButtons</b> property to 'None'.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

