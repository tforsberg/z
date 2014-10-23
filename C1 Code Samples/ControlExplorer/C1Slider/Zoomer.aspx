<%@ Page Language="C#"  MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Zoomer.aspx.cs" Inherits="ControlExplorer.C1Slider.Zoomer" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Slider" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <div style="padding-left: 150px; height: 400px;">
        <div style="width: 350px; height: 360px; background-image: url(images/zoomer.png);
            position: relative;">
            <div style="position: absolute; width: 230px; height: 230px; border: solid 1px black;
                left: 60px; top: 64px; overflow: auto;">
                <img alt="" id="img1" src="images/Photograph.png" style=" width:220px; height:220px;"  />
            </div>
            <div style="position: absolute; width: 290px; height: 30px; border: solid 0px black;
                left: 30px; top: 310px; overflow: hidden;">
                <div style="float: left; padding-top: 5px; width:40px;">
                    <input type="text" value="100" style="width:26px;" id="txt1" /><span>%</span>
                </div>
                <div style="float:left;padding-top:10px;">
                <wijmo:C1Slider ID="c1slider1" runat="server" Width="240px" Value="100"
                     Min ="0" Max="200" />
                </div>
            </div>
        </div>
    </div>
     <script type="text/javascript">
         $(document).ready(function () {
             var $s = $('#<%=c1slider1.ClientID%>');
            var $i = $('#txt1');
            function changed(e, val) {
                var $img = $('#img1');
                var w = 220 * val / 100 + 'px';
                var h = w;
                $img.css({
                    width: w,
                    height: h
                });
                $i.val(val);
            }
            $i.change(function () {
                var val = $i.val();
                if ($.isNumeric(val)) {
                    var percent = parseFloat(val)
                    if (percent < 0 || percent > 200)
                        return;
                    $s.c1slider('option', 'value', percent);
                }
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
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
    <p>
        Slider includes a robust client-side object model, where a majority of server-side properties can be set on the client-side and client-side events are described in the Properties window. For example, you can attach client-side event handlers to the Value property. 
    </p>
</asp:Content>
