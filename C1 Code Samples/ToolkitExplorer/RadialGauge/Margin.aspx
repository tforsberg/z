<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Margin.aspx.cs" Inherits="ToolkitExplorer.RadialGauge.Margin" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gauge"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="radialGauge" Height="400" Width="756" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all">
    </asp:Panel>
    <wijmo:C1RadialGaugeExtender runat="server" ID="RadialGaugeExtender1" TargetControlID="radialGauge" Value="100" Max="150" StartAngle="-45" SweepAngle="270" Height="400" Width="400" >
	<Cap>
        <PointerCapStyle Stroke="#7F9CAD">
			<Fill Color="#7F9CAD">
			</Fill>        
        </PointerCapStyle>
	</Cap>
<TickMajor Factor="2" Visible="True" Interval="10" Offset="0" Position="Inside" >
    <TickStyle Stroke="#556A7C">
		<Fill Color="#556A7C">
		</Fill>    
    </TickStyle>
</TickMajor>
<TickMinor Visible="True" Interval="2" Offset="0" Position="Inside">
    <TickStyle Stroke="#556A7C">
		<Fill Color="#556A7C">
		</Fill>    
    </TickStyle>
	</TickMinor>

<Pointer Length="1" Width="4" Offset="0.15">
    <PointerStyle Stroke="#BF551C">
		<Fill Color="#BF551C">
		</Fill>   
    </PointerStyle>
	</Pointer>
	<Labels Offset="-10">
        <LabelStyle Stroke="#556A7C">			
			<Fill Color="#556A7C">
			</Fill>
		</LabelStyle>
	</Labels>

<Animation Duration="2000" Easing="EaseOutBack"></Animation>
	<Face>
        <FaceStyle Stroke="#E0E8EF">
			<Fill Color="#E0E8EF">
			</Fill>        
        </FaceStyle>
	</Face>
    </wijmo:C1RadialGaugeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>User can use <b>MarginLeft</b>, <b>MarginTop</b>, <b>MarginRight</b> and <b>MarginBottom</b> property to set the gauge's margin.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
 <div>
        <p>
            <label>
                MarginLeft:</label>
            <input type="text" id="txLeft" value="0" />
        </p>
        <p>
            <label>
                MarginRight:</label>
            <input type="text" id="txRight" value="0" />
        </p>
        <p>
            <label>
                MarginTop:</label>
            <input type="text" id="txTop" value="0" />
        </p>
        <p>
            <label>
                MarginBottom:</label>
            <input type="text" id="txBottom" value="0" />
        </p>
        <p>
            <input type="button" id="btnExec" value="Apply" />
        </p>
    </div>
    <script type="text/javascript">
    	$(document).ready(function () {
    		$("#btnExec").click(function () {
    			$("#<%=radialGauge.ClientID %>").wijradialgauge("option", "marginLeft", parseInt($("#txLeft").val()));
    			$("#<%=radialGauge.ClientID %>").wijradialgauge("option", "marginRight", parseInt($("#txRight").val()));
    			$("#<%=radialGauge.ClientID %>").wijradialgauge("option", "marginTop", parseInt($("#txTop").val()));
    			$("#<%=radialGauge.ClientID %>").wijradialgauge("option", "marginBottom", parseInt($("#txBottom").val()));
    		})
    	});
	
    </script>
</asp:Content>
