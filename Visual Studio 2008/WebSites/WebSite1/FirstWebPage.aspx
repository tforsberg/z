<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FirstWebPage.aspx.vb" Inherits="FirstWebPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Welcome to Visual Web Developer -<h1 
            style="font-family: Verdana; color: #FF0000;">
&nbsp;ASP.NET Web Page<br />
            This Page is Powered by ASP.NET</h1>
    </div>
    <p>
        <asp:Label ID="Label1" runat="server" BackColor=Yellow Text="Type your Name:"></asp:Label>
    </p>
    <asp:TextBox ID="TextBox1" runat="server" Width="124px"></asp:TextBox>
    <asp:Button ID="Button1" OnClick=Button1_Click runat="server" Text="Display Name" />
    <p>
        &nbsp;</p>
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
        BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
        Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
        Width="256px">
        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
        <SelectorStyle BackColor="#CCCCCC" />
        <WeekendDayStyle BackColor="#FFFFCC" />
        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
        <OtherMonthDayStyle ForeColor="#808080" />
        <NextPrevStyle VerticalAlign="Bottom" />
        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
    </asp:Calendar>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>
    </form>
</body>
</html>
