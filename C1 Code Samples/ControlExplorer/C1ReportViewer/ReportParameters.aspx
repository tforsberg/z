<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ReportParameters.aspx.cs" Inherits="ControlExplorer.C1ReportViewer.ReportParameters" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ReportViewer" TagPrefix="C1ReportViewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="width:720px">
    <C1ReportViewer:C1ReportViewer runat="server" ID="C1ReportViewer1" FileName="~/C1ReportViewer/RDL/ReportParameters01.rdl" Zoom="75%" Height="475px" Width="100%">
    </C1ReportViewer:C1ReportViewer>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1ReportViewer</strong> supports parameters for <strong>C1Report</strong> and <strong>C1RdlReport</strong> reports. A Parameters pane will be shown above the control when a report requires input parameters. The Parameters pane can be collapsed or expanded during report viewing. Parameters must be filled in by the user before report generation starts.</p>
    <p>
        The list of properties used in the sample:
    </p>
    <ul>
        <li><strong>FileName </strong>- a relative path to the file with report. In this sample, value for this property is set to "~/C1ReportViewer/RDL/ReportParameters01.rdl".</li>
        <li><strong>Zoom</strong> - a page zoom value. Accepts named zoom values like "actual size", "fit page", "fit width", "fit height", or value in percentages, e.g. "50%", "70%". For this sample, we are using "75%".</li>
        <li><strong>Height </strong>- a height of the control. For this sample, we are using "475px".</li>
        <li><strong>Width </strong>- a width of the control. For this sample, we are using "100%".</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
