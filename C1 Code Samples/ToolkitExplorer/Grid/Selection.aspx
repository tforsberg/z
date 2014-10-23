<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Selection.aspx.cs" Inherits="ControlExplorer.Grid.Selection" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style type="text/css">
		#demoTable > tbody > tr > td
		{
			vertical-align: top;
			width: 400px;
		}
		
		#selectionLogTable
		{
			table-layout: fixed;
			width: 100%;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script type="text/javascript">
		$(document).ready(function () {
			$("#selectionMode").change(function (e) {
				$("#<%=demo.ClientID %>").wijgrid("option", "selectionMode", $(e.target).val());
			});
		});

		function dataLoaded(e) {
			var data = $(e.target).wijgrid("data"),
				table = $("#selectionLogTable > tbody"),
				row, cell, key,
				i, rowLen = data.length,
				j, cellLen;

			for (i = 0; i < rowLen; i++) {
				row = table[0].insertRow(-1);

				for (key in data[i]) {
					cell = row.insertCell(-1);
					cell.innerHTML = "&nbsp;";
				}
			}
		}

		function selectionChanged() {
			var sc = $("#<%=demo.ClientID %>").wijgrid("selection").selectedCells(),
				log = $("#selectionLogTable");

			log.find("td").removeClass("ui-state-highlight").html("<span>&nbsp</span>");

			for (var i = 0, len = sc.length(); i < len; i++) {
				var cellInfo = sc.item(i);
				var logCell = $(log[0].tBodies[0].rows[cellInfo.rowIndex()].cells[cellInfo.cellIndex()]);
				logCell.addClass("ui-state-highlight").text(cellInfo.value().toString());
			}
		}
	</script>

	<table id="demoTable">
		<tr>
			<td>
				<asp:GridView runat="server" ID="demo" DataSourceID="AccessDataSource1" ShowHeader="false" />
			</td>
			<td>
				<table class="ui-widget ui-widget-content" rules="all" id="selectionLogTable">
					<caption class="ui-widget-header">selection log</caption>
					<tbody></tbody>
				</table>
			</td>
		</tr>
	</table>

	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/C1NWind.mdb" 
		SelectCommand="SELECT top 10 [OrderID], [ProductID], [UnitPrice], [Quantity] FROM [Order Details]">
	</asp:AccessDataSource>
	
	<wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" SelectionMode="SingleRow"
		OnClientDataLoaded="dataLoaded" OnClientSelectionChanged="selectionChanged">
		<Columns>
			<wijmo:C1Field HeaderText="OrderID"/>
			<wijmo:C1Field HeaderText="ProductID"/>
			<wijmo:C1Field DataType="Currency" HeaderText="UnitPrice" />
			<wijmo:C1Field DataType="Number" HeaderText="Quantity" DataFormatString="n0" />
		</Columns>
	</wijmo:C1GridExtender>

	<table id="selectionLog"></table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates the available <b>selectionMode</b> options.
	</p>
	<p>
		Choose a selection mode and select one or more rows, columns, cells, or ranges to see the selection behavior.
	</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<label for="selectionMode">
		Selection mode</label>
	<select id="selectionMode">
		<option>none</option>
		<option>singleCell</option>
		<option selected="selected">singleRow</option>
		<option>singleColumn</option>
		<option>singleRange</option>
		<option>multiColumn</option>
		<option>multiRow</option>
		<option>multiRange</option>
	</select>
</asp:Content>