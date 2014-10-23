<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="Volume.aspx.cs" Inherits="ControlExplorer.C1Slider.Volume" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Slider" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        #span1{
        border:solid 1px #ccc;
        padding-top:2px;
        z-index:2;
        text-align:center;
        width:22px;
        display:none;
        position:absolute;
        margin-right:5px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height:270px; width:130px;  background-image:url(images/volume.png);">
        <div style="margin-left:52px; position:relative;  padding-top:30px;">
            <wijmo:C1Slider runat="server" ID="C1Slider1" Height="204px"   Value="50" Orientation="Vertical" />
        </div>
    </div>
    <span id="span1"></span>
    <script type="text/javascript">
        $(document).ready(function () {

            var $s = $('#<%=C1Slider1.ClientID%>');
        $('.wijmo-wijslider-decbutton,.wijmo-wijslider-incbutton').hide();
        var $handle = $('.ui-slider-handle');
        var $span = $('#span1');
        function changed(e, val) {
            var parent = $handle.closest('div');
            var left = parseInt($handle.css('left')) - 25;
            var bottom = parseInt($handle.css('bottom')) - 8;
            $span.css({
                'left': left + 'px',
                'bottom': bottom
            }).text(val);
            parent.append($span);
            $span.show();
        }
        $handle.mouseout(function (e) {
            $span.hide();
        }).mouseover(function (e) {
            if ($span.text() != '')
                $span.show();
        });
        $s.c1slider({
            slide: function (e, d) {
                changed(e, d.value);
            },
            change: function (e, d) {
                changed(e, d.value);
            }
        });
    });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        Customize the appearance of the slider using a cascading style sheet (CSS) style. CSS support allows you to match the slider to your organization's standards. 
    </p>
</asp:Content>