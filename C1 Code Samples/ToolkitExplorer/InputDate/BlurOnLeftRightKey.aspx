<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="BlurOnLeftRightKey.aspx.cs" Inherits="ControlExplorer.C1InputDate.BlurOnLeftRightKey" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
    <wijmo:C1InputTextExtender runat="server" TargetControlID="TextBox1"></wijmo:C1InputTextExtender>
     <asp:TextBox ID="TextBox2" runat="server" Width="220px"></asp:TextBox>
    <wijmo:C1InputDateExtender ID="C1InputDate1" runat="server" TargetControlID="TextBox2" BlurOnLeftRightKey="Both">
    </wijmo:C1InputDateExtender>
     <asp:TextBox ID="TextBox3" runat="server" Width="220px"></asp:TextBox>
    <wijmo:C1InputTextExtender ID="C1InputText1" TargetControlID="TextBox3" runat="server"></wijmo:C1InputTextExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates that when the <b>BlurOnLeftRightKey</b> property is set to <b>Both</b>,
                for the date widget, when caret is in the first field, focus will jump to the previous control when press left key, 
                when caret is in the last field, focus will just to the next control when press right key.
    </p>
</asp:Content>
