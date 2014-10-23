<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1ComboBox.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1ComboBox ID="C1ComboBox1" runat="server" Width="160px">
	
		<Items>
			<wijmo:C1ComboBoxItem Text="c++" Value="c++" />
			<wijmo:C1ComboBoxItem Text="java" Selected="true" Value="java" />
			<wijmo:C1ComboBoxItem Text="php" Value="php" />
			<wijmo:C1ComboBoxItem Text="coldfusion" Value="coldfusion" />
			<wijmo:C1ComboBoxItem Text="javascript" Value="javascript" />
			<wijmo:C1ComboBoxItem Text="asp" Value="asp" />
			<wijmo:C1ComboBoxItem Text="ruby" Value="ruby" />
			<wijmo:C1ComboBoxItem Text="python" Value="python" />
			<wijmo:C1ComboBoxItem Text="c" Value="c" />
			<wijmo:C1ComboBoxItem Text="scala" Value="scala" />
			<wijmo:C1ComboBoxItem Text="groovy" Value="groovy" />
			<wijmo:C1ComboBoxItem Text="haskell" Value="haskell" />
			<wijmo:C1ComboBoxItem Text="perl" Value="perl" />
		</Items>
	</wijmo:C1ComboBox>
	
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	The <strong>C1ComboBox </strong>displays an editable text box and a drop-down list on ASPX page.
	</p>
	<p>
	Users can control the appearance of <strong>C1ComboBox </strong>and items of the drop-down list by setting the 
		<strong>Items </strong>property.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
