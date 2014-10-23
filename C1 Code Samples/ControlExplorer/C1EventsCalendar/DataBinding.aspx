<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DataBinding.aspx.cs" Inherits="ControlExplorer.C1EventsCalendar.DataBinding" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1EventsCalendar"
	TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1EventsCalendar runat="server" ID="C1EventsCalendar1" Width="100%"  Height="475px" VisibleCalendars="">
	<DataStorage>
		<EventStorage DataSourceID="AccessDataSource_Events">
			<Mappings>	
				<IdMapping MappingName="AppointmentId" />			
				<StartMapping MappingName="Start" />
				<EndMapping MappingName="End" />
				<SubjectMapping MappingName="Subject" />
				<LocationMapping MappingName="Location" />
				<DescriptionMapping MappingName="Description" />
				<ColorMapping MappingName="Color" />
				<CalendarMapping MappingName="Calendar" />
				<TagMapping MappingName="Tag" />
			</Mappings>
		</EventStorage>
		<CalendarStorage DataSourceID="AccessDataSource_Calendars">
			<Mappings>
				<IdMapping MappingName="CalendarId" />
				<LocationMapping MappingName="Location" />
				<ColorMapping MappingName="Color" />
				<DescriptionMapping MappingName="Description" />
				<NameMapping MappingName="Name" />
				<PropertiesMapping MappingName="Properties" />
				<TagMapping MappingName="Tag" />
			</Mappings>
		</CalendarStorage>
	</DataStorage>
	</wijmo:C1EventsCalendar>

	<asp:AccessDataSource ID="AccessDataSource_Events" runat="server" 
		DataFile="~/App_Data/EventsCalendarNwind.mdb" 
		DeleteCommand="DELETE FROM [Appointments] WHERE [AppointmentId] = ?" 
		InsertCommand="INSERT INTO [Appointments] ([AppointmentId], [Description], [End], [Location], [Start], [Subject], [Properties], [Color], [Calendar], [Tag]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
		SelectCommand="SELECT * FROM [Appointments]" 
		
		UpdateCommand="UPDATE [Appointments] SET [Description] = ?, [End] = ?, [Location] = ?, [Start] = ?, [Subject] = ?, [Properties] = ?, [Color] = ?, [Calendar] = ?, [Tag] = ? WHERE [AppointmentId] = ?">
		<DeleteParameters>
			<asp:Parameter Name="AppointmentId" Type="Object" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="AppointmentId" Type="Object" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="End" Type="DateTime" />
			<asp:Parameter Name="Location" Type="String" />
			<asp:Parameter Name="Start" Type="DateTime" />
			<asp:Parameter Name="Subject" Type="String" />
			<asp:Parameter Name="Properties" Type="String" />
			<asp:Parameter Name="Color" Type="String" />
			<asp:Parameter Name="Calendar" Type="String" />
			<asp:Parameter Name="Tag" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Description" Type="String"/>
			<asp:Parameter Name="End" Type="DateTime" />
			<asp:Parameter Name="Location" Type="String" />
			<asp:Parameter Name="Start" Type="DateTime" />
			<asp:Parameter Name="Subject" Type="String" />
			<asp:Parameter Name="Properties" Type="String" />
			<asp:Parameter Name="Color" Type="String" />
			<asp:Parameter Name="Calendar" Type="String" />
			<asp:Parameter Name="Tag" Type="String" />
			<asp:Parameter Name="AppointmentId" Type="Object" />
		</UpdateParameters>
	</asp:AccessDataSource>
	<asp:AccessDataSource ID="AccessDataSource_Calendars" runat="server" 
		DataFile="~/App_Data/EventsCalendarNwind.mdb" 
		DeleteCommand="DELETE FROM [Calendars] WHERE [CalendarId] = ?" 
		InsertCommand="INSERT INTO [Calendars] ([CalendarId], [Name], [Description], [Color], [Tag], [Location], [Properties]) VALUES (?, ?, ?, ?, ?, ?, ?)" 
		SelectCommand="SELECT * FROM [Calendars]" 
		
		UpdateCommand="UPDATE [Calendars] SET [Name] = ?, [Description] = ?, [Color] = ?, [Tag] = ?, [Location] = ?, [Properties] = ? WHERE [CalendarId] = ?">
		<DeleteParameters>
			<asp:Parameter Name="CalendarId" Type="String" />
		</DeleteParameters>
		<InsertParameters>
			<asp:Parameter Name="CalendarId" Type="String" />
			<asp:Parameter Name="Name" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="Color" Type="String" />
			<asp:Parameter Name="Tag" Type="String" />
			<asp:Parameter Name="Location" Type="String" />
			<asp:Parameter Name="Properties" Type="String" />
		</InsertParameters>
		<UpdateParameters>
			<asp:Parameter Name="Name" Type="String" />
			<asp:Parameter Name="Description" Type="String" />
			<asp:Parameter Name="Color" Type="String" />
			<asp:Parameter Name="Tag" Type="String" />
			<asp:Parameter Name="Location" Type="String" />
			<asp:Parameter Name="Properties" Type="String" />
			<asp:Parameter Name="CalendarId" Type="String" />
		</UpdateParameters>
	</asp:AccessDataSource>
	<br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to bind data to the <strong>C1EventsCalendar</strong> control.</p>
	<p>
	In order to bind the C1EventsCalendar to a data source, you need to follow these steps:
	</p>
	<p>Configure EventStorage.</p>
	<ul>
		<li>
			Add data source control to your page.
		</li>
		<li>
			Setup the event storage's DataSourceID property. If needed, fill the DataMember property.
		</li>
		<li>			
			Generate Insert/Update/Delete commands if you wish to allow end-user to edit events. e.g.:
		</li>
		<li>
			Configure event storage data mappings. e.g.:
<pre class="controldescription-code">
&lt;EventStorage DataSourceID="AccessDataSource_Events"&gt;
	&lt;Mappings&gt;	
		&lt;IdMapping MappingName="AppointmentId" /&gt;			
		&lt;StartMapping MappingName="Start" /&gt;
		&lt;EndMapping MappingName="End" /&gt;
		&lt;SubjectMapping MappingName="Subject" /&gt;
		&lt;LocationMapping MappingName="Location" /&gt;
		&lt;DescriptionMapping MappingName="Description" /&gt;
		&lt;ColorMapping MappingName="Color" /&gt;
	&lt;/Mappings&gt;
&lt;/EventStorage&gt;
</pre>
		</li>
	</ul>

	<p>Configure CalendarStorage.</p>
	<ul>
		<li>
			Add data source control to your page.
		</li>
		<li>
			Setup the calendar storage's DataSourceID property. If needed, fill the DataMember property.
		</li>
		<li>			
			Generate Insert/Update/Delete commands if you wish to allow end-user to edit calendars.
		</li>
		<li>
			Configure calendar storage data mappings. e.g:
<pre class="controldescription-code">
&lt;CalendarStorage DataSourceID="AccessDataSource_Calendars"&gt;
	&lt;Mappings&gt;
		&lt;IdMapping MappingName="CalendarId" /&gt;
		&lt;LocationMapping MappingName="Location" /&gt;
		&lt;ColorMapping MappingName="Color" /&gt;
		&lt;DescriptionMapping MappingName="Description" /&gt;
		&lt;NameMapping MappingName="Name" /&gt;
		&lt;PropertiesMapping MappingName="Properties" /&gt;
		&lt;TagMapping MappingName="Tag" /&gt;
	&lt;/Mappings&gt;
&lt;/CalendarStorage&gt;
</pre>
		</li>
	</ul>
</asp:Content>
