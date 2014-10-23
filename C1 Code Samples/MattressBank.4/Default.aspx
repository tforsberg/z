<%@ Page Title="Mattress Bank" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="_Default" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Menu" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Tabs" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1TreeView" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Wizard" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Accordion" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Expander" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Slider" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Splitter" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Dialog" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.4" Namespace="C1.Web.Wijmo.Extenders.C1FormDecorator" TagPrefix="c1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .ui-accordion .ui-accordion-content
        {
            padding: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="Server">
    <c1:C1Expander ID="PnlWhereMyMoney" runat="server">
        <Header>
            Where is my money going?
        </Header>
        <Content>
            <c1:C1PieChart ID="ChrtSpending" runat="server" Height="340px" Width="240px" ShowChartLabels="false" Legend-Compass="South" Hint-Content-Function="function () { return this.label + ' ' + Globalize.format(this.value / this.total, 'p2'); }">
                <SeriesList>
                    <c1:PieChartSeries Label="Payments" Offset="15" Data="46.78">
                    </c1:PieChartSeries>
                    <c1:PieChartSeries Label="Automotive" Data="23.18">
                    </c1:PieChartSeries>
                    <c1:PieChartSeries Label="Grocery" Data="20.25">
                    </c1:PieChartSeries>
                    <c1:PieChartSeries Label="Entertainment" Data="5.41">
                    </c1:PieChartSeries>
                    <c1:PieChartSeries Label="Savings" Data="3.44">
                    </c1:PieChartSeries>
                    <c1:PieChartSeries Label="Household" Data="11.24">
                    </c1:PieChartSeries>
                </SeriesList>
            </c1:C1PieChart>
        </Content>
    </c1:C1Expander>
    <c1:C1Expander ID="C1Expander1" runat="server">
        <Header>
            Account Figures
        </Header>
        <Content>
            <c1:C1BarChart ID="ChrtChecking" runat="server" Height="180px" Width="240px" ShowChartLabels="False">
                <SeriesList>
                    <c1:BarChartSeries Label="This Month" LegendEntry="True">
                        <Data>
                            <X StringValues="Out,In" />
                            <Y DoubleValues="3768.95,4667.82" />
                        </Data>
                    </c1:BarChartSeries>
                    <c1:BarChartSeries Label="This Year" LegendEntry="True">
                        <Data>
                            <X StringValues="Out,In" />
                            <Y DoubleValues="11420.63,19265.43" />
                        </Data>
                    </c1:BarChartSeries>
                </SeriesList>
                <Footer Compass="South" Visible="False">
                </Footer>
                <Legend Compass="North"></Legend>
                <Axis>
                    <X Compass="West">
                    </X>
                    <Y Visible="False" TextVisible="False">
                        <Labels TextAlign="Center">
                        </Labels>
                        <GridMajor Visible="True">
                        </GridMajor>
                    </Y>
                </Axis>
                <Hint>
                    <Content Function="function () { return this.data.label + ' ' + Globalize.format(this.y, 'c'); }" />
                </Hint>
            </c1:C1BarChart>
        </Content>
    </c1:C1Expander>
    <c1:C1Expander ID="PnlSavingsGolas" runat="server">
        <Header>
            Savings Goals
        </Header>
        <Content>
            <c1:C1PieChart ID="C1PieChart1" runat="server" Height="240px" Width="240px" ShowChartLabels="false" Legend-Compass="South" Hint-Content-Function="function () { return this.label + ' ' + Globalize.format(this.value / this.total, 'p2'); }">
                <SeriesList>
                    <c1:PieChartSeries Label="Saved" Offset="15" Data="3200">
                    </c1:PieChartSeries>
                    <c1:PieChartSeries Label="Remaining" Data="40000">
                    </c1:PieChartSeries>
                </SeriesList>
            </c1:C1PieChart>
        </Content>
    </c1:C1Expander>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <%-- <h1>
        Dashboard</h1>
    <h2>
        Quick Transfer</h2>
    <table style="width: 100%">
        <tr>
            <td>
                <h4>
                    Savings Account</h4>
                <label>
                    $4,230.59</label>
            </td>
            <td>
                <h4>
                    Transfer Amount</h4>
                <c1:C1Slider ID="SldQuickTransfer" runat="server"></c1:C1Slider>
                <div>
                    <label>
                        $230.00</label>
                </div>
            </td>
            <td>
                <h4>
                    Checking Account</h4>
                <label>
                    $1,126.32</label>
            </td>
        </tr>
    </table>
    <div class="align-right">
        <asp:Button ID="BtnQuickTranfer" runat="server" Text="Transfer Now" />
    </div>--%>
    <h2>
        My Accounts <span class="right">Total funds: $20,321.32</span></h2>
    <c1:C1Accordion ID="AcdChecking" runat="server" RequireOpenedPane="false">
        <Panes>
            <c1:C1AccordionPane ID="ApChecking" runat="server" Expanded="true">
                <Header>
                    XXXXXX-1234 General Checking <span class="right">$1,342.22</span>
                </Header>
                <Content>
                    <c1:C1GridView ID="GrdChecking" runat="server" DataSourceID="ObjectDataSource1" AllowPaging="True" AllowSorting="true" Width="607px" AutogenerateColumns="False" ShowFooter="False">
                        <CallbackSettings Action="All" />
                        <Columns>
                            <c1:C1BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="false">
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Date" HeaderText="Date" SortExpression="Date">
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Location" HeaderText="Location" SortExpression="Location">
                                <HeaderStyle Width="200px" />
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Deposits" DataFormatString="c" HeaderText="Deposits" SortExpression="Deposits">
                                <ItemStyle ForeColor="#009900" />
                                <HeaderStyle Width="140px" />
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Withdrawals" DataFormatString="c" HeaderText="Withdrawals" SortExpression="Withdrawals">
                                <ItemStyle ForeColor="#CC0000" />
                                <HeaderStyle Width="140px" />
                            </c1:C1BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            No transactions
                        </EmptyDataTemplate>
                    </c1:C1GridView>                    
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SortParameterName="sortExpression" SelectMethod="GetTransactions" TypeName="Transactions"></asp:ObjectDataSource>
                </Content>
            </c1:C1AccordionPane>
            <c1:C1AccordionPane ID="ApSavings" runat="server" Expanded="true">
                <Header>
                    XXXXXX-3325 Savings <span class="right">$5,894.66</span>
                </Header>
                <Content>
                    <c1:C1GridView ID="C1GridView1" runat="server" DataSourceID="ObjectDataSource2" AllowPaging="True" AllowSorting="true" Width="607px" AutogenerateColumns="False" ShowFooter="False">
                        <CallbackSettings Action="All" />
                        <Columns>
                            <c1:C1BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="false">
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Date" HeaderText="Date" SortExpression="Date">
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Location" HeaderText="Location" SortExpression="Location">
                                <HeaderStyle Width="200px" />
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Deposits" DataFormatString="c" HeaderText="Deposits" SortExpression="Deposits">
                                <ItemStyle ForeColor="#009900" />
                                <HeaderStyle Width="140px" />
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Withdrawals" DataFormatString="c" HeaderText="Withdrawals" SortExpression="Withdrawals">
                                <ItemStyle ForeColor="#CC0000" />
                                <HeaderStyle Width="140px" />
                            </c1:C1BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            No transactions
                        </EmptyDataTemplate>
                    </c1:C1GridView>                    
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SortParameterName="sortExpression" SelectMethod="GetTransactions" TypeName="Transactions"></asp:ObjectDataSource>
                </Content>
            </c1:C1AccordionPane>
            <c1:C1AccordionPane ID="C1AccordionPane1" runat="server" Expanded="true">
                <Header>
                    XXXXXX-3456 Visa <span class="right">$12,342.22</span>
                </Header>
                <Content>
                    <c1:C1GridView ID="C1GridView2" runat="server" DataSourceID="ObjectDataSource3" AllowPaging="True" AllowSorting="true" Width="607px" AutogenerateColumns="False" ShowFooter="False">
                        <CallbackSettings Action="All" />
                        <Columns>
                            <c1:C1BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="false">
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Date" HeaderText="Date" SortExpression="Date">
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Location" HeaderText="Location" SortExpression="Location">
                                <HeaderStyle Width="200px" />
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Deposits" DataFormatString="c" HeaderText="Deposits" SortExpression="Deposits">
                                <ItemStyle ForeColor="#009900" />
                                <HeaderStyle Width="140px" />
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Withdrawals" DataFormatString="c" HeaderText="Withdrawals" SortExpression="Withdrawals">
                                <ItemStyle ForeColor="#CC0000" />
                                <HeaderStyle Width="140px" />
                            </c1:C1BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            No transactions
                        </EmptyDataTemplate>
                    </c1:C1GridView>                    
                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SortParameterName="sortExpression" SelectMethod="GetTransactions" TypeName="Transactions"></asp:ObjectDataSource>
                </Content>
            </c1:C1AccordionPane>
            <c1:C1AccordionPane ID="C1AccordionPane2" runat="server">
                <Header>
                    XXXXXX-1337 Funds <span class="right">$742.22</span>
                </Header>
                <Content>
                     <c1:C1GridView ID="C1GridView3" runat="server" DataSourceID="ObjectDataSource4" AllowPaging="True" AllowSorting="true" Width="607px" AutogenerateColumns="False" ShowFooter="False">
                        <CallbackSettings Action="All" />
                        <Columns>
                            <c1:C1BoundField DataField="ID" HeaderText="ID" SortExpression="ID" Visible="false">
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Date" HeaderText="Date" SortExpression="Date">
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Location" HeaderText="Location" SortExpression="Location">
                                <HeaderStyle Width="200px" />
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Deposits" DataFormatString="c" HeaderText="Deposits" SortExpression="Deposits">
                                <ItemStyle ForeColor="#009900" />
                                <HeaderStyle Width="140px" />
                            </c1:C1BoundField>
                            <c1:C1BoundField DataField="Withdrawals" DataFormatString="c" HeaderText="Withdrawals" SortExpression="Withdrawals">
                                <ItemStyle ForeColor="#CC0000" />
                                <HeaderStyle Width="140px" />
                            </c1:C1BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            No transactions
                        </EmptyDataTemplate>
                    </c1:C1GridView>                    
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SortParameterName="sortExpression" SelectMethod="GetTransactions" TypeName="Transactions"></asp:ObjectDataSource>
                </Content>
            </c1:C1AccordionPane>
        </Panes>
    </c1:C1Accordion>
</asp:Content>
