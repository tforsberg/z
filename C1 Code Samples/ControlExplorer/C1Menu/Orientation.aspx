<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orientation.aspx.cs" MasterPageFile="~/Wijmo.Master"
    Inherits="ControlExplorer.C1Menu.Orientation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Menu"
    TagPrefix="wijmo" %>
<asp:Content ContentPlaceHolderID="Head" ID="Content1" runat="server">
    <style type="text/css">
        div#ctl00_ctl00_MainContent_WidgetTabs_ctl00
        {
            overflow: visible;
            overflow-y: visible;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="MainContent">
    <wijmo:C1Menu runat="server" ID="Menu1" Orientation="Horizontal">
        <Items>
            <wijmo:C1MenuItem runat="server" Text="Breaking News">
                <Items>
                    <wijmo:C1MenuItem runat="server" Text="Entertainment">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Politics">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="A&amp;E">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Sports">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Local">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Health">
                    </wijmo:C1MenuItem>
                </Items>
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Entertainment">
                <Items>
                    <wijmo:C1MenuItem runat="server" Text="Celebrity news">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Gossip">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Movies">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Music">
                        <Items>
                            <wijmo:C1MenuItem runat="server" Text="Alternative">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Country">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Dance">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Electronica">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Metal">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Pop">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Rock">
                                <Items>
                                    <wijmo:C1MenuItem runat="server" Text="Bands">
                                        <Items>
                                            <wijmo:C1MenuItem runat="server" Text="Dokken">
                                            </wijmo:C1MenuItem>
                                        </Items>
                                    </wijmo:C1MenuItem>
                                    <wijmo:C1MenuItem runat="server" Text="Fan Clubs">
                                    </wijmo:C1MenuItem>
                                    <wijmo:C1MenuItem runat="server" Text="Songs">
                                    </wijmo:C1MenuItem>
                                </Items>
                            </wijmo:C1MenuItem>
                        </Items>
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Slide shows">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Red carpet">
                    </wijmo:C1MenuItem>
                </Items>
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Finance">
                <Items>
                    <wijmo:C1MenuItem runat="server" Text="Personal">
                        <Items>
                            <wijmo:C1MenuItem runat="server" Text="Loans">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Savings">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Mortgage">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Debt">
                            </wijmo:C1MenuItem>
                        </Items>
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Business">
                    </wijmo:C1MenuItem>
                </Items>
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Food &#38; Cooking">
                <Items>
                    <wijmo:C1MenuItem runat="server" Text="Breakfast">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Lunch">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Dinner">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Dessert">
                        <Items>
                            <wijmo:C1MenuItem runat="server" Text="Dump Cake">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Doritos">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Both please.">
                            </wijmo:C1MenuItem>
                        </Items>
                    </wijmo:C1MenuItem>
                </Items>
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Lifestyle">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="News">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Politics">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Sports">
            </wijmo:C1MenuItem>
        </Items>
    </wijmo:C1Menu>
    <wijmo:C1Menu runat="server" ID="C1Menu1" Orientation="Vertical">
        <Items>
            <wijmo:C1MenuItem runat="server" Text="Breaking News">
                <Items>
                    <wijmo:C1MenuItem runat="server" Text="Entertainment">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Politics">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="A&amp;E">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Sports">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Local">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Health">
                    </wijmo:C1MenuItem>
                </Items>
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Entertainment">
                <Items>
                    <wijmo:C1MenuItem runat="server" Text="Celebrity news">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Gossip">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Movies">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Music">
                        <Items>
                            <wijmo:C1MenuItem runat="server" Text="Alternative">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Country">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Dance">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Electronica">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Metal">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Pop">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Rock">
                                <Items>
                                    <wijmo:C1MenuItem runat="server" Text="Bands">
                                        <Items>
                                            <wijmo:C1MenuItem runat="server" Text="Dokken">
                                            </wijmo:C1MenuItem>
                                        </Items>
                                    </wijmo:C1MenuItem>
                                    <wijmo:C1MenuItem runat="server" Text="Fan Clubs">
                                    </wijmo:C1MenuItem>
                                    <wijmo:C1MenuItem runat="server" Text="Songs">
                                    </wijmo:C1MenuItem>
                                </Items>
                            </wijmo:C1MenuItem>
                        </Items>
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Slide shows">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Red carpet">
                    </wijmo:C1MenuItem>
                </Items>
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Finance">
                <Items>
                    <wijmo:C1MenuItem runat="server" Text="Personal">
                        <Items>
                            <wijmo:C1MenuItem runat="server" Text="Loans">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Savings">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Mortgage">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Debt">
                            </wijmo:C1MenuItem>
                        </Items>
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Business">
                    </wijmo:C1MenuItem>
                </Items>
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Food &#38; Cooking">
                <Items>
                    <wijmo:C1MenuItem runat="server" Text="Breakfast">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Lunch">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Dinner">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem runat="server" Text="Dessert">
                        <Items>
                            <wijmo:C1MenuItem runat="server" Text="Dump Cake">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Doritos">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem runat="server" Text="Both please.">
                            </wijmo:C1MenuItem>
                        </Items>
                    </wijmo:C1MenuItem>
                </Items>
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Lifestyle">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="News">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Politics">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Sports">
            </wijmo:C1MenuItem>
        </Items>
    </wijmo:C1Menu>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Description" ID="Content3">
<p>This sample demonstrates how to set the orientation of <strong>C1Menu</strong>.</p><br/>
<p>The following properties are used in this sample</p>
<ul>
<li>Orientation</li>
</ul>
<p><strong>Note</strong>: if the <strong>Mode</strong> property is set to <strong>Sliding</strong>, the<strong> Orientation</strong> property will take no effect.</p>
</asp:Content>

