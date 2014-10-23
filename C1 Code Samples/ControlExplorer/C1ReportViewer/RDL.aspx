<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master"  CodeBehind="RDL.aspx.cs" Inherits="ControlExplorer.C1ReportViewer.RDL" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ReportViewer" TagPrefix="C1ReportViewer" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="update1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
<div style="width:720px">
        <C1ReportViewer:C1ReportViewer runat="server" ID="C1ReportViewer1" FileName="C1ReportViewer/Rdl/Nice1_StandardGroups.rdl" Zoom="Fit Width" Height="475px" Width="100%">
        </C1ReportViewer:C1ReportViewer>
</div>
         </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        ReportsViewer integrates with other reporting formats including Microsoft SQL Reporting Services. 
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="update2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li class="fullwidth"><label>Select RDL report</label>
                        <asp:DropDownList runat="server" AutoPostBack="true" OnSelectedIndexChanged="cbbRdl_SelectedIndexChanged" ID="cbbRdl">
                            <asp:ListItem Text="StandardGroups.rdl" Selected="true" Value="~/C1ReportViewer/Rdl/Nice1_StandardGroups.rdl" />
                            <asp:ListItem Text="SpanningGroups.rdl" Value="~/C1ReportViewer/Rdl/Nice2_SpanningGroups.rdl" />
                            <asp:ListItem Text="3Reports.rdl" Value="~/C1ReportViewer/Rdl/Nice3_3Reports.rdl" />
                            <asp:ListItem Text="Big.rdl" Value="~/C1ReportViewer/Rdl/Nice4_Big.rdl" />
                        </asp:DropDownList>
                        </li>
                    </ul>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>