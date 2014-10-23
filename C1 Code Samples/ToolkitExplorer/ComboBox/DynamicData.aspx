<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="DynamicData.aspx.cs" Inherits="ComboBox_DynamicData" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1ComboBox"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script id="scriptInit" type="text/javascript">
        function setData() {
            $('#<%=TextBox1.ClientID %>').wijcombobox("option", "data", [
                {
                    label: 'delphi',
                    value: 'delphi'
                },
                {
                    label: 'visual studio',
                    value: 'visual studio'
                },
                {
                    label: 'flash',
                    value: 'flash'
                }
            ]);
        }
            
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <wijmo:C1ComboBoxExtender ID="ComboBoxExtender2" runat="server" TargetControlID="TextBox1">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
	The C1ComboBoxExtender supports adding dynamical data to the wijcombobox at client.</p>

	<p>DynamicData setting is allowed if the following options are set to corresponding values:</p>
	<ul>
	<li>data</li>
	</ul>
	<p>for example: [{label:'delphi', value: 'delphi'}]</p>

	<p>Once the data is set dynamically at client, the content of dropdown list will 
	be replaced by setting data.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="demo-options">
        <input type="button" value="Set Dynamic Data " onclick="setData()" />
    </div>
</asp:Content>
