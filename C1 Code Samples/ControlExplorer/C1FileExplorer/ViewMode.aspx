<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ViewMode.aspx.cs" Inherits="ControlExplorer.C1FileExplorer.ViewMode" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1FileExplorer" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                    <label class="settinglegend">Mode:</label>
                    <asp:DropDownList ID="dplMode" runat="server">
                        <asp:ListItem Text="Default" Value="Default" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="FileTree" Value="FileTree"></asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
                    <label class="settinglegend">ViewMode:</label>
                    <asp:DropDownList ID="dplViewMode" runat="server">
                        <asp:ListItem Text="Detail" Value="Detail" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Thumbnail" Value="Thumbnail"></asp:ListItem>
                    </asp:DropDownList>
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
            This demo demostartes how you can configure the <strong>C1FileExplorer</strong> to show folders/files.
        </p>
        <p>
            <strong>C1FileExplorer</strong> provides following properties to let you configure the UI layout:
        </p>

        <strong>Mode</strong>, possible values are:
        <ul>
            <li>
                <strong>Default</strong> - in this mode the left tree view only list folders, files are shown in the right grid view.
            </li>
            <li>
                <strong>FileTree</strong> - in this mode the control only shows the left tree view, and all folders/files are shown there.
            </li>
        </ul>

        <strong>ViewMode</strong>, this property is valid only if <strong>Mode</strong> is set as <strong>Default</strong>, possible values are:
        <ul>
            <li>
                <strong>Detail</strong> - the folders/files are shown in the right grid with columns including <strong>Name</strong>, <strong>Size</strong>, etc.
            </li>
            <li>
                <strong>Thumbnail</strong> - the folders/files are shown in the right grid with thumbnail.
            </li>
        </ul>
    </div>
</asp:Content>
