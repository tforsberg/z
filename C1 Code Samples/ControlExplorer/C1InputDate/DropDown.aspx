<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1InputDate_DropDown" Codebehind="DropDown.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<wijmo:C1InputDate ID="C1InputDate1" runat="server" ShowTrigger="true">
<ComboItems>
<wijmo:C1ComboBoxItem Text="4/8/1980" Value="4/8/1980" /> 
<wijmo:C1ComboBoxItem Text="12/25/2007" Value="12/25/2007" /> 
<wijmo:C1ComboBoxItem Text="5/16/2011" Value="5/16/2011" /> 
</ComboItems> 
</wijmo:C1InputDate>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">

<p>
    <strong>C1InputDate </strong>supports selecting date from a drop-down list.
</p>
<p>
If there are no list items specified, clicking the dropdown button will drop down a calendar, which is demonstrated in the 
    <strong>Overview </strong>page.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

