<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Trendline.aspx.cs" Inherits="ControlExplorer.C1ScatterChart.Trendline" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagprefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		function hintContent() {
			return this.x + ' cm, ' + this.y + ' kg';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1ScatterChart  ID="C1ScatterChart1" runat="server" Height="475" Width="756">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<SeriesTransition Duration="2000" Enabled="false">
		</SeriesTransition>
		<Animation Duration="2000" Enabled="false">
		</Animation>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#AFE500">
				<Fill Color="#AFE500">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#FF9900">
				<Fill Color="#FF9900">
				</Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<Header Text="Height Versus Weight of 72 Individuals by Gender">
		</Header>
		<Footer Compass="South" Visible="False">
		</Footer>
		<Legend Visible="true">
			<Size Width="30" Height="3">
			</Size>
		</Legend>
		<Axis>
			<X Text="Height (cm)">
				<Labels>
					<AxisLabelStyle FontSize="11pt" Rotation="-45">
						<Fill Color="#7F7F7F">
						</Fill>
					</AxisLabelStyle>
				</Labels>
                <GridMajor Visible="false"></GridMajor>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#7F7F7F" />
				</TickMajor>
			</X>
			<Y compass="West" text="Weight (kg)" visible="true" >
				<labels textalign="Center">
					<AxisLabelStyle FontSize="11pt">
						<Fill Color="#7F7F7F">
						</Fill>
					</AxisLabelStyle>
				</labels>
				<gridmajor visible="True">
					<GridStyle Stroke="#353539" StrokeDashArray="- "></GridStyle>
				</gridmajor>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#7F7F7F" />
				</TickMajor>
				<TickMinor Position="Outside">
					<TickStyle Stroke="#7F7F7F" />
				</TickMinor>
			</Y>
		</Axis>
	</wijmo:C1ScatterChart>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=C1ScatterChart1.ClientID%>').c1scatterchart('option', 'showChartLabels', true);
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demostrates how to draw trendlines on <strong>C1ScatterChart</strong>.
    </p>
    <p>
        You can customize the trendline by setting following properties:
    </p>
    <ul>
        <li>
            <strong>FitType</strong> - sepcifies the type of the trendline.
        </li>
        <li>
            <strong>SampleCount</strong> - specifies the sample count for function calculation. It works only if the FitType is polynom, power, exponent, logarithmic and fourier. 
        </li>
        <li>
            <strong>Order</strong> - defines the number of terms in polynom equation. It works only if the FitType is polynom, power, exponent, logarithmic and fourier.
        </li>
    </ul>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <label>Order:</label>
                    <wijmo:C1InputNumeric ID="inputOrder" runat="server" Width="80px" ShowSpinner="true" Value="4" MinValue="1" MaxValue="10" DecimalPlaces="0"></wijmo:C1InputNumeric>
                </li>
                <li>
                    <label>SampleCount:</label>
                    <wijmo:C1InputNumeric ID="inputSampleCount" runat="server" Width="80px" ShowSpinner="true" Value="100" MinValue="1" MaxValue="200" DecimalPlaces="0"></wijmo:C1InputNumeric>
                </li>
                <li>
                    <label>FitType:</label>
                    <asp:DropDownList ID="dplFitType" runat="server">
                        <asp:ListItem Text="Polynom" Value="Polynom" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Exponent" Value="Exponent"></asp:ListItem>
                        <asp:ListItem Text="Logarithmic" Value="Logarithmic"></asp:ListItem>
                        <asp:ListItem Text="Power" Value="Power"></asp:ListItem>
                        <asp:ListItem Text="Fourier" Value="Fourier"></asp:ListItem>
                        <asp:ListItem Text="MinX" Value="MinX"></asp:ListItem>
                        <asp:ListItem Text="MinY" Value="MinY"></asp:ListItem>
                        <asp:ListItem Text="MaxX" Value="MaxX"></asp:ListItem>
                        <asp:ListItem Text="MaxY" Value="MaxY"></asp:ListItem>
                        <asp:ListItem Text="AverageX" Value="AverageX"></asp:ListItem>
                        <asp:ListItem Text="AverageY" Value="AverageY"></asp:ListItem>
                    </asp:DropDownList>
                </li>
            </ul>
        </div>
        <div class="settingcontrol">
            <asp:Button ID="btnApply" Text="Apply" CssClass="settingapply" runat="server" OnClick="btnApply_Click" />
        </div>
    </div>
</asp:Content>
