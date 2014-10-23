<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="PathSettings.aspx.cs" Inherits="ControlExplorer.C1FileExplorer.PathSettings" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1FileExplorer" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .settingcontainer .settingcontent .fullwidth label {
            width: 100px;
        }
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <cc1:C1FileExplorer ID="C1FileExplorer1" runat="server" ViewPaths="~/C1FileExplorer" InitPath="~/C1FileExplorer" SearchPatterns="*.jpg,*.png,*.jpeg,*.gif">
    </cc1:C1FileExplorer>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth">
                    <label >ViewPaths:</label>
                    <wijmo:C1InputText ID="inputViewPaths" runat="server" Text="~/C1FileExplorer/Example" Width="350px"></wijmo:C1InputText>
                </li>
                <li class="fullwidth">
                    <label>InitPath:</label>
                    <wijmo:C1InputText ID="inputInitPath" runat="server" Text="~/C1FileExplorer/Example" Width="350px"></wijmo:C1InputText>
                </li>
                <li class="fullwidth">
                    <label>DeletePaths:</label>
                    <wijmo:C1InputText ID="inputDeletePaths" runat="server" Text="~/C1FileExplorer/Example" Width="350px"></wijmo:C1InputText>
                </li>
                <li class="fullwidth">
                    <label>SearchPatterns:</label>
                    <wijmo:C1InputText ID="inputSearchPatterns" runat="server" Text="*.jpg,*.png,*.jpeg,*.gif" Width="350px"></wijmo:C1InputText>
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
        In this demo, you can configure the file explorer to show which folders, and show what kind of files by following properties:
    </p>
    <ul>
        <li>
            <strong>ViewPaths: </strong>set target folders which will be shown by the file explorer.
        </li>
        <li>
            <strong>InitPath: </strong>set the inital path which sub folder/files will be list out in the right grid. If not set, the control will use the first path in <strong>ViewPaths.</strong>
        </li>
        <li>
            <strong>DeletePaths: </strong>set the paths that can be deleted by user. Please note that if the path is not in <strong>ViewPaths</strong>, it can't be deleted as well.
        </li>
        <li>
            <strong>SearchPatterns: </strong>filter what kind of files to show.
        </li>
    </ul>

</asp:Content>
