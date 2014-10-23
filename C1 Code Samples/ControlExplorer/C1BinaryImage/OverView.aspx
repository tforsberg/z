<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="OverView.aspx.cs" Inherits="ControlExplorer.C1BinaryImage.OverView" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1BinaryImage"
    TagPrefix="wijmo" %>
<asp:Content ContentPlaceHolderID="Head" ID="Content1" runat="server">
	<style type="text/css">
		.dataList
		{
			margin: 5px;
			padding: 5px;
			border: 1px solid #CCCCCC;
			width: 168px;
			height: 180px;
		}
       
	</style>
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" ID="Content2" runat="server">
	<asp:DataList ID="DataList1" runat="server" DataKeyField="PhotoID" 
		DataSourceID="AccessDataSource1" RepeatDirection="Horizontal" RepeatColumns="4" Width="100%">
			<ItemTemplate>
				<div class="dataList">
					<wijmo:C1BinaryImage ID="BinaryImage1" runat="server" AlternateText='<%# Eval("Place") %>'
						ImageData='<%# Eval("Photo") %>' SavedImageName='<%# Eval("Place") %>'
						ToolTip='<%# Eval("Place") %>' />
					<br />
					<br />
                    <asp:Label Text="ID: "  runat="server" />
					<asp:Label ID="Id"  runat="server" Text='<%# Eval("PhotoID") %>' />
                    <br />
                     <asp:Label Text="Place: "  runat="server" />
                    <asp:Label ID="Place" runat="server" Text='<%# Eval("Place") %>' />
                    <br />
                     <asp:Label Text="Country: " runat="server" />
                    <asp:Label ID="Country" runat="server" Text='<%# Eval("Country") %>' />
                    <br />
				</div>
			</ItemTemplate>
	</asp:DataList>
	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/C1NWind.mdb" 
		SelectCommand="SELECT top 8 [PhotoID], [Place], [Country], [Photo] FROM [Photos]">
	</asp:AccessDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
    <p>
        <strong>C1BinaryImage</strong> provides an easy way to display an image which is stored as binary data directly in the database.  The control can be used in any data bound control (Repeater, DataList, GridView etc.) to display images which originate from binary image field in the data source.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>
