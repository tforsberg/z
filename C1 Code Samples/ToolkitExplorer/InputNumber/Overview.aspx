<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Overview.aspx.cs" Inherits="InputNumber_Overview" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


Numeric:
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    <wijmo:C1InputNumberExtender ID="InputNumberExtender1" runat="server" TargetControlID="TextBox1"  
        ShowSpinner="true" MinValue="1" MaxValue="1000" Value="2.324" DecimalPlaces="3" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	    The InputNumberExtender converts an ASP.NET TextBox control into three different types of input: numeric, currency, or percentage.
    </p>
    <p>
        In this example, the default value is 2.324; only numeric input is accepted; the input value must be between 0 and 1000; and three decimal places are used.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
