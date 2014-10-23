<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="BlurOnLastChar.aspx.cs" Inherits="ControlExplorer.C1InputMask.BlurOnLastChar" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    	<asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
       <wijmo:C1InputMaskExtender TargetControlID="TextBox1" ID="C1InputMask1" runat="server" MaskFormat="999" BlurOnLastChar="True">
    </wijmo:C1InputMaskExtender>
    	<asp:TextBox ID="TextBox2"  runat="server" Width="220px"></asp:TextBox>
    <wijmo:C1InputTextExtender TargetControlID="TextBox2" ID="C1InputText1" runat="server"></wijmo:C1InputTextExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
      <p>
        This sample demonstrates that when the <b>BlurOnLastChar</b> property is set to <b>true</b>,
                after input finished on the last char, the focus will move to the next control.
    </p>
</asp:Content>
