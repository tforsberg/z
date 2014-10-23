<%@ Page Language="C#"  MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Equalizer.aspx.cs" Inherits="ControlExplorer.C1Slider.Equalizer" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Slider" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div  id="sliderContainer" style="width: 600px; height: 270px; background-image: url(images/equilizer.png);position: relative;">
        <div style="position: absolute; width: 440px; height: 140px; top: 60px; left: 138px;border: solid 0px black;">
            <div class="demoPieOption">
                <wijmo:C1Slider ID="c1slider1" Height="180px" Width="10px" runat="server"  Value="14" Min ="0" Max="28" Orientation="Vertical" />
                <wijmo:C1Slider ID="c1slider2" Height="180px" Width="10px" Orientation="Vertical" runat="server" Value="14" Min ="0" Max="28" />
                <wijmo:C1Slider ID="c1slider3" Height="180px" Width="10px" Orientation="Vertical" runat="server"  Value="14" Min ="0" Max="28" />
                <wijmo:C1Slider ID="c1slider4" Height="180px" Width="10px" Orientation="Vertical" runat="server"  Value="14" Min ="0" Max="28" />
                <wijmo:C1Slider ID="c1slider5" Height="180px" Width="10px" Orientation="Vertical" runat="server" Value="14" Min ="0" Max="28" />
                <wijmo:C1Slider ID="c1slider6" Height="180px" Width="10px" Orientation="Vertical" runat="server"  Value="14" Min ="0" Max="28" />
                <wijmo:C1Slider ID="c1slider7" Height="180px" Width="10px" Orientation="Vertical" runat="server"  Value="14" Min ="0" Max="28" />
                <wijmo:C1Slider ID="c1slider8" Height="180px" Width="10px" Orientation="Vertical" runat="server"  Value="14" Min ="0" Max="28" />
                <wijmo:C1Slider ID="c1slider9" Height="180px" Width="10px" Orientation="Vertical" runat="server"  Value="14" Min ="0" Max="28" />
                <wijmo:C1Slider ID="c1slider10" Height="180px" Width="10px" Orientation="Vertical" runat="server"  Value="14" Min ="0" Max="28" />
            </div>
        </div>
        <div style="position:absolute;  padding-top:3px;top:138px; left:30px; width:30px; height:80px; border:solid 0px black;">
                <input type="radio" style="height:20px;width:20px;" name="r" value="1" checked="checked" id="dependentlySetting" />
                <input type="radio" style="height:20px;width:20px;" name="r" value="2" id="looseSetting" />
                <input type="radio" style="height:20px;width:20px;" name="r" value="3" id="tightSetting" />
        </div> 
        <div style="width:150px; height:30px; position:absolute; left:30px; top:50px; border:solid 0px black;">
            <select id="musictype" style="width:150px;">
                <option value="Default">Default</option>
                <option value="Rock">Rock</option>
                <option value="Country">Country</option>
                <option value="Classical">Classical</option>
                <option value="Custom">Custom</option>
            </select>
         </div>
        <div tabindex="1" id="divDefault" style="position:absolute;top:220px; left:30px; width:60px; cursor:pointer; height:22px; border:solid 0px black; background-image:url(images/Reset.gif)"></div>        
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.wijmo-wijslider-decbutton,.wijmo-wijslider-incbutton').hide();
            var $s1 = $('#<%=c1slider1.ClientID%>'),
                $s2 = $('#<%=c1slider2.ClientID%>'),
                $s3 = $('#<%=c1slider3.ClientID%>'),
                $s4 = $('#<%=c1slider4.ClientID%>'),
                $s5 = $('#<%=c1slider5.ClientID%>'),
                $s6 = $('#<%=c1slider6.ClientID%>'),
                $s7 = $('#<%=c1slider7.ClientID%>'),
                $s8 = $('#<%=c1slider8.ClientID%>'),
                $s9 = $('#<%=c1slider9.ClientID%>'),
                $s10 = $('#<%=c1slider10.ClientID%>');
            var $sliders = [$s1, $s2, $s3, $s4, $s5, $s6, $s7, $s8, $s9, $s10];
            var initValue = 14;
            var oldOffset = 0;
            function setDefault() {
                $.each($sliders, function (index, item) {
                    item.c1slider('option', 'value', 14);
                });
            }
            function setRock() {
                $s1.c1slider('option', 'value', 13); //-1
                $s2.c1slider('option', 'value', 15); //1
                $s3.c1slider('option', 'value', 16); //2
                $s4.c1slider('option', 'value', 17); //3
                $s5.c1slider('option', 'value', 13); //-1
                $s6.c1slider('option', 'value', 13); //-1
                $s7.c1slider('option', 'value', 14); //0
                $s8.c1slider('option', 'value', 14); //0
                $s9.c1slider('option', 'value', 18); //4
                $s10.c1slider('option', 'value', 18); //4
            }
            function setCountry() {
                $s1.c1slider('option', 'value', 13);
                $s2.c1slider('option', 'value', 14);
                $s3.c1slider('option', 'value', 14);
                $s4.c1slider('option', 'value', 16);
                $s5.c1slider('option', 'value', 16);
                $s6.c1slider('option', 'value', 14);
                $s7.c1slider('option', 'value', 14);
                $s8.c1slider('option', 'value', 14);
                $s9.c1slider('option', 'value', 17);
                $s10.c1slider('option', 'value', 17);
            }
            function setClassical() {
                $s1.c1slider('option', 'value', 14);
                $s2.c1slider('option', 'value', 20);
                $s3.c1slider('option', 'value', 20);
                $s4.c1slider('option', 'value', 17);
                $s5.c1slider('option', 'value', 14);
                $s6.c1slider('option', 'value', 14);
                $s7.c1slider('option', 'value', 14);
                $s8.c1slider('option', 'value', 14);
                $s9.c1slider('option', 'value', 16);
                $s10.c1slider('option', 'value', 16);
            }
            $('#musictype').change(
                       function () {
                           var type = $('#musictype').val();
                           if (type != "Custom") {
                               eval("set" + type + "()");
                           }
                       });
            $('#divDefault').click(function () {
                setDefault();
            });
            $.each($sliders, function (index, item) {
                item.c1slider({
                    slide: function (e, d) {
                        var offset = d.value - initValue;
                        if (offset == oldOffset)
                            return;
                        oldOffset = offset;
                        var isLooseGroup = $('#looseSetting').is(':checked');
                        var isTightGroup = $('#tightSetting').is(':checked');
                        var rate = isLooseGroup ? 0.6 : 1;

                        if (isLooseGroup || isTightGroup) {
                            for (var i = 0; i < 10; i++) {
                                if (i != index) {
                                    var $slider = $sliders[i];
                                    var newVal = initValue + offset * (1 - Math.abs(i - index) / (Math.max(Math.abs(9 - index), index - 1))) * rate;

                                    $slider.c1slider('option', 'value', newVal);
                                }
                            }
                        }
                        document.getElementById("musictype").value = "Custom";
                    },
                    change: function (e, d) {
                        var $handle = $(this).find('.ui-slider-handle');
                        if (0 !== $handle.length)
                            $handle.attr('title', parseInt(d.value - 14));
                    }
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
    The client-side object model allows you to change the Value property. 
</p>
</asp:Content>