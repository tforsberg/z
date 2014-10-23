<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1InputMask_DropDown" CodeBehind="DropDown.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
        <wijmo:C1InputMask ID="C1InputMask1" runat="server" Mask="000-0000" ShowTrigger="true">
            <ComboItems>
                <wijmo:C1ComboBoxItem Text="100-1000" Value="100-1000" />
                <wijmo:C1ComboBoxItem Text="200-2000" Value="200-2000" />
                <wijmo:C1ComboBoxItem Text="123-2909" Value="123-2909" />
            </ComboItems>
        </wijmo:C1InputMask>
    </p>
    <br />
    <p>
        <strong>Mask: </strong>000-0000
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>
        <strong>C1InputMask </strong>supports choosing values from a dropdown list.
    </p>

    <p>
        You need to set the <b>ShowTriggers</b> property to True, as well as specify the 
    list items via the <b>ComboItems</b> property.
    </p>

    <p>
        Setting the <b>ButtonAlign</b> property would change the alignment of the trigger button.
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

