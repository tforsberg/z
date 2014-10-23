<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="DatePicker.aspx.cs" Inherits="InputDate_DatePicker" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

	<asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
	<wijmo:C1InputDateExtender ID="InputDateExtender1" runat="server" TargetControlID="TextBox1" ShowTrigger="true">
	     <pickers>
            <DatePicker visible="True" />
        </pickers>
	</wijmo:C1InputDateExtender>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
C1InputDateExtender supports selecting date from a dropdown calendar.
</p>

<p>
You can set the <b>ShowTrigger</b> property to <b>true</b> to enabel the dropdown calendar.
</p>

<p>
Setting the <b>ButtonAlign</b> property would change the alignment of trigger button.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>


