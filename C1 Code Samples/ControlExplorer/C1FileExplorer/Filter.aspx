<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Filter.aspx.cs" Inherits="ControlExplorer.C1FileExplorer.Filter" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1FileExplorer" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .settingcontent li{
            white-space: nowrap;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <cc1:C1FileExplorer ID="C1FileExplorer1" runat="server" InitPath="~/C1FileExplorer/Example" SearchPatterns="*.jpg,*.png,*.jpeg,*.gif">
    </cc1:C1FileExplorer>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <asp:CheckBox ID="ckxEnableFilterOnEnterPressed" Text="Enable Filter on Enter Pressed" runat="server" />
                </li>
            </ul>
            <div class="settingcontrol">
                <asp:Button ID="btnApply" Text="Apply" CssClass="settingapply" runat="server" OnClick="btnApply_Click" />
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1FileExplorer</strong> supports filtering folders/files in the grid. 
    </p>
    <p>
        By default the items are filtered on every key stroke. If you want to do filter when the whole filter keyword was entered, please set <strong>EnableFilteringOnEnterPressed</strong> as true.
    </p>
</asp:Content>
