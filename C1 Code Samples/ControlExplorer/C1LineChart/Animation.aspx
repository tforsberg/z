<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.C1LineChart.Animation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function hintContent() {
            return this.data.lineSeries.label + '\n' +
			this.x + '\n' + this.y + '';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <wijmo:C1LineChart runat="server" ID="C1LineChart1" BackColor="#242529" ShowChartLabels="false" Height="475" Width="756">
        <Animation Direction="Vertical" />
        <Footer Compass="South" Visible="False"></Footer>
        <Legend Visible="false"></Legend>
        <Hint OffsetY="-10">
            <Content Function="hintContent" />
            <ContentStyle FontSize="10pt" />
        </Hint>
        <SeriesStyles>
            <wijmo:ChartStyle Stroke="#ff9900" StrokeWidth="3" />
        </SeriesStyles>
        <SeriesHoverStyles>
            <wijmo:ChartStyle StrokeWidth="4"></wijmo:ChartStyle>
        </SeriesHoverStyles>
        <Axis>
            <X Text="Month of the Year">
                <Labels>
                    <AxisLabelStyle FontSize="11pt" Rotation="-45">
                        <Fill Color="#7f7f7f"></Fill>
                    </AxisLabelStyle>
                </Labels>
                <TickMajor Position="Outside">
                    <TickStyle Stroke="#7f7f7f" />
                </TickMajor>
                <GridMajor Visible="false"></GridMajor>
                <GridMinor Visible="false"></GridMinor>
            </X>
            <Y Text="Number of Hits" AutoMax="false" AutoMin="false" Max="100" Min="0" Compass="West">
                <Labels TextAlign="Center">
                    <AxisLabelStyle FontSize="11pt">
                        <Fill Color="#7f7f7f"></Fill>
                    </AxisLabelStyle>
                </Labels>
                <GridMajor Visible="false">
                    <GridStyle Stroke="#353539" StrokeDashArray="- " />
                </GridMajor>
                <GridMinor Visible="false"></GridMinor>
                <TickMajor Position="Outside">
                    <TickStyle Stroke="#7f7f7f" />
                </TickMajor>
                <TickMinor Position="Outside">
                    <TickStyle Stroke="#7f7f7f" />
                </TickMinor>
            </Y>
        </Axis>
    </wijmo:C1LineChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>The <strong>C1LineChart</strong> supports a variety of animation effects when loading data.</p>
    <br />
    <p>The <strong>Animation</strong> and <strong>SeriesTransition</strong> properties are used to control the animation effect when loading and reloading data respectively.</p>
    <ul>
        <li><strong>Animation.Direction</strong> - for specifying the direction when animation plays which affects both data loading and reloading</li>
        <li><strong>Animation.Enabled</strong> and <strong>SeriesTransition.Enabled</strong>  - for enabling the animation or not</li>
        <li><strong>Animation.Duration</strong> and <strong>SeriesTransition.Duration</strong>- for specifying the duration of the animation. </li>
        <li><strong>Animation.Easing</strong> and <strong>SeriesTransition.Easing</strong> - for setting the animation type.</li>
    </ul>
    <p>The <strong>Easing</strong> property can be set to the following value:</p>
    <ul>
        <li>easeInCubic(">")</li>
        <li>easeOutCubic("<")</li>
        <li>easeInOutCubic("<>")</li>
        <li>easeInBack("backIn")</li>
        <li>easeOutBack("backOut")</li>
        <li>easeOutElastic("elastic")</li>
        <li>easeOutBounce("bounce")</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth">
                    <label class="settinglegend" for="ckxShowXAxis">Animate Settings</label>
                </li>
                <li>
                    <asp:CheckBox ID="ckxEnableAnimation" Text="Enabled" TextAlign="Left" runat="server" Checked="true" />
                </li>
                <li>
                    <label>Duration:</label>
                    <wijmo:C1InputNumeric ID="numberAnimationDuration" runat="server" Width="50px" DecimalPlaces="0" Value="1000"></wijmo:C1InputNumeric>
                </li>
                <li>
                    <label>Easing:</label>
                    <asp:DropDownList ID="cbxAnimationEasing" runat="server">
                        <asp:ListItem Text="EaseInCubic" Value="EaseInCubic" Selected="true" />
                        <asp:ListItem Text="EaseOutCubic" Value="EaseOutCubic" />
                        <asp:ListItem Text="EaseInOutCubic" Value="EaseInOutCubic" />
                        <asp:ListItem Text="EaseInBack" Value="EaseInBack" />
                        <asp:ListItem Text="EaseOutBack" Value="EaseOutBack" />
                        <asp:ListItem Text="EaseOutElastic" Value="EaseOutElastic" />
                        <asp:ListItem Text="EaseOutBounce" Value="EaseOutBounce" />
                    </asp:DropDownList>
                </li>
                <li>
                    <label>Direction:</label>
                    <asp:DropDownList ID="cbxAnimationDirection" runat="server">
                        <asp:ListItem Text="Horizontal" Value="Horizontal" Selected="true" />
                        <asp:ListItem Text="Vertical" Value="Vertical" />
                    </asp:DropDownList>
                </li>
                <li class="fullwidth">
                    <label class="settinglegend" for="ckxShowXAxis">Series Transition Settings</label>
                </li>
                <li>
                    <asp:CheckBox ID="ckxEnableTransition" Text="Enabled" TextAlign="Left" runat="server" Checked="true" />
                </li>
                <li>
                    <label>Duration:</label>
                    <wijmo:C1InputNumeric ID="numberTranDuration" runat="server" Width="50px" DecimalPlaces="0" Value="1000"></wijmo:C1InputNumeric>
                </li>
                <li>
                    <label>Easing:</label>
                    <asp:DropDownList ID="cbxTranEasing" runat="server">
                        <asp:ListItem Text="EaseInCubic" Value="EaseInCubic" Selected="true" />
                        <asp:ListItem Text="EaseOutCubic" Value="EaseOutCubic" />
                        <asp:ListItem Text="EaseInOutCubic" Value="EaseInOutCubic" />
                        <asp:ListItem Text="EaseInBack" Value="EaseInBack" />
                        <asp:ListItem Text="EaseOutBack" Value="EaseOutBack" />
                        <asp:ListItem Text="EaseOutElastic" Value="EaseOutElastic" />
                        <asp:ListItem Text="EaseOutBounce" Value="EaseOutBounce" />
                    </asp:DropDownList>
                </li>
            </ul>
            <div class="settingcontrol">
                <asp:Button ID="btnApply" Text="Apply" CssClass="settingapply" runat="server" OnClick="btnReload_Click" />
            </div>
        </div>
    </div>
</asp:Content>
