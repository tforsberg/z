<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="ControlExplorer.C1ToolTip.Template" %>

<%@ Register Namespace="C1.Web.Wijmo.Controls.C1ToolTip" Assembly="C1.Web.Wijmo.Controls.3" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager2">
    </asp:ScriptManager>
    <div id="targetContainer">
        <asp:TextBox Height="120" runat="server" ID="textBox1" ToolTip="Textbox1"></asp:TextBox>
        <asp:TextBox Height="120" runat="server" ID="textBox2" ToolTip="Textbox2"></asp:TextBox>
        <input type="text" style="height: 120px;" />
        <input type="text" style="height: 120px;" />
    </div>
    <wijmo:C1ToolTip runat="server" ID="Tooltip1" TargetSelector="#targetContainer :input" CloseBehavior="Sticky" EnableCallBackMode="true" OnOnAjaxUpdate="Tooltip1_OnAjaxUpdate">
        <Template>
            <asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl="~/C1ToolTip/AjaxCallback.aspx" Target="_blank">AjaxCallBack</asp:HyperLink>
        </Template>
    </wijmo:C1ToolTip>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample shows how to set tooltip's content by using a template. The Template property can contain any HTML Markup or Controls.</p>
    <p>
        The following properties are used in this sample:
    </p>
    <ul>
        <li>Template</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
