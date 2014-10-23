<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="BlurOnLeftRightKey.aspx.cs" Inherits="ControlExplorer.C1InputMask.BlurOnLeftRightKey" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    	<asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
    <wijmo:C1InputTextExtender TargetControlID="TextBox1" runat="server"></wijmo:C1InputTextExtender>
    	<asp:TextBox ID="TextBox2" runat="server" Width="220px"></asp:TextBox>
    <wijmo:C1InputMaskExtender TargetControlID="TextBox2" ID="C1InputMask1" runat="server" BlurOnLeftRightKey="Both" MaskFormat="9999">
    </wijmo:C1InputMaskExtender>
    	<asp:TextBox ID="TextBox3" runat="server" Width="220px"></asp:TextBox>
    <wijmo:C1InputTextExtender TargetControlID="TextBox3" ID="C1InputText2" runat="server"></wijmo:C1InputTextExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates that when the <b>BlurOnLeftRightKey</b> property is set to <b>Both</b>,
                for the mask control, when caret is in the first position, focus will jump to the previous control when press left key, 
                when caret is in the last position, focus will just to the next control when press right key.
    </p>
</asp:Content>
