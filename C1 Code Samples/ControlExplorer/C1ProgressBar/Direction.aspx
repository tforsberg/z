<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"	CodeBehind="Direction.aspx.cs" Inherits="ControlExplorer.C1ProgressBar.Direction" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ProgressBar"	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="padding-bottom:1em;">
	    <wijmo:C1ProgressBar runat="server" ID="Progressbar1" MinValue="0" MaxValue="100" FillDirection="East" LabelAlign="Center" Value="50">
	    </wijmo:C1ProgressBar>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The sample demonstrates how to change the label alignment, progress value, and direction 
		of the <strong>C1ProgressBar</strong> control dynamically using client-side script.</p><br/>
	<p>The following client-side properties are used in this sample.</p>
	<ul>
		<li><strong>value </strong>-&nbsp; for changing the progress value.</li>
		<li><strong>fillDirection </strong>- for changing the progress direction.</li>
		<li><strong>labelAlign</strong> - for changing the label alignment.</li>
	</ul>
	<p>The <strong>Value </strong>property can only be set somewhere between the <strong>MinValue
		</strong>and the <strong>MaxValue</strong>.
		If the <strong>labelAlign</strong> property is set to running, then the label will run along with the progress 
		indicator.
		If the <strong>fillDirection </strong>is set to east/west, then the progress bar is shown as a horizontal one; otherwise, a vertical one is shown.
		For a horizontal progress bar, the east option indicates the progress indicator increasing from west to east, 
		and the west option indicates the progress indicator increasing from east to 
		west. For a vertical progress bar, the north option indicates the progress 
		indicator is increasing from south to north, while the south option indicates 
		that it is filling from north to south.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class ="settingcontent">
            <ul>
                <li>
                    <label>Value</label>
                    <asp:TextBox ID="c1Input1" runat="server" Width="80" Text="50"></asp:TextBox>
                </li>
                <li>
                    <label>Label Align</label>
                    <asp:DropDownList ID="c1Combobox1" Width="80" runat="server">
                        <asp:ListItem Text="East" Value="east" />
                        <asp:ListItem Text="West" Value="west" />
                        <asp:ListItem Text="Center" Selected="true" Value="center" />
                        <asp:ListItem Text="North" Value="north" />
                        <asp:ListItem Text="South" Value="south" />
                        <asp:ListItem Text="Running" Value="running" />
                    </asp:DropDownList><div>(if select running,please change the value)</div>
                </li>
                <li>
                    <label>Fill Direction</label>
                    <asp:DropDownList ID="c1Combobox2" Width="80" runat="server">
                       <Items>
                            <asp:ListItem Text="East" Selected="true" Value="east" />
                            <asp:ListItem Text="West" Value="west" />
                            <asp:ListItem Text="North" Value="north" />
                            <asp:ListItem Text="South" Value="south" />
                        </Items>
                    </asp:DropDownList>
                </li>
            </ul>
        </div>
    </div>
	<script type="text/javascript">
	    $(document).ready(function () {
	        var $v = $('#<%=c1Input1.ClientID%>');
	        var $d = $('#<%=c1Combobox2.ClientID%>');
	        var $a = $('#<%=c1Combobox1.ClientID%>');
	        var $p = $('#<%=Progressbar1.ClientID%>');
	        $v.change(function () {
	            if(isNaN($v.val()))
	                return false;
	            $p.c1progressbar('option', 'value', parseFloat($v.val()));
	        });
	        $a.change(function () {
	            $p.c1progressbar('option', 'labelAlign', $a.val());
	        });
	        $d.change(function () {
	            $p.c1progressbar('option', 'fillDirection', $d.val());
	        });
		});
	</script>
</asp:Content>
