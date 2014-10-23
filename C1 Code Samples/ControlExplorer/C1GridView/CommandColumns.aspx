<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CommandColumns.aspx.cs" Inherits="ControlExplorer.C1GridView.CommandColumns" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>
			<wijmo:C1GridView runat="server" ID="C1GridView1" AllowPaging="true" PageSize="10" AutogenerateColumns="False" DataSourceID="SqlDataSource1">
				<Columns>
					<wijmo:C1TemplateField HeaderText="Link">
						<ItemTemplate>
							<asp:LinkButton runat="server" ID="LinkBtn1" OnClick="LinkBtn1_Click" CommandArgument='<%# Eval("ShipCountry") %>' Text="Show Country"></asp:LinkButton>
						</ItemTemplate>
					</wijmo:C1TemplateField>
					<wijmo:C1TemplateField HeaderText="Button" Width="120">
						<ItemTemplate>
							<asp:Button runat="server" ID="btn1" OnClick="btn1_Click" CommandArgument='<%# Eval("ShipCountry") %>' CssClass="buttonCommand" Text="Show Country" />
						</ItemTemplate>
					</wijmo:C1TemplateField>
					<wijmo:C1TemplateField HeaderText="imageButton" Width="150">
						<ItemTemplate>
							<asp:LinkButton runat="server" ID="btn2" OnClick="btn2_Click" CssClass="imagebuttonCommand" CommandArgument='<%# Eval("ShipCountry") %>' Text="Show Country" />
						</ItemTemplate>
					</wijmo:C1TemplateField>
					<wijmo:C1TemplateField HeaderText="Image">
						<ItemTemplate>
							<asp:LinkButton runat="server" ID="btn3" OnClick="btn3_Click" CssClass="imageCommand" CommandArgument='<%# Eval("ShipCountry") %>' Text="Show Country" />
						</ItemTemplate>
					</wijmo:C1TemplateField>
					<wijmo:C1BoundField DataField="ShipCountry" HeaderText="Country" SortExpression="ShipCountry">
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName">
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice">
					</wijmo:C1BoundField>
					
				</Columns>
			</wijmo:C1GridView>
			<div>Command result:
			<asp:Label runat="server" ID="ShowCountryLabel"></asp:Label>
				</div>
			
		</ContentTemplate>
	</asp:UpdatePanel>
	
	<script type="text/javascript">
		Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function () {
			$(".buttonCommand").button();
			$(".imagebuttonCommand").button({
				icons: {
					primary: "ui-icon-info"
				}
			});
			$(".imageCommand").button({
				icons: {
					primary: "ui-icon-info"
				},
				text: false
			});
		});
	</script>

	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:C1NWindConnectionString %>" ProviderName="<%$ ConnectionStrings:C1NWindConnectionString.ProviderName %>" SelectCommand="SELECT top 20 Products.ProductName, [Order Details].UnitPrice, Orders.ShipCountry FROM (([Order Details] INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID) INNER JOIN Products ON [Order Details].ProductID = Products.ProductID)"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample shows using <b>ItemTemplate</b> to render custom commands.</p>
</asp:Content>
