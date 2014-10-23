<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="TimePicker.aspx.cs" Inherits="ControlExplorer.C1InputDate.TimePicker" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
    
    <wijmo:C1InputDateExtender runat="server" ID="InputDateExtender" TargetControlID="TextBox1" DateFormat="T">
     
<PopupPosition>
<Offset Top="4"></Offset>
</PopupPosition>
        <pickers>
            <timepicker visible="True" />
        </pickers>
     
    </wijmo:C1InputDateExtender>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" Runat="Server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
    <strong>C1InputDate </strong>supports selecting time from a  time picker.
</p>
</asp:Content>
