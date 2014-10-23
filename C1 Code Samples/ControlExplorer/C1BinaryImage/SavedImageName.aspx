<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="SavedImageName.aspx.cs" Inherits="ControlExplorer.C1BinaryImage.SavedImageName" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1BinaryImage"
    TagPrefix="wijmo" %>
<asp:Content ContentPlaceHolderID="Head" ID="Content1" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" ID="Content2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="float: left; margin: 10px;">
                <wijmo:C1BinaryImage ID="BinaryImage1" SavedImageName="Sample" runat="server"/>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
    <p>
        Right click the image and click "Save Picture as ...", it shows a save dialog, customers can specify the default file name.
    </p>
    <p>
        Use the <strong>SavedImageName</strong> property to change the default file name.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li class="fullwidth">
                            <label class="settinglegend">SavedImageName:</label>
                        </li>
                        <li>
                            <asp:TextBox ID="TextBox_SavedImageName" runat="server" AutoPostBack="True" CausesValidation="True"
                                CssClass="valueField" Text="Sample"></asp:TextBox>
                        </li>
                    </ul>
                </div>
                <div class="settingcontrol">
                    <asp:Button ID="apply" runat="server" Text="Apply" CssClass="settingapply" OnClick="apply_Click" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
