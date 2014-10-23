<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DataSources.aspx.cs" Inherits="ControlExplorer.Grid.DataSources" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style type="text/css">
		.wijmo-wijgrid 
		{
			min-height: 100px;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script type="text/javascript">
		var remoteData = new wijdatasource({
			proxy: new wijhttpproxy({
				url: "http://ws.geonames.org/searchJSON",
				dataType: "jsonp",
				data: {
					featureClass: "P",
					style: "full",
					maxRows: 5,
					name_startsWith: "ab"
				},
				key: "geonames"
			}),
			reader: new wijarrayreader([
					 { name: "label", mapping: function (item) { return item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName } },
					 { name: "name", mapping: "name" },
					 { name: "countryCode", mapping: "countryCode" },
					 { name: "continentCode", mapping: "continentCode" }
				  ])
		});
	</script>

	<p>DOM table:</p>
	<asp:GridView runat="server" ID="demoDOM" ShowHeader="false" DataSourceID="AccessDataSource1" />

	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/C1NWind.mdb" 
		SelectCommand="SELECT TOP 5 [EmployeeID], [LastName], [FirstName], [Title] FROM [Employees]">
	</asp:AccessDataSource>

	<wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demoDOM">
		<Columns>
			<wijmo:C1Field HeaderText="EmployeeID" />
			<wijmo:C1Field HeaderText="LastName" />
			<wijmo:C1Field HeaderText="FirstName" />
			<wijmo:C1Field HeaderText="Title" />
		</Columns> 
	</wijmo:C1GridExtender>

	<p>DataTable:</p>
	<asp:Table runat="server" ID="demoDataTable"></asp:Table>
	<wijmo:C1GridExtender runat="server" ID="GridExtender2" TargetControlID="demoDataTable" />

	<p>Remote:</p>
	<asp:Table runat="server" ID="demoRemote"></asp:Table>
	<wijmo:C1GridExtender runat="server" ID="GridExtender3" TargetControlID="demoRemote">
		<Data DataSourceID="remoteData" />
	</wijmo:C1GridExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample shows how to load data into the grid using various methods such as DOM table, DataTable and remote.
	</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
