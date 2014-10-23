<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1InputDate_DatePicker" Codebehind="DatePicker.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<wijmo:C1InputDate ID="C1InputDate1" runat="server" >
<PopupPosition>
<Offset Top="4"></Offset>
</PopupPosition>
    <Pickers>
        <DatePicker Visible="True" />
    </Pickers>
</wijmo:C1InputDate>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
<p>
    <strong>C1InputDate</strong> supports selecting date from a drop-down date picker.
</p>

<p>
Setting the <b>DropDownButtonAlign</b> property changes the alignment of dropdown button.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

