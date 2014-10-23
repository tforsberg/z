<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="Position.aspx.cs" Inherits="ComboBox_Position" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1ComboBox"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        function changed() {
            $("#<%=TextBox1.ClientID %>").wijcombobox('option', 'dropDownListPosition', {
                my: $('#my_horizontal').val() + ' ' + $('#my_vertical').val(),
                at: $('#at_horizontal').val() + ' ' + $('#at_vertical').val(),
                offset: $('#offset').val(),
                collision: $("#collision_horizontal").val() + ' ' + $("#collision_vertical").val()
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <wijmo:C1ComboBoxExtender ID="ComboBoxExtender2" runat="server" TargetControlID="TextBox1">
			<DropDownListPosition >
				<At Left="Center" Top="Bottom" />
				<My Left="Right" Top="Top" />
			</DropDownListPosition>
            <Data>
                <Items>
                    <wijmo:C1ComboBoxItem Label="c++" Value="c++" />
                    <wijmo:C1ComboBoxItem Label="java" Value="java" />
                    <wijmo:C1ComboBoxItem Label="php" Value="php" />
                    <wijmo:C1ComboBoxItem Label="coldfusion" Value="coldfusion" />
                    <wijmo:C1ComboBoxItem Label="javascript" Value="javascript" />
                    <wijmo:C1ComboBoxItem Label="asp" Value="asp" />
                    <wijmo:C1ComboBoxItem Label="ruby" Value="ruby" />
                    <wijmo:C1ComboBoxItem Label="python" Value="python" />
                    <wijmo:C1ComboBoxItem Label="c" Value="c" />
                    <wijmo:C1ComboBoxItem Label="scala" Value="scala" />
                    <wijmo:C1ComboBoxItem Label="groovy" Value="groovy" />
                    <wijmo:C1ComboBoxItem Label="haskell" Value="haskell" />
                    <wijmo:C1ComboBoxItem Label="perl" Value="perl" />
                </Items>
            </Data>
        </wijmo:C1ComboBoxExtender>
    </div>
    <script id="scriptInit" type="text/javascript">
        $(document).ready(function () {
            $('.position').bind('change', changed);
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
	The C1ComboBoxExtender supports changing the position of the drop-down list for the
	C1ComboBoxExtender at client.
   </p>
		<ul>
	<li><strong>DropDownListPosition </strong>-Changing the position of the drop-down list.</li>
	</ul>
	<p>
	Use the option to control the position of the drop-down list, it supports horizontal, vertical, offset and collision settings.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="demo-options">
        <!-- Begin options markup -->
        <div class="option-row">
            <label for="my_horizontal">
                Dropdown list:</label>
            <select id="my_horizontal" class="position">
                <option value="left">left</option>
                <option value="center">center</option>
                <option value="right">right</option>
            </select>
            <select id="my_vertical" class="position">
                <option value="top">top</option>
                <option value="middle">center</option>
                <option value="bottom">bottom</option>
            </select>
        </div>
        <div class="option-row">
            <label for="at_horizontal">
                Aligns to textbox:</label>
            <select id="at_horizontal" class="position">
                <option value="left">left</option>
                <option value="center">center</option>
                <option value="right">right</option>
            </select>
            <select id="at_vertical" class="position">
                <option value="top">top</option>
                <option value="middle">center</option>
                <option value="bottom">bottom</option>
            </select>
        </div>
        <div class="option-row">
            <label for="offset">
                With offset:</label>
            <input onblur="changed()" id="offset" type="text" size="15" />
        </div>
        <div class="option-row">
            <label for="collision_horizontal">
                Horizontal collision detection:</label>
            <select id="collision_horizontal">
                <option value="flip">flip</option>
                <option value="fit">fit</option>
                <option value="none">none</option>
            </select>
            <label for="collision_vertical">
                Vertical collision detection:</label>
            <select id="collision_vertical">
                <option value="flip">flip</option>
            <option value="fit">fit</option>
                <option value="none">none</option>
            </select>
        </div>
        <!-- End options markup -->
    </div>
</asp:Content>
