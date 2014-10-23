<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="BlurOnLastChar.aspx.cs" Inherits="ControlExplorer.C1InputDate.BlurOnLastChar" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1InputDate ID="C1InputDate1" runat="server" BlurOnLastChar="True">
    </wijmo:C1InputDate>
    <wijmo:C1InputText ID="C1InputText1" runat="server"></wijmo:C1InputText>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates that when the <b>BlurOnLastChar</b> property is set to <b>true</b>,
                after input finished on the last field, the focus will move to the next control.
    </p>
</asp:Content>
