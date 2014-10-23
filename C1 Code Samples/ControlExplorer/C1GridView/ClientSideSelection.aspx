<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ClientSideSelection.aspx.cs" Inherits="ControlExplorer.C1GridView.ClientSideSelection" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style type="text/css">
		#demoTable > tbody > tr > td
		{
			vertical-align: top;
			width: 350px;
		}

		#logTable
		{
			table-layout: fixed;
			margin-left: 20px;
			width: 100%;
		}
	</style>

	<script type="text/javascript">
		var flag = false;

		function changeClientSelectionMode(value) {
			$('#<%= C1GridView1.ClientID %>').c1gridview("option", "clientSelectionMode", value);
        }

        function onClientSelectionChanged() {
        	ensureLogTable();

        	var selectedCells = $('#<%= C1GridView1.ClientID %>').c1gridview("selection").selectedCells(),
                log = $("#logTable"),
                i, cellInfo;

            log
                .find("td")
                .removeClass("ui-state-highlight")
                .html("&nbsp");

            for (i = 0; i < selectedCells.length() ; i++) {
            	cellInfo = selectedCells.item(i);

            	$(log[0].tBodies[0].rows[cellInfo.rowIndex()].cells[cellInfo.cellIndex()])
                    .addClass("ui-state-highlight")
                    .text(cellInfo.value().toString());
            }
		}

		function ensureLogTable() {
			if (!flag) {
				var source = document.getElementById("<%= C1GridView1.ClientID %>").tBodies[0],
                    target = document.getElementById("logTable").tBodies[0],
                    i, j, row;

            	for (i = 0; i < source.rows.length; i++) {
            		var row = target.insertRow(-1);
            		for (j = 0; j < source.rows[i].cells.length; j++) {
            			row.insertCell(-1).innerHTML = "&nbsp;";
            		}
            	}
            }

			flag = true;
		}
	</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>

	<table id="demoTable">
		<tr>
			<td>
				<wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1"
					AutogenerateColumns="false" ClientSelectionMode="SingleRow" OnClientSelectionChanged="onClientSelectionChanged">
					<Columns>
						<wijmo:C1BoundField DataField="OrderID" HeaderText="ID" />
						<wijmo:C1BoundField DataField="ShipName" HeaderText="Ship name" />
						<wijmo:C1BoundField DataField="ShipCity" HeaderText="Ship city" />
					</Columns>
				</wijmo:C1GridView>
			</td>
			<td>
				<table class="ui-widget ui-widget-content" rules="all" id="logTable">
					<caption class="ui-widget-header">selection log</caption>
					<colgroup>
						<col width="50" />
						<col width="200" />
						<col />
					</colgroup>
					<tbody>
					</tbody>
				</table>
			</td>
		</tr>
	</table>

	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"
		ProviderName="System.Data.OleDb" SelectCommand="SELECT TOP 10 [OrderID], [ShipName], [ShipCity] FROM ORDERS"></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		The <strong>C1GridView</strong> supports several modes of client-side cell selection. This sample shows these modes and demonstrates
        how to use the client-side object model to change selection mode without sending requests to the server.
	</p>

	<p>
		Client-side selection is allowed if the <strong>ClientSelectionMode</strong> property is set to the value other than None.
	</p>

	<p>
		Choose a selection mode and select one or more rows, columns, cells, or ranges to see the selection behavior.
	</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<div class="settingcontainer">
		<div class="settingcontent">
			<ul>
				<li class="fullwidth">
					<label for="ddSelectionMode">Selection modes&nbsp;</label>
					<select id="ddSelectionMode" onchange="changeClientSelectionMode(this.value)">
						<option value="none">None</option>
						<option value="singleCell">SingleCell</option>
						<option value="singleColumn">SingleColumn</option>
						<option value="singleRow" selected="selected">SingleRow</option>
						<option value="singleRange">SingleRange</option>
						<option value="multiColumn">MultiColumn</option>
						<option value="multiRow">MultiRow</option>
						<option value="multiRange">MutliRange</option>
					</select></li>
			</ul>
		</div>
	</div>
</asp:Content>
