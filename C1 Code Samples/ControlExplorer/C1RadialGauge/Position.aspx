<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Position.aspx.cs" Inherits="ControlExplorer.C1RadialGauge.Position" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="Wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="update1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

	    <Wijmo:C1RadialGauge runat="server" ID="Gauge1" Value="100" Max="150" 
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
	    </Wijmo:C1RadialGauge>
            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="update2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

        <div class="settingcontainer">
            <div class="settingcontent">
                <ul>
                    <li class="fullwidth"><h3>Pointer</h3></li>
                    <li class="fullwidth inlinediv">
                    <label>Length</label>
                    <asp:TextBox ID="p_length" runat="server" Width="100"  Text="0">
                    </asp:TextBox>
			        <label>Offset</label>
                    <asp:TextBox id="p_offset" runat="server" Width="100"  Text="0" >
                    </asp:TextBox></li>
                    <li class="fullwidth">
                        <h3>Label</h3> </li>
                    <li class="fullwidth inlinediv">
                        <label>Offset</label>
                    <asp:TextBox ID="l_offset" runat="server" Width="100"  Text="0" >
                    </asp:TextBox></li>
                    <li class="fullwidth"><h3>Tick</h3></li>
                    <li class="fullwidth inlinediv"><asp:Label ID="lb4" runat="server" AssociatedControlID="t_offset">Offset</asp:Label>
                        <asp:TextBox ID="t_offset" runat="server" Width="100"  Text="0">
                        </asp:TextBox>
			            <label>Position</label>
                        <asp:DropDownList ID="t_position" Width="100" runat="server">
                            <Items>
                                <asp:ListItem Text="Inside" Value="inside" Selected="true" />
                                <asp:ListItem Text="Outside" Value="outside" />
                            </Items>
                        </asp:DropDownList></li>
                    <li class="fullwidth"><h3>Range</h3></li>
                    <li class="fullwidth inlinediv"><label>Start Distance</label>
                    <asp:TextBox ID="rs_distance" runat="server" Width="100"  Text="0">
                    </asp:TextBox>
			        <label>End Distance</label>
                    <asp:TextBox ID="re_distance" runat="server" Width="100" Text="0">
                    </asp:TextBox></li>
                </ul>
                </div>
            <div class="settingcontrol">
                <asp:Button runat="server" OnClick="applyOption_Click" ID="applyOption" Text="Apply" />
            </div>
	    </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This example demonstrates how to customize the appearance and position of major and minor tick marks in the radial gauge with the <b>TickMajor</b> and <b>TickMinor</b> property's <b>Position</b> child property.</p>
	<p>The Position property can set to inside and outside.</p>
</asp:Content>
