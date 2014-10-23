<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1Tabs_Validation" CodeBehind="Validation.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Tabs" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <style type="text/css">
        .labelstyle
        {
            float:left;
            width:100px;
        }

        .inputPanel
        {
            margin:4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1Tabs ID="C1Tab1" runat="server" CausesValidation="True" ValidationGroup="LoginValidationGroup" Enabled="True" OnClientSelect="function(){return Page_ClientValidate('LoginValidationGroup')}">
        <Pages>
            <wijmo:C1TabPage ID="Page1" Text="Nunc tincidunt">
                <div style="padding-top: 20px; padding-left: 20px;">
                    <div class="inputPanel">
                        <asp:Label ID="Label1" CssClass="labelstyle" runat="server" AssociatedControlID="userName">Username</asp:Label>
                        <asp:TextBox runat="server" ID="userName" CausesValidation="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="validator1"
                            ControlToValidate="userName" Display="Dynamic" ErrorMessage="Please input the Username!"
                            ValidationGroup="LoginValidationGroup" />
                    </div>
                    <div class="inputPanel">
                        <asp:Label ID="Label2" CssClass="labelstyle" runat="server" AssociatedControlID="passWord">Password</asp:Label>
                        <asp:TextBox runat="server" TextMode="password" ID="passWord" CausesValidation="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="validator2"
                            ControlToValidate="passWord" Display="Dynamic" ErrorMessage="Please input the Password!"
                            ValidationGroup="LoginValidationGroup" />
                    </div>
                </div>
            </wijmo:C1TabPage>
            <wijmo:C1TabPage ID="Page2" Text="Proin dolor">
                <p>
                    Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra
                        massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget
                        luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean
                        aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent
                        in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat
                        nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque
                        convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod
                        felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.
                </p>
            </wijmo:C1TabPage>
            <wijmo:C1TabPage ID="Page3" Text="Aenean lacinia">
                <p>
                    Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate,
                        pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem.
                        Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia
                        nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo
                        pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem
                        enim, pretium nec, feugiat nec, luctus a, lacus.
                </p>
                <p>
                    Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam
                        ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing
                        velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula
                        faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero
                        sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor
                        ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas
                        commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit
                        hendrerit.
                </p>
            </wijmo:C1TabPage>
        </Pages>
    </wijmo:C1Tabs>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>
        Tabs can only be selected when the corresponding validation is passed. This can be done by setting the <strong>CausesValidation</strong> to True, and specifing the <strong>ValidationGroup</strong> property. 
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>
