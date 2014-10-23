﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ScrollMode.aspx.cs" Inherits="ControlExplorer.C1Superpanel.ScrollMode" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1SuperPanel" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .elements ul
        {
            padding: 8px 0 0 8px;
            margin: 0px;
            width: 840px;
            float: left;
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h4>
        Default Scroll Bar Mode</h4>
    <wijmo:C1SuperPanel runat="server" ID="C1SuperPanel1" Width="300" Height="300">
        <ContentTemplate>
            <div class="elements">
                <ul>
                    <li style="background: activeborder;"><span>ActiveBorder</span></li>
                    <li style="background: activecaption;"><span>ActiveCaption</span></li>
                    <li style="background: captiontext;"><span>ActiveCaptionText</span></li>
                    <li style="background: appworkspace;"><span>AppWorkspace</span></li>
                    <li style="background: buttonface;"><span>Control</span></li>
                    <li style="background: buttonshadow;"><span>ControlDark</span></li>
                    <li style="background: threeddarkshadow;"><span>ControlDarkDark</span></li>
                    <li style="background: buttonface;"><span>ControlLight</span></li>
                    <li style="background: buttonhighlight;"><span>ControlLightLight</span></li>
                    <li style="background: buttontext;"><span>ControlText</span></li>
                    <li style="background: background;"><span>Desktop</span></li>
                    <li style="background: graytext;"><span>GrayText</span></li>
                    <li style="background: highlight;"><span>Highlight</span></li>
                    <li style="background: highlighttext;"><span>HighlightText</span></li>
                    <li style="background: highlight;"><span>HotTrack</span></li>
                    <li style="background: inactiveborder;"><span>InactiveBorder</span></li>
                    <li style="background: inactivecaption;"><span>InactiveCaption</span></li>
                    <li style="background: inactivecaptiontext;"><span>InactiveCaptionText</span></li>
                    <li style="background: infobackground;"><span>Info</span></li>
                    <li style="background: infotext;"><span>InfoText</span></li>
                    <li style="background: menu;"><span>Menu</span></li>
                    <li style="background: menutext;"><span>MenuText</span></li>
                    <li style="background: scrollbar;"><span>ScrollBar</span></li>
                    <li style="background: window;"><span>Window</span></li>
                    <li style="background: windowframe;"><span>WindowFrame</span></li>
                    <li style="background: windowtext;"><span>WindowText</span></li>
                    <li><span>Transparent</span></li>
                    <li style="background: AliceBlue;"><span>AliceBlue</span></li>
                    <li style="background: AntiqueWhite;"><span>AntiqueWhite</span></li>
                    <li style="background: Aqua;"><span>Aqua</span></li>
                    <li style="background: Aquamarine;"><span>Aquamarine</span></li>
                    <li style="background: Azure;"><span>Azure</span></li>
                    <li style="background: Beige;"><span>Beige</span></li>
                    <li style="background: Bisque;"><span>Bisque</span></li>
                    <li style="background: Black;"><span>Black</span></li>
                    <li style="background: BlanchedAlmond;"><span>BlanchedAlmond</span></li>
                    <li style="background: Blue;"><span>Blue</span></li>
                    <li style="background: BlueViolet;"><span>BlueViolet</span></li>
                    <li style="background: Brown;"><span>Brown</span></li>
                    <li style="background: BurlyWood;"><span>BurlyWood</span></li>
                    <li style="background: CadetBlue;"><span>CadetBlue</span></li>
                    <li style="background: Chartreuse;"><span>Chartreuse</span></li>
                    <li style="background: Chocolate;"><span>Chocolate</span></li>
                    <li style="background: Coral;"><span>Coral</span></li>
                    <li style="background: CornflowerBlue;"><span>CornflowerBlue</span></li>
                    <li style="background: Cornsilk;"><span>Cornsilk</span></li>
                    <li style="background: Crimson;"><span>Crimson</span></li>
                    <li style="background: Cyan;"><span>Cyan</span></li>
                    <li style="background: DarkBlue;"><span>DarkBlue</span></li>
                    <li style="background: DarkCyan;"><span>DarkCyan</span></li>
                    <li style="background: DarkGoldenrod;"><span>DarkGoldenrod</span></li>
                    <li style="background: DarkGray;"><span>DarkGray</span></li>
                    <li style="background: DarkGreen;"><span>DarkGreen</span></li>
                    <li style="background: DarkKhaki;"><span>DarkKhaki</span></li>
                    <li style="background: DarkMagenta;"><span>DarkMagenta</span></li>
                    <li style="background: DarkOliveGreen;"><span>DarkOliveGreen</span></li>
                    <li style="background: DarkOrange;"><span>DarkOrange</span></li>
                    <li style="background: DarkOrchid;"><span>DarkOrchid</span></li>
                    <li style="background: DarkRed;"><span>DarkRed</span></li>
                    <li style="background: DarkSalmon;"><span>DarkSalmon</span></li>
                    <li style="background: DarkSeaGreen;"><span>DarkSeaGreen</span></li>
                    <li style="background: DarkSlateBlue;"><span>DarkSlateBlue</span></li>
                    <li style="background: DarkSlateGray;"><span>DarkSlateGray</span></li>
                    <li style="background: DarkTurquoise;"><span>DarkTurquoise</span></li>
                    <li style="background: DarkViolet;"><span>DarkViolet</span></li>
                    <li style="background: DeepPink;"><span>DeepPink</span></li>
                    <li style="background: DeepSkyBlue;"><span>DeepSkyBlue</span></li>
                    <li style="background: DimGray;"><span>DimGray</span></li>
                    <li style="background: DodgerBlue;"><span>DodgerBlue</span></li>
                    <li style="background: Firebrick;"><span>Firebrick</span></li>
                    <li style="background: FloralWhite;"><span>FloralWhite</span></li>
                    <li style="background: ForestGreen;"><span>ForestGreen</span></li>
                    <li style="background: Fuchsia;"><span>Fuchsia</span></li>
                    <li style="background: Gainsboro;"><span>Gainsboro</span></li>
                    <li style="background: GhostWhite;"><span>GhostWhite</span></li>
                    <li style="background: Gold;"><span>Gold</span></li>
                    <li style="background: Goldenrod;"><span>Goldenrod</span></li>
                    <li style="background: Gray;"><span>Gray</span></li>
                    <li style="background: Green;"><span>Green</span></li>
                    <li style="background: GreenYellow;"><span>GreenYellow</span></li>
                    <li style="background: Honeydew;"><span>Honeydew</span></li>
                    <li style="background: HotPink;"><span>HotPink</span></li>
                    <li style="background: IndianRed;"><span>IndianRed</span></li>
                    <li style="background: Indigo;"><span>Indigo</span></li>
                    <li style="background: Ivory;"><span>Ivory</span></li>
                    <li style="background: Khaki;"><span>Khaki</span></li>
                    <li style="background: Lavender;"><span>Lavender</span></li>
                    <li style="background: LavenderBlush;"><span>LavenderBlush</span></li>
                    <li style="background: LawnGreen;"><span>LawnGreen</span></li>
                    <li style="background: LemonChiffon;"><span>LemonChiffon</span></li>
                    <li style="background: LightBlue;"><span>LightBlue</span></li>
                    <li style="background: LightCoral;"><span>LightCoral</span></li>
                    <li style="background: LightCyan;"><span>LightCyan</span></li>
                    <li style="background: LightGoldenrodYellow;"><span>LightGoldenrodYellow</span></li>
                    <li style="background: LightGrey;"><span>LightGray</span></li>
                    <li style="background: LightGreen;"><span>LightGreen</span></li>
                    <li style="background: LightPink;"><span>LightPink</span></li>
                    <li style="background: LightSalmon;"><span>LightSalmon</span></li>
                    <li style="background: LightSeaGreen;"><span>LightSeaGreen</span></li>
                    <li style="background: LightSkyBlue;"><span>LightSkyBlue</span></li>
                    <li style="background: LightSlateGray;"><span>LightSlateGray</span></li>
                    <li style="background: LightSteelBlue;"><span>LightSteelBlue</span></li>
                    <li style="background: LightYellow;"><span>LightYellow</span></li>
                    <li style="background: Lime;"><span>Lime</span></li>
                    <li style="background: LimeGreen;"><span>LimeGreen</span></li>
                    <li style="background: Linen;"><span>Linen</span></li>
                    <li style="background: Magenta;"><span>Magenta</span></li>
                    <li style="background: Maroon;"><span>Maroon</span></li>
                    <li style="background: MediumAquamarine;"><span>MediumAquamarine</span></li>
                    <li style="background: MediumBlue;"><span>MediumBlue</span></li>
                    <li style="background: MediumOrchid;"><span>MediumOrchid</span></li>
                    <li style="background: MediumPurple;"><span>MediumPurple</span></li>
                    <li style="background: MediumSeaGreen;"><span>MediumSeaGreen</span></li>
                    <li style="background: MediumSlateBlue;"><span>MediumSlateBlue</span></li>
                    <li style="background: MediumSpringGreen;"><span>MediumSpringGreen</span></li>
                    <li style="background: MediumTurquoise;"><span>MediumTurquoise</span></li>
                    <li style="background: MediumVioletRed;"><span>MediumVioletRed</span></li>
                    <li style="background: MidnightBlue;"><span>MidnightBlue</span></li>
                    <li style="background: MintCream;"><span>MintCream</span></li>
                    <li style="background: MistyRose;"><span>MistyRose</span></li>
                    <li style="background: Moccasin;"><span>Moccasin</span></li>
                    <li style="background: NavajoWhite;"><span>NavajoWhite</span></li>
                    <li style="background: Navy;"><span>Navy</span></li>
                    <li style="background: OldLace;"><span>OldLace</span></li>
                    <li style="background: Olive;"><span>Olive</span></li>
                    <li style="background: OliveDrab;"><span>OliveDrab</span></li>
                    <li style="background: Orange;"><span>Orange</span></li>
                    <li style="background: OrangeRed;"><span>OrangeRed</span></li>
                    <li style="background: Orchid;"><span>Orchid</span></li>
                    <li style="background: PaleGoldenrod;"><span>PaleGoldenrod</span></li>
                    <li style="background: PaleGreen;"><span>PaleGreen</span></li>
                    <li style="background: PaleTurquoise;"><span>PaleTurquoise</span></li>
                    <li style="background: PaleVioletRed;"><span>PaleVioletRed</span></li>
                    <li style="background: PapayaWhip;"><span>PapayaWhip</span></li>
                    <li style="background: PeachPuff;"><span>PeachPuff</span></li>
                    <li style="background: Peru;"><span>Peru</span></li>
                    <li style="background: Pink;"><span>Pink</span></li>
                    <li style="background: Plum;"><span>Plum</span></li>
                    <li style="background: PowderBlue;"><span>PowderBlue</span></li>
                    <li style="background: Purple;"><span>Purple</span></li>
                    <li style="background: Red;"><span>Red</span></li>
                    <li style="background: RosyBrown;"><span>RosyBrown</span></li>
                    <li style="background: RoyalBlue;"><span>RoyalBlue</span></li>
                    <li style="background: SaddleBrown;"><span>SaddleBrown</span></li>
                    <li style="background: Salmon;"><span>Salmon</span></li>
                    <li style="background: SandyBrown;"><span>SandyBrown</span></li>
                    <li style="background: SeaGreen;"><span>SeaGreen</span></li>
                    <li style="background: SeaShell;"><span>SeaShell</span></li>
                    <li style="background: Sienna;"><span>Sienna</span></li>
                    <li style="background: Silver;"><span>Silver</span></li>
                    <li style="background: SkyBlue;"><span>SkyBlue</span></li>
                    <li style="background: SlateBlue;"><span>SlateBlue</span></li>
                    <li style="background: SlateGray;"><span>SlateGray</span></li>
                    <li style="background: Snow;"><span>Snow</span></li>
                    <li style="background: SpringGreen;"><span>SpringGreen</span></li>
                    <li style="background: SteelBlue;"><span>SteelBlue</span></li>
                    <li style="background: Tan;"><span>Tan</span></li>
                    <li style="background: Teal;"><span>Teal</span></li>
                    <li style="background: Thistle;"><span>Thistle</span></li>
                    <li style="background: Tomato;"><span>Tomato</span></li>
                    <li style="background: Turquoise;"><span>Turquoise</span></li>
                    <li style="background: Violet;"><span>Violet</span></li>
                    <li style="background: Wheat;"><span>Wheat</span></li>
                    <li style="background: White;"><span>White</span></li>
                    <li style="background: WhiteSmoke;"><span>WhiteSmoke</span></li>
                    <li style="background: Yellow;"><span>Yellow</span></li>
                    <li style="background: YellowGreen;"><span>YellowGreen</span></li>
                    <li style=""><span>ButtonFace</span></li>
                    <li style=""><span>ButtonHighlight</span></li>
                    <li style=""><span>ButtonShadow</span></li>
                    <li style="background: activecaption;"><span>GradientActiveCaption</span></li>
                    <li style="background: inactivecaption;"><span>GradientInactiveCaption</span></li>
                    <li style="background: menu;"><span>MenuBar</span></li>
                    <li style="background: highlighttext;"><span>MenuHighlight</span></li>
                </ul>
            </div>
        </ContentTemplate>
    </wijmo:C1SuperPanel>
    <h4>
        Mixed Scrolling Mode</h4>
    <wijmo:C1SuperPanel runat="server" ID="C1SuperPanel2" Width="300" Height="300" AllowResize="true">
        <HScroller ScrollMode="ScrollBar,Buttons">
        </HScroller>
        <VScroller ScrollMode="ScrollBar,Buttons">
        </VScroller>
        <ResizableOptions Handles="S" Helper="ui-widget-content wijmo-wijsuperpanel-helper" />
        <ContentTemplate>
            <div class="elements">
                <ul>
                    <li style="background: activeborder;"><span>ActiveBorder</span></li>
                    <li style="background: activecaption;"><span>ActiveCaption</span></li>
                    <li style="background: captiontext;"><span>ActiveCaptionText</span></li>
                    <li style="background: appworkspace;"><span>AppWorkspace</span></li>
                    <li style="background: buttonface;"><span>Control</span></li>
                    <li style="background: buttonshadow;"><span>ControlDark</span></li>
                    <li style="background: threeddarkshadow;"><span>ControlDarkDark</span></li>
                    <li style="background: buttonface;"><span>ControlLight</span></li>
                    <li style="background: buttonhighlight;"><span>ControlLightLight</span></li>
                    <li style="background: buttontext;"><span>ControlText</span></li>
                    <li style="background: background;"><span>Desktop</span></li>
                    <li style="background: graytext;"><span>GrayText</span></li>
                    <li style="background: highlight;"><span>Highlight</span></li>
                    <li style="background: highlighttext;"><span>HighlightText</span></li>
                    <li style="background: highlight;"><span>HotTrack</span></li>
                    <li style="background: inactiveborder;"><span>InactiveBorder</span></li>
                    <li style="background: inactivecaption;"><span>InactiveCaption</span></li>
                    <li style="background: inactivecaptiontext;"><span>InactiveCaptionText</span></li>
                    <li style="background: infobackground;"><span>Info</span></li>
                    <li style="background: infotext;"><span>InfoText</span></li>
                    <li style="background: menu;"><span>Menu</span></li>
                    <li style="background: menutext;"><span>MenuText</span></li>
                    <li style="background: scrollbar;"><span>ScrollBar</span></li>
                    <li style="background: window;"><span>Window</span></li>
                    <li style="background: windowframe;"><span>WindowFrame</span></li>
                    <li style="background: windowtext;"><span>WindowText</span></li>
                    <li><span>Transparent</span></li>
                    <li style="background: AliceBlue;"><span>AliceBlue</span></li>
                    <li style="background: AntiqueWhite;"><span>AntiqueWhite</span></li>
                    <li style="background: Aqua;"><span>Aqua</span></li>
                    <li style="background: Aquamarine;"><span>Aquamarine</span></li>
                    <li style="background: Azure;"><span>Azure</span></li>
                    <li style="background: Beige;"><span>Beige</span></li>
                    <li style="background: Bisque;"><span>Bisque</span></li>
                    <li style="background: Black;"><span>Black</span></li>
                    <li style="background: BlanchedAlmond;"><span>BlanchedAlmond</span></li>
                    <li style="background: Blue;"><span>Blue</span></li>
                    <li style="background: BlueViolet;"><span>BlueViolet</span></li>
                    <li style="background: Brown;"><span>Brown</span></li>
                    <li style="background: BurlyWood;"><span>BurlyWood</span></li>
                    <li style="background: CadetBlue;"><span>CadetBlue</span></li>
                    <li style="background: Chartreuse;"><span>Chartreuse</span></li>
                    <li style="background: Chocolate;"><span>Chocolate</span></li>
                    <li style="background: Coral;"><span>Coral</span></li>
                    <li style="background: CornflowerBlue;"><span>CornflowerBlue</span></li>
                    <li style="background: Cornsilk;"><span>Cornsilk</span></li>
                    <li style="background: Crimson;"><span>Crimson</span></li>
                    <li style="background: Cyan;"><span>Cyan</span></li>
                    <li style="background: DarkBlue;"><span>DarkBlue</span></li>
                    <li style="background: DarkCyan;"><span>DarkCyan</span></li>
                    <li style="background: DarkGoldenrod;"><span>DarkGoldenrod</span></li>
                    <li style="background: DarkGray;"><span>DarkGray</span></li>
                    <li style="background: DarkGreen;"><span>DarkGreen</span></li>
                    <li style="background: DarkKhaki;"><span>DarkKhaki</span></li>
                    <li style="background: DarkMagenta;"><span>DarkMagenta</span></li>
                    <li style="background: DarkOliveGreen;"><span>DarkOliveGreen</span></li>
                    <li style="background: DarkOrange;"><span>DarkOrange</span></li>
                    <li style="background: DarkOrchid;"><span>DarkOrchid</span></li>
                    <li style="background: DarkRed;"><span>DarkRed</span></li>
                    <li style="background: DarkSalmon;"><span>DarkSalmon</span></li>
                    <li style="background: DarkSeaGreen;"><span>DarkSeaGreen</span></li>
                    <li style="background: DarkSlateBlue;"><span>DarkSlateBlue</span></li>
                    <li style="background: DarkSlateGray;"><span>DarkSlateGray</span></li>
                    <li style="background: DarkTurquoise;"><span>DarkTurquoise</span></li>
                    <li style="background: DarkViolet;"><span>DarkViolet</span></li>
                    <li style="background: DeepPink;"><span>DeepPink</span></li>
                    <li style="background: DeepSkyBlue;"><span>DeepSkyBlue</span></li>
                    <li style="background: DimGray;"><span>DimGray</span></li>
                    <li style="background: DodgerBlue;"><span>DodgerBlue</span></li>
                    <li style="background: Firebrick;"><span>Firebrick</span></li>
                    <li style="background: FloralWhite;"><span>FloralWhite</span></li>
                    <li style="background: ForestGreen;"><span>ForestGreen</span></li>
                    <li style="background: Fuchsia;"><span>Fuchsia</span></li>
                    <li style="background: Gainsboro;"><span>Gainsboro</span></li>
                    <li style="background: GhostWhite;"><span>GhostWhite</span></li>
                    <li style="background: Gold;"><span>Gold</span></li>
                    <li style="background: Goldenrod;"><span>Goldenrod</span></li>
                    <li style="background: Gray;"><span>Gray</span></li>
                    <li style="background: Green;"><span>Green</span></li>
                    <li style="background: GreenYellow;"><span>GreenYellow</span></li>
                    <li style="background: Honeydew;"><span>Honeydew</span></li>
                    <li style="background: HotPink;"><span>HotPink</span></li>
                    <li style="background: IndianRed;"><span>IndianRed</span></li>
                    <li style="background: Indigo;"><span>Indigo</span></li>
                    <li style="background: Ivory;"><span>Ivory</span></li>
                    <li style="background: Khaki;"><span>Khaki</span></li>
                    <li style="background: Lavender;"><span>Lavender</span></li>
                    <li style="background: LavenderBlush;"><span>LavenderBlush</span></li>
                    <li style="background: LawnGreen;"><span>LawnGreen</span></li>
                    <li style="background: LemonChiffon;"><span>LemonChiffon</span></li>
                    <li style="background: LightBlue;"><span>LightBlue</span></li>
                    <li style="background: LightCoral;"><span>LightCoral</span></li>
                    <li style="background: LightCyan;"><span>LightCyan</span></li>
                    <li style="background: LightGoldenrodYellow;"><span>LightGoldenrodYellow</span></li>
                    <li style="background: LightGrey;"><span>LightGray</span></li>
                    <li style="background: LightGreen;"><span>LightGreen</span></li>
                    <li style="background: LightPink;"><span>LightPink</span></li>
                    <li style="background: LightSalmon;"><span>LightSalmon</span></li>
                    <li style="background: LightSeaGreen;"><span>LightSeaGreen</span></li>
                    <li style="background: LightSkyBlue;"><span>LightSkyBlue</span></li>
                    <li style="background: LightSlateGray;"><span>LightSlateGray</span></li>
                    <li style="background: LightSteelBlue;"><span>LightSteelBlue</span></li>
                    <li style="background: LightYellow;"><span>LightYellow</span></li>
                    <li style="background: Lime;"><span>Lime</span></li>
                    <li style="background: LimeGreen;"><span>LimeGreen</span></li>
                    <li style="background: Linen;"><span>Linen</span></li>
                    <li style="background: Magenta;"><span>Magenta</span></li>
                    <li style="background: Maroon;"><span>Maroon</span></li>
                    <li style="background: MediumAquamarine;"><span>MediumAquamarine</span></li>
                    <li style="background: MediumBlue;"><span>MediumBlue</span></li>
                    <li style="background: MediumOrchid;"><span>MediumOrchid</span></li>
                    <li style="background: MediumPurple;"><span>MediumPurple</span></li>
                    <li style="background: MediumSeaGreen;"><span>MediumSeaGreen</span></li>
                    <li style="background: MediumSlateBlue;"><span>MediumSlateBlue</span></li>
                    <li style="background: MediumSpringGreen;"><span>MediumSpringGreen</span></li>
                    <li style="background: MediumTurquoise;"><span>MediumTurquoise</span></li>
                    <li style="background: MediumVioletRed;"><span>MediumVioletRed</span></li>
                    <li style="background: MidnightBlue;"><span>MidnightBlue</span></li>
                    <li style="background: MintCream;"><span>MintCream</span></li>
                    <li style="background: MistyRose;"><span>MistyRose</span></li>
                    <li style="background: Moccasin;"><span>Moccasin</span></li>
                    <li style="background: NavajoWhite;"><span>NavajoWhite</span></li>
                    <li style="background: Navy;"><span>Navy</span></li>
                    <li style="background: OldLace;"><span>OldLace</span></li>
                    <li style="background: Olive;"><span>Olive</span></li>
                    <li style="background: OliveDrab;"><span>OliveDrab</span></li>
                    <li style="background: Orange;"><span>Orange</span></li>
                    <li style="background: OrangeRed;"><span>OrangeRed</span></li>
                    <li style="background: Orchid;"><span>Orchid</span></li>
                    <li style="background: PaleGoldenrod;"><span>PaleGoldenrod</span></li>
                    <li style="background: PaleGreen;"><span>PaleGreen</span></li>
                    <li style="background: PaleTurquoise;"><span>PaleTurquoise</span></li>
                    <li style="background: PaleVioletRed;"><span>PaleVioletRed</span></li>
                    <li style="background: PapayaWhip;"><span>PapayaWhip</span></li>
                    <li style="background: PeachPuff;"><span>PeachPuff</span></li>
                    <li style="background: Peru;"><span>Peru</span></li>
                    <li style="background: Pink;"><span>Pink</span></li>
                    <li style="background: Plum;"><span>Plum</span></li>
                    <li style="background: PowderBlue;"><span>PowderBlue</span></li>
                    <li style="background: Purple;"><span>Purple</span></li>
                    <li style="background: Red;"><span>Red</span></li>
                    <li style="background: RosyBrown;"><span>RosyBrown</span></li>
                    <li style="background: RoyalBlue;"><span>RoyalBlue</span></li>
                    <li style="background: SaddleBrown;"><span>SaddleBrown</span></li>
                    <li style="background: Salmon;"><span>Salmon</span></li>
                    <li style="background: SandyBrown;"><span>SandyBrown</span></li>
                    <li style="background: SeaGreen;"><span>SeaGreen</span></li>
                    <li style="background: SeaShell;"><span>SeaShell</span></li>
                    <li style="background: Sienna;"><span>Sienna</span></li>
                    <li style="background: Silver;"><span>Silver</span></li>
                    <li style="background: SkyBlue;"><span>SkyBlue</span></li>
                    <li style="background: SlateBlue;"><span>SlateBlue</span></li>
                    <li style="background: SlateGray;"><span>SlateGray</span></li>
                    <li style="background: Snow;"><span>Snow</span></li>
                    <li style="background: SpringGreen;"><span>SpringGreen</span></li>
                    <li style="background: SteelBlue;"><span>SteelBlue</span></li>
                    <li style="background: Tan;"><span>Tan</span></li>
                    <li style="background: Teal;"><span>Teal</span></li>
                    <li style="background: Thistle;"><span>Thistle</span></li>
                    <li style="background: Tomato;"><span>Tomato</span></li>
                    <li style="background: Turquoise;"><span>Turquoise</span></li>
                    <li style="background: Violet;"><span>Violet</span></li>
                    <li style="background: Wheat;"><span>Wheat</span></li>
                    <li style="background: White;"><span>White</span></li>
                    <li style="background: WhiteSmoke;"><span>WhiteSmoke</span></li>
                    <li style="background: Yellow;"><span>Yellow</span></li>
                    <li style="background: YellowGreen;"><span>YellowGreen</span></li>
                    <li style=""><span>ButtonFace</span></li>
                    <li style=""><span>ButtonHighlight</span></li>
                    <li style=""><span>ButtonShadow</span></li>
                    <li style="background: activecaption;"><span>GradientActiveCaption</span></li>
                    <li style="background: inactivecaption;"><span>GradientInactiveCaption</span></li>
                    <li style="background: menu;"><span>MenuBar</span></li>
                    <li style="background: highlighttext;"><span>MenuHighlight</span></li>
                </ul>
            </div>
        </ContentTemplate>
    </wijmo:C1SuperPanel>
    <h4>
        Edge Hover</h4>
    <wijmo:C1SuperPanel runat="server" ID="C1SuperPanel3" Width="300" Height="300">
        <HScroller ScrollMode="Buttons">
        </HScroller>
        <VScroller ScrollMode="Edge">
        </VScroller>
        <ResizableOptions Handles="S" Helper="ui-widget-content wijmo-wijsuperpanel-helper"></ResizableOptions>
        <ContentTemplate>
            <div class="elements">
                <ul>
                    <li style="background: activeborder;"><span>ActiveBorder</span></li>
                    <li style="background: activecaption;"><span>ActiveCaption</span></li>
                    <li style="background: captiontext;"><span>ActiveCaptionText</span></li>
                    <li style="background: appworkspace;"><span>AppWorkspace</span></li>
                    <li style="background: buttonface;"><span>Control</span></li>
                    <li style="background: buttonshadow;"><span>ControlDark</span></li>
                    <li style="background: threeddarkshadow;"><span>ControlDarkDark</span></li>
                    <li style="background: buttonface;"><span>ControlLight</span></li>
                    <li style="background: buttonhighlight;"><span>ControlLightLight</span></li>
                    <li style="background: buttontext;"><span>ControlText</span></li>
                    <li style="background: background;"><span>Desktop</span></li>
                    <li style="background: graytext;"><span>GrayText</span></li>
                    <li style="background: highlight;"><span>Highlight</span></li>
                    <li style="background: highlighttext;"><span>HighlightText</span></li>
                    <li style="background: highlight;"><span>HotTrack</span></li>
                    <li style="background: inactiveborder;"><span>InactiveBorder</span></li>
                    <li style="background: inactivecaption;"><span>InactiveCaption</span></li>
                    <li style="background: inactivecaptiontext;"><span>InactiveCaptionText</span></li>
                    <li style="background: infobackground;"><span>Info</span></li>
                    <li style="background: infotext;"><span>InfoText</span></li>
                    <li style="background: menu;"><span>Menu</span></li>
                    <li style="background: menutext;"><span>MenuText</span></li>
                    <li style="background: scrollbar;"><span>ScrollBar</span></li>
                    <li style="background: window;"><span>Window</span></li>
                    <li style="background: windowframe;"><span>WindowFrame</span></li>
                    <li style="background: windowtext;"><span>WindowText</span></li>
                    <li><span>Transparent</span></li>
                    <li style="background: AliceBlue;"><span>AliceBlue</span></li>
                    <li style="background: AntiqueWhite;"><span>AntiqueWhite</span></li>
                    <li style="background: Aqua;"><span>Aqua</span></li>
                    <li style="background: Aquamarine;"><span>Aquamarine</span></li>
                    <li style="background: Azure;"><span>Azure</span></li>
                    <li style="background: Beige;"><span>Beige</span></li>
                    <li style="background: Bisque;"><span>Bisque</span></li>
                    <li style="background: Black;"><span>Black</span></li>
                    <li style="background: BlanchedAlmond;"><span>BlanchedAlmond</span></li>
                    <li style="background: Blue;"><span>Blue</span></li>
                    <li style="background: BlueViolet;"><span>BlueViolet</span></li>
                    <li style="background: Brown;"><span>Brown</span></li>
                    <li style="background: BurlyWood;"><span>BurlyWood</span></li>
                    <li style="background: CadetBlue;"><span>CadetBlue</span></li>
                    <li style="background: Chartreuse;"><span>Chartreuse</span></li>
                    <li style="background: Chocolate;"><span>Chocolate</span></li>
                    <li style="background: Coral;"><span>Coral</span></li>
                    <li style="background: CornflowerBlue;"><span>CornflowerBlue</span></li>
                    <li style="background: Cornsilk;"><span>Cornsilk</span></li>
                    <li style="background: Crimson;"><span>Crimson</span></li>
                    <li style="background: Cyan;"><span>Cyan</span></li>
                    <li style="background: DarkBlue;"><span>DarkBlue</span></li>
                    <li style="background: DarkCyan;"><span>DarkCyan</span></li>
                    <li style="background: DarkGoldenrod;"><span>DarkGoldenrod</span></li>
                    <li style="background: DarkGray;"><span>DarkGray</span></li>
                    <li style="background: DarkGreen;"><span>DarkGreen</span></li>
                    <li style="background: DarkKhaki;"><span>DarkKhaki</span></li>
                    <li style="background: DarkMagenta;"><span>DarkMagenta</span></li>
                    <li style="background: DarkOliveGreen;"><span>DarkOliveGreen</span></li>
                    <li style="background: DarkOrange;"><span>DarkOrange</span></li>
                    <li style="background: DarkOrchid;"><span>DarkOrchid</span></li>
                    <li style="background: DarkRed;"><span>DarkRed</span></li>
                    <li style="background: DarkSalmon;"><span>DarkSalmon</span></li>
                    <li style="background: DarkSeaGreen;"><span>DarkSeaGreen</span></li>
                    <li style="background: DarkSlateBlue;"><span>DarkSlateBlue</span></li>
                    <li style="background: DarkSlateGray;"><span>DarkSlateGray</span></li>
                    <li style="background: DarkTurquoise;"><span>DarkTurquoise</span></li>
                    <li style="background: DarkViolet;"><span>DarkViolet</span></li>
                    <li style="background: DeepPink;"><span>DeepPink</span></li>
                    <li style="background: DeepSkyBlue;"><span>DeepSkyBlue</span></li>
                    <li style="background: DimGray;"><span>DimGray</span></li>
                    <li style="background: DodgerBlue;"><span>DodgerBlue</span></li>
                    <li style="background: Firebrick;"><span>Firebrick</span></li>
                    <li style="background: FloralWhite;"><span>FloralWhite</span></li>
                    <li style="background: ForestGreen;"><span>ForestGreen</span></li>
                    <li style="background: Fuchsia;"><span>Fuchsia</span></li>
                    <li style="background: Gainsboro;"><span>Gainsboro</span></li>
                    <li style="background: GhostWhite;"><span>GhostWhite</span></li>
                    <li style="background: Gold;"><span>Gold</span></li>
                    <li style="background: Goldenrod;"><span>Goldenrod</span></li>
                    <li style="background: Gray;"><span>Gray</span></li>
                    <li style="background: Green;"><span>Green</span></li>
                    <li style="background: GreenYellow;"><span>GreenYellow</span></li>
                    <li style="background: Honeydew;"><span>Honeydew</span></li>
                    <li style="background: HotPink;"><span>HotPink</span></li>
                    <li style="background: IndianRed;"><span>IndianRed</span></li>
                    <li style="background: Indigo;"><span>Indigo</span></li>
                    <li style="background: Ivory;"><span>Ivory</span></li>
                    <li style="background: Khaki;"><span>Khaki</span></li>
                    <li style="background: Lavender;"><span>Lavender</span></li>
                    <li style="background: LavenderBlush;"><span>LavenderBlush</span></li>
                    <li style="background: LawnGreen;"><span>LawnGreen</span></li>
                    <li style="background: LemonChiffon;"><span>LemonChiffon</span></li>
                    <li style="background: LightBlue;"><span>LightBlue</span></li>
                    <li style="background: LightCoral;"><span>LightCoral</span></li>
                    <li style="background: LightCyan;"><span>LightCyan</span></li>
                    <li style="background: LightGoldenrodYellow;"><span>LightGoldenrodYellow</span></li>
                    <li style="background: LightGrey;"><span>LightGray</span></li>
                    <li style="background: LightGreen;"><span>LightGreen</span></li>
                    <li style="background: LightPink;"><span>LightPink</span></li>
                    <li style="background: LightSalmon;"><span>LightSalmon</span></li>
                    <li style="background: LightSeaGreen;"><span>LightSeaGreen</span></li>
                    <li style="background: LightSkyBlue;"><span>LightSkyBlue</span></li>
                    <li style="background: LightSlateGray;"><span>LightSlateGray</span></li>
                    <li style="background: LightSteelBlue;"><span>LightSteelBlue</span></li>
                    <li style="background: LightYellow;"><span>LightYellow</span></li>
                    <li style="background: Lime;"><span>Lime</span></li>
                    <li style="background: LimeGreen;"><span>LimeGreen</span></li>
                    <li style="background: Linen;"><span>Linen</span></li>
                    <li style="background: Magenta;"><span>Magenta</span></li>
                    <li style="background: Maroon;"><span>Maroon</span></li>
                    <li style="background: MediumAquamarine;"><span>MediumAquamarine</span></li>
                    <li style="background: MediumBlue;"><span>MediumBlue</span></li>
                    <li style="background: MediumOrchid;"><span>MediumOrchid</span></li>
                    <li style="background: MediumPurple;"><span>MediumPurple</span></li>
                    <li style="background: MediumSeaGreen;"><span>MediumSeaGreen</span></li>
                    <li style="background: MediumSlateBlue;"><span>MediumSlateBlue</span></li>
                    <li style="background: MediumSpringGreen;"><span>MediumSpringGreen</span></li>
                    <li style="background: MediumTurquoise;"><span>MediumTurquoise</span></li>
                    <li style="background: MediumVioletRed;"><span>MediumVioletRed</span></li>
                    <li style="background: MidnightBlue;"><span>MidnightBlue</span></li>
                    <li style="background: MintCream;"><span>MintCream</span></li>
                    <li style="background: MistyRose;"><span>MistyRose</span></li>
                    <li style="background: Moccasin;"><span>Moccasin</span></li>
                    <li style="background: NavajoWhite;"><span>NavajoWhite</span></li>
                    <li style="background: Navy;"><span>Navy</span></li>
                    <li style="background: OldLace;"><span>OldLace</span></li>
                    <li style="background: Olive;"><span>Olive</span></li>
                    <li style="background: OliveDrab;"><span>OliveDrab</span></li>
                    <li style="background: Orange;"><span>Orange</span></li>
                    <li style="background: OrangeRed;"><span>OrangeRed</span></li>
                    <li style="background: Orchid;"><span>Orchid</span></li>
                    <li style="background: PaleGoldenrod;"><span>PaleGoldenrod</span></li>
                    <li style="background: PaleGreen;"><span>PaleGreen</span></li>
                    <li style="background: PaleTurquoise;"><span>PaleTurquoise</span></li>
                    <li style="background: PaleVioletRed;"><span>PaleVioletRed</span></li>
                    <li style="background: PapayaWhip;"><span>PapayaWhip</span></li>
                    <li style="background: PeachPuff;"><span>PeachPuff</span></li>
                    <li style="background: Peru;"><span>Peru</span></li>
                    <li style="background: Pink;"><span>Pink</span></li>
                    <li style="background: Plum;"><span>Plum</span></li>
                    <li style="background: PowderBlue;"><span>PowderBlue</span></li>
                    <li style="background: Purple;"><span>Purple</span></li>
                    <li style="background: Red;"><span>Red</span></li>
                    <li style="background: RosyBrown;"><span>RosyBrown</span></li>
                    <li style="background: RoyalBlue;"><span>RoyalBlue</span></li>
                    <li style="background: SaddleBrown;"><span>SaddleBrown</span></li>
                    <li style="background: Salmon;"><span>Salmon</span></li>
                    <li style="background: SandyBrown;"><span>SandyBrown</span></li>
                    <li style="background: SeaGreen;"><span>SeaGreen</span></li>
                    <li style="background: SeaShell;"><span>SeaShell</span></li>
                    <li style="background: Sienna;"><span>Sienna</span></li>
                    <li style="background: Silver;"><span>Silver</span></li>
                    <li style="background: SkyBlue;"><span>SkyBlue</span></li>
                    <li style="background: SlateBlue;"><span>SlateBlue</span></li>
                    <li style="background: SlateGray;"><span>SlateGray</span></li>
                    <li style="background: Snow;"><span>Snow</span></li>
                    <li style="background: SpringGreen;"><span>SpringGreen</span></li>
                    <li style="background: SteelBlue;"><span>SteelBlue</span></li>
                    <li style="background: Tan;"><span>Tan</span></li>
                    <li style="background: Teal;"><span>Teal</span></li>
                    <li style="background: Thistle;"><span>Thistle</span></li>
                    <li style="background: Tomato;"><span>Tomato</span></li>
                    <li style="background: Turquoise;"><span>Turquoise</span></li>
                    <li style="background: Violet;"><span>Violet</span></li>
                    <li style="background: Wheat;"><span>Wheat</span></li>
                    <li style="background: White;"><span>White</span></li>
                    <li style="background: WhiteSmoke;"><span>WhiteSmoke</span></li>
                    <li style="background: Yellow;"><span>Yellow</span></li>
                    <li style="background: YellowGreen;"><span>YellowGreen</span></li>
                    <li style=""><span>ButtonFace</span></li>
                    <li style=""><span>ButtonHighlight</span></li>
                    <li style=""><span>ButtonShadow</span></li>
                    <li style="background: activecaption;"><span>GradientActiveCaption</span></li>
                    <li style="background: inactivecaption;"><span>GradientInactiveCaption</span></li>
                    <li style="background: menu;"><span>MenuBar</span></li>
                    <li style="background: highlighttext;"><span>MenuHighlight</span></li>
                </ul>
            </div>
        </ContentTemplate>
    </wijmo:C1SuperPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample shows how the <strong>HScroller.ScrollMode</strong> and <strong>VScroller.ScrollMode</strong> options can be used to control the way the <strong>C1SuperPanel</strong> is scrolled. The possible values are "Edge", "Buttons", "ButtonsHover" and "ScrollBar".
    </p>
    <ul>
        <li><strong>HScroller.ScrollMode</strong> - to determine scroll mode of horizontal direction.</li>
        <li><strong>VScroller.ScrollMode</strong> - to determine scroll mode of vertical direction.</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
