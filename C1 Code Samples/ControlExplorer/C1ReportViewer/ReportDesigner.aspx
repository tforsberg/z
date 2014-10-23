<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Wijmo.Master" CodeBehind="ReportDesigner.aspx.cs" Inherits="ControlExplorer.C1ReportViewer.ReportDesigner" %>
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
        Display rich <strong>C1Reports</strong> designed with the Report Designer. This sample shows various uses of the powerful reporting tool. 
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="update2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li class="fullwidth inlinediv">
                            <label>definition file:</label>
                            <asp:DropDownList ID="cbbFile" Width="400" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cbbFile_SelectedIndexChanged">
                                    <asp:ListItem Selected="true" Text="CommonTasks.xml" Value="~/C1ReportViewer/C1ReportXML/CommonTasks.xml" />
                                    <asp:ListItem Text="BarcodeLabels.xml" Value="~/C1ReportViewer/C1ReportXML/BarcodeLabels.xml" />
                                    <asp:ListItem Text="TestSuite.xml" Value="~/C1ReportViewer/C1ReportXML/TestSuite.xml" />
                                    <asp:ListItem Text="MultiColSubreport.xml" Value="~/C1ReportViewer/C1ReportXML/MultiColSubreport.xml" />
                                    <asp:ListItem Text="LongReport.xml" Value="~/C1ReportViewer/C1ReportXML/LongReport.xml" />
                            </asp:DropDownList>
                        </li>
                        <li class="fullwidth inlinediv">
                            <label>report definition:</label>
                            <asp:DropDownList ID="cbbDefinition" AutoPostBack="true" OnSelectedIndexChanged="cbbDefinition_SelectedIndexChanged"  Width="400" runat="server">
                            </asp:DropDownList>
                        </li>
                    </ul>
                </div>
            </div>
            
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>