<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="VisibleControls.aspx.cs" Inherits="ControlExplorer.C1FileExplorer.VisibleControls" %>
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
                    <asp:CheckBox ID="ckxShowToolbar" Text="Show Toolbar" runat="server" Checked="true" />
                </li>
                <li>
                    <asp:CheckBox ID="ckxShowAddressBox" Text="Show Address Box" runat="server" Checked="true" />
                </li>
                <li>
                    <asp:CheckBox ID="ckxShowFilterTextBox" Text="Show FilterTextBox" runat="server" Checked="true" />
                </li>
                <li>
                    <asp:CheckBox ID="ckxShowTreeView" Text="Show Tree View" runat="server" Checked="true" />
                </li>
                <li>
                    <asp:CheckBox ID="ckxShowGrid" Text="Show Grid" runat="server"  Checked="true" />
                </li>
                <li>
                    <asp:CheckBox ID="ckxShowListView" Text="Show List View" runat="server" Checked="true" />
                </li>
                <li>
                    <asp:CheckBox ID="ckxShowContextMenu" Text="Show Context Menu" runat="server" Checked="true" />
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
        <strong>C1FileExplorer</strong> provides a convenient way to customize the controls layout. 
    </p>
    <p>
        This demo demostarte that you can configure the <strong>C1FileExplorer</strong> to show/hide sepcific child controls.
    </p>
</asp:Content>
