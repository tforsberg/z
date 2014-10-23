<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DropDown.aspx.cs" Inherits="ControlExplorer.C1InputText.DropDown" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>
<%@ Register TagPrefix="wijmo" Namespace="C1.Web.Wijmo.Extenders.C1ComboBox" Assembly="C1.Web.Wijmo.Extenders.3, Version=3.5.20132.132, Culture=neutral, PublicKeyToken=9b75583953471eea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    	<asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
     <wijmo:C1InputTextExtender TargetControlID="TextBox1" ID="C1InputText1" runat="server" Format="a" ShowDropDownButton="True">
         <Pickers>
             <List>
                 <wijmo:C1ComboBoxItem Label="red" Value="red" />
                 <wijmo:C1ComboBoxItem Label="green" Value="green" />
                 <wijmo:C1ComboBoxItem Label="blue" Value="blue" />
                 <wijmo:C1ComboBoxItem Label="yellow" Value="yellow" />
             </List>
         </Pickers>
     </wijmo:C1InputTextExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
</asp:Content>
