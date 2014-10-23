<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Overview.aspx.cs" Inherits="ComboBox_Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<div>
		<label>
			TextBox</label>
		<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
		<wijmo:C1ComboBoxExtender ID="ComboBoxExtender2" runat="server" TargetControlID="TextBox1">
			<Data>
				<Items>
					<wijmo:C1ComboBoxItem Label="c++" Value="c++" />
					<wijmo:C1ComboBoxItem Label="java" Value="java" />
					<wijmo:C1ComboBoxItem Label="php" Value="php" />
					<wijmo:C1ComboBoxItem Label="coldfusion" Value="coldfusion" />
					<wijmo:C1ComboBoxItem Label="javascript" Value="javascript" />
					<wijmo:C1ComboBoxItem Label="asp" Value="asp" />
					<wijmo:C1ComboBoxItem Label="ruby" Value="ruby" />
					<wijmo:C1ComboBoxItem Label="python" Value="python" />
					<wijmo:C1ComboBoxItem Label="c" Value="c" />
					<wijmo:C1ComboBoxItem Label="scala" Value="scala" />
					<wijmo:C1ComboBoxItem Label="groovy" Value="groovy" />
					<wijmo:C1ComboBoxItem Label="haskell" Value="haskell" />
					<wijmo:C1ComboBoxItem Label="perl" Value="perl" />
				</Items>
			</Data>
		</wijmo:C1ComboBoxExtender>
	</div>
	<div>
		<label>
			DropDownList</label>
		<asp:DropDownList runat="server" ID="DropDownList1">
			<asp:ListItem Value="c++" Text="c++"></asp:ListItem>
			<asp:ListItem Value="java" Text="java"></asp:ListItem>
			<asp:ListItem Value="php" Text="php"></asp:ListItem>
			<asp:ListItem Value="coldfusion" Text="coldfusion"></asp:ListItem>
			<asp:ListItem Value="javascript" Text="javascript"></asp:ListItem>
			<asp:ListItem Value="asp" Text="asp"></asp:ListItem>
			<asp:ListItem Value="ruby" Text="ruby"></asp:ListItem>
			<asp:ListItem Value="python" Text="python"></asp:ListItem>
			<asp:ListItem Value="c" Text="c"></asp:ListItem>
			<asp:ListItem Value="scala" Text="scala"></asp:ListItem>
			<asp:ListItem Value="groovy" Text="groovy"></asp:ListItem>
			<asp:ListItem Value="haskell" Text="haskell"></asp:ListItem>
			<asp:ListItem Value="perl" Text="perl"></asp:ListItem>
		</asp:DropDownList>
		<wijmo:C1ComboBoxExtender ID="ComboBoxExtender1" runat="server" TargetControlID="DropDownList1" />
	</div>
	<script id="scriptInit" type="text/javascript">
		$(document).ready(function () {
			$('#show').click(function () {
				var isCheck = $('#show').attr("checked");
				if (isCheck) {
					$("#<%=DropDownList1.ClientID %>").show();
				}
				else {
					$("#<%=DropDownList1.ClientID %>").hide();
				}
			})
		});
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The C1ComboBoxExtender display an editable text box/drop-down list on ASPX page.</p>

	<p>User can control the appearance of C1ComboBoxExtender and items of dropdown list.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<input id="show" type="checkbox" /><label for="show">Show Original Select Element</label>
</asp:Content>
