<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="TextPosition.aspx.cs" Inherits="ControlExplorer.C1LightBox.TextPosition" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <wijmo:C1LightBox ID="C1LightBox1" runat="server" Player="Img" TextPosition="Inside">
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
        This sample demonstrates the possible position or style of text section supported by <strong>C1LightBox</strong>.
    </p>

    <p>
        To change the position or style of the text section, simply change the <strong>TextPosition</strong> property to one of the following values:
    </p>

    <ul>
        <li>Inside - Displays the text description inside the content container, side by side with the content.</li>
        <li>Outside - Displays the text description outside the content container.</li>
        <li>Overlay - Displays the text description inside the content container overlaying the content. </li>
        <li>TitleOverlay - Displays the text description inside the content container overlaying the title only.</li>
        <li>None - No text is displayed.</li>
    </ul>

    <p>
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <label>Text Position:</label>
                    <asp:DropDownList ID="cbxTextPosition" AutoPostBack="true" runat="server" OnSelectedIndexChanged="cbxTextPosition_SelectedIndexChanged">
                        <asp:ListItem Value="Inside" Selected="true">Inside</asp:ListItem>
                        <asp:ListItem Value="Outside">Outside</asp:ListItem>
                        <asp:ListItem Value="Overlay">Overlay</asp:ListItem>
                        <asp:ListItem Value="TitleOverlay">TitleOverlay</asp:ListItem>
                        <asp:ListItem Value="None">None</asp:ListItem>
                    </asp:DropDownList>
                </li>
            </ul>
        </div>
    </div>

</asp:Content>
