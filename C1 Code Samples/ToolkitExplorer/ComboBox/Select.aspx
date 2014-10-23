<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Select.aspx.cs" Inherits="ComboBox_Select" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<script type="text/javascript">
		function select() {
			$('#output').html('I live in ' + this.value + '!')
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<asp:DropDownList ID="DropDownList1" runat="server">
		<asp:ListItem Text="Alabama" Value="AL"></asp:ListItem>
		<asp:ListItem Text="Alaska" Value="AK"></asp:ListItem>
		<asp:ListItem Text="Arizona" Value="AZ"></asp:ListItem>
		<asp:ListItem Text="Arkansas" Value="AR"></asp:ListItem>
		<asp:ListItem Text="California" Value="CA"></asp:ListItem>
		<asp:ListItem Text="Colorado" Value="CO"></asp:ListItem>
		<asp:ListItem Text="Connecticut" Value="CT"></asp:ListItem>
		<asp:ListItem Text="Delaware" Value="DE"></asp:ListItem>
		<asp:ListItem Text="Florida" Value="FL"></asp:ListItem>
		<asp:ListItem Text="Georgia" Value="GA"></asp:ListItem>
		<asp:ListItem Text="Hawaii" Value="HI"></asp:ListItem>
		<asp:ListItem Text="Idaho" Value="ID"></asp:ListItem>
		<asp:ListItem Text="Illinois" Value="IL"></asp:ListItem>
		<asp:ListItem Text="Indiana" Value="IN"></asp:ListItem>
		<asp:ListItem Text="Iowa" Value="IA"></asp:ListItem>
		<asp:ListItem Text="Kansas" Value="KS"></asp:ListItem>
		<asp:ListItem Text="Kentucky" Value="KY"></asp:ListItem>
		<asp:ListItem Text="Louisiana" Value="LA"></asp:ListItem>
		<asp:ListItem Text="Maine" Value="ME"></asp:ListItem>
		<asp:ListItem Text="Maryland" Value="MD"></asp:ListItem>
		<asp:ListItem Text="Massachusetts" Value="MA"></asp:ListItem>
		<asp:ListItem Text="Michigan" Value="MI"></asp:ListItem>
		<asp:ListItem Text="Minnesota" Value="MN"></asp:ListItem>
		<asp:ListItem Text="Mississippi" Value="MS"></asp:ListItem>
		<asp:ListItem Text="Missouri" Value="MO"></asp:ListItem>
		<asp:ListItem Text="Montana" Value="MT"></asp:ListItem>
		<asp:ListItem Text="Nebraska" Value="ME"></asp:ListItem>
		<asp:ListItem Text="Nevada" Value="NV"></asp:ListItem>
		<asp:ListItem Text="New Hampshire" Value="NH"></asp:ListItem>
		<asp:ListItem Text="New Jersey" Value="NJ"></asp:ListItem>
		<asp:ListItem Text="New Mexico" Value="NM"></asp:ListItem>
		<asp:ListItem Text="New York" Value="NY"></asp:ListItem>
		<asp:ListItem Text="North Carolina" Value="NC"></asp:ListItem>
		<asp:ListItem Text="North Dakota" Value="ND"></asp:ListItem>
		<asp:ListItem Text="Ohio" Value="OH" Selected="True"></asp:ListItem>
		<asp:ListItem Text="Oklahoma" Value="OK"></asp:ListItem>
		<asp:ListItem Text="Oregon" Value="OR"></asp:ListItem>
		<asp:ListItem Text="Pennsylvania" Value="PA"></asp:ListItem>
		<asp:ListItem Text="Rhode Island" Value="RI"></asp:ListItem>
		<asp:ListItem Text="South Carolina" Value="SC"></asp:ListItem>
		<asp:ListItem Text="South Dakota" Value="SD"></asp:ListItem>
		<asp:ListItem Text="Tennessee" Value="TN"></asp:ListItem>
		<asp:ListItem Text="Texas" Value="TX"></asp:ListItem>
		<asp:ListItem Text="Utah" Value="UT"></asp:ListItem>
		<asp:ListItem Text="Vermont" Value="VT"></asp:ListItem>
		<asp:ListItem Text="Virginia" Value="VA"></asp:ListItem>
		<asp:ListItem Text="Washington" Value="WA"></asp:ListItem>
		<asp:ListItem Text="West Virginia" Value="WV"></asp:ListItem>
		<asp:ListItem Text="Wisconsin" Value="WI"></asp:ListItem>
		<asp:ListItem Text="Wyoming" Value="WY"></asp:ListItem>
	</asp:DropDownList>
	<wijmo:C1ComboBoxExtender ID="ComboBoxExtender2" runat="server" OnClientChanged="select"
		TargetControlID="DropDownList1">
	</wijmo:C1ComboBoxExtender>
	<p>
		<label id="output">
			Please select.</label></p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	The C1ComboBoxExtender supports triggering the client event when the selected items is changed.
	</p>	 

	<p>The select event of client is trigged if the following property are set to corresponding value:</p>
	<ul>
	<li>OnClientChanged</li>
	</ul>
	<p>The value of OnClientChanged is the function name of the client.</p>

	<p>OnClientChanged event will be fired when select item is changed.</p>
	<p>End-user can get the selectedItem(include value) in the select event, then do something.</p>
</asp:Content>
