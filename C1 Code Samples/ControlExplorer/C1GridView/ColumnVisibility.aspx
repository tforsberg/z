<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ColumnVisibility.aspx.cs" Inherits="ControlExplorer.C1GridView.ColumnVisibility" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<wijmo:C1GridView runat="server" PageSize="15" AllowPaging="true" ID="C1GridView1" AutogenerateColumns="False" DataSourceID="SqlDataSource1">
				<CallbackSettings Action="Paging" />
				<Columns>
					<wijmo:C1BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName">
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="UnitPrice" HeaderText="UnitPrice" DataFormatString="c" SortExpression="UnitPrice">
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="Quantity" DataFormatString="n0" HeaderText="Quantity" SortExpression="Quantity">
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="Discount" HeaderText="Discount" DataFormatString="p" SortExpression="Discount">
					</wijmo:C1BoundField>

					<wijmo:C1BoundField DataField="OrderDate" HeaderText="OrderDate" DataFormatString="MMM-dd-yyyy" SortExpression="OrderDate">
						<ItemStyle HorizontalAlign="Center" />
					</wijmo:C1BoundField>

					<wijmo:C1CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued">
					</wijmo:C1CheckBoxField>

				</Columns>
			</wijmo:C1GridView>
		</ContentTemplate>
	</asp:UpdatePanel>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:C1NWindConnectionString %>" ProviderName="<%$ ConnectionStrings:C1NWindConnectionString.ProviderName %>" SelectCommand="SELECT TOP 20 Products.ProductName, Products.Discontinued, Orders.OrderDate, [Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount FROM (([Order Details] INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID) INNER JOIN Products ON [Order Details].ProductID = Products.ProductID) ORDER BY Orders.OrderDate DESC"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
	
	<asp:UpdatePanel ID="UpdatePanel2" runat="server">
		<ContentTemplate>
			<div class="settingcontainer">
				<div class="settingcontent">
					<ul>
					    <li class="fullwidth"><label class="settinglegend">Visible Columns:</label></li>
						<li><asp:CheckBox runat="server" ID="chk_0" Text="ProductName" Checked="true" AutoPostBack="true" OnCheckedChanged="chkbox_CheckedChanged" /></li>
						<li><asp:CheckBox runat="server" ID="chk_1" Text="UnitPrice" Checked="true" AutoPostBack="true" OnCheckedChanged="chkbox_CheckedChanged" /></li>
						<li><asp:CheckBox runat="server" ID="chk_2" Text="Quantity" Checked="true" AutoPostBack="true" OnCheckedChanged="chkbox_CheckedChanged" /></li>
						<li><asp:CheckBox runat="server" ID="chk_3" Text="Discount" Checked="true" AutoPostBack="true" OnCheckedChanged="chkbox_CheckedChanged" /></li>
						<li><asp:CheckBox runat="server" ID="chk_4" Text="OrderDate" Checked="true" AutoPostBack="true" OnCheckedChanged="chkbox_CheckedChanged" /></li>
						<li><asp:CheckBox runat="server" ID="chk_5" Text="Discontinued" Checked="true" AutoPostBack="true" OnCheckedChanged="chkbox_CheckedChanged" /></li>
					</ul>
				</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
	This sample illustrates how columns can be hidden using the visible property. To show or hide a column, check or uncheck the corresponding checkbox.</p>
</asp:Content>
