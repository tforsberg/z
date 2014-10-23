<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomHandleResponse.aspx.cs" Inherits="ControlExplorer.C1GridView.CustomHandleResponse" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1GridView runat="server" ID="C1GridView1" AutogenerateColumns="False" DataSourceID="SqlDataSource1">
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
<script type="text/javascript" src="<%= Page.ResolveUrl("~/explore/js/export/FileSaver.js") %>"></script>
<script type="text/javascript" src="<%= Page.ResolveUrl("~/explore/js/export/utils.js") %>"></script>
<script type="text/javascript">
    $(function() {
        $("#export").click(customHandleResponse);
    });

    function getGrid(){
		return $("#<%=C1GridView1.ClientID%>").data("wijmoC1gridview");
	}

	function customHandleResponse() {
	    wijmo.exporter.exportGrid({
            grid: getGrid(),
            serviceUrl: getServiceUrl(),
            fileName: $("#fileName").val(),
		    exportFileType: wijmo.exporter.ExportFileType[$("#fileFormats > option:selected").val()],
			receiver: saveFile,
			contentType: "application/json"
		});
	}

	function getServiceUrl(){
		return $("#serverUrl").val()+"/exportapi/grid";
    }
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates how to export <strong>C1GridView</strong> by sending the 
        request with json data and handling the response data to save as a file.
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
