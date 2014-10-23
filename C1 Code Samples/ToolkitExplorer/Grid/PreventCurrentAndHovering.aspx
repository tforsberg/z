<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="PreventCurrentAndHovering.aspx.cs" Inherits="ControlExplorer.Grid.PreventCurrentAndHovering" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script type="text/javascript">
		function cellStyleFormatter (args) {
		    if (args.state & $.wijmo.wijgrid.renderState.current) {
		        args.$cell.removeClass("ui-state-active wijmo-wijgrid-current-headercell wijmo-wijgrid-current-cell");
		    }
		}
		function rowStyleFormatter(args) {
			var rs = $.wijmo.wijgrid.renderState;

			if (args.state & rs.hovered) {
				args.$rows.removeClass("ui-state-hover");
			}

			if (args.state & rs.current) {
				args.$rows.find("td:first").removeClass("ui-state-active wijmo-wijgrid-current-rowheadercell");
			}
		}

	</script>

	<asp:GridView runat="server" ID="demo" DataSourceID="AccessDataSource1" ShowHeader="false" />

	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/C1NWind.mdb" 
		SelectCommand="SELECT top 10 [OrderID], [ProductID], [UnitPrice], [Quantity] FROM [Order Details]">
	</asp:AccessDataSource>

	<wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" ShowRowHeader="true"
		CellStyleFormatter="cellStyleFormatter" RowStyleFormatter="rowStyleFormatter">
		<Columns>
			<wijmo:C1Field HeaderText="OrderID"/>
			<wijmo:C1Field HeaderText="ProductID"/>
			<wijmo:C1Field DataType="Currency" HeaderText="UnitPrice" />
			<wijmo:C1Field DataType="Number" HeaderText="Quantity" DataFormatString="n0" />
		</Columns>
	</wijmo:C1GridExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates how to prevent formatting of the current position and hovering using <b>cellStyleFormatter</b> and <b>rowStyleFormatter</b>.
	</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>