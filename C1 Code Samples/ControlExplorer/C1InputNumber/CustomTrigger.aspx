<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomTrigger.aspx.cs" Inherits="ControlExplorer.C1InputNumber.CustomTrigger" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

    <style type="text/css">
        .dropdown-container {
            height: 127px;
            margin: 0;
            padding: 0;
            width: 25px;
        }

        .valueslider {
            left: 4px;
            height: 103px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    Quantity:
    <wijmo:C1InputNumeric ID="C1InputNumeric1" runat="server" Width="50px" Value="2" DecimalPlaces="0" MinValue="0" MaxValue="5" ShowTrigger="true" OnClientTriggerMouseUp="triggerClicked">
    </wijmo:C1InputNumeric>

    <div class="dropdown-container">
        <div class="valueslider ui-state-default ui-corner-top"></div>
    </div>
    <script type="text/javascript">


        $(function () {
            $(".dropdown-container").wijpopup({
                autoHide: true,
                showEffect: 'drop',
                hideEffect: 'fade'
            });
        });


        function triggerClicked(e) {
            var $input = $('#<%=C1InputNumeric1.ClientID%>');
            var val = $input.c1inputnumeric('option', 'value');

            var $volumeSlider = $('.valueslider');
            $volumeSlider.slider({
                min: 0,
                max: 5,
                value: val,
                step: 1,
                orientation: 'vertical',
                range: 'min',
                slide: function (e, ui) {
                    $input.c1inputnumeric('option', 'value', ui.value);
                }
            });

            $(".dropdown-container").wijpopup('show', {
                of: $('.wijmo-wijinput'),
                at: 'right bottom',
                my: 'right top',
                offset: "4 2"
            });
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

    <p>
        This sample illustrates how to implement a custom UI when trigger button is clicked.
    </p>

    <p>
        The <b>OnClientTriggerMouseDown</b> specifies the client callback function name, which will be called when the trigger button is clicked.
    </p>

    <p>
        In this sample, we drop down a slider that allow user to change input value by dragging the slider thumb. 
    </p>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
