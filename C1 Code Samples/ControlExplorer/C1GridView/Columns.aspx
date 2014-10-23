<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Columns.aspx.cs" Inherits="ControlExplorer.C1GridView.Columns" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1" />
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1" ScrollMode="Auto"
                AutoGenerateColumns="false" ShowRowHeader="true" AllowColMoving="true" AllowSorting="true">
                <Columns>
                    <wijmo:C1BoundField DataField="OrderID" HeaderText="ID" SortExpression="OrderID" DataFormatString="d"/>
                    <wijmo:C1BoundField DataField="ShipName" HeaderText="Ship name" SortExpression="ShipName" />
                    <wijmo:C1BoundField DataField="ShipCity" HeaderText="Ship city" SortExpression="ShipCity"/>
                    <wijmo:C1Band HeaderText="Dates">
                        <Columns>
                            <wijmo:C1BoundField DataField="OrderDate" HeaderText="Order date" DataFormatString="d" SortExpression="OrderDate" />
                            <wijmo:C1BoundField DataField="RequiredDate" HeaderText="Required date" DataFormatString="d" SortExpression="RequiredDate" />
                            <wijmo:C1BoundField DataField="ShippedDate" HeaderText="Shipped date" DataFormatString="d" SortExpression="ShippedDate" />
                        </Columns>
                    </wijmo:C1Band>
                </Columns>
            </wijmo:C1GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"
        ProviderName="System.Data.OleDb" SelectCommand="SELECT TOP 10 [OrderID], [ShipName], [ShipCity], [OrderDate], [RequiredDate], [ShippedDate] FROM ORDERS">
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
      This sample shows how to use bands to organize column headers into a hierarchical structure.
      It also shows you how to sort columns and use drag-n-drop to reorder columns.
    </p>

    <p>
       The following column properties and techniques are used in this sample:
    </p>
    <ul>
        <li><strong>AllowColMoving</strong> - to allow drag-n-drop for reordering columns.</li>
        <li><strong>AllowSorting</strong> - to allow column sorting.</li>
        <li>The <strong>OrderDate</strong>, <strong>RequiredDate</strong>, and 
            <strong>ShippedDate </strong>columns are placed into the <strong>C1Band</strong> column to organize multilevel column headers.</li>
    </ul>

    <p>
        Click a column header to sort by that column.
    </p>
    <p>
        Move a column by dragging a source column header onto a target column header. Columns can be inserted
        either to the right or to the left of the target column, the insertion point is denoted by the insertion arrows between the column header. 
        To add a column to a band, the column should be dropped to the center of banded header.
    </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
			<div class="settingcontainer">
				<div class="settingcontent">
					<ul>
						<li class="fullwidth"> <asp:CheckBox ID="CheckBox4" runat="server" AutoPostBack="true" Text="Show Row Header"
                    Checked="true" OnCheckedChanged="CheckBox1_CheckedChanged" /></li>
						<li class="fullwidth">
							<asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true" Text="Allow Column Moving"
                    Checked="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
						</li>
						<li class="fullwidth">
							<asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="true" Text="Allow Sorting"
                    Checked="true" OnCheckedChanged="CheckBox1_CheckedChanged" />
						</li>
					</ul>
				</div>
			</div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
