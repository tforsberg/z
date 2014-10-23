<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="InvalidTips.aspx.cs" Inherits="ControlExplorer.C1InputMask.InvalidTips" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

<script type="text/javascript">

    function invalidInput(e, data) {
        $(data.widget.element).wijtooltip({
            title: '\"' + data.char + '\" is invalid to mask ' + data.widget.options.mask,
            triggers: 'custom',
            showing: function () {
                window.setTimeout(function () {
                    $(data.widget.element).wijtooltip('hide');
                }, 3000);
            }
        });
        $(data.widget.element).wijtooltip('show');
    }

</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<wijmo:C1InputMask ID="C1InputMask1" runat="server" Mask="000-00-0000" HidePromptOnLeave="true" OnClientInvalidInput="invalidInput" >
</wijmo:C1InputMask>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This sample illustrates how to display a tooltip when a invalid character is typed.
</p>

<p>
The <b>OnClientInvalidInput</b> specifies the client callback function name, which will be called when an invalid character is pressed.
</p>

<p>
In this sample we display a tooltip using the wijtooltip widget.
</p>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
