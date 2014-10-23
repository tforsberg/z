<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Overview.aspx.cs" Inherits="List_Overview" %>

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
			var selectedItem = ui.item;
			var str = selectedItem.label;
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
				<wijmo:C1ListExtender runat="server" ID="ListExtender1" TargetControlID="list" OnClientSelected="BindSelect">
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
	<p>
		C1ListExtender allows users to select one or more items from a list. 
		User can use ListItem to populate a C1ListExtender.
	</p>
</asp:Content>
