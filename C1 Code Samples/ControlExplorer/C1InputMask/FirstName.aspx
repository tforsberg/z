<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1InputMask_FirstName" CodeBehind="FirstName.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
        <wijmo:C1InputMask ID="C1InputMask1" runat="server" Mask=">L|LLLLLLLLL" HidePromptOnLeave="true">
        </wijmo:C1InputMask>
    </p>
    <br />
    <p>
        <strong>Mask: </strong>>L|LLLLLLLLL
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">

    <p>
        This sample illustrates how you can use the <b>Mask</b> property to allow text only input.
    </p>

    <p>
        Setting the <b>HidePromptOnLeave</b> property to True displays the prompt characters only when the input has focus.
    </p>

    <p>
        Mask ">L|LLLLLLLLL" represents a text only string, with first character in upper case.
    </p>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

