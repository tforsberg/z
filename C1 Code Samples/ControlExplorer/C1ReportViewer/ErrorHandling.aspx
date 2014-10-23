<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ErrorHandling.aspx.cs" Inherits="ControlExplorer.C1ReportViewer.ErrorHandling" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ReportViewer" TagPrefix="C1ReportViewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="width:720px">
    <C1ReportViewer:C1ReportViewer runat="server" ID="C1ReportViewer1" FileName="C1ReportViewer/C1ReportXML/BarcodeLabels.xml" ReportName="Wrong report name" EnableLogs="true" CollapseToolsPanel="True" Height="475px" Width="100%">
    </C1ReportViewer:C1ReportViewer>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1ReportViewer</strong> control allows you to display built-in log console for debugging purposes.</p>
    <p>
        The list of properties used in the sample:
    </p>
    <ul>
        <li><strong>FileName </strong>- a relative path to the file with report. In this sample, the value for this property is set to "C1ReportViewer/C1ReportXML/BarcodeLabels.xml"</li>
        <li><strong>ReportName</strong> - a name of the report to view. For this sample, we are using "Wrong report name".</li>
        <li><strong>EnableLogs </strong>- enables built-in log console. For this sample, we set this property to True in order to display log console.</li>
        <li><strong>CollapseToolsPanel </strong>- specifies whether the tools panel will be collapsed. For this sample, we set this property to True.</li>
        <li><strong>Height </strong>- a height of the control. For this sample, we are using "475px".</li>
        <li><strong>Width </strong>- a width of the control. For this sample, we are using "100%". Note, C1ReportViewer allows you to specify Width/Height in percentages.</li>
    </ul>
    <p>
        Note that the report name "Wrong report name" does not exist in the report specified by <strong>FileName</strong> property and appropriate error message is shown inside the log console.</p>
    <p>
        The log console can contain any other information messages like document generation status, a current report viewer action, and et cetera , all of which you can use for debug purposes</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
