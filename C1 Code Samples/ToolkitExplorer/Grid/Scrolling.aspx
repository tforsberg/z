<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Scrolling.aspx.cs" Inherits="ControlExplorer.Grid.Scrolling" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script type="text/javascript">
	</script>

	<asp:GridView runat="server" ID="demo" DataSourceID="AccessDataSource1" ShowHeader="false" Height="300" />

	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/C1NWind.mdb" 
		SelectCommand="SELECT top 50 [OrderID], [ProductID], [UnitPrice], [Quantity] FROM [Order Details]">
	</asp:AccessDataSource>

	<wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" ScrollMode="Auto">
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
		This sample sets the <b>scrollMode</b> option to "auto" to automatically add a scrollbar to the grid.
	</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>