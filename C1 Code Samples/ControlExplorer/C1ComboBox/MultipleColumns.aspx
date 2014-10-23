<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="MultipleColumns.aspx.cs" Inherits="ControlExplorer.C1ComboBox.MultipleColumns" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1ComboBox ID="C1ComboBox1" runat="server" Width="160px" DropdownHeight="500" AutoPostBack="false"
		DropdownWidth="400">
		<Columns>
			<wijmo:C1ComboBoxColumn Name="ID" />
			<wijmo:C1ComboBoxColumn Name="Last Name" />
			<wijmo:C1ComboBoxColumn Name="First Name" />
			<wijmo:C1ComboBoxColumn Name="Birth Date" />
		</Columns>
		<Items>
			<wijmo:C1ComboBoxItem Text="Davolio" Value="1" Cells="1,Davolio,Nancy,12/8/1948" />
			<wijmo:C1ComboBoxItem Text="Fuller" Value="2" Cells="2,Fuller,Andrew,2/19/1952" />
			<wijmo:C1ComboBoxItem Text="Leverling" Value="3" Cells="3,Leverling,Janet,8/30/1963" />
			<wijmo:C1ComboBoxItem Text="Peacock" Value="4" Cells="4,Peacock,Margaret,9/19/1937" />
			<wijmo:C1ComboBoxItem Text="Buchanan" Value="5" Cells="5,Buchanan,Steven,3/4/1955" />
			<wijmo:C1ComboBoxItem Text="Suyama" Value="6" Cells="6,Suyama,Michael,7/2/1963" />
		</Items>
	</wijmo:C1ComboBox> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The <strong>C1ComboBox </strong>supports multiple columns setting in the <strong>C1ComboBox</strong>.</p>

	<p>Multiple columns are allowed if the following properties are set to corresponding values: </p>
	<ul>
	<li>Columns</li>
	<li>Cells in C1ComboBoxItem</li>
	</ul>
	<p>"Columns" indicates the collection of columns in the <strong>C1ComboBox</strong>.</p>
	<p>The count of columns must be equal to the cell's count.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
