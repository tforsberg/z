<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Direction.aspx.cs" Inherits="ControlExplorer.Progressbar.Direction" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1ProgressBar"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1ProgressBarExtender runat="server" ID="ProgressBarExtender1" Value="50" TargetControlID="hProBar">
        <AnimationOptions Duration="1000"></AnimationOptions>
    </wijmo:C1ProgressBarExtender>
    <div>
        <asp:Panel ID="hProBar" runat="server">
        </asp:Panel>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>The sample demonstrates how to change the label alignment and progress value and direction dynamically.</p><br/>
	<p>The following client side properties are used in this sample.</p>
	<ul>
		<li>value for changing the progress value.</li>
		<li>fillDirection for changing the progress direction.</li>
		<li>labelAlign for changing the label alignment.</li>
	</ul>
	<p>Only the value between maxValue and MinValue can be set to the value property.
		If the labelAlign is set to running, then the label will run along with the progress.
		If the fillDirection is set to east/west, then the progress bar is shown as a horizontal one, otherwise, a vertical one is shown.
		For horizontal progressbar, east option indicates the progress increasing from west to east, west option indicates the opposite direction.
        for vertical progressbar, north option indicates the progress increasing from south to north, south option indicates the opposite direction.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
        <ul>
            <li>
                <label>
                    Value</label>
                <input type="text" id="value" value="50" />
            </li>
            <li>
                <label>
                    Label Align</label>
                <select id="labelAlign">
                    <option value="east">east</option>
                    <option value="west">west</option>
                    <option value="center" selected="selected">center</option>
                    <option value="north">north</option>
                    <option value="south">south</option>
                    <option value="running">running</option>
                </select>(if select running,please change the value) </li>
            <li>
                <label>
                    Fill Direction</label>
                <select id="fillDirection">
                    <option value="east">east</option>
                    <option value="west">west</option>
                    <option value="south">south</option>
                    <option value="north">north</option>
                </select>
            </li>
        </ul>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#value").blur(function () {
                if ($(this).val() == "") return;
                var value = parseInt($(this).val());
                $("#<%=hProBar.ClientID %>").wijprogressbar("option", "value", value);
            });
            $("#labelAlign").change(function () {
                $("#<%=hProBar.ClientID %>").wijprogressbar("option", "labelAlign", $(this).val());
            });
            $("#fillDirection").change(function () {
                $("#<%=hProBar.ClientID %>").wijprogressbar("option", "fillDirection", $(this).val());
            });
        });
				
    </script>
</asp:Content>
