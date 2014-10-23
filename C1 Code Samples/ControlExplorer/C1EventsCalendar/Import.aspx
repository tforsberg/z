<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Import.aspx.cs" Inherits="ControlExplorer.C1EventsCalendar.Import1" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1EventsCalendar"
	TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
		<wijmo:C1EventsCalendar runat="server" ID="C1EventsCalendar1" 
			ViewType="Month" SelectedDate="2011-03-01"
			Width="100%"  Height="475px"></wijmo:C1EventsCalendar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
                <p>
                    The sample demonstrates how to import events from iCal format.
                </p>
			<p>Methods used in the sample:</p>
			<ul>
				<li><strong>DataStorage.Import</strong> - Imports data into the events calendar from a file of the specified format.</li>
				<li><strong>DataStorage.SaveData()</strong> - Save events data to data source or xml file depending on data storage settings.</li>
			</ul>
			<p>Please, note, after import operation, you should call SaveData() method in order to make data changes persistent.</p>
			<pre class="controldescription-code">
  C1EventsCalendar1.DataStorage.Import(
			Server.MapPath("pens_schedule_1011_full.ics"), 
			FileFormatEnum.iCal);
  C1EventsCalendar1.DataStorage.SaveData();
			</pre>
</asp:Content>
