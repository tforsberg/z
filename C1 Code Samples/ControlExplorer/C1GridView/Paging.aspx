<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Paging.aspx.cs" Inherits="ControlExplorer.C1GridView.Paging" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManger1" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1"
                AutoGenerateColumns="true" ShowRowHeader="true" AllowPaging="true" PageSize="10" CallbackSettings-Action="All">
            </wijmo:C1GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"
        ProviderName="System.Data.OleDb" SelectCommand="SELECT [OrderID], [ShipName], [ShipCity], [ShippedDate] FROM ORDERS">
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
  <p>
    Paging is allowed if the <strong>AllowPaging</strong> property is set to True.
  </p>

  <p>
   The following common properties are related to paging:
  </p>
  <ul>
    <li><strong>PageSize</strong> - determines the number of rows to place on a single page.</li>
    <li><strong>PagerSettings</strong> - determines the appearance of the pager, such as position (top\ bottom), mode (numeric, firstLast) etc.</li>
  </ul>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
			<div class="settingcontainer">
				<div class="settingcontent">
					<ul>
						<li><asp:Label runat="server" ID="lblPosition" Text="Position" AssociatedControlID="dplPosition"></asp:Label>
				<asp:DropDownList runat="server" ID="dplPosition" AutoPostBack="true" OnSelectedIndexChanged="dplPosition_SelectedIndexChanged">
					<asp:ListItem Value="Top">Top</asp:ListItem>
                    <asp:ListItem Value="Bottom" Selected="True">Bottom</asp:ListItem>
                    <asp:ListItem Value="TopAndBottom">Top and Bottom</asp:ListItem>
				</asp:DropDownList></li>
						<li><asp:Label AssociatedControlID="dplMode" runat="server" ID="lblMode" Text="Mode"></asp:Label>
				<asp:DropDownList runat="server" ID="dplMode" AutoPostBack="true" OnSelectedIndexChanged="dplMode_SelectedIndexChanged">
					 <asp:ListItem Value="Numeric" Selected="True">Numeric</asp:ListItem>
                    <asp:ListItem Value="NumericFirstLast">Numeric (First &amp; Last)</asp:ListItem>
                    <asp:ListItem Value="NextPrevious">Next/Previous</asp:ListItem>
                    <asp:ListItem Value="NextPreviousFirstLast">Next/Previous (First &amp; Last)</asp:ListItem>
				</asp:DropDownList></li>
						<li><asp:Label runat="server" ID="lblSize" Text="Page Size" AssociatedControlID="dplSize"></asp:Label>
				<asp:DropDownList runat="server" ID="dplSize" OnSelectedIndexChanged="dplSize_SelectedIndexChanged" AutoPostBack="true">
					<asp:ListItem Text="5"></asp:ListItem>
					<asp:ListItem Text="10" Selected="True"></asp:ListItem>
					<asp:ListItem Text="25"></asp:ListItem>
					<asp:ListItem Text="50"></asp:ListItem>
					<asp:ListItem Text="100"></asp:ListItem>
				</asp:DropDownList></li>
					</ul>
				</div>
			</div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
