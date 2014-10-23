<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="MultiViews.aspx.cs" Inherits="Calendar_MultiViews" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Calendar" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

	<asp:Panel ID="Panel1" runat="server">
	</asp:Panel>

	<wijmo:C1CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Panel1" MonthRows="2" MonthCols="3" />

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
C1CalendarExtender can display multiple months at one time.
</p>

<p>
You can control how many months are displayed in each row and column by setting the MonthRows and MonthCols properties. 
</p>

<p>
Preview and quick navigation features are not supported in multiple months view.
</p>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<div class="demo-options">
			<!-- Begin options markup -->
			<div class="option-row">
				<label for="rows">Rows</label>
				<select name="rows" id="rows">
					<option value="1">1</option>
					<option value="2" selected="selected">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
				</select>
			</div>
			<div class="option-row">
				<label for="cols">Columns</label>
				<select name="cols" id="cols">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3" selected="selected">3</option>
					<option value="4">4</option>
				</select>
			</div>
			<!-- End options markup -->
		</div>
	</div>

	<script type="text/javascript">
		$(function () {
			$('#rows').bind("change keyup", function () {
				$('#<%=Panel1.ClientID %>').wijcalendar({ monthRows: $(this).val() * 1 });
			});

			$('#cols').bind("change keyup", function () {
				$('#<%=Panel1.ClientID %>').wijcalendar({ monthCols: $(this).val() * 1 });
			});
		});
	
	</script>

</asp:Content>
