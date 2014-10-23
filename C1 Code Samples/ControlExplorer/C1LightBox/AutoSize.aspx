<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="AutoSize.aspx.cs" Inherits="ControlExplorer.C1LightBox.AutoSize" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <wijmo:C1LightBox ID="C1LightBox1" runat="server" Player="Img" TextPosition="TitleOverlay" AutoSize="true" KeyNav="true">
        <Items>
            <wijmo:C1LightBoxItem ID="LightBoxItem1" Title="Sport1" Text="Sport1"
                ImageUrl="http://lorempixum.com/120/90/sports/1"
                LinkUrl="http://lorempixum.com/600/400/sports/1" />
            <wijmo:C1LightBoxItem ID="LightBoxItem2" Title="Sport2" Text="Sport2"
                ImageUrl="http://lorempixum.com/120/90/sports/2"
                LinkUrl="http://lorempixum.com/800/400/sports/2" />
            <wijmo:C1LightBoxItem ID="C1LightBoxItem3" Title="Sport3" Text="Sport3"
                ImageUrl="http://lorempixum.com/120/90/sports/3"
                LinkUrl="http://lorempixum.com/600/400/sports/3" />
            <wijmo:C1LightBoxItem ID="C1LightBoxItem4" Title="Sport4" Text="Sport4"
                ImageUrl="http://lorempixum.com/120/90/sports/4"
                LinkUrl="http://lorempixum.com/600/300/sports/4" />
        </Items>
    </wijmo:C1LightBox>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

    <p>
        <strong>C1LightBox</strong> can resize automatically according to the content image's width and height. This makes sure images are displayed with the correct width/height ratio.
    </p>

    <p>
        Enabled automatic resizing by setting the <b>AutoSize</b> property to True.
    </p>

    <p>
        The <b>ResizeAnimation</b> property determines the animation effect when the container changes the size. <b>ResizeAnimation.Animated</b> property supports the following values:

    </p>
    <ul>
        <li><strong>Sync</strong> - Resize both the width and height at the same time.</li>
        <li><strong>Width to Height</strong> - Resize the width in advance of height.</li>
        <li><strong>Height to Width</strong> - Resize the height in advance of width.</li>
        <li><strong>None</strong> - No animation.</li>
    </ul>
    <p>
        Please notice that the auto-size feature only works for Image content.
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <label>Animation:</label>
                    <asp:DropDownList ID="cbxAnimation" AutoPostBack="true" runat="server" OnSelectedIndexChanged="cbxAnimation_SelectedIndexChanged">
                        <asp:ListItem Value="Sync" Selected="true">Sync</asp:ListItem>
                        <asp:ListItem Value="Wh">Width to Height</asp:ListItem>
                        <asp:ListItem Value="Hw">Height to Width</asp:ListItem>
                        <asp:ListItem Value="None">None</asp:ListItem>
                    </asp:DropDownList>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
