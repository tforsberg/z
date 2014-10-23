<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Overview.aspx.cs" Inherits="InputMask_Overview" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <h4>Phone:</h4>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    <wijmo:C1InputMaskExtender ID="InputMaskExtender1" runat="server" TargetControlID="TextBox1" Mask="(999) 000-0000" HidePromptOnLeave="true" />
    Mask:(999) 000-0000

    <h4>SSN:</h4>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    
    <wijmo:C1InputMaskExtender ID="InputMaskExtender2" runat="server" TargetControlID="TextBox2" Mask="000-00-0000" HidePromptOnLeave="true" />
    Mask:000-00-0000

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
    The InputMaskExtender converts an ASP.NET TextBox control into a masked input based on the mask and other properties.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    
</asp:Content>

