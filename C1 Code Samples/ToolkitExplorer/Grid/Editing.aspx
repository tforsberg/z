<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Editing.aspx.cs" Inherits="ControlExplorer.Grid.Editing" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script type="text/javascript">
		function dataLoaded(e) {
			$("#log").html(dump($(e.target).wijgrid("data")));
		}

		function afterCellUpdate(e, args) {
			$("#log").html(dump($(e.target).wijgrid("data")));
		}

		function invalidCellValue(e, args) {
			$(args.cell.container())
				.addClass("ui-state-error");
		}

		function afterCellEdit(e, args) {
			$(args.cell.container())
				.removeClass("ui-state-error");
		}

		function dump(d2array) {
			var str = "<table class=\"ui-widget ui-widget-content\" rules=\"all\">" +
				"<caption class=\"ui-widget-header\">dump</caption>\n";

			for (var i = 0, rowLen = d2array.length; i < rowLen; i++) {
				var row = d2array[i];

				str += "<tr>";

				for (var key in row) {
					if (row.hasOwnProperty(key)) {
						str += "<td>" + row[key] + "</td>";
					}
				}

				str += "</tr>\n";
			}

			return str + "</table>";
		}
	</script> 

	<asp:Table runat="server" ID="demo"></asp:Table>
	<wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo"
		AllowEditing="true" AllowKeyboardNavigation="true" ShowRowHeader="true" SelectionMode="None" HighlightCurrentCell="true"
		OnClientAfterCellUpdate="afterCellUpdate" OnClientAfterCellEdit="afterCellEdit" OnClientInvalidCellValue="invalidCellValue"
		OnClientDataLoaded="dataLoaded">
		<Columns>
			<wijmo:C1Field />
			<wijmo:C1Field DataType="Currency" ValueRequired="true"/>
			<wijmo:C1Field DataType="Number" DataFormatString="n0" />
			<wijmo:C1Field DataType="Number" DataFormatString="p0" />
			<wijmo:C1Field DataType="Boolean" />
		</Columns>
	</wijmo:C1GridExtender>

	<hr />
	<div id="log">log</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample shows how you can edit the grid by enabling the <b>allowEditing</b> option. 
	</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>