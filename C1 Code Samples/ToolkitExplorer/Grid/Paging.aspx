<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Paging.aspx.cs" Inherits="ControlExplorer.Grid.Paging" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script type="text/javascript">
		$(document).ready(function () {
			$("#pagerPosition").change(function (e) {
			    var pagerSettings = $.extend({}, $("#<%=demo.ClientID %>").wijgrid("option", "pagerSettings"));
				pagerSettings.position = $(e.target).val();
				$("#<%=demo.ClientID %>").wijgrid("option", "pagerSettings", pagerSettings);
			});

			$("#pagerMode").bind("change", function (e) {
			    var pagerSettings = $.extend({}, $("#<%=demo.ClientID %>").wijgrid("option", "pagerSettings"));
				pagerSettings.mode = $(e.target).val();
				$("#<%=demo.ClientID %>").wijgrid("option", "pagerSettings", pagerSettings);
			});

			$("#pageSize").bind("change", function (e) {
			    $("#<%=demo.ClientID %>").wijgrid("option", "pageSize", parseInt($(e.target).val()));
			});
		});
	</script>
	<asp:GridView runat="server" ID="demo" DataSourceID="AccessDataSource1" ShowHeader="false" />

	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/C1NWind.mdb" 
		SelectCommand="SELECT top 50 [OrderID], [ProductID], [UnitPrice], [Quantity] FROM [Order Details]">
	</asp:AccessDataSource>

	<wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" AllowPaging="true" PageSize="5">
		<Columns>
			<wijmo:C1Field HeaderText="OrderID"/>
			<wijmo:C1Field HeaderText="ProductID"/>
			<wijmo:C1Field DataType="Currency" HeaderText="UnitPrice" />
			<wijmo:C1Field DataType="Number" HeaderText="Quantity" DataFormatString="n0" />
		</Columns>
		<PagerSettings Position="Bottom" PageButtonCount="5" />
	</wijmo:C1GridExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates how you can create a pageable grid by setting the <b>allowPaging</b>,
		<b>pageSize</b> and <b>pagerSettings</b> options.
	</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<label for="pagerPosition">
		Position</label>
	<select id="pagerPosition">
		<option selected="selected">bottom</option>
		<option>top</option>
		<option>topAndBottom</option>
	</select>

	<label for="pagerMode">
		Mode</label>
	<select id="pagerMode">
		<option>nextPrevious</option>
		<option>nextPreviousFirstLast</option>
		<option>numeric</option>
		<option>numericFirstLast</option>
	</select>

	<label for="pageSize">
		Page size</label>
	<select id="pageSize">
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option selected="selected">5</option>
		<option>10</option>
		<option>25</option>
	</select>
</asp:Content>