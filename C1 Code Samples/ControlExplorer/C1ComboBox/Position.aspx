<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Position.aspx.cs" Inherits="ControlExplorer.C1ComboBox.Position" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script id="scriptInit" type="text/javascript">
		function changed() {
			$("#<%=C1ComboBox1.ClientID%>").c1combobox('option', 'dropDownListPosition', {
				my: $('#my_horizontal').val() + ' ' + $('#my_vertical').val(),
				at: $('#at_horizontal').val() + ' ' + $('#at_vertical').val(),
				offset: $('#offset').val(),
				collision: $("#collision_horizontal").val() + ' ' + $("#collision_vertical").val()
			});
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
	<ContentTemplate>
	<wijmo:C1ComboBox ID="C1ComboBox1" runat="server" Width="160px" >
	<DropDownListPosition >
		<At Left="Center" Top="Bottom" />
		<My Left="Right" Top="Top" />
	</DropDownListPosition>
		<Items>
			<wijmo:C1ComboBoxItem Text="c++" Value="c++" />
			<wijmo:C1ComboBoxItem Text="java" Value="java" />
			<wijmo:C1ComboBoxItem Text="php" Value="php" />
			<wijmo:C1ComboBoxItem Text="coldfusion" Value="coldfusion" />
			<wijmo:C1ComboBoxItem Text="javascript" Value="javascript" />
			<wijmo:C1ComboBoxItem Text="asp" Value="asp" />
			<wijmo:C1ComboBoxItem Text="ruby" Value="ruby" />
			<wijmo:C1ComboBoxItem Text="python" Value="python" />
			<wijmo:C1ComboBoxItem Text="c" Value="c" />
			<wijmo:C1ComboBoxItem Text="scala" Value="scala" />
			<wijmo:C1ComboBoxItem Text="groovy" Value="groovy" />
			<wijmo:C1ComboBoxItem Text="haskell" Value="haskell" />
			<wijmo:C1ComboBoxItem Text="perl" Value="perl" />
		</Items>
	</wijmo:C1ComboBox>
	<script type="text/javascript">
		$(document).ready(function () {
			$('.position').bind('change', changed);
		});
	</script>
				</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	The <strong>C1ComboBox</strong> supports changing the position of the drop-down list for the
	    <strong>C1Combobox </strong>.
	</p>
		<ul>
	<li><strong>DropDownListPosition </strong>-Changing the position of the drop-down list.</li>
	</ul>

	<p>
	Use the option to control the position of the drop-down list; it supports horizontal, vertical, offset, and collision settings.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
<ContentTemplate>
<div class="settingcontainer">
<div class="settingcontent">
<ul>
	<li class="fullwidth"><label class="settinglegend">Drop-down List Position:</label>
	<li class="widesetting"><label>Drop-down List:</label>
		<asp:DropDownList ID="MyHPDdl" runat="server">
				<asp:ListItem value="Left">Left</asp:ListItem>
				<asp:ListItem value="Center" Selected="True">Center</asp:ListItem>
				<asp:ListItem value="Right">Right</asp:ListItem>
			</asp:DropDownList>
			<asp:DropDownList ID="MyVPDdl" runat="server">
				<asp:ListItem value="Top">Top</asp:ListItem>
				<asp:ListItem value="Middle">Center</asp:ListItem>
				<asp:ListItem value="Bottom" Selected="True">Bottom</asp:ListItem>
			</asp:DropDownList>
	</li>
	<li class="widesetting">
		<label>Aligns to Textbox:</label>
			<asp:DropDownList ID="AtHPDdl" runat="server">
				<asp:ListItem value="Left">Left</asp:ListItem>
				<asp:ListItem value="Center">Center</asp:ListItem>
				<asp:ListItem value="Right" Selected="True">Right</asp:ListItem>
			</asp:DropDownList>
			<asp:DropDownList ID="AtVPDdl" runat="server">
				<asp:ListItem value="Top" Selected="True">Top</asp:ListItem>
				<asp:ListItem value="Middle">Center</asp:ListItem>
				<asp:ListItem value="Bottom">Bottom</asp:ListItem>
			</asp:DropDownList>
	</li>
	<li class="widesetting">
		<label>Horizontal Collision Detection:</label>
			<asp:DropDownList ID="CollisionLeftDdl" runat="server">
				<asp:ListItem value="Flip">Flip</asp:ListItem>
				<asp:ListItem value="Fit" Selected="True">Fit</asp:ListItem>
				<asp:ListItem value="None">None</asp:ListItem>
			</asp:DropDownList>
	</li>
	<li class="widesetting">
		<label>Vertical Collision Detection:</label>
			<asp:DropDownList ID="CollisionTopDdl" runat="server">
				<asp:ListItem value="Flip" Selected="True">Flip</asp:ListItem>
				<asp:ListItem value="Fit">Fit</asp:ListItem>
				<asp:ListItem value="None">None</asp:ListItem>
			</asp:DropDownList>
	</li>
	<li><label>Offset X:</label>
		<asp:TextBox runat="server" id="XOffsetTxt" text="0" />
	</li>
	<li><label>Offset Y:</label>
		<asp:TextBox runat="server" id="YOffsetTxt" text="0" />
	</li>
</ul>
</div>
	<div class="settingcontrol">
	<asp:Button ID="ApplyBtn" Text="Apply" CssClass="settingapply" runat="server" OnClick="ApplyBtn_Click"/>
	</div>
</div>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
