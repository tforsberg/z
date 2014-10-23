﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="ModalAlert.aspx.cs" Inherits="Dialog_ModalAlert" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Dialog"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        function btnClick() {
            $(this).wijdialog("close");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="dialog" runat="server">
        <p>
            <span class="ui-icon ui-icon-circle-check"></span>Your files have uploaded successfully!
        </p>
    </asp:Panel>
    <wijmo:C1DialogExtender runat="server" ID="DialogExtender1" Width="550" Height="240"
        Title="Upload file" TargetControlID="dialog" Modal="True" Stack="True" CloseText="Close">
        <ExpandingAnimation Duration="400">
        </ExpandingAnimation>
        <Buttons>
            <wijmo:DialogButton OnClientClick="btnClick" Text="OK" />
        </Buttons>
        <CaptionButtons>
            <Pin Visible="False" />
            <Refresh Visible="False" />
            <Toggle Visible="False" />
            <Minimize Visible="False" />
            <Maximize Visible="False" />
        </CaptionButtons>
        <CollapsingAnimation Duration="300" />
    </wijmo:C1DialogExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample shows a confirm dialog.
    </p>
    <ul>
        <li>This feature is allowed if the property <b>Modal</b> is set to true . </li>
        <li>The property <b>Buttons</b> is set to add buttons on the bottom of this dialog.</li>
        <li>The property <b>CaptionButtons</b> is set to determine the visibility of the caption buttons.</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <input type="button" value="Show Alert" onclick="$('#<%=dialog.ClientID%>').wijdialog('open')" />
</asp:Content>
