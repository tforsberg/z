<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1Upload.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Upload" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Editor" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .panel
        {
            padding: 3px;
            margin: 10px;
            background-color: #FFFFFF;
        }

        .address
        {
            height: 24px;
            width: 650px;
        }

        .addresspanel
        {
            padding:1px;
        }

        .sendpanel
        {
            float:left; 
            padding:2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel" style=" width: 759px; background-color: #CCCCCC;">
        <div class="panel" style="background-color: #A0A0A0">
            <ul style="list-style: none;">
                <li class="sendpanel">
                    <span><input id="Button1" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" style="width:65px; height:55px;" type="button" value="Send" /></span>
                </li>
                <li class="sendpanel">
                    <div class="addresspanel">
                        <input id="Text1" type="text" class="address" value="john@johnsmith.com"/>
                    </div>
                    <div class="addresspanel">
                        <input id="Text2" type="text" class="address" value="New Website Designs"/>
                    </div>
                </li>
            </ul>
            <div style="clear:both;"></div>
        </div>
        <div class="panel">
            <wijmo:C1Upload ID="c1Upload1" runat="server" Width="300px" ShowUploadedFiles="true" />
        </div>
        <div class="panel">
            <wijmo:C1Editor runat="server" ID="Editor1" Width="100%" Height="300px" Text="Hi John, <br /><br />Please find the new agency design proposals attached.<br /> Let me know what you think.<br /><br /> Thanks!<br />Best, Serena <br />" Mode="Simple"></wijmo:C1Editor>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1Upload</strong> allows you to upload file handling with comprehensive information about the upload progress. Its highly efficient proprietary HttpModule allocates minimum server memory and enables optimized configurable single and multiple file uploads.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
