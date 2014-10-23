<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="KeyboardSupports.aspx.cs" Inherits="ControlExplorer.C1FileExplorer.KeyboardSupports" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1FileExplorer" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .settingcontainer .settingcontent li label {
            width: 120px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <cc1:C1FileExplorer ID="C1FileExplorer1" runat="server" InitPath="~/C1FileExplorer/Example" VisibleControls="All" AllowPaging="true" PageSize="2" SearchPatterns="*.jpg,*.png,*.jpeg,*.gif">
    </cc1:C1FileExplorer>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <label>FocusFileExplorer</label>
                    <wijmo:C1InputText ID="inputFocusFileExplorer" runat="server" Text="{Ctrl}+{F2}" Width="70px"></wijmo:C1InputText>
                </li>
                <li>
                    <label>FocusToolbar</label>
                    <wijmo:C1InputText ID="inputFocusToolbar" runat="server" Text="{Shift}+{1}" Width="70px"></wijmo:C1InputText>
                </li>
                <li>
                    <label>FocusAddressBar</label>
                    <wijmo:C1InputText ID="inputFocusAddressBar" runat="server" Text="{Shift}+{2}" Width="70px"></wijmo:C1InputText>
                </li>
                <li>
                    <label>FocusTreeView</label>
                    <wijmo:C1InputText ID="inputFocusTreeView" runat="server" Text="{Shift}+{3}" Width="70px"></wijmo:C1InputText>
                </li>
                <li>
                    <label>FocusGrid</label>
                    <wijmo:C1InputText ID="inputFocusGrid" runat="server" Text="{Shift}+{4}" Width="70px"></wijmo:C1InputText>
                </li>
                <li>
                    <label>FocusPagingSlider</label>
                    <wijmo:C1InputText ID="inputFocusPaging" runat="server" Text="{Shift}+{5}" Width="70px"></wijmo:C1InputText>
                </li>
                <li>
                    <label>ContextMenu</label>
                    <wijmo:C1InputText ID="inputOpenContextMenu" runat="server" Text="{Shift}+{M}" Width="70px"></wijmo:C1InputText>
                </li>
                <li>
                    <label>Back</label>
                    <wijmo:C1InputText ID="inputBack" runat="server" Text="{Ctrl}+{K}" Width="70px"></wijmo:C1InputText>
                </li>
                <li>
                    <label>Forward</label>
                    <wijmo:C1InputText ID="inputForward" runat="server" Text="{Ctrl}+{L}" Width="70px"></wijmo:C1InputText>
                </li>
                <li>
                    <label>Open</label>
                    <wijmo:C1InputText ID="inputOpen" runat="server" Text="{Enter}" Width="70px"></wijmo:C1InputText>
                </li>
                <li>
                    <label>Refresh</label>
                    <wijmo:C1InputText ID="inputRefresh" runat="server" Text="{Ctrl}+{F3}" Width="70px"></wijmo:C1InputText>
                </li>
                <li>
                    <label>NewFolder</label>
                    <wijmo:C1InputText ID="inputNewFolder" runat="server" Text="{Ctrl}+{N}" Width="70px"></wijmo:C1InputText>
                </li>
                <li>
                    <label>Delete</label>
                    <wijmo:C1InputText ID="inputDelete" runat="server" Text="{Delete}" Width="70px"></wijmo:C1InputText>
                </li>
            </ul>
            <div class="settingcontrol">
                <asp:Button ID="btnApply" Text="Apply" CssClass="settingapply" runat="server" OnClick="btnApply_Click" />
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <div>
        <p>
            <strong>C1FileExplorer</strong> supports almost all actions by keyboard, such as navigation, create new folder, open a file, delete a folder, etc.
        </p>
        <p>
            In this demo, it shows the supported keyboard actions and the default shortcut keys. You can change the shortcut keys if necessary.
        </p>
        <p>
            Please note you have to focus a control before performing any actions on it.
            For example, if you want to create a new folder, you should first press <strong>{Shift}+{3}</strong> to focus on the tree view, then press <strong>{Ctrl}+{N}</strong> to create a new folder.
        </p>
    </div>
</asp:Content>
