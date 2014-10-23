<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ExportAllPages.aspx.cs" Inherits="ControlExplorer.C1GridView.ExportAllPages" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1GridView runat="server" ID="C1GridView1" AutogenerateColumns="False" 
    DataSourceID="SqlDataSource1" AllowPaging="true" PageSize="10" CallbackSettings-Action="All">
		<Columns>
			<wijmo:C1Band HeaderText="Product Information">
				<Columns>
					<wijmo:C1BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName">
						<ItemStyle HorizontalAlign="Center" />
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice">
					</wijmo:C1BoundField>
				</Columns>
			</wijmo:C1Band>
			<wijmo:C1Band HeaderText="Order Information">
				<Columns>
					<wijmo:C1BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity">
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount">
					</wijmo:C1BoundField>
				</Columns>
			</wijmo:C1Band>
			<wijmo:C1Band HeaderText="Order Details">
				<Columns>
					<wijmo:C1BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate">
						<ItemStyle HorizontalAlign="Center" />
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="ShipName" HeaderText="ShipName" SortExpression="ShipName">
					</wijmo:C1BoundField>
				</Columns>
			</wijmo:C1Band>
		</Columns>
	</wijmo:C1GridView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:C1NWindConnectionString %>" ProviderName="<%$ ConnectionStrings:C1NWindConnectionString.ProviderName %>" SelectCommand="SELECT top 15 [Order Details].OrderID, [Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount, Products.ProductName, Orders.OrderDate, Orders.ShipName FROM ((Products INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID) INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID)"></asp:SqlDataSource>
<script type="text/javascript">
    $(function() {
        $("#export").click(exportAllPages);
    });

    function getGrid(){
		return $("#<%=C1GridView1.ClientID%>").data("wijmoC1gridview");
	}

	function exportGrid(id) {
	    var fileName = $("#fileName").val();
	    var type = $("#fileFormats > option:selected").val();
	    var url = $("#serverUrl").val() + "/exportapi/grid";
	    $("#" + id).c1gridview("exportGrid", fileName, type, url);
	}

	function exportAllPages(){
		var grid = getGrid(),
			$gridElement = $(grid.element),
			id = $gridElement.attr("id"),
			options = grid.options,
			originPageSize = options.pageSize,
			originPageCount = options.pageCount;
		//change options to make all data show in one page
		options.pageSize = options.pageSize*options.pageCount;
		options.pageCount = 1;
		
		//requst all data
		$gridElement.wijSaveState("c1gridview", "onwijstatesaving");
        c1common.updateWebFormsInternals(id, __JSONC1.stringify(grid.onwijstatesaving()));
		WebForm_DoCallback(options.innerState.uid, "page:0", initExportGrid, null, null, true);
		
		//change the option back
		options.pageSize = originPageSize;
		options.pageCount = originPageCount;
	}
	
	function initExportGrid(value){
		// generate a temp grid which shows all data in one page
		var response = jQuery.parseJSON(value),
			options = jQuery.parseJSON(response.options),
			id = "tempGridForExport",
			divId = "tempGridForExport_div",
			gridElement = $(response.entity.html).attr("id", id),
			originGrid = getGrid(),
			$originGridElement = $(originGrid.element),
			innerDiv = getParent($originGridElement),
			outterDiv = getParent($originGridElement.parent()).attr("id", divId);
		innerDiv.append(gridElement);
		outterDiv.append(innerDiv);
		$(document.body).append(outterDiv);
		$("#"+id).c1gridview(wijmoASPNetParseOptions(options));
		
		//export the grid
		exportGrid(id);
		
		//remove the temp grid
		$("#"+divId).remove();
	}
	
	function getParent($element){
		return $($element.parent()[0].outerHTML).empty();
	}
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates how export all data when paging is used.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<div class="settingcontainer">
    <div class="settingcontent">
	    <ul>
		    <li class="fullwidth"><input type="button" value="Export" id="export"/></li>
		    <li class="longinput">
				<label>Server Url:</label>
				<input type="text" id="serverUrl" value="http://demos.componentone.com/ASPNET/ExportService">
			</li>
            <li>
				<label>File Name:</label>
				<input type="text" id="fileName" value="export">
			</li>
            <li>
			    <label>File Format:</label>
			    <select id="fileFormats">
				    <option selected="selected" value="Pdf">Pdf</option>
				    <option value="Xls">Xls</option>
				    <option value="Xlsx">Xlsx</option>
				    <option value="Csv">Csv</option>
			    </select> 
		    </li>
	    </ul>
    </div>
</div>
</asp:Content>
