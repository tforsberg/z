<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1InputMask_Overview" CodeBehind="Overview.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
        <wijmo:C1InputMask ID="C1InputMask1" runat="server" Mask="(999) 000-0000" HidePromptOnLeave="true" Text="(412) 867-5309">
        </wijmo:C1InputMask>
    </p>
    <br />
    <p>
        <strong>Mask: </strong>(999) 000-0000
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>
        The <strong>C1InputMask </strong>is an input web control that allows users to type text-based 
    input on the mask. This sample illustrates a simple default<strong> C1InputMask</strong>; 
    other samples in this section illustrate how to use <strong>C1InputMask </strong>
        as a password field, a name field, and a drop-down list, etc.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

