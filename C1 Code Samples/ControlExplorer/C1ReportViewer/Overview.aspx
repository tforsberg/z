<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1ReportViewer.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ReportViewer" TagPrefix="C1ReportViewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="width:720px">
    <C1ReportViewer:C1ReportViewer runat="server" ID="C1ReportViewer1" FileName="C1ReportViewer/Rdl/Nice1_StandardGroups.rdl" Zoom="Fit Width" Height="475px" Width="100%">
    </C1ReportViewer:C1ReportViewer>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates the default <strong>C1ReportViewer</strong> control behavior.
    </p>
    <p>
        The <strong>C1ReportViewer</strong> control allows you to easily add reports Web applications. The report viewer is based on the <strong>C1Report</strong> component and uses the same report definition files that you create with the <strong>C1ReportDesigner</strong>.
    </p>
    <p>
        The list of properties used in the sample:
    </p>
    <ul>
        <li><strong>FileName </strong>- a relative path to the file with report. In this sample, we set the value for this property to "C1ReportViewer/Rdl/Nice1_StandardGroups.rdl".</li>
        <li><strong>Zoom</strong> - a page zoom value. Accepts named zoom values like "actual size", "fit page", "fit width", "fit height" or value in percentages, e.g. "50%", "70%". For this sample, we are using "Fit Width".</li>
        <li><strong>Height </strong>- height of the control. For this sample, we are using "475px".</li>
        <li><strong>Width </strong>- width of the control. For this sample, we are using &quot;100%&quot;. Note<strong> </strong>that <strong>C1ReportViewer</strong> allows you to specify Width/Height in percentages.</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
