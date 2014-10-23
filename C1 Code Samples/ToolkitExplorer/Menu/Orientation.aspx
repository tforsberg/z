<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Orientation.aspx.cs" Inherits="Menu_Orientation" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Menu"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <ul id="menu1">
                <li><a href="#">Breaking News</a>
                    <ul>
                        <li><a href="#">Entertainment</a></li>
                        <li><a href="#">Politics</a></li>
                        <li><a href="#">A&amp;E</a></li>
                        <li><a href="#">Sports</a> </li>
                        <li><a href="#">Local</a></li>
                        <li><a href="#">Health</a></li>
                    </ul>
                </li>
                <li><a href="#">Entertainment</a>
                    <ul>
                        <li><a href="#">Celebrity news</a></li>
                        <li><a href="#">Gossip</a></li>
                        <li><a href="#">Movies</a></li>
                        <li><a href="#">Music</a>
                            <ul>
                                <li><a href="#">Alternative</a></li>
                                <li><a href="#">Country</a></li>
                                <li><a href="#">Dance</a></li>
                                <li><a href="#">Electronica</a></li>
                                <li><a href="#">Metal</a></li>
                                <li><a href="#">Pop</a></li>
                                <li><a href="#">Rock</a>
                                    <ul>
                                        <li><a href="#">Bands</a>
                                            <ul>
                                                <li><a href="#">Dokken</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Fan Clubs</a></li>
                                        <li><a href="#">Songs</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li><a href="#">Slide shows</a></li>
                        <li><a href="#">Red carpet</a></li>
                    </ul>
                </li>
                <li><a href="#">Finance</a>
                    <ul>
                        <li><a href="#">Personal</a>
                            <ul>
                                <li><a href="#">Loans</a></li>
                                <li><a href="#">Savings</a></li>
                                <li><a href="#">Mortgage</a></li>
                                <li><a href="#">Debt</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Business</a></li>
                    </ul>
                </li>
                <li><a href="#">Food &#38; Cooking</a>
                    <ul>
                        <li><a href="#">Breakfast</a></li>
                        <li><a href="#">Lunch</a></li>
                        <li><a href="#">Dinner</a></li>
                        <li><a href="#">Dessert</a>
                            <ul>
                                <li><a href="#">Dump Cake</a></li>
                                <li><a href="#">Doritos</a></li>
                                <li><a href="#">Both please.</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="#">Lifestyle</a></li>
                <li><a href="#">News</a></li>
                <li><a href="#">Politics</a></li>
                <li><a href="#">Sports</a></li>
            </ul>
    </asp:Panel>
    <wijmo:C1MenuExtender ID="MenuExtender1" runat="server" TargetControlID="Panel1" />
    <asp:Panel ID="Panel2" runat="server">
        <ul id="menu2">
                <li><a href="#">Breaking News</a>
                    <ul>
                        <li><a href="#">Entertainment</a></li>
                        <li><a href="#">Politics</a></li>
                        <li><a href="#">A&amp;E</a></li>
                        <li><a href="#">Sports</a> </li>
                        <li><a href="#">Local</a></li>
                        <li><a href="#">Health</a></li>
                    </ul>
                </li>
                <li><a href="#">Entertainment</a>
                    <ul>
                        <li><a href="#">Celebrity news</a></li>
                        <li><a href="#">Gossip</a></li>
                        <li><a href="#">Movies</a></li>
                        <li><a href="#">Music</a>
                            <ul>
                                <li><a href="#">Alternative</a></li>
                                <li><a href="#">Country</a></li>
                                <li><a href="#">Dance</a></li>
                                <li><a href="#">Electronica</a></li>
                                <li><a href="#">Metal</a></li>
                                <li><a href="#">Pop</a></li>
                                <li><a href="#">Rock</a>
                                    <ul>
                                        <li><a href="#">Bands</a>
                                            <ul>
                                                <li><a href="#">Dokken</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Fan Clubs</a></li>
                                        <li><a href="#">Songs</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li><a href="#">Slide shows</a></li>
                        <li><a href="#">Red carpet</a></li>
                    </ul>
                </li>
                <li><a href="#">Finance</a>
                    <ul>
                        <li><a href="#">Personal</a>
                            <ul>
                                <li><a href="#">Loans</a></li>
                                <li><a href="#">Savings</a></li>
                                <li><a href="#">Mortgage</a></li>
                                <li><a href="#">Debt</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Business</a></li>
                    </ul>
                </li>
                <li><a href="#">Food &#38; Cooking</a>
                    <ul>
                        <li><a href="#">Breakfast</a></li>
                        <li><a href="#">Lunch</a></li>
                        <li><a href="#">Dinner</a></li>
                        <li><a href="#">Dessert</a>
                            <ul>
                                <li><a href="#">Dump Cake</a></li>
                                <li><a href="#">Doritos</a></li>
                                <li><a href="#">Both please.</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="#">Lifestyle</a></li>
                <li><a href="#">News</a></li>
                <li><a href="#">Politics</a></li>
                <li><a href="#">Sports</a></li>
            </ul>
    </asp:Panel>
    <wijmo:C1MenuExtender ID="MenuExtender2" runat="server" Orientation="Vertical" TargetControlID="Panel2" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Description" ID="Content3">
<p>This sample demonstrates how to set the orientation of C1MenuExtender.</p><br/>
<p>The following properties are used in this sample</p>
<ul>
<li>Orientation</li>
</ul>
<p><strong>Note</strong>: if the <strong>Mode</strong> property is set to <strong>Sliding</strong>, the<strong> Orientation</strong> property will take no effect.</p>
</asp:Content>

