<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="BlurOnLastChar.aspx.cs" Inherits="ControlExplorer.C1InputMask.BlurOnLastChar" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
       <wijmo:C1InputMask ID="C1InputMask1" runat="server" MaskFormat="999" BlurOnLastChar="True">
    </wijmo:C1InputMask>
    <wijmo:C1InputText ID="C1InputText1" runat="server"></wijmo:C1InputText>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
      <p>
        This sample demonstrates that when the <b>BlurOnLastChar</b> property is set to <b>true</b>,
                after input finished on the last char, the focus will move to the next control.
    </p>
</asp:Content>
