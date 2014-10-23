<%@ Page Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DataBinding.aspx.cs"
    Inherits="ControlExplorer.C1Gallery.DataBinding" Title="Data Bind" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gallery"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <cc1:C1Gallery ID="C1Gallery1" runat="server" ShowTimer="True" Width="750px" Height="416px"
        ThumbsDisplay="4" LoadOnDemand="true">
    </cc1:C1Gallery>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1Gallery</strong> supports data binding, it can bind image url, caption, and link fields, or bind any data in template.
    </p>
    <p>Data binding is allowed if the following properties are set: </p>
		<ul>
		<li><strong>DataSourceID </strong>- sets the ID of the data source.</li>
		<li><strong>DataCaptionField </strong>-&nbsp; sets the field in the data source from 
			which to load  the caption of the images.</li>
		<li><strong>DataLinkUrlField </strong>-&nbsp; sets the field in the data source from which to load link fields.</li>
        <li><strong>DataImageUrlField </strong>-&nbsp; sets the field in the data source from which to load image url fields.</li></ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<div class="settingcontainer">
		<div class="settingcontent">
			<ul>
				<li><asp:CheckBox ID="CheckBox1" AutoPostBack="true" runat="server" Text="LoadOnDemand"
        OnCheckedChanged="CheckBox1_CheckedChanged" /></li>
			</ul>
		</div>
	</div>
    
</asp:Content>
