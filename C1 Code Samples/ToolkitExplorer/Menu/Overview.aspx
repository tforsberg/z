<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Overview.aspx.cs" Inherits="Menu_Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Menu" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h3>
        Default Menu</h3>
    <asp:Panel ID="Panel1" runat="server">
        <ul>
            <li><a href="#">Breaking News</a>
                <ul>
                    <li>
                        <h3>
                            header</h3>
                    </li>
                    <li><a href="#">Entertainment</a></li>
                    <li><a href="#">Politics</a></li>
                    <li><a href="#">A&amp;E</a></li>
                    <li><a href="#">Sports</a>
                        <ul>
                            <li><a href="#">Baseball</a></li>
                            <li><a href="#">Basketball</a></li>
                            <li><a href="#">A really long label would wrap nicely as you can see</a></li>
                            <li><a href="#">Swimming</a>
                                <ul>
                                    <li><a href="#">High School</a></li>
                                    <li><a href="#">College</a></li>
                                    <li><a href="#">Professional</a>
                                        <ul>
                                            <li><a href="#">Mens Swimming</a>
                                                <ul>
                                                    <li><a href="#">News</a></li>
                                                    <li><a href="#">Events</a></li>
                                                    <li><a href="#">Awards</a></li>
                                                    <li><a href="#">Schedule</a></li>
                                                    <li><a href="#">Team Members</a></li>
                                                    <li><a href="#">Fan Site</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Womens Swimming</a>
                                                <ul>
                                                    <li><a href="#">News</a></li>
                                                    <li><a href="#">Events</a></li>
                                                    <li><a href="#">Awards</a></li>
                                                    <li><a href="#">Schedule</a></li>
                                                    <li><a href="#">Team Members</a></li>
                                                    <li><a href="#">Fan Site</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Adult Recreational</a></li>
                                    <li><a href="#">Youth Recreational</a></li>
                                    <li><a href="#">Senior Recreational</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Tennis</a></li>
                            <li><a href="#">Ice Skating</a></li>
                            <li><a href="#">Javascript Programming</a></li>
                            <li><a href="#">Running</a></li>
                            <li><a href="#">Walking</a></li>
                        </ul>
                    </li>
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
            <li><a href="#">Sports</a>
                <ul>
                    <li><a href="#">Baseball</a></li>
                    <li><a href="#">Basketball</a></li>
                    <li><a href="#">Swimming</a>
                        <ul>
                            <li><a href="#">High School</a></li>
                            <li><a href="#">College</a></li>
                            <li><a href="#">Professional</a>
                                <ul>
                                    <li><a href="#">Mens Swimming</a>
                                        <ul>
                                            <li><a href="#">News</a></li>
                                            <li><a href="#">Events</a></li>
                                            <li><a href="#">Awards</a></li>
                                            <li><a href="#">Schedule</a></li>
                                            <li><a href="#">Team Members</a></li>
                                            <li><a href="#">Fan Site</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Womens Swimming</a>
                                        <ul>
                                            <li><a href="#">News</a></li>
                                            <li><a href="#">Events</a></li>
                                            <li><a href="#">Awards</a></li>
                                            <li><a href="#">Schedule</a></li>
                                            <li><a href="#">Team Members</a></li>
                                            <li><a href="#">Fan Site</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="#">Adult Recreational</a></li>
                            <li><a href="#">Youth Recreational</a></li>
                            <li><a href="#">Senior Recreational</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Tennis</a></li>
                    <li><a href="#">Ice Skating</a></li>
                    <li><a href="#">Javascript Programming</a></li>
                    <li><a href="#">Running</a></li>
                    <li><a href="#">Walking</a></li>
                </ul>
            </li>
        </ul>
    </asp:Panel>
    <wijmo:C1MenuExtender ID="MenuExtender1" runat="server" TargetControlID="Panel1" />
    <h3>iPad Style Menu</h3>
    <asp:Panel ID="Panel2" runat="server">
        <ul>
            <li><a href="#">Breaking News</a>
                <ul>
                    <li>
                        <h3>
                            header</h3>
                    </li>
                    <li><a href="#">Entertainment</a></li>
                    <li><a href="#">Politics</a></li>
                    <li><a href="#">A&amp;E</a></li>
                    <li><a href="#">Sports</a>
                        <ul>
                            <li><a href="#">Baseball</a></li>
                            <li><a href="#">Basketball</a></li>
                            <li><a href="#">A really long label would wrap nicely as you can see</a></li>
                            <li><a href="#">Swimming</a>
                                <ul>
                                    <li><a href="#">High School</a></li>
                                    <li><a href="#">College</a></li>
                                    <li><a href="#">Professional</a>
                                        <ul>
                                            <li><a href="#">Mens Swimming</a>
                                                <ul>
                                                    <li><a href="#">News</a></li>
                                                    <li><a href="#">Events</a></li>
                                                    <li><a href="#">Awards</a></li>
                                                    <li><a href="#">Schedule</a></li>
                                                    <li><a href="#">Team Members</a></li>
                                                    <li><a href="#">Fan Site</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">Womens Swimming</a>
                                                <ul>
                                                    <li><a href="#">News</a></li>
                                                    <li><a href="#">Events</a></li>
                                                    <li><a href="#">Awards</a></li>
                                                    <li><a href="#">Schedule</a></li>
                                                    <li><a href="#">Team Members</a></li>
                                                    <li><a href="#">Fan Site</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Adult Recreational</a></li>
                                    <li><a href="#">Youth Recreational</a></li>
                                    <li><a href="#">Senior Recreational</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Tennis</a></li>
                            <li><a href="#">Ice Skating</a></li>
                            <li><a href="#">Javascript Programming</a></li>
                            <li><a href="#">Running</a></li>
                            <li><a href="#">Walking</a></li>
                        </ul>
                    </li>
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
            <li><a href="#">Sports</a>
                <ul>
                    <li><a href="#">Baseball</a></li>
                    <li><a href="#">Basketball</a></li>
                    <li><a href="#">Swimming</a>
                        <ul>
                            <li><a href="#">High School</a></li>
                            <li><a href="#">College</a></li>
                            <li><a href="#">Professional</a>
                                <ul>
                                    <li><a href="#">Mens Swimming</a>
                                        <ul>
                                            <li><a href="#">News</a></li>
                                            <li><a href="#">Events</a></li>
                                            <li><a href="#">Awards</a></li>
                                            <li><a href="#">Schedule</a></li>
                                            <li><a href="#">Team Members</a></li>
                                            <li><a href="#">Fan Site</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Womens Swimming</a>
                                        <ul>
                                            <li><a href="#">News</a></li>
                                            <li><a href="#">Events</a></li>
                                            <li><a href="#">Awards</a></li>
                                            <li><a href="#">Schedule</a></li>
                                            <li><a href="#">Team Members</a></li>
                                            <li><a href="#">Fan Site</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="#">Adult Recreational</a></li>
                            <li><a href="#">Youth Recreational</a></li>
                            <li><a href="#">Senior Recreational</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Tennis</a></li>
                    <li><a href="#">Ice Skating</a></li>
                    <li><a href="#">Javascript Programming</a></li>
                    <li><a href="#">Running</a></li>
                    <li><a href="#">Walking</a></li>
                </ul>
            </li>
        </ul>
    </asp:Panel>
    <wijmo:C1MenuExtender ID="MenuExtender2" runat="server" Mode="Sliding" TargetControlID="Panel2" />
</asp:Content>
<asp:Content ContentPlaceHolderID="Description" ID="Content3" runat="server">
	<p>
		Create multi-level menus with animation effects, images and check box items, interactive
		item scrolling, and more using the <strong>C1MenuExtender</strong> control. You can even create a pop-up
		menu for context help within your application. The samples in this section will 
        show you how to use several features of the control, such as orientation, 
        client-side functions, triggers, and much more.</p>
</asp:Content>
