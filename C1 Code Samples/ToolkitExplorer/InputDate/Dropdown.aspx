<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="InputDate_Dropdown" Codebehind="Dropdown.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>
<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1ComboBox" tagprefix="ComboBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
    <wijmo:C1InputDateExtender ID="InputDateExtender1" runat="server" TargetControlID="TextBox1" ShowTrigger="true" DateFormat="yyyy/M/d">
        <comboitems>
            <ComboBox:C1ComboBoxItem Label="Birthday" Value="4/8/1980" />
            <ComboBox:C1ComboBoxItem Label="Wedding day" Value="12/25/2007" />
        </comboitems>
    </wijmo:C1InputDateExtender> 


    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
C1InputDateExtender supports selecting date from a dropdown list.
</p>

<p>
You need to set the <b>ShowTriggers</b> property to true, as well as specifing the list items to the <b>ComboItems</b> property.
</p>

<p>
If there is no list items specified, clicking the trigger button will dropdown a calendar, which is demonstrated in the DatePicker page.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
