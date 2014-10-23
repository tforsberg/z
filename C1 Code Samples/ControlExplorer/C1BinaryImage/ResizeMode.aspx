<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="ResizeMode.aspx.cs" Inherits="ControlExplorer.C1BinaryImage.ResizeMode" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1BinaryImage"
    TagPrefix="wijmo" %>
<asp:Content ContentPlaceHolderID="Head" ID="Content1" runat="server">
    <style type="text/css">
        .settingcontainer .settingcontent .secondLable
        {
            text-align:right;
            padding-right:5px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" ID="Content2" runat="server">

    <div style="float: left; margin: 10px;">
        <h3>Source image(300x225):</h3>
        <wijmo:C1BinaryImage ID="BinaryImage1" runat="server" ImageUrl="images/ResizeModeSample.jpg" /><br /><br />
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="float: left; margin: 10px;">
                <h3>Resized image:</h3>
                <wijmo:C1BinaryImage ID="BinaryImage2" runat="server"/>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
    <p>
        The <strong>C1BinaryImage</strong> control support resizing(Crop/Fill/Fit) action.
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li class="fullwidth">
                            <label class="settinglegend">Resize Mode:</label>
                        </li>
                        <li>
                            <label>Width: </label>
                            <asp:TextBox ID="TextBox_Width" runat="server" AutoPostBack="True" CausesValidation="True"
                                CssClass="valueField" ValidationGroup="SizeValidation"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox_Width" ValidationGroup="SizeValidation"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_Width"
                                ErrorMessage="*" ValidationExpression="^[1-9]\d*$" ValidationGroup="SizeValidation"></asp:RegularExpressionValidator>
                        </li>
                        <li>
                            <label class="secondLable">Height:</label>
                                <asp:TextBox ID="TextBox_Height" runat="server" AutoPostBack="True" CssClass="valueField"
                                    CausesValidation="True" ValidationGroup="SizeValidation"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox_Height" ValidationGroup="SizeValidation"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox_Height"
                                    ErrorMessage="*" ValidationExpression="^[1-9]\d*$" ValidationGroup="SizeValidation"></asp:RegularExpressionValidator>
                        </li>

                        <li>
                            <label>ResizeMode: </label>
                            <asp:DropDownList ID="DropDownList_ResizeMode" runat="server" AutoPostBack="True"
                                ValidationGroup="SizeValidation" CssClass="valueField" CausesValidation="True">
                                <asp:ListItem Selected="True">None</asp:ListItem>
                                <asp:ListItem>Fit</asp:ListItem>
                                <asp:ListItem>Crop</asp:ListItem>
                                <asp:ListItem>Fill</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <div runat="server" id="Div_CropPosition">
                        <li>
                            <label class="secondLable">CropPosition: </label>
                            <asp:DropDownList ID="DropDownList_CropPosition" runat="server" AutoPostBack="True"
                                ValidationGroup="SizeValidation" CssClass="valueField" CausesValidation="True">
                                <asp:ListItem>Top</asp:ListItem>
                                <asp:ListItem Selected="True">Center</asp:ListItem>
                                <asp:ListItem>Bottom</asp:ListItem>
                                <asp:ListItem>Left</asp:ListItem>
                                <asp:ListItem>Right</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        </div>
                    </ul>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
