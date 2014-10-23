﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    Inherits="SuperPanel_Overview" CodeBehind="Overview.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1SuperPanel"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <style type="text/css">
        .elements ul
        {
            padding: 8px 0 0 8px;
            margin: 0px;
            width: 840px;
            float: left;
            position: relative;
            zoom: 1;
        }
        
        .elements ul li
        {
            background: #fff;
            color: #fff;
            font-weight: 900;
            height: 70px;
            margin: 0 8px 8px 0;
            padding: 0;
            padding-top: 62px;
            position: relative;
            text-align: center;
            width: 132px;
            text-shadow: 1px 1px 2px #000000;
        }
        
        .elements li
        {
            float: left;
            list-style: none;
        }
    </style>
    <script type="text/javascript">

        function changeProperties() {
            var animationOptions = {
                disabled: $('#<%=chbDisabled.ClientID%>').is(":checked"),
                duration: parseFloat($('#<%=txtDuration.ClientID%>').val()),
                easing: $('#<%=DrpListEasing.ClientID%>').val()
            };
            $('#<%=superpanel.ClientID%>').wijsuperpanel({ animationOptions: animationOptions });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="superpanel" runat="server" Width="300px" Height="300px">
        <div class="elements">
            <ul>
                <li style="background: none repeat scroll 0% 0% activeborder;"><span>ActiveBorder</span>
                </li>
                <li style="background: none repeat scroll 0% 0% activecaption;"><span>ActiveCaption</span>
                </li>
                <li style="background: none repeat scroll 0% 0% captiontext;"><span>ActiveCaptionText</span>
                </li>
                <li style="background: none repeat scroll 0% 0% appworkspace;"><span>AppWorkspace</span>
                </li>
                <li style="background: none repeat scroll 0% 0% buttonface;"><span>Control</span>
                </li>
                <li style="background: none repeat scroll 0% 0% buttonshadow;"><span>ControlDark</span>
                </li>
                <li style="background: none repeat scroll 0% 0% threeddarkshadow;"><span>ControlDarkDark</span>
                </li>
                <li style="background: none repeat scroll 0% 0% buttonface;"><span>ControlLight</span>
                </li>
                <li style="background: none repeat scroll 0% 0% buttonhighlight;"><span>ControlLightLight</span>
                </li>
                <li style="background: none repeat scroll 0% 0% buttontext;"><span>ControlText</span>
                </li>
                <li style="background: none repeat scroll 0% 0% background;"><span>Desktop</span>
                </li>
                <li style="background: none repeat scroll 0% 0% graytext;"><span>GrayText</span>
                </li>
                <li style="background: none repeat scroll 0% 0% highlight;"><span>Highlight</span>
                </li>
                <li style="background: none repeat scroll 0% 0% highlighttext;"><span>HighlightText</span>
                </li>
                <li style="background: none repeat scroll 0% 0% highlight;"><span>HotTrack</span>
                </li>
                <li style="background: none repeat scroll 0% 0% inactiveborder;"><span>InactiveBorder</span>
                </li>
                <li style="background: none repeat scroll 0% 0% inactivecaption;"><span>InactiveCaption</span>
                </li>
                <li style="background: none repeat scroll 0% 0% inactivecaptiontext;"><span>InactiveCaptionText</span>
                </li>
                <li style="background: none repeat scroll 0% 0% infobackground;"><span>Info</span>
                </li>
                <li style="background: none repeat scroll 0% 0% infotext;"><span>InfoText</span>
                </li>
                <li style="background: none repeat scroll 0% 0% menu;"><span>Menu</span> </li>
                <li style="background: none repeat scroll 0% 0% menutext;"><span>MenuText</span>
                </li>
                <li style="background: none repeat scroll 0% 0% scrollbar;"><span>ScrollBar</span>
                </li>
                <li style="background: none repeat scroll 0% 0% window;"><span>Window</span> </li>
                <li style="background: none repeat scroll 0% 0% windowframe;"><span>WindowFrame</span>
                </li>
                <li style="background: none repeat scroll 0% 0% windowtext;"><span>WindowText</span>
                </li>
                <li style="background: ;"><span>Transparent</span> </li>
                <li style="background: none repeat scroll 0% 0% AliceBlue;"><span>AliceBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% AntiqueWhite;"><span>AntiqueWhite</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Aqua;"><span>Aqua</span> </li>
                <li style="background: none repeat scroll 0% 0% Aquamarine;"><span>Aquamarine</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Azure;"><span>Azure</span> </li>
                <li style="background: none repeat scroll 0% 0% Beige;"><span>Beige</span> </li>
                <li style="background: none repeat scroll 0% 0% Bisque;"><span>Bisque</span> </li>
                <li style="background: none repeat scroll 0% 0% Black;"><span>Black</span> </li>
                <li style="background: none repeat scroll 0% 0% BlanchedAlmond;"><span>BlanchedAlmond</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Blue;"><span>Blue</span> </li>
                <li style="background: none repeat scroll 0% 0% BlueViolet;"><span>BlueViolet</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Brown;"><span>Brown</span> </li>
                <li style="background: none repeat scroll 0% 0% BurlyWood;"><span>BurlyWood</span>
                </li>
                <li style="background: none repeat scroll 0% 0% CadetBlue;"><span>CadetBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Chartreuse;"><span>Chartreuse</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Chocolate;"><span>Chocolate</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Coral;"><span>Coral</span> </li>
                <li style="background: none repeat scroll 0% 0% CornflowerBlue;"><span>CornflowerBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Cornsilk;"><span>Cornsilk</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Crimson;"><span>Crimson</span> </li>
                <li style="background: none repeat scroll 0% 0% Cyan;"><span>Cyan</span> </li>
                <li style="background: none repeat scroll 0% 0% DarkBlue;"><span>DarkBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkCyan;"><span>DarkCyan</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkGoldenrod;"><span>DarkGoldenrod</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkGray;"><span>DarkGray</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkGreen;"><span>DarkGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkKhaki;"><span>DarkKhaki</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkMagenta;"><span>DarkMagenta</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkOliveGreen;"><span>DarkOliveGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkOrange;"><span>DarkOrange</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkOrchid;"><span>DarkOrchid</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkRed;"><span>DarkRed</span> </li>
                <li style="background: none repeat scroll 0% 0% DarkSalmon;"><span>DarkSalmon</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkSeaGreen;"><span>DarkSeaGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkSlateBlue;"><span>DarkSlateBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkSlateGray;"><span>DarkSlateGray</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkTurquoise;"><span>DarkTurquoise</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DarkViolet;"><span>DarkViolet</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DeepPink;"><span>DeepPink</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DeepSkyBlue;"><span>DeepSkyBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% DimGray;"><span>DimGray</span> </li>
                <li style="background: none repeat scroll 0% 0% DodgerBlue;"><span>DodgerBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Firebrick;"><span>Firebrick</span>
                </li>
                <li style="background: none repeat scroll 0% 0% FloralWhite;"><span>FloralWhite</span>
                </li>
                <li style="background: none repeat scroll 0% 0% ForestGreen;"><span>ForestGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Fuchsia;"><span>Fuchsia</span> </li>
                <li style="background: none repeat scroll 0% 0% Gainsboro;"><span>Gainsboro</span>
                </li>
                <li style="background: none repeat scroll 0% 0% GhostWhite;"><span>GhostWhite</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Gold;"><span>Gold</span> </li>
                <li style="background: none repeat scroll 0% 0% Goldenrod;"><span>Goldenrod</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Gray;"><span>Gray</span> </li>
                <li style="background: none repeat scroll 0% 0% Green;"><span>Green</span> </li>
                <li style="background: none repeat scroll 0% 0% GreenYellow;"><span>GreenYellow</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Honeydew;"><span>Honeydew</span>
                </li>
                <li style="background: none repeat scroll 0% 0% HotPink;"><span>HotPink</span> </li>
                <li style="background: none repeat scroll 0% 0% IndianRed;"><span>IndianRed</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Indigo;"><span>Indigo</span> </li>
                <li style="background: none repeat scroll 0% 0% Ivory;"><span>Ivory</span> </li>
                <li style="background: none repeat scroll 0% 0% Khaki;"><span>Khaki</span> </li>
                <li style="background: none repeat scroll 0% 0% Lavender;"><span>Lavender</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LavenderBlush;"><span>LavenderBlush</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LawnGreen;"><span>LawnGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LemonChiffon;"><span>LemonChiffon</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightBlue;"><span>LightBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightCoral;"><span>LightCoral</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightCyan;"><span>LightCyan</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightGoldenrodYellow;"><span>LightGoldenrodYellow</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightGrey;"><span>LightGray</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightGreen;"><span>LightGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightPink;"><span>LightPink</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightSalmon;"><span>LightSalmon</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightSeaGreen;"><span>LightSeaGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightSkyBlue;"><span>LightSkyBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightSlateGray;"><span>LightSlateGray</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightSteelBlue;"><span>LightSteelBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% LightYellow;"><span>LightYellow</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Lime;"><span>Lime</span> </li>
                <li style="background: none repeat scroll 0% 0% LimeGreen;"><span>LimeGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Linen;"><span>Linen</span> </li>
                <li style="background: none repeat scroll 0% 0% Magenta;"><span>Magenta</span> </li>
                <li style="background: none repeat scroll 0% 0% Maroon;"><span>Maroon</span> </li>
                <li style="background: none repeat scroll 0% 0% MediumAquamarine;"><span>MediumAquamarine</span>
                </li>
                <li style="background: none repeat scroll 0% 0% MediumBlue;"><span>MediumBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% MediumOrchid;"><span>MediumOrchid</span>
                </li>
                <li style="background: none repeat scroll 0% 0% MediumPurple;"><span>MediumPurple</span>
                </li>
                <li style="background: none repeat scroll 0% 0% MediumSeaGreen;"><span>MediumSeaGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% MediumSlateBlue;"><span>MediumSlateBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% MediumSpringGreen;"><span>MediumSpringGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% MediumTurquoise;"><span>MediumTurquoise</span>
                </li>
                <li style="background: none repeat scroll 0% 0% MediumVioletRed;"><span>MediumVioletRed</span>
                </li>
                <li style="background: none repeat scroll 0% 0% MidnightBlue;"><span>MidnightBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% MintCream;"><span>MintCream</span>
                </li>
                <li style="background: none repeat scroll 0% 0% MistyRose;"><span>MistyRose</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Moccasin;"><span>Moccasin</span>
                </li>
                <li style="background: none repeat scroll 0% 0% NavajoWhite;"><span>NavajoWhite</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Navy;"><span>Navy</span> </li>
                <li style="background: none repeat scroll 0% 0% OldLace;"><span>OldLace</span> </li>
                <li style="background: none repeat scroll 0% 0% Olive;"><span>Olive</span> </li>
                <li style="background: none repeat scroll 0% 0% OliveDrab;"><span>OliveDrab</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Orange;"><span>Orange</span> </li>
                <li style="background: none repeat scroll 0% 0% OrangeRed;"><span>OrangeRed</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Orchid;"><span>Orchid</span> </li>
                <li style="background: none repeat scroll 0% 0% PaleGoldenrod;"><span>PaleGoldenrod</span>
                </li>
                <li style="background: none repeat scroll 0% 0% PaleGreen;"><span>PaleGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% PaleTurquoise;"><span>PaleTurquoise</span>
                </li>
                <li style="background: none repeat scroll 0% 0% PaleVioletRed;"><span>PaleVioletRed</span>
                </li>
                <li style="background: none repeat scroll 0% 0% PapayaWhip;"><span>PapayaWhip</span>
                </li>
                <li style="background: none repeat scroll 0% 0% PeachPuff;"><span>PeachPuff</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Peru;"><span>Peru</span> </li>
                <li style="background: none repeat scroll 0% 0% Pink;"><span>Pink</span> </li>
                <li style="background: none repeat scroll 0% 0% Plum;"><span>Plum</span> </li>
                <li style="background: none repeat scroll 0% 0% PowderBlue;"><span>PowderBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Purple;"><span>Purple</span> </li>
                <li style="background: none repeat scroll 0% 0% Red;"><span>Red</span> </li>
                <li style="background: none repeat scroll 0% 0% RosyBrown;"><span>RosyBrown</span>
                </li>
                <li style="background: none repeat scroll 0% 0% RoyalBlue;"><span>RoyalBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% SaddleBrown;"><span>SaddleBrown</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Salmon;"><span>Salmon</span> </li>
                <li style="background: none repeat scroll 0% 0% SandyBrown;"><span>SandyBrown</span>
                </li>
                <li style="background: none repeat scroll 0% 0% SeaGreen;"><span>SeaGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% SeaShell;"><span>SeaShell</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Sienna;"><span>Sienna</span> </li>
                <li style="background: none repeat scroll 0% 0% Silver;"><span>Silver</span> </li>
                <li style="background: none repeat scroll 0% 0% SkyBlue;"><span>SkyBlue</span> </li>
                <li style="background: none repeat scroll 0% 0% SlateBlue;"><span>SlateBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% SlateGray;"><span>SlateGray</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Snow;"><span>Snow</span> </li>
                <li style="background: none repeat scroll 0% 0% SpringGreen;"><span>SpringGreen</span>
                </li>
                <li style="background: none repeat scroll 0% 0% SteelBlue;"><span>SteelBlue</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Tan;"><span>Tan</span> </li>
                <li style="background: none repeat scroll 0% 0% Teal;"><span>Teal</span> </li>
                <li style="background: none repeat scroll 0% 0% Thistle;"><span>Thistle</span> </li>
                <li style="background: none repeat scroll 0% 0% Tomato;"><span>Tomato</span> </li>
                <li style="background: none repeat scroll 0% 0% Turquoise;"><span>Turquoise</span>
                
                </li>
                <li style="background: none repeat scroll 0% 0% Violet;"><span>Violet</span> </li>
                <li style="background: none repeat scroll 0% 0% Wheat;"><span>Wheat</span> </li>
                <li style="background: none repeat scroll 0% 0% White;"><span>White</span> </li>
                <li style="background: none repeat scroll 0% 0% WhiteSmoke;"><span>WhiteSmoke</span>
                </li>
                <li style="background: none repeat scroll 0% 0% Yellow;"><span>Yellow</span> </li>
                <li style="background: none repeat scroll 0% 0% YellowGreen;"><span>YellowGreen</span>
                </li>
                <li style=""><span>ButtonFace</span> </li>
                <li style=""><span>ButtonHighlight</span> </li>
                <li style=""><span>ButtonShadow</span> </li>
                <li style="background: none repeat scroll 0% 0% activecaption;"><span>GradientActiveCaption</span>
                </li>
                <li style="background: none repeat scroll 0% 0% inactivecaption;"><span>GradientInactiveCaption</span>
                </li>
                <li style="background: none repeat scroll 0% 0% menu;"><span>MenuBar</span> </li>
                <li style="background: none repeat scroll 0% 0% highlighttext;"><span>MenuHighlight</span>
                </li>
            </ul>
        </div>
    </asp:Panel>
    <wijmo:C1SuperPanelExtender runat="server" ID="SuperPanelExtender1" TargetControlID="superpanel" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates the C1SuperPanelExtender which allows you to easily scroll
        overflowed elements.
    </p><br/>
    <p>
        In this sample, the <b>animationOptions</b> client side option is used to set the animation seen as the
        panel is scrolled.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    Animation Settings:
    <asp:CheckBox ID="chbDisabled" runat="server" Text="Disabled" TextAlign="Left" />
    Duration
    <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>
    Easing
    <asp:DropDownList ID="DrpListEasing" runat="server">
        <asp:ListItem>easeInQuad</asp:ListItem>
        <asp:ListItem>easeOutQuad</asp:ListItem>
        <asp:ListItem>easeInOutQuad</asp:ListItem>
        <asp:ListItem>easeInCubic</asp:ListItem>
        <asp:ListItem>easeOutCubic</asp:ListItem>
        <asp:ListItem>easeInOutCubic</asp:ListItem>
        <asp:ListItem>easeInQuart</asp:ListItem>
        <asp:ListItem>easeOutQuart</asp:ListItem>
        <asp:ListItem>easeInOutQuart</asp:ListItem>
        <asp:ListItem>easeInQuint</asp:ListItem>
        <asp:ListItem>easeOutQuint</asp:ListItem>
        <asp:ListItem>easeInOutQuint</asp:ListItem>
        <asp:ListItem>easeInSine</asp:ListItem>
        <asp:ListItem>easeOutSine</asp:ListItem>
        <asp:ListItem>easeInOutSine</asp:ListItem>
        <asp:ListItem>easeInExpo</asp:ListItem>
        <asp:ListItem>easeOutExpo</asp:ListItem>
        <asp:ListItem>easeInOutExpo</asp:ListItem>
        <asp:ListItem>easeInCirc</asp:ListItem>
        <asp:ListItem>easeOutCirc</asp:ListItem>
        <asp:ListItem>easeInOutCirc</asp:ListItem>
        <asp:ListItem>easeInElastic</asp:ListItem>
        <asp:ListItem>easeOutElastic</asp:ListItem>
        <asp:ListItem>easeInOutElastic</asp:ListItem>
        <asp:ListItem>easeInBack</asp:ListItem>
        <asp:ListItem>easeOutBack</asp:ListItem>
        <asp:ListItem>easeInOutBack</asp:ListItem>
        <asp:ListItem>easeInBounce</asp:ListItem>
        <asp:ListItem>easeOutBounce</asp:ListItem>
        <asp:ListItem>easeInOutBounce</asp:ListItem>
    </asp:DropDownList>
    <input type="button" value="Apply" onclick="return changeProperties();" />
</asp:Content>
