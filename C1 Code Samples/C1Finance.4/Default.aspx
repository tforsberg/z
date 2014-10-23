<%@ Page Title="ASP.NET StockPortfolio" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="True" Inherits="_Default" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1ProgressBar" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.4" Namespace="C1.Web.Wijmo.Extenders.C1FormDecorator" TagPrefix="c1" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="chart">
   
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <fieldset>
                        <legend>Date Range</legend>
                        <div class="contain">
                            <div class="third">
                                <asp:Label ID="LblDateFrom" runat="server" CssClass="left" AssociatedControlID="TxtDateFrom">Begin Date</asp:Label>
                                <div class="left">
                                    <c1:C1InputDate ID="TxtDateFrom" runat="server" ShowTrigger="true" />
                                </div>
                            </div>
                            <div class="third">
                                <asp:Label ID="LblDateTo" runat="server" CssClass="left" AssociatedControlID="TxtDateTo">End Date</asp:Label>
                                <div class="left">
                                    <c1:C1InputDate ID="TxtDateTo" runat="server" ShowTrigger="true" CssClass="left" />
                                </div>
                            </div>
                            <div class="third">
                                <asp:Button ID="BtnUpdateRange" runat="server" Text="Update" />
                                <c1:C1ButtonExtender ID="BtnUpdateRange_C1ButtonExtender" runat="server" TargetControlID="BtnUpdateRange">
                                </c1:C1ButtonExtender>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                        <%--<p>
                            <em>Data will only be displayed for a maximum range of 6 months.</em></p>--%>
                    </fieldset>
                </div>
                <c1:C1LineChart ID="C1WebChart1" runat="server" DataSourceID="ObjectDataSource2" Height="300px" Width="920px" ShowChartLabels="false">
                    <SeriesTransition Duration="2000" />
                    <Hint>
                        <Content Function="hintContent" />
                    </Hint>
                    <Animation Duration="2000" />
                    <SeriesList>
                        <c1:LineChartSeries Label="SampleData" LegendEntry="True">
				            <Markers Visible="True"></Markers>
                            <Data>
                                <X DoubleValues="1, 2, 3, 4, 5" />
                                <Y DoubleValues="20, 22, 19, 24, 25" />
                            </Data>
                        </c1:LineChartSeries>
                    </SeriesList>
                    <SeriesStyles>
                        <c1:ChartStyle Stroke="#4B6C9E" StrokeWidth="4" Opacity="0.8">
                        </c1:ChartStyle>
                    </SeriesStyles>
                    <SeriesHoverStyles>
                        <c1:ChartStyle Stroke="#4B6C9E" StrokeWidth="6" Opacity="0.9">
                        </c1:ChartStyle>
                    </SeriesHoverStyles>
                    <Footer Compass="South" Visible="False">
                    </Footer>
                    <Legend Visible="false">
                    </Legend>
                    <Axis>
                        <Y Compass="West" Visible="False">
                            <Labels TextAlign="Center">
                            </Labels>
                            <GridMajor Visible="True">
                            </GridMajor>
                        </Y>
                    </Axis>
                    <DataBindings>
                        <c1:C1ChartBinding XField="Date" XFieldType="DateTime" YField="Close" YFieldType="Number" />
                    </DataBindings>
                </c1:C1LineChart>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div id="grid">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <c1:C1GridView ID="C1GridView1" runat="server" AutogenerateColumns="False" DataKeyNames="Symbol" DataSourceID="ObjectDataSource1" SelectedIndex="0" ClientSelectionMode="None" OnSelectedIndexChanging="C1GridView1_SelectedIndexChanging">
                    <SelectedRowStyle />
                    <Columns>
                        <c1:C1ButtonField Text="Select" ButtonType="Link" CommandName="Select">
                            <ItemStyle CssClass="center" />
                        </c1:C1ButtonField>
                        <c1:C1BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                            <HeaderStyle CssClass="center" />
                        </c1:C1BoundField>
                        <c1:C1BoundField DataField="Symbol" HeaderText="Symbol" SortExpression="Symbol">
                            <HeaderStyle CssClass="center" />
                        </c1:C1BoundField>
                        <c1:C1BoundField DataField="Open" HeaderText="Open" SortExpression="Open" DataFormatString="c">
                            <HeaderStyle CssClass="center" />
                            <ItemStyle CssClass="currency" />
                        </c1:C1BoundField>
                        <c1:C1BoundField DataField="Close" HeaderText="Close" SortExpression="Close" DataFormatString="c">
                            <HeaderStyle CssClass="center" />
                            <ItemStyle CssClass="currency" />
                        </c1:C1BoundField>
                        <c1:C1BoundField DataField="High" HeaderText="High" SortExpression="High" DataFormatString="c">
                            <HeaderStyle CssClass="center" />
                            <ItemStyle CssClass="currency" />
                        </c1:C1BoundField>
                        <c1:C1BoundField DataField="Low" HeaderText="Low" SortExpression="Low" DataFormatString="c">
                            <HeaderStyle CssClass="center" />
                            <ItemStyle CssClass="currency" />
                        </c1:C1BoundField>
                        <c1:C1BoundField DataField="Volume" HeaderText="Volume" SortExpression="Volume" DataFormatString="n">
                            <HeaderStyle CssClass="center" />
                            <ItemStyle CssClass="number" />
                        </c1:C1BoundField>
                    </Columns>
                </c1:C1GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="statusbar">
        <div class="progress" style="display: none">
            <c1:C1ProgressBar ID="C1ProgressBar1" runat="server" UseEmbeddedjQuery="false" AnimationDelay="0" AnimationOptions-Duration="800" Height="20px" Width="920px" LabelAlign="Center" />
        </div>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetStocks" TypeName="Stocks">
        <SelectParameters>
            <asp:Parameter DefaultValue="MSFT,GOOG,YHOO,AAPL,INTC,NVDA,ORCL,GE,AMD" Name="Symbols" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetStockHistory" TypeName="Stocks">
        <SelectParameters>
            <asp:Parameter DefaultValue="MSFT" Name="Symbol" Type="String" />
            <asp:ControlParameter ControlID="TxtDateFrom" DefaultValue="7/1/11" Name="startDate" PropertyName="Date" Type="DateTime" />
            <asp:ControlParameter ControlID="TxtDateTo" DefaultValue="8/1/11" Name="endDate" PropertyName="Date" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <script type="text/javascript">
        function hintContent() {
            return Globalize.format(this.y, "c");
        }

        $(document).ready(function () {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_initializeRequest(initializeRequest);
            prm.add_beginRequest(beginRequest);
            prm.add_endRequest(endRequest);


        });
        function initializeRequest(sender, args) {
            $(".progress").show();
            $("#<%=C1ProgressBar1.ClientID %>").c1progressbar("option", "value", 25);
        }
        function beginRequest(sender, args) {
            $("#<%=C1ProgressBar1.ClientID %>").c1progressbar("option", "animationOptions", { duration: 2500 });
            $("#<%=C1ProgressBar1.ClientID %>").c1progressbar("option", "value", 80);
        }
        function endRequest(sender, args) {
            $("#<%=C1ProgressBar1.ClientID %>").c1progressbar("option", "animationOptions", { duration: 400 });
            $("#<%=C1ProgressBar1.ClientID %>").c1progressbar("option", "value", 100);
            window.setTimeout(resetIt, 500);
        }
        function resetIt() {
            $("#<%=C1ProgressBar1.ClientID %>").c1progressbar("option", "value", 0);
            $(".progress").hide();
        }

    </script>
</asp:Content>
