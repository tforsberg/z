<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Position.aspx.cs" Inherits="ToolkitExplorer.RadialGauge.Position" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gauge"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="radialGauge" Height="475" Width="756" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all">
    </asp:Panel>
    <wijmo:C1RadialGaugeExtender runat="server" ID="RadialGaugeExtender1" TargetControlID="radialGauge"
        Value="100" Max="150" 
		StartAngle="-45" SweepAngle="270" Radius="170">
		
<TickMajor Position="Inside" Factor="2" Visible="True" Offset="-5" Interval="10"></TickMajor>

<TickMinor Position="Inside" Visible="True" Offset="0" Interval="2"></TickMinor>

<Pointer Length="0.8" Width="4" Offset="0.15"></Pointer>

<Labels Offset="-10">
    <LabelStyle Stroke="#556A7C">
		<Fill Color="#556A7C">
		</Fill>
	</LabelStyle>
		</Labels>

<Animation Duration="2000" Easing="EaseOutBack"></Animation>
		<Face>
            <FaceStyle StrokeWidth="0">
            </FaceStyle>
		</Face>
		<Ranges>
			<Wijmo:GaugelRange EndDistance="1" EndValue="50" EndWidth="20" 
				StartDistance="1" StartValue="20" StartWidth="15">
                <RangeStyle Stroke="#BC8A8E">
					<Fill Color="#BC8A8E">
					</Fill>
                </RangeStyle>
			</Wijmo:GaugelRange>
		</Ranges>
    </wijmo:C1RadialGaugeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <div>
        <p>
            pointer</p>
        Length:<input id="p_length" type="text" />
        Offset:<input id="p_offset" type="text" />
        <p>
            label</p>
        Offset:<input id="l_offset" type="text" />
        <p>
            tick</p>
        Offset:<input id="t_offset" type="text" />
        Position:<select id="t_position"><option value="inside">Inside</option>
            <option value="outside">Outside</option>
        </select>
        <p>
            range1</p>
        start Distance<input id="rs_distance" type="text" />
        end Distance<input id="re_distance" type="text" />
        <br />
        <input id="applyOption" type="button" value="Apply" />
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#applyOption").click(function () {
                var option = {}, pointer = {}, label = {}, tick = {}, range1 = {};
                pointer.length = getInputNum("p_length");
                pointer.offset = getInputNum("p_offset");
                label.offset = getInputNum("l_offset");
                tick.offset = getInputNum("t_offset");
                tick.position = $("#t_position").val();
                range1 = $("#<%=radialGauge.ClientID %>").wijradialgauge("option", "ranges")[0];
                range1.startDistance = getInputNum("rs_distance");
                range1.endDistance = getInputNum("re_distance");

                option.pointer = pointer;
                option.labels = label;
                option.tickMinor = tick;
                option.tickMajor = tick;
                option.ranges = [];
                option.ranges[0] = range1;

                $("#<%=radialGauge.ClientID %>").wijradialgauge("option", option);
            });

            var getInputNum = function (id) {
                var val = $("#" + id).val();
                return val ? parseFloat(val) : 1;
            }
        });
	
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>User can use <b>TickMajor</b> and <b>TickMinor</b> property's <b>Position</b> child property setting the marker's position.</p>
	<p>The Position property can set to inside and outside.</p>
</asp:Content>
