<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Scrollable.aspx.cs" Inherits="Tabs_Scrollable" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Tabs" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:Panel ID="Panel2" runat="server" Width="600px">

    <asp:Panel ID="Panel1" runat="server">

        <ul>
            <li><a href="#tabs-1">Nunc tincidunt</a></li>
            <li><a href="#tabs-2">Proin dolor</a></li>
            <li><a href="#tabs-3">Aenean lacinia</a></li>
            <li><a href="#tabs-4">Demo Tab4</a></li>
            <li><a href="#tabs-5">Demo Tab5</a></li>
            <li><a href="#tabs-6">Demo Tab6</a></li>
            <li><a href="#tabs-7">Demo Tab7</a></li>
            <li><a href="#tabs-8">Demo Tab8</a></li>
        </ul>
        <div id="tabs-1">
            <p>
                Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec
                arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante.
                Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper
                leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales
                tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel
                pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum.
                Nunc tristique tempus lectus.</p>
        </div>
        <div id="tabs-2">
            <p>
                Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra
                massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget
                luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean
                aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent
                in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat
                nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque
                convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod
                felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
        </div>
        <div id="tabs-3">
            <p>
                Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate,
                pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem.
                Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia
                nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo
                pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem
                enim, pretium nec, feugiat nec, luctus a, lacus.</p>
            <p>
                Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam
                ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing
                velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula
                faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero
                sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor
                ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas
                commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit
                hendrerit.</p>
        </div>
        <div id="tabs-4">
            <p>
                This is sample page 4</p>
        </div>
        <div id="tabs-5">
            <p>
                This is sample page 5</p>
        </div>
        <div id="tabs-6">
            <p>
                This is sample page 6</p>
        </div>
        <div id="tabs-7">
            <p>
                This is sample page 7</p>
        </div>
        <div id="tabs-8">
            <p>
                This is sample page 8</p>
        </div>

    </asp:Panel>

    </asp:Panel>


    <wijmo:C1TabsExtender ID="TabsExtender1" runat="server" TargetControlID="Panel1" Scrollable="true" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
C1TabsExtender supports tabs scrolling when there are too many tabs to fit along the width of the container.
</p>

<p>
This behavior is enabled if the <b>Scrollable</b> property is set to true.
</p>

<p>
Try this sample, the tabs will scroll instead of wrapping to next line.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
