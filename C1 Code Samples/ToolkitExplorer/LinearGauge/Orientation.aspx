<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Orientation.aspx.cs" Inherits="ToolkitExplorer.LinearGauge.Orientation" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gauge"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Orientation</h2>
    <asp:Panel ID="linearGauge" runat="server" Width="310" Height="70" CssClass="ui-widget ui-widget-content ui-corner-all">
    </asp:Panel>
    <wijmo:C1LinearGaugeExtender runat="server" ID="LinearGaugeExtender1" TargetControlID="linearGauge" Value="50">
        <TickMajor Position="Inside" Factor="3">
        </TickMajor>
        <TickMinor Visible="true">
        </TickMinor>
    </wijmo:C1LinearGaugeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <p>
        <select id="orientation">
            <option>horizontal</option>
            <option>vertical</option>
        </select>
    </p>
    <script type="text/javascript">
        $(document).ready(function () {
        	var gaugeEle = $("#<%= linearGauge.ClientID %>"),
				width = gaugeEle.width(),
				height = gaugeEle.height();

            $("#orientation").change(function () {
                var orientation = $(this).val();
                gaugeEle.wijlineargauge("option", "orientation", orientation);
			if (orientation === "vertical") {
				gaugeEle.width(height);
				gaugeEle.height(width);
				//gaugeEle.c1lineargauge("option", "orientation", orientation);
			}
			else {
				gaugeEle.width(width);
				gaugeEle.height(height);
			}
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This demo shows we can use <b>Orientation</b> property to control the gauge showing as horizontal and vertical lineargauge</p>
	<p>The orientation property can set to Horizontal and Vertical.</p>
</asp:Content>
