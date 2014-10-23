<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="TimePicker.aspx.cs" Inherits="ControlExplorer.C1InputDate.TimePicker" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


<wijmo:C1InputDate ID="C1InputDate1" runat="server" DateFormat="T" >
<PopupPosition>
<Offset Top="4"></Offset>
</PopupPosition>
    <Pickers>
        <TimePicker Visible="True" />
    </Pickers>
</wijmo:C1InputDate>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" Runat="Server">

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">

<p>
    <strong>C1InputDate </strong>supports selecting time from a  time picker.
</p>
</asp:Content>
