<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DropDown.aspx.cs" Inherits="ControlExplorer.C1InputText.DropDown" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1InputText ID="C1InputText1" runat="server" Format="a" ShowDropDownButton="True">
        <Pickers>
            <List>
                <wijmo:C1ComboBoxItem runat="server" Text="red" Value="red" />
                <wijmo:C1ComboBoxItem runat="server" Text="green" Value="green" />
                <wijmo:C1ComboBoxItem runat="server" Text="blue" Value="blue" />
                <wijmo:C1ComboBoxItem runat="server" Text="yellow" Value="yellow" />
            </List>
        </Pickers>
    </wijmo:C1InputText>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how you can create a drop-down list with text items.
    </p>

</asp:Content>
