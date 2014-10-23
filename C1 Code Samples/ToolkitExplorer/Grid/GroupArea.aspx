<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="GroupArea.aspx.cs" Inherits="ToolkitExplorer.Grid.GroupArea" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		function GridExtender2_columnGrouping(e, args) {
		    if (args.dragSource !== "groupArea") {
			    var columns = $("#<%= demo2.ClientID %>").wijgrid("columns");
			    $.each(columns, function (i, w) {
			        if (w.options.dataKey == args.drag.dataKey) {
			            w.options.visible = false;
			        }
			    });
			}
		}

		function GridExtender2_columnUngrouping(e, args) {
		    args.column.visible = true;
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/C1NWind.mdb" 
		SelectCommand="SELECT TOP 10 [OrderID], [ProductID], [UnitPrice], [Quantity] FROM [Order Details]">
	</asp:AccessDataSource>

	<asp:GridView runat="server" ID="demo" DataSourceID="AccessDataSource1" ShowHeader="false" />

	<wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" 
		AllowSorting="true" AllowColMoving="True" ShowGroupArea="True">
		<Columns>
			<wijmo:C1Field HeaderText="OrderID" Aggregate="Count">
				<GroupInfo Position="Header" HeaderText="{1}:{0}, Count={2}" />
			</wijmo:C1Field>
			<wijmo:C1Field HeaderText="ProductID"/>
			<wijmo:C1Field DataType="Currency" HeaderText="UnitPrice" Aggregate="Sum" />
			<wijmo:C1Field DataType="Number" HeaderText="Quantity" DataFormatString="n0" Aggregate="Sum" />
		</Columns>
	</wijmo:C1GridExtender>

	<p>hide the column when grouped:</p>

	<asp:GridView runat="server" ID="demo2" DataSourceID="AccessDataSource1" ShowHeader="false" />

	<wijmo:C1GridExtender runat="server" ID="GridExtender2" TargetControlID="demo2" 
		AllowSorting="true" AllowColMoving="True" ShowGroupArea="True" 
		onclientcolumngrouping="GridExtender2_columnGrouping" 
		onclientcolumnungrouping="GridExtender2_columnUngrouping">
		<Columns>
			<wijmo:C1Field HeaderText="OrderID" Aggregate="Count" Visible="False">
				<GroupInfo Position="Header" HeaderText="{1}:{0}, Count={2}" />
			</wijmo:C1Field>
			<wijmo:C1Field HeaderText="ProductID"/>
			<wijmo:C1Field DataType="Currency" HeaderText="UnitPrice" Aggregate="Sum" />
			<wijmo:C1Field DataType="Number" HeaderText="Quantity" DataFormatString="n0" Aggregate="Sum" />
		</Columns>
	</wijmo:C1GridExtender>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

	<p>
		This sample shows how to use the <b>showGroupArea</b> option to create grouping within wijgrid.
	</p>

	<ul>
		<li>
		The <b>showGroupArea</b> option determines whether the group area should be displayed or not.
		</li>
	</ul>

	<p>
		In order to allow dragging columns into group area, <b>allowColMoving</b> option must be set to true.
	</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
