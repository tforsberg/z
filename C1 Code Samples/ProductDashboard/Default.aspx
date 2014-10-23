<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<!DOCTYPE html >


<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>Product Dashboard</title>
    <link href="Content/StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div id="panel1" class="panel1" runat="server">
                    <div id="headerpanel" class="header">
                        <div class="imagepanel">
                            <asp:Image ID="imgproduct" runat="server" Height="40" ImageUrl="~/Images/xboximages.png" ImageAlign="Left" />
                        </div>
                        <div class="controlpanel1">
                            <wijmo:C1ComboBox ID="productcombo" Width="150px" Height="25px" runat="server" OnSelectedIndexChanged="productcombo_SelectedIndexChanged" AutoPostBack="True" />
                        </div>
                        <div class="controlpanel2">
                            <asp:Label ID="Label1" runat="server" Text="Product Dashboard" ForeColor="White" Font-Names="Segoe UI" Font-Size="X-Large" />
                        </div>
                        <div class="controlpanel3">

                            <wijmo:C1ComboBox ID="monthcombo" Width="125px" Height="25px" runat="server" OnSelectedIndexChanged="monthcombo_SelectedIndexChanged" AutoPostBack="True" />
                        </div>
                    </div>
                </div>
                <div id="container1" class="Container1">
                    <header>REVENUE & UNITS</header>
                    <wijmo:C1CompositeChart ID="productsaleschart" runat="server" Height="270px" Width="1145">
                        <Legend Orientation="Horizontal" Compass="North"></Legend>
                        <Animation Duration="2000" Easing="EaseOutCubic" />
                        <Hint Content-Function="function () { return this.label + ' ' + Globalize.format(this.y); }" />
                    </wijmo:C1CompositeChart>

                </div>
                <div id="container2" class="Container2">
                    <header>
                        <asp:Label ID="salesLabel" Text="Revenue: " runat="server" ForeColor="white" Font-Names="Segoe UI" />
                    </header>
                    <wijmo:C1RadialGauge runat="server" ID="salesgauge" Value="100" StartAngle="10" SweepAngle="160" Max="100" Width="240" Height="230"
                        Radius="95">
                        <Labels Offset="35">
                            <LabelStyle FontSize="12pt" FontWeight="800">
                                <Fill Color="#1E395B"></Fill>
                            </LabelStyle>
                        </Labels>
                        <TickMajor Position="Inside" Interval="25" Visible="true" Factor="3"
                            Offset="1">
                            <TickStyle Stroke="#1E395B" Height="2" Width="10">
                                <Fill Color="#1E395B"></Fill>
                            </TickStyle>
                        </TickMajor>
                        <TickMinor Position="Center" Interval="1" Visible="true" Offset="5" Factor="3">
                            <TickStyle Height="1" Width="10">
                                <Fill ColorBegin="#9903333" ColorEnd="#9906666" Type="LinearGradient"></Fill>
                            </TickStyle>
                        </TickMinor>
                        <Ranges>
                            <wijmo:GaugelRange StartWidth="20" EndWidth="20" StartValue="10" EndValue="40" StartDistance="0.8" EndDistance="0.8">
                                <RangeStyle Opacity="0.2">
                                    <Fill ColorBegin="#ff9900" ColorEnd="#ff0000" Type="LinearGradient"></Fill>
                                </RangeStyle>
                            </wijmo:GaugelRange>
                        </Ranges>

                        <Animation Duration="2000" Easing="EaseOutBack"></Animation>

                        <Face Template="face"></Face>
                        <Pointer Length="0.8">
                            <PointerStyle Stroke="#BF551C">
                                <Fill Color="#BF551C"></Fill>
                            </PointerStyle>
                        </Pointer>
                        <Cap>
                            <PointerCapStyle Stroke="#7F9CAD">
                                <Fill Color="#3399FF"></Fill>
                            </PointerCapStyle>
                        </Cap>
                    </wijmo:C1RadialGauge>
                </div>
                <div>
                    <asp:UpdateProgress ID="updProgress"
                        AssociatedUpdatePanelID="UpdatePanel1"
                        runat="server">
                        <ProgressTemplate>
                            <div id="blur" />
                            <div id="progress">
                                <img alt="progress" src="Images/progress.gif" />
                                Processing...   
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </div>
                <div id="container3" class="Container3">
                    <header>NEW CUSTOMER VS OLD CUSTOMER</header>
                    <wijmo:C1BarChart ID="C1BarChart1" runat="server" Height="230px" Width="635px">
                        <Animation Duration="2000" Easing="EaseInOutCubic" />
                        <Legend Compass="North" Orientation="Horizontal" />
                        <SeriesStyles>
                            <wijmo:ChartStyle>
                                <Fill ColorBegin="#804040" ColorEnd="#58503D">
                                </Fill>
                            </wijmo:ChartStyle>
                        </SeriesStyles>
                        <Header Compass="North">
                        </Header>
                        <Footer Compass="South" Visible="False">
                        </Footer>
                        <Axis>
                            <X>
                                <GridMajor Visible="True">
                                </GridMajor>
                                <GridMinor Visible="False">
                                </GridMinor>
                            </X>
                            <Y Compass="West" Visible="False">
                                <Labels TextAlign="Center">
                                </Labels>
                                <GridMajor Visible="True">
                                </GridMajor>
                                <GridMinor Visible="False">
                                </GridMinor>
                            </Y>
                        </Axis>
                    </wijmo:C1BarChart>

                </div>
                <div id="container4" class="Container4">
                    <header>ORDER RATIO</header>
                    <wijmo:C1PieChart ID="orderRatioChart" runat="server" Height="230px" Width="250px" Animation-Offset="20" ShowChartLabels="False">
                        <SeriesTransition Duration="1000" Easing="EaseOutBounce" />
                        <Legend Compass="North" Orientation="Horizontal" />
                        <Animation Duration="1000" Easing="EaseOutBounce" />
                        <Header Compass="North">
                        </Header>
                        <Hint Content-Function="hintContent" />
                        <Footer Compass="South" Visible="False">
                        </Footer>
                        <Axis>
                            <X>
                                <GridMajor Visible="True">
                                </GridMajor>
                                <GridMinor Visible="False">
                                </GridMinor>
                            </X>
                            <Y Compass="West" Visible="False">
                                <Labels TextAlign="Center">
                                </Labels>
                                <GridMajor Visible="True">
                                </GridMajor>
                                <GridMinor Visible="False">
                                </GridMinor>
                            </Y>
                        </Axis>
                    </wijmo:C1PieChart>

                </div>
                <div id="container5" class="Container5">
                    <header>SALES RATIO %</header>
                    <wijmo:C1BubbleChart ID="salesratiochart" runat="server" Height="180px" Width="310px" ShowChartLabels="False">
                        <Legend Compass="North" />
                        <Animation Duration="1000" Easing="EaseOutBounce" />
                        <Hint Content-Function="hintValue" />

                    </wijmo:C1BubbleChart>
                </div>
                <div id="container6" class="Container6">
                    <header>UNITS SOLD</header>
                    <wijmo:C1LineChart ID="unitsummarychart" runat="server" Height="180px" Width="315" Hint-Content-Function="unitshintValue">
                        <Legend Compass="East" />
                    </wijmo:C1LineChart>

                </div>
                <div id="container7" class="Container7">
                    <div id="container8" class="Container8">
                        <header>
                            <asp:Label ID="sonysales" runat="server" Text="Sony:" ForeColor="White" Font-Size="Small" Font-Names="Segoe UI" />
                        </header>
                        <wijmo:C1RadialGauge ID="C1RadialGauge1" runat="server" Value="10" Min="5" Max="30" Height="180" Width="175" SweepAngle="90" Radius="100" Origin-X="0.8" Origin-Y="0.8">
                            <Face FaceStyle-Fill-Color="Transparent" FaceStyle-StrokeWidth="0" />
                            <TickMajor Position="Center" Interval="5" Visible="true" Factor="1"
                                Offset="5">

                                <TickStyle Height="2" Width="20">
                                    <Fill ColorBegin="#9903333" ColorEnd="#9903333" Type="LinearGradient"></Fill>
                                </TickStyle>
                            </TickMajor>
                            <TickMinor Position="Inside" Interval="1" Visible="true" Offset="5" Factor="3">
                                <TickStyle Height="1" Width="10">
                                    <Fill ColorBegin="#9903333" ColorEnd="#9906666" Type="LinearGradient"></Fill>
                                </TickStyle>
                            </TickMinor>
                            <Origin X="0.8" Y="0.8"></Origin>

                            <Cap Radius="20" PointerCapStyle-Fill-Type="LinearGradient" PointerCapStyle-Fill-ColorBegin="#ff9900" PointerCapStyle-Fill-ColorEnd="#ff0000" />
                            <Pointer Width="20" Length="0.6" PointerStyle-Fill-Type="Default" PointerStyle-Fill-Color="#ff9900" PointerStyle-FillOpacity="0.8" />

                            <Labels Offset="30">
                                <LabelStyle Fill-Color="Black" Fill-Type="Default" />
                            </Labels>

                            <Animation Duration="2000" Easing="EaseOutBack"></Animation>
                            <Ranges>
                                <wijmo:GaugelRange StartWidth="20" EndWidth="20" StartValue="5" EndValue="30" StartDistance="0.6" EndDistance="0.6">
                                    <RangeStyle Opacity="0.2">
                                        <Fill ColorBegin="#ff9900" ColorEnd="#ff0000" Type="LinearGradient"></Fill>
                                    </RangeStyle>

                                </wijmo:GaugelRange>

                            </Ranges>
                        </wijmo:C1RadialGauge>
                    </div>
                    <div id="container9" class="Container9">
                        <header>
                            <asp:Label ID="mssales" runat="server" Text="Microsoft:" ForeColor="White" Font-Size="Small" Font-Names="Segoe UI" />
                        </header>
                        <wijmo:C1RadialGauge ID="C1RadialGauge2" runat="server" Value="10" Min="5" Max="30" Height="180" Width="175" SweepAngle="90" Radius="100" Origin-X="0.8" Origin-Y="0.8">
                            <Face FaceStyle-Fill-Color="Transparent" FaceStyle-StrokeWidth="0" />
                            <TickMajor Position="Center" Interval="5" Visible="true" Factor="1"
                                Offset="5">

                                <TickStyle Height="2" Width="20">
                                    <Fill ColorBegin="#9903333" ColorEnd="#9903333" Type="LinearGradient"></Fill>
                                </TickStyle>
                            </TickMajor>
                            <TickMinor Position="Inside" Interval="1" Visible="true" Offset="5" Factor="3">
                                <TickStyle Height="1" Width="10">
                                    <Fill ColorBegin="#9903333" ColorEnd="#9906666" Type="LinearGradient"></Fill>
                                </TickStyle>
                            </TickMinor>
                            <Origin X="0.8" Y="0.8"></Origin>
                            <Cap Radius="20" PointerCapStyle-Fill-Type="LinearGradient" PointerCapStyle-Fill-ColorBegin="#ff9900" PointerCapStyle-Fill-ColorEnd="#ff0000" />
                            <Pointer Width="20" Length="0.6" PointerStyle-Fill-Type="Default" PointerStyle-Fill-Color="#ff9900" PointerStyle-FillOpacity="0.8" />
                            <Labels Offset="30">
                                <LabelStyle Fill-Color="Black" Fill-Type="Default" />
                            </Labels>
                            <Animation Duration="2000" Easing="EaseOutBack"></Animation>
                            <Ranges>
                                <wijmo:GaugelRange StartWidth="20" EndWidth="20" StartValue="5" EndValue="30" StartDistance="0.6" EndDistance="0.6">
                                    <RangeStyle Opacity="0.2">
                                        <Fill ColorBegin="#ff9900" ColorEnd="#ff0000" Type="LinearGradient"></Fill>
                                    </RangeStyle>
                                </wijmo:GaugelRange>
                            </Ranges>
                        </wijmo:C1RadialGauge>
                    </div>
                    <div id="container10" class="Container10">
                        <header>
                            <asp:Label ID="NVideaSales" runat="server" Text="Nvidea:" ForeColor="White" Font-Size="Small" Font-Names="Segoe UI" />
                        </header>
                        <wijmo:C1RadialGauge ID="C1RadialGauge3" runat="server" Value="10" Min="5" Max="30" Height="180" Width="160" SweepAngle="90" Radius="100"
                            Origin-X="0.8" Origin-Y="0.8">
                            <Labels Offset="30">
                                <LabelStyle Fill-Color="Black" Fill-Type="Default" />

                            </Labels>
                            <Face FaceStyle-Fill-Color="Transparent" FaceStyle-StrokeWidth="0" />
                            <TickMajor Position="Center" Interval="5" Visible="true" Factor="1"
                                Offset="5">

                                <TickStyle Height="2" Width="20">
                                    <Fill ColorBegin="#9903333" ColorEnd="#9903333" Type="LinearGradient"></Fill>
                                </TickStyle>
                            </TickMajor>
                            <TickMinor Position="Inside" Interval="1" Visible="true" Offset="5" Factor="3">
                                <TickStyle Height="1" Width="10">
                                    <Fill ColorBegin="#9903333" ColorEnd="#9906666" Type="LinearGradient"></Fill>
                                </TickStyle>
                            </TickMinor>
                            <Origin X="0.8" Y="0.8"></Origin>
                            <Cap Radius="20" PointerCapStyle-Fill-Type="LinearGradient" PointerCapStyle-Fill-ColorBegin="#ff9900" PointerCapStyle-Fill-ColorEnd="#ff0000" />
                            <Pointer Width="20" Length="0.6" PointerStyle-Fill-Type="Default" PointerStyle-Fill-Color="#ff9900" PointerStyle-FillOpacity="0.8" />

                            <Animation Duration="2000" Easing="EaseOutBack"></Animation>
                            <Ranges>
                                <wijmo:GaugelRange StartWidth="20" EndWidth="20" StartValue="5" EndValue="30" StartDistance="0.6" EndDistance="0.6">
                                    <RangeStyle Opacity="0.2">
                                        <Fill ColorBegin="#ff9900" ColorEnd="#ff0000" Type="LinearGradient"></Fill>
                                    </RangeStyle>
                                </wijmo:GaugelRange>
                            </Ranges>

                        </wijmo:C1RadialGauge>
                    </div>
                </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="JavaScript.js"></script>
</body>
