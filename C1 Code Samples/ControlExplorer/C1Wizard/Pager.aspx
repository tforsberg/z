<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Pager.aspx.cs" Inherits="ControlExplorer.C1Wizard.Pager" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Wizard" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Pager" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        function onClientPageIndexChanged() {
            var pageIndex = $("#<%=C1Pager1.ClientID%>").c1pager("option", "pageIndex");
                    $("#<%=C1Wizard1.ClientID%>").c1wizard({ activeIndex: pageIndex });
        };

        $(document).ready(function () {

            $(':radio').change(function (e) {
                switch ($(this).val()) {
                    case "Default":
                        $("#<%=C1Pager1.ClientID%>").c1pager('option', {
                            firstPageClass: "ui-icon-seek-first",
                            previousPageClass: "ui-icon-seek-prev",
                            nextPageClass: "ui-icon-seek-next",
                            lastPageClass: "ui-icon-seek-end",
                            firstPageText: "First",
                            previousPageText: "Previous",
                            nextPageText: "Next",
                            lastPageText: "Last"
                        });
                        break;

                    case "Text":
                        $("#<%=C1Pager1.ClientID%>").c1pager('option', {
                        firstPageClass: "",
                        previousPageClass: "",
                        nextPageClass: "",
                        lastPageClass: "",
                        firstPageText: "First",
                        previousPageText: "Previous",
                        nextPageText: "Next",
                        lastPageText: "Last"
                    });
                    break;

                case "Custom":
                    $("#<%=C1Pager1.ClientID%>").c1pager('option', {
                        firstPageClass: "",
                        previousPageClass: "",
                        nextPageClass: "",
                        lastPageClass: "",
                        firstPageText: "|<",
                        previousPageText: "<",
                        nextPageText: ">",
                        lastPageText: ">|"
                    });
                    break;
            }
            });
        });
    </script>

    <wijmo:C1Wizard ID="C1Wizard1" runat="server" NavButtons="None">
        <Steps>
            <wijmo:C1WizardStep ID="C1WizardStep1" Title="Step1">
                Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur necarcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorperleo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales	tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel	pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.
            </wijmo:C1WizardStep>
            <wijmo:C1WizardStep ID="C1WizardStep2" Title="Step2">
                Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.
            </wijmo:C1WizardStep>
            <wijmo:C1WizardStep ID="C1WizardStep3" Title="Step3">
                Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.
            </wijmo:C1WizardStep>
            <wijmo:C1WizardStep ID="C1WizardStep4" Title="Step4">
                Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.
            </wijmo:C1WizardStep>
            <wijmo:C1WizardStep ID="C1WizardStep5" Title="Step5">
                Seven platforms, hundreds of controls, one studio. Build awesome desktop, Web, and mobile apps with our tools for WinForms, WPF, ASP.NET, Silverlight, iPhone, Mobile, and ActiveX.
            </wijmo:C1WizardStep>
            <wijmo:C1WizardStep ID="C1WizardStep6" Title="Step6">
                Over 65 .NET controls, including the ones you can't get anywhere else. Studio for WinForms can handle anything, from a grid with a million rows to a chart with unlimited points.
            </wijmo:C1WizardStep>
            <wijmo:C1WizardStep ID="C1WizardStep7" Title="Step7">
                Studio for WPF offers everything from advanced data binding to rich data visualizations	included in grids, schedulers, charts, reports, and more.
            </wijmo:C1WizardStep>
        </Steps>
    </wijmo:C1Wizard>

    <wijmo:C1Pager runat="server" ID="C1Pager1" Mode="NextPreviousFirstLast" OnClientPageIndexChanged="onClientPageIndexChanged" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

    <p>
        This sample demonstrates a C1Wizard that uses C1Pager control as navigation buttons. 
    </p>

    <p>
        We hide the built-in navigation buttons by setting the <b>NavButtons</b> property to "None" firstly.
    </p>

    <p>
        Then we add a C1Pager control directly after the C1Wizard, and bind the index between them by implementing some simple client script code and setting the pager control's <b>OnClientPageIndexChanged</b> property.
    </p>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth">
                    <label class="settinglegend">Show Options:</label>
                </li>
                <li>
                    <input type="radio" value="Default" name="set1" id="setDefault" checked="checked" /><label for="setDefault">Default</label>
                    <input type="radio" value="Text" name="set1" id="setText" /><label for="setText">Text</label>
                </li>
                <li>
                    <input type="radio" value="Custom" name="set1" id="setCustom" /><label for="setCustom">Custom Text</label>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
