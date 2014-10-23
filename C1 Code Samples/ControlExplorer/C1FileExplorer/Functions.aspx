<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Functions.aspx.cs" Inherits="ControlExplorer.C1FileExplorer.Functions" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1FileExplorer" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .settingcontent li{
            white-space: nowrap;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <cc1:C1FileExplorer ID="C1FileExplorer1" runat="server" InitPath="~/C1FileExplorer/Example" >
    </cc1:C1FileExplorer>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <asp:CheckBox ID="ckxEnableCopy" Text="Enable Copy" runat="server" Checked="true" />
                </li>
                <li>
                    <asp:CheckBox ID="ckxEnableOpenFile" Text="Enable Open File" runat="server" Checked="true" />
                </li>
                <li>
                    <asp:CheckBox ID="ckxAllowFileExtensionRename" Text="Allow Change File Extension" runat="server" Checked="false" />
                </li>
                <li>
                    <asp:CheckBox ID="ckxEnableCreateFolder" Text="Enable Create New Folder" runat="server" Checked="true" />
                </li>
                <li>
                    <label>TreePanelWidth:</label>
                    <wijmo:C1InputNumeric ID="inputTreeWidth" DecimalPlaces="0" Value="200" runat="server"></wijmo:C1InputNumeric>
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
        The <strong>C1FileExplorer</strong> provides many powerful functionalities such as creating new folder, delete,  
        rename or copy a folder, you can peform these actions through the tool bar or contxt menu, 
        you can also do this by keyboard and shortcut keys.
    </p>
    <p>
        This demo shows you can enable/disable the <strong>C1FileExplorer</strong> to do Copy, create new items, or open a file by double click, etc.
    </p>
</asp:Content>
