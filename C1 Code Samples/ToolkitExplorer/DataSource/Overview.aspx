<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Overview.aspx.cs" Inherits="DataSource_Overview" %>

<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1DataSource" tagPrefix="wijmo" %>

<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1List" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <wijmo:C1DataSource ID="DataSource1" runat="server" 
        onclientloaded="datasource_loaded" onclientloading="datasource_loading">
        <Reader>
            <Fields>
                <wijmo:ReaderField Name="label">
                    <Mapping Function="reader_mapping" />
                </wijmo:ReaderField>
                <wijmo:ReaderField Name="value">
                    <Mapping Name="name" />
                </wijmo:ReaderField>
                <wijmo:ReaderField Name="selected">
                    <DefaultValue ValueString="false" />
                </wijmo:ReaderField>
            </Fields>
        </Reader>
        <Proxy>
            <Options>
                <wijmo:ProxyField Name="url">
                    <Value NeedQuotes="True" ValueString="http://ws.geonames.org/searchJSON" />
                </wijmo:ProxyField>
                <wijmo:ProxyField Name="dataType">
                    <Value NeedQuotes="True" ValueString="jsonp" />
                </wijmo:ProxyField>
                <wijmo:ProxyField Name="data">
                    <Value ValueString="ajaxData" />
                </wijmo:ProxyField>
                <wijmo:ProxyField Name="key">
                    <Value NeedQuotes="True" ValueString="geonames" />
                </wijmo:ProxyField>
            </Options>
        </Proxy>
    </wijmo:C1DataSource>
    <wijmo:C1ListExtender runat="server" onclientselected="list_selected" 
        TargetSelector="#list"></wijmo:C1ListExtender>
    <div class="ui-widget">
        <input style="width: 400px" id="testinput" type="text" class="ui-widget-content ui-corner-all" /><input type="button" onclick="loadRemoteData()" id="loadremote" value="Load Remote Data" />
        <div id="list" style="height: 300px; width: 400px;">
        </div>
    </div>
    <script id="scriptInit" type="text/javascript">
        var list = $("#list");
        var input = $('#testinput');
        var ajaxData = {
            featureClass: "P",
            style: "full",
            maxRows: 12,
            name_startsWith: 'ab'
        };
        function reader_mapping(item)
        {
            return item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName
        }
        function list_selected(event, ui)
        {
            var item = ui.item;
            input.val(item.value);
            list.wijlist('deactivate');
        }
        function datasource_loading()
        {
            input.addClass('wijmo-wijcombobox-loading');
        }
        function datasource_loaded(data)
        {
            list.wijlist('setItems', data.items);
            list.wijlist('renderList');
            list.wijlist('refreshSuperPanel');
            input.removeClass('wijmo-wijcombobox-loading');
        }
        $(document).ready(function ()
        {
            // put all your jQuery goodness in here.
            DataSource1.load();
            input.bind("keydown.wijcombobox", function (event)
            {
                var keyCode = $.ui.keyCode;
                switch (event.keyCode)
                {
                    case keyCode.UP:
                        list.wijlist('previous', event);
                        // prevent moving cursor to beginning of text field in some browsers
                        event.preventDefault();
                        break;
                    case keyCode.DOWN:
                        if (!list.is(':visible'))
                        {
                            list.show();
                            return;
                        }
                        list.wijlist('next', event);
                        // prevent moving cursor to end of text field in some browsers
                        event.preventDefault();
                        break;
                    case keyCode.ENTER:
                        event.preventDefault();
                        list.wijlist('select', event);
                        break;
                    case keyCode.PAGE_UP:
                        list.wijlist('previousPage');
                        break;
                    case keyCode.PAGE_DOWN:
                        list.wijlist('nextPage');
                        break;
                    default:
                        break;
                }
            });
        });

        function loadRemoteData()
        {
            var datasource = DataSource1;
            datasource.proxy.options.data.name_startsWith = $('#testinput').val();
            datasource.load();
        }
    </script>
</asp:Content>

