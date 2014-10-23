<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomEditing.aspx.cs" Inherits="ControlExplorer.C1GridView.Editing" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>

	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
				<wijmo:C1GridView ID="C1GridView1" runat="server" AllowPaging="True" PageSize="10"
					DataKeyNames="OrderID" AutoGenerateColumns="False"
					OnPageIndexChanging="C1GridView1_PageIndexChanging"
					OnRowCancelingEdit="C1GridView1_RowCancelingEdit" OnRowEditing="C1GridView1_RowEditing"
					OnRowUpdating="C1GridView1_RowUpdating" OnRowDeleting="C1GridView1_RowDeleting">
					<PagerSettings Mode="NextPreviousFirstLast" />
					<Columns>
						<wijmo:C1TemplateField>
							<ItemStyle Width="15px" />
						</wijmo:C1TemplateField>
						<wijmo:C1BoundField DataField="OrderID" HeaderText="ID" ReadOnly="true" DataFormatString="d" />
					   
						<wijmo:C1TemplateField HeaderText="Ship name">
							<UpdateBindings>
								<wijmo:C1GridViewUpdateBinding ControlProperty="tbShipName.Text" UpdateField="ShipName" />
							</UpdateBindings>
							<EditItemTemplate>
								<asp:TextBox ID="tbShipName" runat="server" Text='<%# Bind("ShipName") %>' BorderStyle="None" Width="100%" />
							</EditItemTemplate>
							<ItemTemplate>
								<%# HtmlEncode(Eval("ShipName")) %>
							</ItemTemplate>
						</wijmo:C1TemplateField>
						 
						<wijmo:C1TemplateField HeaderText="Ship city">
							<UpdateBindings>
								<wijmo:C1GridViewUpdateBinding ControlProperty="tbShipCity.Text" UpdateField="ShipCity" />
							</UpdateBindings>
							<EditItemTemplate>
								<asp:TextBox ID="tbShipCity" runat="server" Text='<%# Bind("ShipCity") %>' BorderStyle="None" Width="100%" />
							</EditItemTemplate>
							<ItemTemplate>
								<%# HtmlEncode(Eval("ShipCity")) %>
							</ItemTemplate>
						</wijmo:C1TemplateField>
						<wijmo:C1CommandField ShowEditButton="True" ShowDeleteButton="false" />
					</Columns>
				</wijmo:C1GridView>
	   
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	  The <strong>C1GridView</strong> supports server editing. This sample shows how to use custom data binding to bind the <strong>C1GridView</strong>
	  to a dataset stored in the session object, how to use template fields to implement custom editors and how to use <strong>UpdateBindings</strong>
	  collections of the template fields to automatically update the dataset with the <strong>Update</strong> method when custom data binding is used.
	</p>

	<p>
	 Server-side editing in <strong>C1GridView</strong> is row-based. At each moment only one data row determined by
	 the <strong>EditIndex</strong> property is in edit mode.
	</p>

	<p>
	   The following techniques are used in this sample:
	</p>
	<ul>
	  <li><strong>Template fields</strong> - to implement custom editors. The ItemTemplate and HeaderTemplate properties determine
		cell content for display and edit purposes.</li>
	  <li><strong>Update bindings</strong> - links editor of the template columns with data field. This allows using
		the <strong>Update()</strong> method to automatically update the dataset when custom data binding is used.</li>
	  <li><strong>C1CommandField</strong> column with the properties <strong>ShowEditButton</strong> and <strong>ShowDeleteButton</strong>.
		Adds Edit, Сancel, Update, and Delete buttons to each data row clicking which end-user edits data.
	  </li>
	</ul>

	<p>
	   The following event handlers are used in this sample:
	</p>
	<ul>
		<li><strong>RowEditing</strong> - to put the <strong>C1GridView's</strong>  row into the edit mode when the Edit<strong>
			</strong>button of the row is clicked.</li>
		<li><strong>RowCancelingEdit</strong> - to cancel editing when the Cancel button of the row is clicked.</li>
		<li><strong>RowUpdating</strong> - to handle changes, update the dataset and put the editing row into the normal mode when the Update button of the row is clicked.</li>
		<li><strong>RowDeleting</strong> - to delete the row when the Delete button of the row is clicked.</li>
	</ul>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<asp:UpdatePanel ID="UpdatePanel2" runat="server">
		<ContentTemplate>
			<div class="settingcontainer">
				<div class="settingcontent">
					<p>Edit Column Settings</p>
					<ul>
						<li class="fullwidth"><asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" Text="Show Edit Button"
							Checked="true" OnCheckedChanged="CheckBox1_CheckedChanged" /></li>
						<li class="fullwidth"><asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="true" Text="Show Delete Button"
							Checked="false" OnCheckedChanged="CheckBox1_CheckedChanged" /></li>
					</ul>
				</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>

</asp:Content>
