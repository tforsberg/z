<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="SpinnerAlign.aspx.cs" Inherits="ControlExplorer.C1InputDate.SpinnerAlign" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <span>SpinnerAlign="VerticalLeft"</span>
      	<asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
       <wijmo:C1InputDateExtender ID="C1InputDate1" TargetControlID="TextBox1"   runat="server" ShowSpinner="True" SpinnerAlign="VerticalLeft">
    </wijmo:C1InputDateExtender>
    <br/>
    <span>SpinnerAlign="VerticalRight"</span>
    	<asp:TextBox ID="TextBox2" runat="server"  Width="220px"></asp:TextBox>
    <wijmo:C1InputDateExtender ID="C1InputDate2" TargetControlID="TextBox2"  runat="server"  ShowSpinner="True" SpinnerAlign="VerticalRight">
    </wijmo:C1InputDateExtender>
     <br/>
    <span>SpinnerAlign="HorizontalDownLeft"</span>
    	<asp:TextBox ID="TextBox3" runat="server"   Width="220px"></asp:TextBox>
    <wijmo:C1InputDateExtender ID="C1InputDate3" TargetControlID="TextBox3" runat="server" ShowSpinner="True"  SpinnerAlign="HorizontalDownLeft">
    </wijmo:C1InputDateExtender>
     <br/>
    <span>SpinnerAlign="HorizontalDownLeft"</span>
    	<asp:TextBox ID="TextBox4" runat="server"   Width="220px"></asp:TextBox>
    <wijmo:C1InputDateExtender ID="C1InputDate4" TargetControlID="TextBox4" runat="server" ShowSpinner="True"  SpinnerAlign="HorizontalUpLeft">
    </wijmo:C1InputDateExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates the <b>SpinnerAlign</b> option, it can change the alignment of the spinner button.
    </p>
</asp:Content>
