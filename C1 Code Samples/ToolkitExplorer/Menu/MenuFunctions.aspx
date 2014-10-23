<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="MenuFunctions.aspx.cs" Inherits="Menu_MenuFunctions" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Menu"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <ul id="menu1">
            <li><a href="#">MenuItem</a></li>
            <li><a href="#">Breaking News</a>
                <ul>
                    <li class="header">
                        <h3>
                            header2</h3>
                    </li>
                    <li class="separator">s1</li>
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
            <li><a href="#">Novels</a></li>
            <li><a href="#">Magazine</a></li>
            <li><a href="#">Books</a></li>
            <li><a href="#">Education</a></li>
        </ul>
    </asp:Panel>
    <wijmo:C1MenuExtender ID="MenuExtender1" runat="server" Mode="Sliding" TargetControlID="Panel1" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Description" ID="Content3">
<p>The <strong>C1MenuExtender</strong> control has an extensive client-side API.  This sample shows how to call the client-side methods using the same patterns you would see in jQuery UI.
</p>
<p>This sample illustrates the following client-side functions: </p>
	<ul>
		<li>previous</li>
		<li>next</li>
		<li>previousPage</li>
		<li>nextPage</li>
	</ul>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ControlOptions" ID="Content4">
    <p>
        <input type="button" id="previous" value="previous" />
        <input type="button" id="next" value="next" />
        <input type="button" id="previousPage" value="previousPage" />
        <input type="button" id="nextPage" value="nextPage" />
    </p>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#previous").click(function () {
                $("#<%=Panel1.ClientID %>").focus().wijmenu("previous");
            });
            $("#next").click(function () {
                $("#<%=Panel1.ClientID %>").focus().wijmenu("next");
            });
            $("#previousPage").click(function () {
                $("#<%=Panel1.ClientID %>").focus().wijmenu("previousPage");
            });
            $("#nextPage").click(function () {
                $("#<%=Panel1.ClientID %>").focus().wijmenu("nextPage");
            });
        });
    </script>
</asp:Content>
