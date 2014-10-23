<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomEditors.aspx.cs" Inherits="ControlExplorer.C1GridView.CustomEditors" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server">
		<ContentTemplate>
			<wijmo:C1GridView ID="C1GridView1" runat="server" AllowPaging="True" PageSize="10"
				DataKeyNames="ProductID" AutogenerateColumns="False" OnRowUpdated="C1GridView1_RowUpdated"
				OnPageIndexChanging="C1GridView1_PageIndexChanging"
				OnRowCancelingEdit="C1GridView1_RowCancelingEdit" OnRowEditing="C1GridView1_RowEditing"
				OnRowUpdating="C1GridView1_RowUpdating" OnRowDeleting="C1GridView1_RowDeleting">
				<PagerSettings Mode="NextPreviousFirstLast" />
				<Columns>
					<wijmo:C1BoundField DataField="ProductName" HeaderText="ProductName"></wijmo:C1BoundField>
					<wijmo:C1TemplateField HeaderText="CategoryName">
						<ItemTemplate>
							<%# GetCategoryName((int)Eval("CategoryID")) %>
						</ItemTemplate>
						<EditItemTemplate>
							<wijmo:C1ComboBox runat="server" ID="combobox1" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryID"
								 Text='<%# GetCategoryName((int)Eval("CategoryID")) %>'></wijmo:C1ComboBox>
						</EditItemTemplate>
						<UpdateBindings>
							<wijmo:C1GridViewUpdateBinding ControlProperty="combobox1.SelectedValue" UpdateField="CategoryID" />
						</UpdateBindings>
					</wijmo:C1TemplateField>
					<wijmo:C1TemplateField HeaderText="UnitPrice">
						<ItemStyle HorizontalAlign="Right" />
						<ItemTemplate>
							<%# Eval("UnitPrice") %>
						</ItemTemplate>
						<EditItemTemplate>
							<wijmo:C1InputNumeric runat="server" ID="InputNumber" ShowSpinner="true" Value='<%# double.Parse(Eval("UnitPrice").ToString()) %>'></wijmo:C1InputNumeric>
						</EditItemTemplate>
						<UpdateBindings>
							<wijmo:C1GridViewUpdateBinding ControlProperty="InputNumber.Value" UpdateField="UnitPrice" />
						</UpdateBindings>
					</wijmo:C1TemplateField>
					<wijmo:C1TemplateField HeaderText="Discontinued">
						<ItemStyle HorizontalAlign="Center" />
						<ItemTemplate>
							<asp:CheckBox Enabled="false" runat="server" ID="chk1" Checked='<%# Eval("Discontinued") %>' />
						</ItemTemplate>
						<EditItemTemplate>
							<asp:CheckBox runat="server" ID="chkDiscontinued" Checked='<%# Eval("Discontinued") %>' />
						</EditItemTemplate>
						<UpdateBindings>
							<wijmo:C1GridViewUpdateBinding ControlProperty="chkDiscontinued.Checked" UpdateField="Discontinued" />
						</UpdateBindings>
					</wijmo:C1TemplateField>
					<wijmo:C1CommandField ShowEditButton="True" ShowDeleteButton="false" />
				</Columns>
			</wijmo:C1GridView>
		</ContentTemplate>
	</asp:UpdatePanel>
	<asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:C1NWindConnectionString %>" ProviderName="<%$ ConnectionStrings:C1NWindConnectionString.ProviderName %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how you can create custom cell editors using the columns templates</p>
</asp:Content>

