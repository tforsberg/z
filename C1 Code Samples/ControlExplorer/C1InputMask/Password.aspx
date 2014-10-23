<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1InputMask_Password" CodeBehind="Password.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <p>
        <wijmo:C1InputMask ID="C1InputMask1" runat="server" Mask="000-00-0000" PasswordChar="#" HidePromptOnLeave="true">
        </wijmo:C1InputMask>
    </p>
    <br />
    <p>
        <strong>Mask:</strong> 000-00-0000

    <br />
        <strong>Password Char:</strong> #
    </p>
    <br />
    <p>
        <wijmo:C1InputMask ID="C1InputMask2" runat="server" Mask="CCCCCCC" PasswordChar="*" HidePromptOnLeave="true">
        </wijmo:C1InputMask>
    </p>
    <br />
    <p>
        <strong>Mask:</strong> CCCCCCC

    <br />
        <strong>Password Char:</strong> *
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">

    <p>
        Using <b>C1InputMask</b> you can display password characters, such as *, #. This sample is used as a Social Security Number field.
    </p>

    <p>
        The Password char is specified by the <b>PasswordChar</b> property.
    </p>

    <p>
        The <b>PasswordChar</b> property is a string type property.&nbsp; If the value is a string with length larger than 1, only the first character is used.
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

