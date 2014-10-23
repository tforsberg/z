<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Hyperlinks.aspx.cs" Inherits="ControlExplorer.C1ReportViewer.Hyperlinks" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ReportViewer" TagPrefix="C1ReportViewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="width:720px">
    <C1ReportViewer:C1ReportViewer runat="server" ID="C1ReportViewer1" FileName="Hyperlinks" Zoom="75%" CollapseToolsPanel="True" Height="475px" Width="100%">
    </C1ReportViewer:C1ReportViewer>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The sample demonstrates report hyperlinks</p>
    <p>
        You can add links that allow users to open Web pages or other reports, jump to another location within the same report, change C1ReportViewer appearance, or execute custom JavaScript.
    </p>
    <p>
        The list of properties used in the sample:
    </p>
    <ul>
        <li>FileName - a relative path to the file with report. In this sample, value for this property is set to "Hyperlinks"</li>
        <li>Zoom - a page zoom value. Accepts named zoom values like "actual size", "fit page", "fit width", "fit height" or value in percentages, e.g. "50%", "70%". For this sample we are using "75%".</li>
        <li>CollapseToolsPanel - specifies whether the tools panel will be collapsed. We set this property to "true".</li>
        <li>Height - a height of the control. For this sample we are using "475px".</li>
        <li>Width - a width of the control. For this sample we are using "100%".</li>
    </ul>
    <p>
        In this sample we are generating in-memory document. The following code is used to create hyperlinks.
    </p>
    Navigate last page:
    <pre class="controldescription-code">
	renderText.Hyperlink = new C1Hyperlink(
				new C1LinkTargetPage(PageJumpTypeEnum.Last),
				"Go to the last page of the document");
</pre>
    Go to the middle of document:
    <pre class="controldescription-code">
	rt4.Hyperlink = new C1Hyperlink(doc.Body.Children[doc.Body.Children.Count / 2]);
</pre>
    Open external URL:
    <pre class="controldescription-code">
ri1.Hyperlink = new C1Hyperlink(new C1LinkTargetFile("http://www.google.com"),
		" Go googling... (Use Ctrl+Click in order to open link in a new window");
</pre>
    Open print with preview dialog:
    <pre class="controldescription-code">
	rt6.Hyperlink = new C1Hyperlink(new C1LinkTargetFile("exec:printWithPreview()"));
</pre>
    Execute custom javascript action:
    <pre class="controldescription-code">
	rt5.Hyperlink = new C1Hyperlink(
		new C1LinkTargetFile("javascript:alert('Hello')"));
</pre>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
