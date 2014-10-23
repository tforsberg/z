<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1Calendar_Popup" Codebehind="Popup.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>

    
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<wijmo:C1Calendar ID="C1Calendar1" runat="server" PopupMode="true" OnClientSelectedDatesChanged="SelectDate" >
</wijmo:C1Calendar>

<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

<script type="text/javascript">

    $(function () {
		$("#<%=TextBox1.ClientID %>").click(function () {
		    $("#<%=C1Calendar1.ClientID %>").c1calendar("popup", {
		        of: $("#<%=TextBox1.ClientID %>"),
                offset: '0 2'
            });
        })
    });

    function SelectDate() {
        var selDate = $(this).c1calendar("getSelectedDate");
        if (!!selDate) $("#<%=TextBox1.ClientID %>").val(selDate.toDateString());
    }

	
</script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
<p>
    <strong>C1Calendar </strong>can work in pop-up mode.
</p>

<p>
Popup mode is enabled if the <strong>PopupMode </strong>property is set to True.
</p>

<p>
In pop-up mode, calendar is rendered hidden to client. User has to call the methods to pop it out, this is demonstrated in this sample.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

