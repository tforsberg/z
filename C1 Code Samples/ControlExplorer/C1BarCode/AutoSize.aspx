<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="AutoSize.aspx.cs" Inherits="ControlExplorer.C1BarCode.AutoSize" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1BarCode"
    TagPrefix="wijmo" %>
<asp:Content ContentPlaceHolderID="Head" ID="Content1" runat="server">
    <style type="text/css">
        .codeContainer
        {
            display: inline-block;
            padding: 20px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" ID="Content2" runat="server">
	<p><strong>AutoSize</strong> property is set to <i>false</i> by default, it allows people to customize the size of their barcode. </p>
	<br />
	<wijmo:C1BarCode ID="C1BarCode4" runat="server" Text="1234567890" ShowText="true" Width="200" Height="60" />
	<p>(Width:200px;&nbsp;&nbsp;&nbsp;Height:60px)</p>
	<br />
	<wijmo:C1BarCode ID="C1BarCode2" runat="server" Text="1234" ShowText="true" Width="200" Height="60" />
	<p>(Width:200px;&nbsp;&nbsp;&nbsp;Height:60px)</p>
	<br />
	<p>Set <strong>AutoSize</strong> property to <i>true</i>, the <strong>C1BarCode</strong> control will adjust its size follow the default size of barcode image.</p>
	<br />
	<wijmo:C1BarCode ID="C1BarCode1" runat="server" Text="1234567890" ShowText="true" Width="200" Height="60" AutoSize="true"/>
	<br />
	<wijmo:C1BarCode ID="C1BarCode3" runat="server" Text="1234" ShowText="true" Width="200" Height="60" AutoSize="true"/>
	<br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>