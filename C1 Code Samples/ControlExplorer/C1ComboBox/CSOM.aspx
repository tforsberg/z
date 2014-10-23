<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CSOM.aspx.cs" Inherits="ControlExplorer.C1ComboBox.CSOM" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		
		function AddNewItem() {
			var combobox1 = $("#<%= Combobox1.ClientID%>");
			combobox1.c1combobox("add", { label: $("#itemText").val(), value: $("#itemValue").val() });
		}

		function Insert() {
			var combobox1 = $("#<%= Combobox1.ClientID%>");
			combobox1.c1combobox("add", { label: $("#itemTextI").val(), value: $("#itemValueI").val() }, parseInt($("#itemIndexI").val()));
		}

		function RemoveItemAt() {
			var combobox1 = $("#<%= Combobox1.ClientID%>");
			combobox1.c1combobox("remove", parseInt($("#itemIndex").val()));
		}
	</script>	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1ComboBox runat="server" ID="Combobox1">
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

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
<div class="settingcontainer">
<div class="settingcontent">
<ul>
	<li class="fullwidth"><label class="settinglegend">ComboBox Items</label></li>
	<li class="fullwidth"><input id="addNew" type="button" value="Add" onclick="AddNewItem();" /></li>
    <li class="narrowsetting"><label>Text:</label><input id="itemText" type="text" /></li>
    <li class="narrowsetting"><label>Value:</label><input id="itemValue" type="text" /></li>
	<li class="fullwidth"><input type="button" value="Insert" onclick="Insert()" /></li>
    <li class="narrowsetting"><label>Index:</label><input id="itemIndexI" type="text" /></li>
    <li class="narrowsetting"><label>Text:</label><input id="itemTextI" type="text" /></li>
    <li class="narrowsetting"><label>Value:</label><input id="itemValueI" type="text" /></li>
	<li class="fullwidth"><input type="button" value="Remove at" onclick="RemoveItemAt()" /></li>
    <li class="narrowsetting"><label>Index:</label><input id="itemIndex" type="text" /></li>
</ul>
</div>
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
<p>
	<strong>C1ComboBox</strong>’s rich client-side object model allows for event handling and interacting with properties in JavaScript. 
</p>
</asp:Content>
