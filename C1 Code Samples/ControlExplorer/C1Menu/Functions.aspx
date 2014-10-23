<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Functions.aspx.cs" Inherits="ControlExplorer.C1Menu.Functions" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Menu"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        div#ctl00_ctl00_MainContent_WidgetTabs_ctl00
        {
            overflow: visible;
            overflow-y: visible;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1Menu runat="server" ID="Menu1" Mode="Sliding">
		<Items>
			<wijmo:C1MenuItem Text="MenuItem" runat="server">
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem1" Text="Breaking News" runat="server">
				<Items>
					<wijmo:C1MenuItem runat="server" Header="true" Text="header2">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem runat="server" Separator="true">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem runat="server" Text="Entertainment">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem2" runat="server" Text="Politics">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem3" runat="server" Text="A&amp;E">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem4" runat="server" Text="Sports">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem5" runat="server" Text="Local">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem6" runat="server" Text="Health">
					</wijmo:C1MenuItem>
				</Items>
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem7" runat="server" Text="Entertainment">
				<Items>
					<wijmo:C1MenuItem ID="C1MenuItem8" runat="server" Text="Celebrity news">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem9" runat="server" Text="Gossip">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem10" runat="server" Text="Movies">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem11" runat="server" Text="Music">
						<Items>
							<wijmo:C1MenuItem ID="C1MenuItem12" runat="server" Text="Alternative">
							</wijmo:C1MenuItem>
							<wijmo:C1MenuItem ID="C1MenuItem13" runat="server" Text="Country">
							</wijmo:C1MenuItem>
							<wijmo:C1MenuItem ID="C1MenuItem14" runat="server" Text="Dance">
							</wijmo:C1MenuItem>
							<wijmo:C1MenuItem ID="C1MenuItem15" runat="server" Text="Electronica">
							</wijmo:C1MenuItem>
							<wijmo:C1MenuItem ID="C1MenuItem16" runat="server" Text="Metal">
							</wijmo:C1MenuItem>
							<wijmo:C1MenuItem ID="C1MenuItem17" runat="server" Text="Pop">
							</wijmo:C1MenuItem>
							<wijmo:C1MenuItem ID="C1MenuItem18" runat="server" Text="Rock">
								<Items>
									<wijmo:C1MenuItem ID="C1MenuItem19" runat="server" Text="Bands">
										<Items>
											<wijmo:C1MenuItem ID="C1MenuItem22" runat="server" Text="Dokken">
											</wijmo:C1MenuItem>
										</Items>
									</wijmo:C1MenuItem>
									<wijmo:C1MenuItem ID="C1MenuItem20" runat="server" Text="Fan Clubs">
									</wijmo:C1MenuItem>
									<wijmo:C1MenuItem ID="C1MenuItem21" runat="server" Text="Songs">
									</wijmo:C1MenuItem>
								</Items>
							</wijmo:C1MenuItem>
						</Items>
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem23" runat="server" Text="Slide shows">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem24" runat="server" Text="Red carpet">
					</wijmo:C1MenuItem>
				</Items>
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem25" Text="Finance" runat="server">
				<Items>
					<wijmo:C1MenuItem ID="C1MenuItem26" Text="Personal" runat="server">
						<Items>
							<wijmo:C1MenuItem ID="C1MenuItem28" Text="Loans" runat="server">
							</wijmo:C1MenuItem>
							<wijmo:C1MenuItem ID="C1MenuItem29" Text="Savings" runat="server">
							</wijmo:C1MenuItem>
							<wijmo:C1MenuItem ID="C1MenuItem30" Text="Mortgage" runat="server">
							</wijmo:C1MenuItem>
							<wijmo:C1MenuItem ID="C1MenuItem31" Text="Debt" runat="server">
							</wijmo:C1MenuItem>
						</Items>
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem27" Text="Business" runat="server">
					</wijmo:C1MenuItem>
				</Items>
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem32" Text="Food &#38; Cooking" runat="server">
				<Items>
					<wijmo:C1MenuItem ID="C1MenuItem33" Text="Breakfast" runat="server">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem34" Text="Lunch" runat="server">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem35" Text="Dinner" runat="server">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem36" Text="Dessert" runat="server">
						<Items>
							<wijmo:C1MenuItem ID="C1MenuItem37" Text="Dump Cake" runat="server">
							</wijmo:C1MenuItem>
							<wijmo:C1MenuItem ID="C1MenuItem38" Text="Doritos" runat="server">
							</wijmo:C1MenuItem>
							<wijmo:C1MenuItem ID="C1MenuItem39" Text="Both please" runat="server">
							</wijmo:C1MenuItem>
						</Items>
					</wijmo:C1MenuItem>
				</Items>
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem40" Text="Lifestyle" runat="server">
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem41" Text="News" runat="server">
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem42" Text="Politics" runat="server">
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem43" Text="Sports" runat="server">
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem44" Text="Novels" runat="server">
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem45" Text="Magazine" runat="server">
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem46" Text="Books" runat="server">
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem47" Text="Education" runat="server">
			</wijmo:C1MenuItem>
		</Items>
	</wijmo:C1Menu>
    <br/>
	<p>
		<input type="button" id="previous" value="Previous" style="padding:3px 4px 3px 4px; margin-right:5px;" />
		<input type="button" id="next" value="Next" style="padding:3px 4px 3px 4px; margin-right:5px;" />
		<input type="button" id="previousPage" value="Previous Page" style="padding:3px 4px 3px 4px; margin-right:5px;" />
		<input type="button" id="nextPage" value="Next Page" style="padding:3px 4px 3px 4px; margin-right:5px;" />
	</p>
		<script type="text/javascript">
			var count = 0;
			$(document).ready(function () {
				$("#previous").click(function () {
					$("#<%= Menu1.ClientID %>").focus().c1menu("previous");
					count++;
				});
				$("#next").click(function () {
					$("#<%= Menu1.ClientID %>").focus().c1menu("next");
					count++;
				});
				$("#previousPage").click(function () {
					if (count === 0) {
						$("#<%= Menu1.ClientID %>").find(".wijmo-wijmenu-link:first").click();
					}
					$("#<%= Menu1.ClientID %>").c1menu("previousPage");
					count++;
				});
				$("#nextPage").click(function () {
					if (count === 0) {
						$("#<%= Menu1.ClientID %>").find(".wijmo-wijmenu-link:first").click();
					}
					$("#<%= Menu1.ClientID %>").c1menu("nextPage");
					count++;
				});
			});


	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>The <strong>C1Menu</strong> control has an extensive client-side API.  This sample shows how to call the client-side methods using the same patterns you would see in jQuery UI.
</p>
<p>This sample illustrates the following client-side functions: </p>
	<ul>
		<li>previous</li>
		<li>next</li>
		<li>previousPage</li>
		<li>nextPage</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	
</asp:Content>
