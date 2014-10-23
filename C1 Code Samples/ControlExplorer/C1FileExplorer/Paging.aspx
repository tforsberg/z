<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Paging.aspx.cs" Inherits="ControlExplorer.C1FileExplorer.Paging" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1FileExplorer" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <cc1:C1FileExplorer ID="C1FileExplorer1" AllowPaging="true" PageSize="2" runat="server" InitPath="~/C1FileExplorer/Example" SearchPatterns="*.jpg,*.png,*.jpeg,*.gif">
    </cc1:C1FileExplorer>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <asp:CheckBox ID="ckxAllowPaging" Text="AllowPaging" runat="server" Checked="true" />
                </li>
                <li>
                    <label>Page Size:</label>
                    <wijmo:C1InputNumeric ID="inputPageSize" Value="2" runat="server" Width="60px" MinValue="0" MaxValue="50" ShowSpinner="true" DecimalPlaces="0"></wijmo:C1InputNumeric>
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
    <strong>C1FileExplorer</strong> supports <strong>Paging</strong> if there are too mnay items in the right grid view.
        Please note you should firstly set <strong>AllowPaging</strong> as true to enable paging.
    </p>
    <p>
       <strong>C1FileExplorer</strong> also provides a property <strong>PageSize</strong> to let user set the page size.
    </p>
</asp:Content>
