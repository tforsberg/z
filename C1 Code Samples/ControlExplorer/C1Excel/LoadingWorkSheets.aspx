<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="LoadingWorkSheets.aspx.cs" Inherits="ControlExplorer.C1Excel.LoadingWorkSheets" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>



<asp:Content id="content1" ContentPlaceHolderID="Head" runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
      <wijmo:C1CompositeChart ID="weatherchart" runat="server" Width="800" Height="500">

      </wijmo:C1CompositeChart>
   
    </asp:Content>

    <asp:Content ID="content3" ContentPlaceHolderID="Description" runat="server">
		<p>
       Excel for .NET makes it easy to read Excel files into your applications and you don't even need to have Microsoft® Excel installed! 
       You can use the data from your Excel files in any number of ways. In this demo we use the C1XLBook component to load and extract the data 
       into arrays which are used as the data source for our C1Chart control.</p>
    </asp:Content>