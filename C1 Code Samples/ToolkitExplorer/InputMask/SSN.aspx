<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="SSN.aspx.cs" Inherits="ControlExplorer.C1InputMask.SSN" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
    <wijmo:C1InputMaskExtender ID="C1InputMask1" TargetControlID="TextBox1" runat="server" MaskFormat="000-00-0000" HidePromptOnLeave="True">
    </wijmo:C1InputMaskExtender>
    
     <h6>
                Mask</h6>
            <p>
                000-00-0000</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how to use the <b>MaskFormat</b> property to allow only numeric input.
    </p>
</asp:Content>
