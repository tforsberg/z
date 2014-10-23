<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Select.aspx.cs" Inherits="ControlExplorer.C1ComboBox.Select" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script id="scriptInit" type="text/javascript">
		function C1ComboBox1_OnClientChanged(e, data) {
			var val = data.selectedItem.value;
			$('#output').html('I live in ' + val + '!');
		}	
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1ComboBox ID="C1ComboBox1" runat="server" Width="160px" OnClientChanged="C1ComboBox1_OnClientChanged">
		<Items>
			<wijmo:C1ComboBoxItem Value="AL" Text="Alabama"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="AK" Text="Alaska"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="AZ" Text="Arizona"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="AR" Text="Arkansas"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="CA" Text="California"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="CO" Text="Colorado"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="CT" Text="Connecticut"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="DE" Text="Delaware"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="FL" Text="Florida"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="GA" Text="Georgia"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="HI" Text="Hawaii"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="ID" Text="Idaho"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="IL" Text="Illinois"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="IN" Text="Indiana"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="IA" Text="Iowa"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="KS" Text="Kansas"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="KY" Text="Kentucky"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="LA" Text="Louisiana"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="ME" Text="Maine"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="MD" Text="Maryland"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="MA" Text="Massachusetts"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="MI" Text="Michigan"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="MN" Text="Minnesota"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="MS" Text="Mississippi"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="MO" Text="Missouri"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="MT" Text="Montana"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="NE" Text="Nebraska"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="NV" Text="Nevada"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="NH" Text="New Hampshire"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="NJ" Text="New Jersey"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="NM" Text="New Mexico"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="NY" Text="New York"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="NC" Text="North Carolina"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="ND" Text="North Dakota"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="OH" Text="Ohio" Selected="true"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="OK" Text="Oklahoma"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="OR" Text="Oregon"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="PA" Text="Pennsylvania"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="RI" Text="Rhode Island"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="SC" Text="South Carolina"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="SD" Text="South Dakota"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="TN" Text="Tennessee"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="TX" Text="Texas"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="UT" Text="Utah"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="VT" Text="Vermont"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="VA" Text="Virginia"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="WA" Text="Washington"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="WV" Text="West Virginia"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="WI" Text="Wisconsin"></wijmo:C1ComboBoxItem>
			<wijmo:C1ComboBoxItem Value="WY" Text="Wyoming"></wijmo:C1ComboBoxItem>
		</Items>
	</wijmo:C1ComboBox>
	<p>
		<label id="output">
			Please select.</label></p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	The <strong>C1ComboBox </strong>supports raising client side events when the selected item is changed.</p> 

	<p>The event is raised when the <strong>OnClientChanged</strong> 
		property is set to a javascript function name. This function will be called when the selected item is changed.</p>
	<p>End-user can get the <strong>selectedItem</strong>(including the value) in the select event.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
