﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ClientSideEditing.aspx.cs" Inherits="ControlExplorer.C1GridView.Editing1" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style type="text/css">
		.wijmo-wijgrid .wijmo-wijinput .wijmo-wijinput-trigger .ui-icon
		{
			margin-top: 0px;
		}
	</style>

	<script type="text/javascript">
		function beforeCellEdit(e, args) {
			if (args.cell.column().dataField === "ShippedDate") {
				$("<input />")
					.width("100%")
					.appendTo(args.cell.container().empty())
					.wijinputdate({
						date: args.cell.value(),
						showTrigger: true
					});

				args.handled = true;
			}
		}

		function beforeCellUpdate(e, args) {
			if (args.cell.column().dataField === "ShippedDate") {
				args.value = args.cell.container()
					.find("input")
					.wijinputdate("option", "date");
			}
		}

		function afterCellEdit(e, args) {
			if (args.cell.column().dataField === "ShippedDate") {
				args.cell.container()
					.find("input")
					.wijinputdate("destroy");
			}
		}
	</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>

	<wijmo:C1GridView ID="C1GridView1" runat="server"
		AutoGenerateDeleteButton="true" AllowClientEditing="true" DataKeyNames="OrderID" HighlightCurrentCell="true" ShowRowHeader="true"
		OnRowUpdating="C1GridView1_RowUpdating" OnEndRowUpdated="C1GridView1_EndRowUpdated" OnRowDeleting="C1GridView1_RowDeleting" AllowKeyboardNavigation="true"
		
		OnClientBeforeCellEdit="beforeCellEdit" OnClientBeforeCellUpdate="beforeCellUpdate" OnClientAfterCellEdit="afterCellEdit">
		<CallbackSettings Action="Editing" />
	</wijmo:C1GridView>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
		The <strong>C1GridView</strong> supports client editing. This  sample shows how to update a dataset stored in the session object when 
		client editing is used and how to provide client-side custom editors.
	</p>

	<p>The following properties are used in this sample:</p>
	<ul>
		<li><strong>AllowClientEditing</strong> - to allow end-user to edit current cell value.</li>
		<li><strong>AllowKeyboardNavigation</strong> - to allow end-user to change current cell position using keyboard.</li>
		<li><strong>HighlightCurrentCell</strong> - to highlight position of the current cell.</li>
	</ul>

	<p>
		The following client-side event handlers are used in this sample to create a custom editor (wijinputdate) for the <strong>ShippedDate</strong> column:
	</p>
	<ul>
		<li><strong>OnClientBeforeCellEdit</strong> - creating the custom editor before editing.</li>
		<li><strong>OnClientBeforeCellUpdate</strong> - passing edited value to the grid before editing finishes.</li>
		<li><strong>OnClientAfterCellEdit</strong> - destroying editor when editing is done.</li>
	</ul>

	<p>The following server-side event handlers are used in this sample:</p>
	<ul>
		<li><strong>RowUpdating</strong> - updating datasource with the values obtained from client.</li>
		<li><strong>EndRowUpdating</strong> - committing changes.</li>
	</ul>

	<p>Current cell goes in edit mode if:</p>
	<ul>
		<li>It is double-clicked with the left mouse button.</li>
		<li><strong>F2</strong> key is pressed on the keyboard (cursor is placed at the end of editor area).</li>
		<li>Any alphanumeric key is pressed (original value is replaced with inputted symbol).</li>
	</ul>

	<p>Editing of the current cell is committed if:</p>
	<ul>
		<li>Current cell position is changed.</li>
		<li><strong>F2</strong> or <strong>Enter</strong> key is pressed (only for default editors).</li>
	</ul>

	<p>Pressing <strong>Esc</strong> key cancels editing of the current cell restoring original value.</p>

	<p>When current row position is changed all the accumulated changes are sent to server.</p>
</asp:Content>