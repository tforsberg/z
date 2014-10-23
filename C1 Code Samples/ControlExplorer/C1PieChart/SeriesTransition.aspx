<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="SeriesTransition.aspx.cs" Inherits="ControlExplorer.C1PieChart.SeriesTransition" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		function hintContent() {
		    return this.data.label + " : " + Globalize.format(this.value / this.total, "p2");
		   }
		   function reload() {
		       $("#<%= C1PieChart1.ClientID %>").c1piechart("option", "seriesList", createRandomSeriesList());
		       return false;
		   }

		   function createRandomSeriesList() {
			var seriesList = [],
				randomDataValuesCount = 6,
				labels = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
				idx;
			for (idx = 0; idx < randomDataValuesCount; idx++) {
				seriesList.push({
					label: labels[idx],
					legendEntry: true,
					data: createRandomValue()
				});
			}
			return seriesList;
		   }

		   function createRandomValue() {
			var val = Math.round(Math.random() * 100);
			return val;
		   }
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="update1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

	    <wijmo:C1PieChart runat="server" ID="C1PieChart1" Radius="140" Height="475" Width = "756" CssClass ="ui-widget ui-widget-content ui-corner-all">
		    <Hint>
			    <Content Function="hintContent" />
		    </Hint>
		    <SeriesList>
			    <wijmo:PieChartSeries Label="Jan" LegendEntry="true" Data="50" />
			    <wijmo:PieChartSeries Label="Feb" LegendEntry="true" Data="38" />
			    <wijmo:PieChartSeries Label="Mar" LegendEntry="true" Data="73" />
			    <wijmo:PieChartSeries Label="Apr" LegendEntry="true" Data="13" />
			    <wijmo:PieChartSeries Label="May" LegendEntry="true" Data="89" />
			    <wijmo:PieChartSeries Label="Jun" LegendEntry="true" Data="5" />
		    </SeriesList>
		    <Legend Visible="true"></Legend>
		    <Footer Compass="South" Visible="False">
		    </Footer>
		    <Axis>
			    <Y Visible="False" Compass="West">
				    <Labels TextAlign="Center">
				    </Labels>
				    <GridMajor Visible="True">
				    </GridMajor>
			    </Y>
		    </Axis>
	    </wijmo:C1PieChart>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
   <p>The <strong>C1PieChart</strong> control supports a variety of animation effects when reloading data.</p><br/>
	<p>
		The <strong>SeriesTransition</strong> property is used to control the animation effect while data is being reloaded.
	</p>
	<ul>
		<li><strong>SeriesTransition.Enabled </strong>- enables or disables the animation.</li>
		<li><strong>SeriesTransition.Duration </strong>- sets the duration of the animation. </li>
		<li><strong>SeriesTransition.Easing </strong>- sets the animation effect. </li>
	</ul>
	<p> The <strong>Easing</strong> property can be set to one of the following values:</p>
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
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="update2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth"><h3>
			        seriesTransition Settings: 
		        </h3></li>
                <li class="inlinediv"><label>Enabled</label>
                    <asp:CheckBox ID="cbEnabled" Checked="true" runat="server" />
                </li>
                <li class="fullwidth inlinediv"><label>Duration</label>
                    <asp:TextBox id="txtDuration" runat="server"></asp:TextBox>
                    <label>Easing</label>
                    <asp:DropDownList ID="selEasing" runat="server">
                        <asp:ListItem Text="easeInCubic" Selected="true" Value="easeInCubic" />
                        <asp:ListItem Text="easeOutCubic" Value="easeOutCubic" />
                        <asp:ListItem Text="easeInOutCubic" Value="easeInOutCubic" />
                        <asp:ListItem Text="easeInBack" Value="easeInBack" />
                        <asp:ListItem Text="easeOutBack" Value="easeOutBack" />
                        <asp:ListItem Text="easeOutElastic" Value="easeOutElastic" />
                        <asp:ListItem Text="easeOutBounce" Value="easeOutBounce" />
                    </asp:DropDownList>
                </li>
            </ul>
        </div>
        <div class="settingcontrol">
            <asp:Button ID="btnApply" OnClick="btnApply_Click" runat="server" Text="Apply" />
            <asp:Button ID="btnReload" Text="Reload" runat="server"  OnClientClick="return reload();" />
        </div>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
