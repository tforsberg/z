<%@ Page Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1Excel.CreatingWorkSheets" %>

<asp:Content id="content1" ContentPlaceHolderID="Head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <asp:Button ID="btnexcel" runat="server" OnClick="btnexcel_Click" Text="Generate Excel" />
        <br/>
        <asp:Image ID="xlsimage" runat="server" ImageUrl="~/Images/excelWorkSheets.png" />
     </asp:Content>

    <asp:Content ID="content3" ContentPlaceHolderID="Description" runat="server">
		<p>
        With ComponentOne Excel for .NET you can create Microsoft Excel files directly from your application's code. 
       The possibilities are endless with an easy-to-manipulate Excel object model exposed in your code. Create Excel files 
       from data that doesn't directly support Excel exportation like any grid, schedule or chart. Excel for .NET supports formulas, 
       cell styles and Excel formatting. This sample creates a workbook with NorthWind product information using the C1XLBook control. 
       Each product category is placed on a separate worksheet.</p>
    </asp:Content>