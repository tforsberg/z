<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1InputNumber_DropDown" Codebehind="DropDown.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<wijmo:C1InputCurrency ID="C1InputCurrency1" runat="server" ShowTrigger="true">
<ComboItems>
<wijmo:C1ComboBoxItem Text="$100.12" Value="100.12" /> 
<wijmo:C1ComboBoxItem Text="$1200" Value="1200" /> 
<wijmo:C1ComboBoxItem Text="$2000" Value="2000" /> 
<wijmo:C1ComboBoxItem Text="$5200" Value="5200" /> 
</ComboItems> 
</wijmo:C1InputCurrency>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">

<p>
    <strong>C1InputCurrency </strong>supports selecting predefined values from a drop-down list.
</p>

<p>
You need to set the <b>ShowTriggers</b> property to True, as well as specifying the list items to the <b>ComboItems</b> property.
</p>

<p>
Setting the <b>ButtonAlign</b> property changes the alignment of the trigger button.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

