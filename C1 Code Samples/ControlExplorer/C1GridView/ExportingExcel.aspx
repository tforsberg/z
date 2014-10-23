<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ExportingExcel.aspx.cs" Inherits="ControlExplorer.C1GridView.ExportingExcel" %>

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
<script type="text/javascript">
    $(function() {
        $("#exportExcel").click(exportExcel);
    });

    function exportExcel() {
        var fileName = $("#fileName").val();
        var type = $("#excelFileFormats > option:selected").val();
        var excelSetting = {
            showGridLines: $("#showGridLines").prop('checked'),
            autoRowHeight: $("#autoRowHeight").prop('checked'),
            author: $("#xlsAuthor").val()
        };
        var url = $("#serverUrl").val() + "/exportapi/grid";
        $("#<%=C1GridView1.ClientID%>").c1gridview("exportGrid", fileName, type, excelSetting, url);
    }
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates how to export <strong>C1GridView</strong> to Excel(Xls/Xlsx) files with settings by Export Service.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<div class="settingcontainer">
    <div class="settingcontent">
	    <ul>
		    <li class="fullwidth"><input type="button" value="Export" id="exportExcel"/></li>
		    <li>
			    <label>File Format:</label>
			    <select id="excelFileFormats">
				    <option selected="selected" value="xls">Xls</option>
				    <option value="xlsx">Xlsx</option>
			    </select> 
		    </li>
		    <li><label>Author:</label><input type="text" id="xlsAuthor" value="ComponentOne"/></li>
		    <li><input type="checkbox" id="autoRowHeight"/><label class="widelabel">Auto Row Height</label></li>
		    <li><input type="checkbox" id="showGridLines" checked="checked"/><label class="widelabel">Show Grid Lines</label></li>
            <li class="longinput">
				<label>Server Url:</label>
				<input type="text" id="serverUrl" value="http://demos.componentone.com/ASPNET/ExportService">
			</li>
            <li>
				<label>File Name:</label>
				<input type="text" id="fileName" value="export">
			</li>
	    </ul>
    </div>
</div>
</asp:Content>
