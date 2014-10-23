<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="AutoPlay.aspx.cs" Inherits="Wizard_AutoPlay" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Wizard" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

  <asp:Panel ID="Panel1" runat="server">

        <ul>
            <li>
                <h1>
                    Step 1</h1>
                This is the first step</li>
            <li>
                <h1>
                    Step 2</h1>
                This is the second step</li>
            <li>
                <h1>
                    Step 3</h1>
                This is the third step</li>
        </ul>
        <div>
            <p>
                Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec
                arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante.
                Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper
                leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales
                tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel
                pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum.
                Nunc tristique tempus lectus.</p>
        </div>
        <div>
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
        <div>
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

    </asp:Panel>

    <wijmo:C1WizardExtender ID="WizardExtender1" runat="server" AutoPlay="True" 
        Loop="True" NavButtons="None" TargetControlID="Panel1">
    </wijmo:C1WizardExtender>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
C1WizardExtender supports showing each page in order automatically.
</p>

<p>
Auto-play is enabled if setting the <b>AutoPlay</b> property to true.
You can change the time span of each page been displayed by setting the <b>Delay</b> property.
If you want the wizard to show pages in loop mode, could set the <b>Loop</b> property to true.
</p>

<p>
Generally, we set the <b>NavButtons</b> property to <b>None</b> in auto-play mode.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
