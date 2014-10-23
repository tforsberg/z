<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="LoadOnDemand.aspx.cs" Inherits="ControlExplorer.C1ComboBox.LoadOnDemand" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<h3>Using ItemPopulate event</h3>
	<wijmo:C1ComboBox ID="C1ComboBox1" runat="server" Width="160px" CallbackDataPopulate="ItemPopulate"
		EnableCallBackMode="True" OnItemPopulate="C1ComboBox1_ItemPopulate">
		<Items>
			<wijmo:C1ComboBoxItem Text="c++" Value="c++" />
			<wijmo:C1ComboBoxItem Text="java" Value="java" />
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
		<h3>Using CallbackDataBind event</h3>
	<wijmo:C1ComboBox ID="C1ComboBox2" runat="server" Width="160px"  
		EnableCallBackMode="True"  oncallbackdatabind="C1ComboBox2_CallbackDataBind" DataTextField="Text" DataValueField="Value" DataSelectedField="Selected"  >
	</wijmo:C1ComboBox>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

		<p>The <strong>C1ComboBox </strong>control supports filling the dropdown list dynamically as the user scrolls.  You 
		can fill the list by using two different methods: 
			<strong>OnItemPopulate</strong> or <strong>OnCallbackDataBind</strong>.</p>

		<p>If the C1ComboBox is not bound to a datasource, you can populate the items using the corresponding properties: </p>

		<p><strong>OnItemPopulate</strong> :</p>
		<ul>
		<li>EnableCallBackMode: true</li>
		<li>CallbackDataPopulate:ItemPopulate</li>
		<li>OnItemPopulate</li>
	  </ul>
	  <p>The <strong>OnItemPopulate</strong> event will be raised when <strong>C1ComboBox
		  </strong>requests data from client side.</p>
		<p>&nbsp</p>
		<p><strong>CallbackDataBind</strong>:</p>
		<ul>
		<li>EnableCallBackMode: true</li>
		<li>OnCallbackdatabind </li>
		</ul>
		<p>The <strong>OnCallbackDatabind </strong>event will be raised when <strong>C1ComboBox
			</strong>requests data from the data source.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
