<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ClientSideAPI.aspx.cs" Inherits="ControlExplorer.C1Superpanel.ClientSideAPI" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1SuperPanel" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
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
    <script id="script1" type="text/javascript">
        function scroll(x, y) {
            try {
                var x = parseInt($("#<%=inputX.ClientID %>").val());
                var y = parseInt($("#<%=inputY.ClientID %>").val());
            }
            catch (e) {
                return;
            }

            $("#<%=C1superPanel1.ClientID%>").c1superpanel('scrollTo', x, y);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1SuperPanel runat="server" ID="C1superPanel1" Width="300" Height="300">
        <ContentTemplate>
            <div class="elements">
                <ul>
                    <li style="background: none repeat scroll 0% 0% activeborder;"><span>ActiveBorder</span> </li>
                    <li style="background: none repeat scroll 0% 0% activecaption;"><span>ActiveCaption</span> </li>
                    <li style="background: none repeat scroll 0% 0% captiontext;"><span>ActiveCaptionText</span> </li>
                    <li style="background: none repeat scroll 0% 0% appworkspace;"><span>AppWorkspace</span> </li>
                    <li style="background: none repeat scroll 0% 0% buttonface;"><span>Control</span> </li>
                    <li style="background: none repeat scroll 0% 0% buttonshadow;"><span>ControlDark</span> </li>
                    <li style="background: none repeat scroll 0% 0% threeddarkshadow;"><span>ControlDarkDark</span> </li>
                    <li style="background: none repeat scroll 0% 0% buttonface;"><span>ControlLight</span> </li>
                    <li style="background: none repeat scroll 0% 0% buttonhighlight;"><span>ControlLightLight</span> </li>
                    <li style="background: none repeat scroll 0% 0% buttontext;"><span>ControlText</span> </li>
                    <li style="background: none repeat scroll 0% 0% background;"><span>Desktop</span> </li>
                    <li style="background: none repeat scroll 0% 0% graytext;"><span>GrayText</span> </li>
                    <li style="background: none repeat scroll 0% 0% highlight;"><span>Highlight</span> </li>
                    <li style="background: none repeat scroll 0% 0% highlighttext;"><span>HighlightText</span> </li>
                    <li style="background: none repeat scroll 0% 0% highlight;"><span>HotTrack</span> </li>
                    <li style="background: none repeat scroll 0% 0% inactiveborder;"><span>InactiveBorder</span> </li>
                    <li style="background: none repeat scroll 0% 0% inactivecaption;"><span>InactiveCaption</span> </li>
                    <li style="background: none repeat scroll 0% 0% inactivecaptiontext;"><span>InactiveCaptionText</span> </li>
                    <li style="background: none repeat scroll 0% 0% infobackground;"><span>Info</span> </li>
                    <li style="background: none repeat scroll 0% 0% infotext;"><span>InfoText</span> </li>
                    <li style="background: none repeat scroll 0% 0% menu;"><span>Menu</span> </li>
                    <li style="background: none repeat scroll 0% 0% menutext;"><span>MenuText</span> </li>
                    <li style="background: none repeat scroll 0% 0% scrollbar;"><span>ScrollBar</span> </li>
                    <li style="background: none repeat scroll 0% 0% window;"><span>Window</span> </li>
                    <li style="background: none repeat scroll 0% 0% windowframe;"><span>WindowFrame</span> </li>
                    <li style="background: none repeat scroll 0% 0% windowtext;"><span>WindowText</span> </li>
                    <li style="background: ;"><span>Transparent</span> </li>
                    <li style="background: none repeat scroll 0% 0% AliceBlue;"><span>AliceBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% AntiqueWhite;"><span>AntiqueWhite</span> </li>
                    <li style="background: none repeat scroll 0% 0% Aqua;"><span>Aqua</span> </li>
                    <li style="background: none repeat scroll 0% 0% Aquamarine;"><span>Aquamarine</span> </li>
                    <li style="background: none repeat scroll 0% 0% Azure;"><span>Azure</span> </li>
                    <li style="background: none repeat scroll 0% 0% Beige;"><span>Beige</span> </li>
                    <li style="background: none repeat scroll 0% 0% Bisque;"><span>Bisque</span> </li>
                    <li style="background: none repeat scroll 0% 0% Black;"><span>Black</span> </li>
                    <li style="background: none repeat scroll 0% 0% BlanchedAlmond;"><span>BlanchedAlmond</span> </li>
                    <li style="background: none repeat scroll 0% 0% Blue;"><span>Blue</span> </li>
                    <li style="background: none repeat scroll 0% 0% BlueViolet;"><span>BlueViolet</span> </li>
                    <li style="background: none repeat scroll 0% 0% Brown;"><span>Brown</span> </li>
                    <li style="background: none repeat scroll 0% 0% BurlyWood;"><span>BurlyWood</span> </li>
                    <li style="background: none repeat scroll 0% 0% CadetBlue;"><span>CadetBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% Chartreuse;"><span>Chartreuse</span> </li>
                    <li style="background: none repeat scroll 0% 0% Chocolate;"><span>Chocolate</span> </li>
                    <li style="background: none repeat scroll 0% 0% Coral;"><span>Coral</span> </li>
                    <li style="background: none repeat scroll 0% 0% CornflowerBlue;"><span>CornflowerBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% Cornsilk;"><span>Cornsilk</span> </li>
                    <li style="background: none repeat scroll 0% 0% Crimson;"><span>Crimson</span> </li>
                    <li style="background: none repeat scroll 0% 0% Cyan;"><span>Cyan</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkBlue;"><span>DarkBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkCyan;"><span>DarkCyan</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkGoldenrod;"><span>DarkGoldenrod</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkGray;"><span>DarkGray</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkGreen;"><span>DarkGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkKhaki;"><span>DarkKhaki</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkMagenta;"><span>DarkMagenta</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkOliveGreen;"><span>DarkOliveGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkOrange;"><span>DarkOrange</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkOrchid;"><span>DarkOrchid</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkRed;"><span>DarkRed</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkSalmon;"><span>DarkSalmon</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkSeaGreen;"><span>DarkSeaGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkSlateBlue;"><span>DarkSlateBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkSlateGray;"><span>DarkSlateGray</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkTurquoise;"><span>DarkTurquoise</span> </li>
                    <li style="background: none repeat scroll 0% 0% DarkViolet;"><span>DarkViolet</span> </li>
                    <li style="background: none repeat scroll 0% 0% DeepPink;"><span>DeepPink</span> </li>
                    <li style="background: none repeat scroll 0% 0% DeepSkyBlue;"><span>DeepSkyBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% DimGray;"><span>DimGray</span> </li>
                    <li style="background: none repeat scroll 0% 0% DodgerBlue;"><span>DodgerBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% Firebrick;"><span>Firebrick</span> </li>
                    <li style="background: none repeat scroll 0% 0% FloralWhite;"><span>FloralWhite</span> </li>
                    <li style="background: none repeat scroll 0% 0% ForestGreen;"><span>ForestGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% Fuchsia;"><span>Fuchsia</span> </li>
                    <li style="background: none repeat scroll 0% 0% Gainsboro;"><span>Gainsboro</span> </li>
                    <li style="background: none repeat scroll 0% 0% GhostWhite;"><span>GhostWhite</span> </li>
                    <li style="background: none repeat scroll 0% 0% Gold;"><span>Gold</span> </li>
                    <li style="background: none repeat scroll 0% 0% Goldenrod;"><span>Goldenrod</span> </li>
                    <li style="background: none repeat scroll 0% 0% Gray;"><span>Gray</span> </li>
                    <li style="background: none repeat scroll 0% 0% Green;"><span>Green</span> </li>
                    <li style="background: none repeat scroll 0% 0% GreenYellow;"><span>GreenYellow</span> </li>
                    <li style="background: none repeat scroll 0% 0% Honeydew;"><span>Honeydew</span> </li>
                    <li style="background: none repeat scroll 0% 0% HotPink;"><span>HotPink</span> </li>
                    <li style="background: none repeat scroll 0% 0% IndianRed;"><span>IndianRed</span> </li>
                    <li style="background: none repeat scroll 0% 0% Indigo;"><span>Indigo</span> </li>
                    <li style="background: none repeat scroll 0% 0% Ivory;"><span>Ivory</span> </li>
                    <li style="background: none repeat scroll 0% 0% Khaki;"><span>Khaki</span> </li>
                    <li style="background: none repeat scroll 0% 0% Lavender;"><span>Lavender</span> </li>
                    <li style="background: none repeat scroll 0% 0% LavenderBlush;"><span>LavenderBlush</span> </li>
                    <li style="background: none repeat scroll 0% 0% LawnGreen;"><span>LawnGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% LemonChiffon;"><span>LemonChiffon</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightBlue;"><span>LightBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightCoral;"><span>LightCoral</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightCyan;"><span>LightCyan</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightGoldenrodYellow;"><span>LightGoldenrodYellow</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightGrey;"><span>LightGray</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightGreen;"><span>LightGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightPink;"><span>LightPink</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightSalmon;"><span>LightSalmon</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightSeaGreen;"><span>LightSeaGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightSkyBlue;"><span>LightSkyBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightSlateGray;"><span>LightSlateGray</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightSteelBlue;"><span>LightSteelBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% LightYellow;"><span>LightYellow</span> </li>
                    <li style="background: none repeat scroll 0% 0% Lime;"><span>Lime</span> </li>
                    <li style="background: none repeat scroll 0% 0% LimeGreen;"><span>LimeGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% Linen;"><span>Linen</span> </li>
                    <li style="background: none repeat scroll 0% 0% Magenta;"><span>Magenta</span> </li>
                    <li style="background: none repeat scroll 0% 0% Maroon;"><span>Maroon</span> </li>
                    <li style="background: none repeat scroll 0% 0% MediumAquamarine;"><span>MediumAquamarine</span> </li>
                    <li style="background: none repeat scroll 0% 0% MediumBlue;"><span>MediumBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% MediumOrchid;"><span>MediumOrchid</span> </li>
                    <li style="background: none repeat scroll 0% 0% MediumPurple;"><span>MediumPurple</span> </li>
                    <li style="background: none repeat scroll 0% 0% MediumSeaGreen;"><span>MediumSeaGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% MediumSlateBlue;"><span>MediumSlateBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% MediumSpringGreen;"><span>MediumSpringGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% MediumTurquoise;"><span>MediumTurquoise</span> </li>
                    <li style="background: none repeat scroll 0% 0% MediumVioletRed;"><span>MediumVioletRed</span> </li>
                    <li style="background: none repeat scroll 0% 0% MidnightBlue;"><span>MidnightBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% MintCream;"><span>MintCream</span> </li>
                    <li style="background: none repeat scroll 0% 0% MistyRose;"><span>MistyRose</span> </li>
                    <li style="background: none repeat scroll 0% 0% Moccasin;"><span>Moccasin</span> </li>
                    <li style="background: none repeat scroll 0% 0% NavajoWhite;"><span>NavajoWhite</span> </li>
                    <li style="background: none repeat scroll 0% 0% Navy;"><span>Navy</span> </li>
                    <li style="background: none repeat scroll 0% 0% OldLace;"><span>OldLace</span> </li>
                    <li style="background: none repeat scroll 0% 0% Olive;"><span>Olive</span> </li>
                    <li style="background: none repeat scroll 0% 0% OliveDrab;"><span>OliveDrab</span> </li>
                    <li style="background: none repeat scroll 0% 0% Orange;"><span>Orange</span> </li>
                    <li style="background: none repeat scroll 0% 0% OrangeRed;"><span>OrangeRed</span> </li>
                    <li style="background: none repeat scroll 0% 0% Orchid;"><span>Orchid</span> </li>
                    <li style="background: none repeat scroll 0% 0% PaleGoldenrod;"><span>PaleGoldenrod</span> </li>
                    <li style="background: none repeat scroll 0% 0% PaleGreen;"><span>PaleGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% PaleTurquoise;"><span>PaleTurquoise</span> </li>
                    <li style="background: none repeat scroll 0% 0% PaleVioletRed;"><span>PaleVioletRed</span> </li>
                    <li style="background: none repeat scroll 0% 0% PapayaWhip;"><span>PapayaWhip</span> </li>
                    <li style="background: none repeat scroll 0% 0% PeachPuff;"><span>PeachPuff</span> </li>
                    <li style="background: none repeat scroll 0% 0% Peru;"><span>Peru</span> </li>
                    <li style="background: none repeat scroll 0% 0% Pink;"><span>Pink</span> </li>
                    <li style="background: none repeat scroll 0% 0% Plum;"><span>Plum</span> </li>
                    <li style="background: none repeat scroll 0% 0% PowderBlue;"><span>PowderBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% Purple;"><span>Purple</span> </li>
                    <li style="background: none repeat scroll 0% 0% Red;"><span>Red</span> </li>
                    <li style="background: none repeat scroll 0% 0% RosyBrown;"><span>RosyBrown</span> </li>
                    <li style="background: none repeat scroll 0% 0% RoyalBlue;"><span>RoyalBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% SaddleBrown;"><span>SaddleBrown</span> </li>
                    <li style="background: none repeat scroll 0% 0% Salmon;"><span>Salmon</span> </li>
                    <li style="background: none repeat scroll 0% 0% SandyBrown;"><span>SandyBrown</span> </li>
                    <li style="background: none repeat scroll 0% 0% SeaGreen;"><span>SeaGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% SeaShell;"><span>SeaShell</span> </li>
                    <li style="background: none repeat scroll 0% 0% Sienna;"><span>Sienna</span> </li>
                    <li style="background: none repeat scroll 0% 0% Silver;"><span>Silver</span> </li>
                    <li style="background: none repeat scroll 0% 0% SkyBlue;"><span>SkyBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% SlateBlue;"><span>SlateBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% SlateGray;"><span>SlateGray</span> </li>
                    <li style="background: none repeat scroll 0% 0% Snow;"><span>Snow</span> </li>
                    <li style="background: none repeat scroll 0% 0% SpringGreen;"><span>SpringGreen</span> </li>
                    <li style="background: none repeat scroll 0% 0% SteelBlue;"><span>SteelBlue</span> </li>
                    <li style="background: none repeat scroll 0% 0% Tan;"><span>Tan</span> </li>
                    <li style="background: none repeat scroll 0% 0% Teal;"><span>Teal</span> </li>
                    <li style="background: none repeat scroll 0% 0% Thistle;"><span>Thistle</span> </li>
                    <li style="background: none repeat scroll 0% 0% Tomato;"><span>Tomato</span> </li>
                    <li style="background: none repeat scroll 0% 0% Turquoise;"><span>Turquoise</span> </li>
                    <li style="background: none repeat scroll 0% 0% Violet;"><span>Violet</span> </li>
                    <li style="background: none repeat scroll 0% 0% Wheat;"><span>Wheat</span> </li>
                    <li style="background: none repeat scroll 0% 0% White;"><span>White</span> </li>
                    <li style="background: none repeat scroll 0% 0% WhiteSmoke;"><span>WhiteSmoke</span> </li>
                    <li style="background: none repeat scroll 0% 0% Yellow;"><span>Yellow</span> </li>
                    <li style="background: none repeat scroll 0% 0% YellowGreen;"><span>YellowGreen</span> </li>
                    <li style=""><span>ButtonFace</span> </li>
                    <li style=""><span>ButtonHighlight</span> </li>
                    <li style=""><span>ButtonShadow</span> </li>
                    <li style="background: none repeat scroll 0% 0% activecaption;"><span>GradientActiveCaption</span> </li>
                    <li style="background: none repeat scroll 0% 0% inactivecaption;"><span>GradientInactiveCaption</span> </li>
                    <li style="background: none repeat scroll 0% 0% menu;"><span>MenuBar</span> </li>
                    <li style="background: none repeat scroll 0% 0% highlighttext;"><span>MenuHighlight</span> </li>
                </ul>
            </div>
        </ContentTemplate>
    </wijmo:C1SuperPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample shows how you can scroll to a specified position in the C1SuperPanel control using a client-side method.</p>
    <p>
        The <strong>scrollTo</strong> client-side method is used to scroll the C1SuperPanel to a specified position. For example:
    </p>
    <pre>$("#superpanelId").c1superpanel('scrollTo', 100, 100);</pre>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <label>X Position:</label>
                    <asp:TextBox ID="inputX" runat="server"></asp:TextBox>
                </li>
                <li>
                    <label>Y Position:</label>
                    <asp:TextBox ID="inputY" runat="server"></asp:TextBox>
                </li>
            </ul>
        </div>
        <div class="settingcontrol">
            <input type="button" id="doScroll" value="Scroll" onclick="scroll()" />
        </div>
    </div>
</asp:Content>
