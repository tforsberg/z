<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomEra.aspx.cs" Inherits="ControlExplorer.C1InputDate.CustomEra" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        
    <script type="text/javascript">
        window.eras = [{ name: "明治", abbreviation: "明", symbol: "Meiji", startDate: "1868-09-08", shortcuts: "1,M" },
{ name: "大正", abbreviation: "大", symbol: "Taisho", startDate: "1912-07-30", shortcuts: "2,T" },
{ name: "昭和", abbreviation: "昭", symbol: "Showa", startDate: "1926-12-25", shortcuts: "3,S" },
{ name: "平成", abbreviation: "平", symbol: "Heisei", startDate: "1989-01-08", shortcuts: "4,H" },
{ name: "新历", abbreviation: "新", symbol: "After", startDate: "2087-12-31", shortcuts: "5,A" }];
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
	<asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
        <wijmo:C1InputDateExtender ID="C1InputDate1" runat="server"  TargetControlID="TextBox1" DisplayFormat="ggg ee/MM/dd" Placeholder="Birth date">
    </wijmo:C1InputDateExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
     <p>
                This sample demonstrates the custom era setting, date widget will test whether the <b> windows.era </b> has been set, it has the valid era setting, then the setting will be applied to the date widget.</p>
</asp:Content>
