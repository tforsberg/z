<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Scrolling.aspx.cs" Inherits="ControlExplorer.C1GridView.Scrolling" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
    
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1" ScrollMode="Auto" 
				 StaticRowIndex="1" AllowKeyboardNavigation="true" StaticColumnIndex="0" Height="400px">
            </wijmo:C1GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"
        ProviderName="System.Data.OleDb" SelectCommand="SELECT TOP 30 * FROM ORDERS">
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
  <p>
                This sample shows how to create a scrollable grid.
            </p>
            <p>
                To enable scrolling, you should start by setting the grid's height, then set
                the <b>ScrollMode</b> property to "auto".
            </p>
            <p>
                You may prevent some rows and columns from scrolling (freeze them) by setting
                the <b>StaticRowIndex</b> and <b>StaticColumnIndex</b> properties.
            </p>
            <p>
                You may also set the <b>AllowKeyboardNavigation</b> property to true so users
                can scroll the grid using the keyboard.
            </p>
</asp:Content>

