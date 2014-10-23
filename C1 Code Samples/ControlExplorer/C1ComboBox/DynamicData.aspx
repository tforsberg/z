<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="DynamicData.aspx.cs" Inherits="ControlExplorer.C1ComboBox.DynamicData" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script id="scriptInit" type="text/javascript">
		function setData() {
			$('#<%=C1ComboBox1.ClientID %>').c1combobox("option", "data", [
				{
					label: 'delphi',
					value: 'delphi'
				},
				{
					label: 'visual studio',
					value: 'visual studio'
				},
				{
					label: 'flash',
					value: 'flash'
				}
			]);
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1ComboBox ID="C1ComboBox1" runat="server" Width="160px">
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
	<input type="button" value="Set Dynamic Data " onclick="setData()" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	The <strong>C1ComboBox </strong>supports adding dynamic data to the <strong>C1ComboBox
		</strong>on the client.</p>

	<p>The <strong>DynamicData</strong> setting is allowed if the data option is set to 
		an array of label/value pairs.</p>

	<p>For example: [{label:'delphi', value: 'delphi'}]</p>

	<p>Setting this option replaces the contents of the dropdown with the new values.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
