<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1Window.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Dialog"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <cc1:C1Dialog ID="dialog" runat="server" Title="Basic dialog" Width="300" Height="185">
        <CaptionButtons>
            <Refresh Visible="false" />
        </CaptionButtons>
        <Content>
            <p>
                This is the default dialog which is useful for displaying information. The dialog
                        window can be moved, resized and closed with the 'x' icon.
            </p>
        </Content>
    </cc1:C1Dialog>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the default <strong>C1Dialog </strong>control, which is useful for displaying information such as error messages or instructions. The dialog
        window can be moved, resized and closed with the 'x' icon. Other samples in the <b>C1Dialog</b> section will demonstrate how to use animation effects, modal dialog boxes, and iFrame elements.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">

    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth">
                    <asp:Button runat="server" ID="btnHide" Text="Hide Dialog" Width="100" OnClientClick="return false;" />
                    <asp:Button runat="server" ID="btnShow" Text="Show Dialog" Width="100" OnClientClick="return false;" />
                </li>
            </ul>
        </div>
    </div>

    <script>
        $(document).ready(function () {

            var $dlg = $("#<%=dialog.ClientID%>");

            $("#" + "<%=btnHide.ClientID%>").on("click", function () {
                $dlg.c1dialog("close");
            });

            $("#" + "<%=btnShow.ClientID%>").on("click", function () {
                $dlg.c1dialog("open");
            });
        });
    </script>
</asp:Content>
