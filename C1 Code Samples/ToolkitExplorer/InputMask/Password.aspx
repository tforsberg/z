<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Password.aspx.cs" Inherits="InputMask_Password" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    <wijmo:C1InputMaskExtender ID="InputMaskExtender1" runat="server" TargetControlID="TextBox1" Mask="000-00-0000" PasswordChar="#" HidePromptOnLeave="true" />
    <p>Mask:000-00-0000</p>
    <p>Password Char:#</p>

    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    
    <wijmo:C1InputMaskExtender ID="InputMaskExtender2" runat="server" TargetControlID="TextBox2" Mask="CCCCCCC" PasswordChar="*" HidePromptOnLeave="true" />
    <p>Mask:CCCCCCC</p>
    <p>Password Char:*</p>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
This sample demonstrates how to display password characters, such as * and #.
</p>

<p>
Password char is specified by the <b>PasswordChar</b> property.
</p>

<p>
<b>PasswordChar</b> property is a string type property, if the value is a string with length larger than 1, only the first character is used.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

