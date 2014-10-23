<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="OverView.aspx.cs" Inherits="ControlExplorer.C1BarCode.OverView" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1BarCode"
    TagPrefix="wijmo" %>
<asp:Content ContentPlaceHolderID="Head" ID="Content1" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" ID="Content2" runat="server">
<wijmo:C1BarCode ID="C1BarCode1" runat="server" Text="1234567890" />
<p>Value in this BarCode is "1234567890"</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	    <p>
        <strong>C1BarCode </strong>provides a BarCode image which is encoded according to a special string value.
    </p>
    <p>
        Users can set the value and showing style of the BarCode 
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">

</asp:Content>
