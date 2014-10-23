<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="MultipleSelection.aspx.cs" Inherits="List_MultipleSelection" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1List"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<style type="text/css">
		.list
		{
			height: 200px;
			width: 300px;
		}
		#testinput
		{
			width: 150px;
			padding: 5px;
		}
	</style>
	<script type="text/javascript">
		function BindSelect(event, ui) {
			var selectedItems = ui.selectedItems;
			var str = $.map(selectedItems, function (n) {
				return n.label;
			}).join(",");
			$("#testinput").val(str);
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<div class="container">
		<div class="header">
			<h2>
				Overview</h2>
		</div>
		<div class="main demo">
			<!-- Begin demo markup -->
			<div class="ui-widget">
				<input readonly="readonly" id="testinput" type="text" class="ui-widget-content ui-corner-all" />
				<asp:Panel runat="server" ID="list" CssClass="list">
				</asp:Panel>
				<wijmo:C1ListExtender runat="server" ID="ListExtender1" TargetControlID="list" SelectionMode="Multiple"
					OnClientSelected="BindSelect">
					<ListItems>
						<wijmo:ListItem Label="Label1" Value="Value1" />
						<wijmo:ListItem Label="Label2" Value="Value2" />
						<wijmo:ListItem Label="Label3" Value="Value3" />
						<wijmo:ListItem Label="Label4" Value="Value4" />
						<wijmo:ListItem Label="Label5" Value="Value5" />
						<wijmo:ListItem Label="Label6" Value="Value6" />
					</ListItems>
				</wijmo:C1ListExtender>
			</div>
			<!-- End demo markup -->
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

		<p>The C1ListExtender supports multiple selection.</p>

		<p>Multiple selection is allowed if the following options are set to corresponding values:</p>
		<ul>
		<li>SelectionMode:Multiple</li>
		</ul> 
		<p>The default value of "SelectionMode" is "Single".</p>
		<p>End-users can select multiple items onceSelectionMode is set to Multiple.</p>

</asp:Content>
