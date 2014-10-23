<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1Tabs_AddRemove" CodeBehind="AddRemove.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Tabs" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Dialog"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <style type="text/css">
        #tabs
        {
            margin-top: 1em;
        }

        #tabs li .ui-icon-close
        {
            float: left;
            margin: 0.4em 0.2em 0 0;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1Tabs ID="C1Tab1" runat="server">
        <Pages>
            <wijmo:C1TabPage ID="Page1" Text="Nunc tincidunt">
                <p>
                    Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec
                        arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante.
                        Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper
                        leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales
                        tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel
                        pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum.
                        Nunc tristique tempus lectus.
                </p>
            </wijmo:C1TabPage>
        </Pages>
    </wijmo:C1Tabs>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>
        This sample illustrates how to dynamically add tabs using the addTab function. In
        addition, the sample includes a function that will allow each tab to close by clicking
        on an 'x' on the tabs.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <input type="button" value="Add Tab" id="add_tab" onclick="$('#<%=dialog.ClientID%>').c1dialog('open')" />
                </li>
            </ul>
        </div>
    </div>
    <cc1:C1Dialog ID="dialog" runat="server" Height="270px" Title="Add tab" ShowOnLoad="False">
        <CaptionButtons>
            <Pin IconClassOn="ui-icon-pin-w" IconClassOff="ui-icon-pin-s"></Pin>

            <Refresh IconClassOn="ui-icon-refresh"></Refresh>

            <Minimize IconClassOn="ui-icon-minus"></Minimize>

            <Maximize IconClassOn="ui-icon-extlink"></Maximize>

            <Close IconClassOn="ui-icon-close"></Close>
        </CaptionButtons>
        <Buttons>
            <cc1:DialogButton Text="Add" OnClientClick="addClick" />
            <cc1:DialogButton Text="Cancel" OnClientClick="cancelClick" />
        </Buttons>
        <Content>
            <label for="tab_title">
                Title</label><br />
            <input type="text" name="tab_title" id="tab_title" style="width: 100%" class="ui-widget-content ui-corner-all" /><br />
            <label for="tab_content">
                Content</label><br />
            <textarea name="tab_content" id="tab_content" style="width: 100%" class="ui-widget-content ui-corner-all"
                cols="" rows=""></textarea><br />
        </Content>
    </cc1:C1Dialog>
    <script id="scriptInit" type="text/javascript">
        $('#<%=C1Tab1.ClientID%>').find("ul li").append('<span class="ui-icon ui-icon-close">Remove Tab</span>');
        var $tab_title_input = $('#tab_title'),
            $tab_content_input = $('#tab_content'),
            tab_counter = 2;

        var $tabs = $('#<%=C1Tab1.ClientID%>').c1tabs({
                tabTemplate: '<li><a href="#{href}">#{label}</a> <span class="ui-icon ui-icon-close">Remove Tab</span></li>',
                add: function (event, ui) {
                    var tab_content = $tab_content_input.val() || 'Tab ' + tab_counter + ' content.';
                    $(ui.panel).append('<p>' + tab_content + '</p>');
                }
            });

            $('#<%=C1Tab1.ClientID%>').on('click', 'span.ui-icon-close', function () {
            var index = $('li', $tabs).index($(this).parent());
            $tabs.c1tabs('remove', index);
        });

        function addClick() {
            var tab_title = $tab_title_input.val() || 'Tab ' + tab_counter;
            $tabs.c1tabs('add', '#tabs-' + tab_counter, tab_title);
            tab_counter++;

            $tab_title_input.val("");
            $tab_content_input.val("");

            $(this).c1dialog("close");
        }

        function cancelClick() {
            $(this).c1dialog("close");
        }
    </script>
</asp:Content>
