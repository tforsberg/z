<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="FirstName.aspx.cs" Inherits="InputMask_FirstName" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <h4>First Name:</h4>
	<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

	<wijmo:C1InputMaskExtender ID="InputMaskExtender1" runat="server" TargetControlID="TextBox1" Mask=">L|LLLLLLLLL" HidePromptOnLeave="true" />
    Mask:L|LLLLLLLLL

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
This sample illustrates how you can use the <b>Mask</b> property to allow text only input.
</p>

<p>
Setting the <b>HidePromptOnLeave</b> property to true would display the prompt charactors only when the input has focus.
</p>

<p>
Mask ">L|LLLLLLLLL" represents a text only string, with first character in upper case.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	
</asp:Content>

