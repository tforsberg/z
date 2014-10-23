<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="RemoteData.aspx.cs" Inherits="ComboBox_RemoteData" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1ComboBox"
	TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1DataSource"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<script type="text/javascript">
		function mapping(item) {
			return item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName
		}
		function search(e, obj) {
			obj.datasrc.proxy.options.data.name_startsWith = obj.term.value;
		}
		function select(e, item) {
			$('#output').html('I come from ' + item.label + '!');
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<wijmo:C1DataSourceExtender ID="DataSource1" runat="server">
		<Reader>
			<Fields>
				<wijmo:ReaderField Name="label">
					<Mapping Function="mapping" />
				</wijmo:ReaderField>
				<wijmo:ReaderField Name="value">
					<Mapping Name="name" />
				</wijmo:ReaderField>
				<wijmo:ReaderField Name="selected">
					<DefaultValue ValueString="false" />
				</wijmo:ReaderField>
			</Fields>
		</Reader>
		<Proxy>
			<Options>
				<wijmo:ProxyField Name="url">
					<Value NeedQuotes="True" ValueString="http://ws.geonames.org/searchJSON" />
				</wijmo:ProxyField>
				<wijmo:ProxyField Name="dataType">
					<Value NeedQuotes="True" ValueString="jsonp" />
				</wijmo:ProxyField>
				<wijmo:ProxyField Name="data">
					<Value ValueString="{featureClass: &quot;P&quot;,style: &quot;full&quot;,maxRows: 12}" />
				</wijmo:ProxyField>
				<wijmo:ProxyField Name="key">
					<Value NeedQuotes="True" ValueString="geonames" />
				</wijmo:ProxyField>
			</Options>
		</Proxy>
	</wijmo:C1DataSourceExtender>
	<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
	<p>
		<label id="output">
		</label>
	</p>
	<wijmo:C1ComboBoxExtender runat="server" ID="ComboBoxExtender1" TargetControlID="TextBox1"
		OnClientSearch="search" OnClientSelect="select" ShowTrigger="False">
		<Data DataSourceID="DataSource1">
		</Data>
	</wijmo:C1ComboBoxExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		The C1ComboBoxExtender support client search and select event.
		</p>
		<p>
		The select or search event of client is trigged if the following property are set to corresponding value:
		</p>
		<ul>
		<li>OnClientSelect</li>
		<li>OnClientSearch</li>
		</ul>
		<p>The value of properties are the function name of the client.</p>

		<p>OnClientSelect event will be fired before searching the list. </p>
		<p>OnClientSearch event will be fired when select item is changed. </p>
	</p>
</asp:Content>
