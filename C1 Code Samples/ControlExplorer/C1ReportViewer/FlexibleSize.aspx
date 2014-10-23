<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="FlexibleSize.aspx.cs" Inherits="ControlExplorer.C1ReportViewer.FlexibleSize" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ReportViewer" TagPrefix="C1ReportViewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="parentContainerSample" style="width: 720px; height: 475px;">
        <C1ReportViewer:C1ReportViewer runat="server" ID="C1ReportViewer1" FileName="C1ReportViewer/C1ReportXML/BarcodeLabels.xml" ReportName="Product Labels (EAN-13, Label 5096)" Zoom="Fit width" Height="100%" Width="100%" CollapseToolsPanel="True">
        </C1ReportViewer:C1ReportViewer>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1ReportViewer</strong> control allows you to specify Width/Height properties in percentages for flexible sizing.</p>
    <p>
        The list of properties used in the sample:
    </p>
    <ul>
        <li><strong>FileName</strong> - a relative path to the file with report. In this sample, the value for this property is set to "C1ReportViewer/C1ReportXML/BarcodeLabels.xml"</li>
        <li><strong>ReportName </strong>- a name of the report to view. For this sample, we are using "Product Labels (EAN-13, Label 5096)".</li>
        <li><strong>Zoom </strong>- a page zoom value. Accepts named zoom values like "actual size", "fit page", "fit width", "fit height" or value in percentages, e.g. "50%", "70%". For this sample, we are using "Fit width".</li>
        <li><strong>CollapseToolsPanel </strong>- specifies whether the tools panel will be collapsed. For this sample, we are setting this property to True.</li>
        <li><strong>Height </strong>- a height of the control. For this sample, we are using "100%".</li>
        <li><strong>Width </strong>- a width of the control. For this sample, we are using "100%".</li>
    </ul>
    <p>
        In this sample we are changing a parent container size from the client script. The <strong>C1ReportViewer</strong> layout is adjusted according a parent container size changes.
    </p>
    <script type="text/javascript">
        function changeParentSize(w, h) {
            $("#parentContainerSample").width(w).height(h);
            $("#<%=C1ReportViewer1.ClientID%>").c1reportviewer("refresh");
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth"><h3>Change parent container size:</h3></li>
                <li><a href="javascript:changeParentSize(320, 240);">Change parent size to 320x240px</a>
                </li>
                <li><a href="javascript:changeParentSize(600, 400);">Change parent size to 600x400px</a>
                </li>
                <li><a href="javascript:changeParentSize('100%', '475');">Change parent size to 100% x 475px</a>
                </li>
            </ul>
        </div>
    </div>
    
    </asp:Content>
