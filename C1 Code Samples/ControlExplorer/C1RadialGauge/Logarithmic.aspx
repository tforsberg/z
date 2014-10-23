<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Logarithmic.aspx.cs" Inherits="ControlExplorer.C1RadialGauge.Logarithmic" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="Wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="update1" UpdateMode="Conditional">
        <ContentTemplate>

        <Wijmo:C1RadialGauge runat="server" ID="Gauge1" Value="100" StartAngle="-45" 
		SweepAngle="270" Islogarithmic="true" Max="150">
	<Cap Radius="10">
		<PointerCapStyle Stroke="#1E395B">
			<Fill Color="#1E395B">
			</Fill>        
		</PointerCapStyle>
	</Cap>
<TickMajor Factor="2" Visible="True" Interval="10" Offset="27" Position="Inside">
	<TickStyle Height="4" Stroke="#E7EFF8" StrokeWidth="1.5" Width="20">
		<Fill Color="#1E395B">
		</Fill>        
	</TickStyle>
	</TickMajor>

<TickMinor Visible="True" Interval="5" Offset="30" Position="Inside">
	<TickStyle Height="3" Stroke="#E7EFF8" Width="10">
		<Fill Color="#1E395B">
		</Fill>
	</TickStyle>
	</TickMinor>

<Pointer Length="0.8" Width="6" Offset="0" Shape="Rect">
	<PointerStyle Stroke="#1E395B">
		<Fill Color="#1E395B">
		</Fill>
	</PointerStyle>
	</Pointer>

	<Labels Offset="27">
		<LabelStyle FontSize="12pt" FontWeight="800">
			<Fill Color="#1E395B">
			</Fill>
		</LabelStyle>
	</Labels>

<Animation Duration="2000" Easing="EaseOutBack"></Animation>
	<Face>
		<FaceStyle Stroke="#7BA0CC" StrokeWidth="4">
			<Fill ColorBegin="White" ColorEnd="#D9E3F0" RadialGradientFocusPointX="0.9" 
				RadialGradientFocusPointY="0.6" Type="RadialGradient">
			</Fill>
		</FaceStyle>
	</Face>
	<Ranges>
		<Wijmo:GaugelRange EndDistance="0.58" EndValue="10" EndWidth="5" 
			StartDistance="0.6" StartValue="0" StartWidth="2">
			<RangeStyle Stroke="#7BA0CC" StrokeWidth="0">
				<Fill Color="#7BA0CC">
				</Fill>            
			</RangeStyle>
		</Wijmo:GaugelRange>
		<Wijmo:GaugelRange EndDistance="0.54" EndValue="125" EndWidth="20" 
			StartDistance="0.58" StartValue="10" StartWidth="5">
			<RangeStyle Stroke="White" StrokeWidth="0">
				<Fill ColorBegin="#B4D5F0" ColorEnd="#B4D5F0" Type="LinearGradient">
				</Fill>            
			</RangeStyle>
		</Wijmo:GaugelRange>
		<Wijmo:GaugelRange EndDistance="0.5" EndValue="150" EndWidth="25" 
			StartDistance="0.54" StartValue="125" StartWidth="20">
			<RangeStyle Stroke="#7BA0CC" StrokeWidth="0">
				<Fill Color="#7BA0CC">
				</Fill>            
			</RangeStyle>
		</Wijmo:GaugelRange>
	</Ranges>
</Wijmo:C1RadialGauge>
            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel runat="server" ID="update2" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li>
                            <label>IsLogarithmic</label>
                            <asp:CheckBox AutoPostBack="true" runat="server"  id="checkbox1" Checked="true" />
                        </li>
                    </ul>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to create non-uniform tick marks with the  <b>Islogarithmic</b> and <b>LogarithmicBase</b> properties.</p>
</asp:Content>
