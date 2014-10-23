<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Dropdown.aspx.cs" Inherits="InputMask_Dropdown" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1ComboBox" tagprefix="ComboBox" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

	<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
	
	<wijmo:C1InputMaskExtender ID="InputMaskExtender1" runat="server" Mask="000-0000" TargetControlID="TextBox1" 
		ShowTrigger="true" >
		<comboitems>
			<ComboBox:C1ComboBoxItem Label="100-1000" />
			<ComboBox:C1ComboBoxItem Label="200-2000" />
			<ComboBox:C1ComboBoxItem Label="123-2909" />
		</comboitems>
	</wijmo:C1InputMaskExtender>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
C1InputMaskExtender supports choosing values from a dropdown list.
</p>

<p>
You need to set the <b>ShowTriggers</b> property to true, as well as specifing the list items to the <b>ComboItems</b> property.
</p>

<p>
Setting the <b>ButtonAlign</b> property would change the alignment of trigger button.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

