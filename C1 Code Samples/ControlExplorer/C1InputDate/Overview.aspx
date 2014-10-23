<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1InputDate_Overview" CodeBehind="Overview.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

	<ul class="ui-helper-reset">
		<li>
			<label>dateFormat='T' (Long time pattern)</label>
			<wijmo:C1InputDate ID="C1InputDate1" runat="server" DateFormat="T"></wijmo:C1InputDate>
		</li>
		<li>
			<label>dateFormat='d' (Short date pattern)</label>
			<wijmo:C1InputDate ID="C1InputDate2" runat="server" DateFormat="d"></wijmo:C1InputDate>
		</li>
		<li>
			<label>dateFormat='g' (General Date & Short Time)</label>
			<wijmo:C1InputDate ID="C1InputDate3" runat="server" DateFormat="g"></wijmo:C1InputDate>
		</li>
		<li>
			<label>dateFormat='U' (Universal Date & Long Time)</label>
			<wijmo:C1InputDate ID="C1InputDate4" runat="server" Width="300" DateFormat="U"></wijmo:C1InputDate>
		</li>
	</ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">

	<p>
		The <strong>C1InputDate</strong> is an input control that is specialized for editing Date/Time values. 
    This sample shows a simple default input. Other samples in this section 
    illustrate how to use <strong>C1InputDate </strong>as a date picker and how to 
    utilize a drop-down calendar for date selection. 
	</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

