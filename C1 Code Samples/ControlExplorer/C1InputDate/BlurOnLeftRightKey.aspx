<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="BlurOnLeftRightKey.aspx.cs" Inherits="ControlExplorer.C1InputDate.BlurOnLeftRightKey" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1InputText runat="server"></wijmo:C1InputText>
    <wijmo:C1InputDate ID="C1InputDate1" runat="server" BlurOnLeftRightKey="Both">
    </wijmo:C1InputDate>
    <wijmo:C1InputText ID="C1InputText1" runat="server"></wijmo:C1InputText>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates that when the <b>BlurOnLeftRightKey</b> property is set to <b>Both</b>,
                for the <strong>C1InputDate</strong>, when caret is in the first field, focus will jump to the previous control when press left key, 
                when caret is in the last field, focus will just to the next control when press right key.
    </p>
</asp:Content>
