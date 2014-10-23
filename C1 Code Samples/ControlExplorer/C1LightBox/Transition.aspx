<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Transition.aspx.cs" Inherits="ControlExplorer.C1LightBox.Transition" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <wijmo:C1LightBox ID="C1LightBox1" runat="server" Player="Img" TextPosition="TitleOverlay" SlideDirection="Horizontal">
        <TransAnimation Animated="Fade" Duration="1000" />
        <Items>
            <wijmo:C1LightBoxItem ID="LightBoxItem1" Title="Abstract1" Text="Abstract1"
                ImageUrl="http://lorempixum.com/120/90/abstract/1"
                LinkUrl="http://lorempixum.com/600/400/abstract/1" />
            <wijmo:C1LightBoxItem ID="LightBoxItem2" Title="Abstract2" Text="Abstract2"
                ImageUrl="http://lorempixum.com/120/90/abstract/2"
                LinkUrl="http://lorempixum.com/600/400/abstract/2" />
            <wijmo:C1LightBoxItem ID="C1LightBoxItem3" Title="Abstract3" Text="Abstract3"
                ImageUrl="http://lorempixum.com/120/90/abstract/3"
                LinkUrl="http://lorempixum.com/600/400/abstract/3" />
            <wijmo:C1LightBoxItem ID="C1LightBoxItem4" Title="Abstract4" Text="Abstract4"
                ImageUrl="http://lorempixum.com/120/90/abstract/4"
                LinkUrl="http://lorempixum.com/600/400/abstract/4" />
        </Items>
    </wijmo:C1LightBox>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

    <p>
        This sample demonstrates animation effects when transitioning from one page to the next.
    </p>

    <p>
        You can change the animation style by setting the <b>TransAnimation.Animated</b> property with the following values:
    </p>

    <ul>
        <li>Slide - Slide animation.</li>
        <li>Fade - Fade animation.</li>
        <li>None - No animation.</li>
    </ul>


    <p>
        <b>TransAnimation.Easing</b> determines the easing style to animate.
        <b>TransAnimation.Duration</b> determines the time span to animate.
    </p>


    <p>
        For the slide animation, you can also change the slide direction by setting the <b>SlideDirection</b> property to "Horizontal" or "Vertical". 
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <label>Animation:</label>
                    <asp:DropDownList ID="cbxAnimation" AutoPostBack="true" runat="server" OnSelectedIndexChanged="cbxAnimation_SelectedIndexChanged">
                        <asp:ListItem Value="Fade" Selected="true">Fade</asp:ListItem>
                        <asp:ListItem Value="Slide">Slide</asp:ListItem>
                        <asp:ListItem Value="None">None</asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
                    <label>Slide Direction:</label>
                    <asp:DropDownList ID="cbxSlideDirecion" AutoPostBack="true" runat="server" OnSelectedIndexChanged="cbxSlideDirecion_SelectedIndexChanged">
                        <asp:ListItem Value="Horizontal" Selected="true">Horizontal</asp:ListItem>
                        <asp:ListItem Value="Vertical">Vertical</asp:ListItem>
                    </asp:DropDownList>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
