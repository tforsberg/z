<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ToolbarCustomization.aspx.cs" Inherits="ControlExplorer.C1ReportViewer.ToolBarCustomization" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ReportViewer" TagPrefix="C1ReportViewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="width:720px">
    <C1ReportViewer:C1ReportViewer runat="server" ID="C1ReportViewer1" FileName="~/C1ReportViewer/C1ReportXML/BarcodeLabels.xml" ReportName="Product Labels (EAN-13, Label 5096)" Zoom="75%" CollapseToolsPanel="True" Height="475px" Width="100%">
    </C1ReportViewer:C1ReportViewer>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1ReportViewer</strong> toolbar panel can be customized from server-side or client-side code. In this sample, the toolbar is customized from code-behind - we remove the first "print" button and all buttons located after the "next page" button.</p>
    <p>
        The list of properties used in the sample:
    </p>
    <ul>
        <li><strong>FileName</strong> - a relative path to the file with report. In this sample, we set the value of this property&nbsp; to "~/C1ReportViewer/C1ReportXML/BarcodeLabels.xml"</li>
        <li><strong>ReportName </strong>- a name of the report to view. For this sample, we are using "Product Labels (EAN-13, Label 5096".</li>
        <li><strong>Zoom </strong>- a page zoom value. Accepts named zoom values like "actual size", "fit page", "fit width", "fit height" or value in percentages, e.g. "50%", "70%". For this sample, we are using "75%".</li>
        <li><strong>CollapseToolsPanel </strong>- specifies whether the tools panel will be collapsed. For this sample, we set this property to "true".</li>
        <li><strong>Height</strong> - a height of the control. For this sample, we are using "475px".</li>
        <li><strong>Width </strong>- a width of the control. For this sample, we are using "100%".</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
