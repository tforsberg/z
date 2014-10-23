<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Dropdown.aspx.cs" Inherits="InputNumber_Dropdown" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1ComboBox" tagprefix="ComboBox" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    <wijmo:C1InputNumberExtender ID="InputNumberExtender1" runat="server" TargetControlID="TextBox1"   
        ShowTrigger="true" NumberType="Currency" >
        <comboitems>
            <ComboBox:C1ComboBoxItem Label="100,12$" Value="100.12" />
            <ComboBox:C1ComboBoxItem Label="1200$" Value="1200" />
            <ComboBox:C1ComboBoxItem Label="2000$" Value="2000" />
            <ComboBox:C1ComboBoxItem Label="5200$" Value="5200" />
        </comboitems>
    </wijmo:C1InputNumberExtender>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
Currency input supports selecting predefined values from a dropdown list.
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

