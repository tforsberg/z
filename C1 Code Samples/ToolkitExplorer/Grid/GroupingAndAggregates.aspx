<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="GroupingAndAggregates.aspx.cs" Inherits="ControlExplorer.Grid.GroupingAndAggregates" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:GridView runat="server" ID="demo" DataSourceID="AccessDataSource1" ShowHeader="false" />

	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/C1NWind.mdb" 
		SelectCommand="SELECT TOP 10 [OrderID], [ProductID], [UnitPrice], [Quantity] FROM [Order Details]">
	</asp:AccessDataSource>

	<wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" AllowSorting="true">
		<Columns>
			<wijmo:C1Field HeaderText="OrderID" Aggregate="Count">
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
		This sample shows how to use the <b>groupInfo</b> and <b>aggregate</b> options to create grouping within wijgrid.
	</p>
	<ul>
		<li>
		The <b>groupInfo</b> option determines whether a group should be created for the column, as well as the
		appearance, position, and content of the group header and group footer rows.</li>
		<li>
		The <b>aggregate</b> option determines the type of aggregate that should be calculated for this column
		and included in the group header and footer rows.</li>
	</ul>
	<p>
		In this sample the sum value aggregate is used.
	</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>