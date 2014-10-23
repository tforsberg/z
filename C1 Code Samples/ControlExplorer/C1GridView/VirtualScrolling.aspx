<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="VirtualScrolling.aspx.cs" Inherits="ControlExplorer.C1GridView.WebForm1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
    
    <wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1" ScrollMode="Both" Height="400px" AllowVirtualScrolling="true" PageSize="10">
		<CallbackSettings Action="Scrolling" />
    </wijmo:C1GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"
        ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM ORDERS">
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
  <p>
    The <strong>C1GridView</strong> supports virtual scrolling to speed up rendering when large amount of data is used.

	<p>
         The following properties are used in this sample:
    </p>
    <ul>
        <li><strong>AllowVirtualScrolling</strong> - to enable the virtual scrolling.</li>
        <li><strong>CallbackSettings.Action</strong> - to enable the virtual scrolling mode in which new portions of data will be requested from the server via callbacks (when this mode is used some features like column grouping are not supported).</li>
        <li><strong>PageSize</strong> - to specify the amount of simultaneously rendered rows.</li>
    </ul>
  </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
