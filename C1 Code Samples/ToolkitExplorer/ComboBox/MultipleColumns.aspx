<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="MultipleColumns.aspx.cs" Inherits="ComboBox_MultipleColumns" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
	<wijmo:C1ComboBoxExtender ID="ComboBoxExtender2" runat="server" TargetControlID="TextBox1"
		DropdownWidth="627">
		<Data>
			<Items>
				<wijmo:C1ComboBoxItem Label="label0" Value="value0" Cells="cell00,cell01,cell02,cell03,cell04,cell05">
				</wijmo:C1ComboBoxItem>
				<wijmo:C1ComboBoxItem Cells="cell10,cell11,cell12,cell13,cell14,cell15" Label="label1"
					Value="value1" />
				<wijmo:C1ComboBoxItem Cells="cell20,cell21,cell22,cell23,cell24,cell25" Label="label2"
					Value="value2" />
				<wijmo:C1ComboBoxItem Cells="cell30,cell31,cell32,cell33,cell34,cell35" Label="label3"
					Value="value3" />
				<wijmo:C1ComboBoxItem Cells="cell40,cell41,cell42,cell43,cell44,cell45" Label="label4"
					Value="value4" />
				<wijmo:C1ComboBoxItem Cells="cell50,cell51,cell52,cell53,cell54,cell55" Label="label5"
					Value="value5" />
				<wijmo:C1ComboBoxItem Cells="cell60,cell61,cell62,cell63,cell64,cell65" Label="label6"
					Value="value6" />
				<wijmo:C1ComboBoxItem Cells="cell70,cell71,cell72,cell73,cell74,cell75" Label="label7"
					Value="value7" />
				<wijmo:C1ComboBoxItem Cells="cell80,cell81,cell82,cell83,cell84,cell85" Label="label8"
					Value="value8" />
				<wijmo:C1ComboBoxItem Cells="cell90,cell91,cell92,cell93,cell94,cell95" Label="label9"
					Value="value9" />
				<wijmo:C1ComboBoxItem Cells="cell100,cell101,cell102,cell103,cell104,cell105" Label="label10"
					Value="value10" />
				<wijmo:C1ComboBoxItem Cells="cell110,cell111,cell112,cell113,cell114,cell115" Label="label11"
					Value="value11" />
				<wijmo:C1ComboBoxItem Cells="cell120,cell121,cell122,cell123,cell124,cell125" Label="label12"
					Value="value12" />
				<wijmo:C1ComboBoxItem Cells="cell130,cell131,cell132,cell133,cell134,cell135" Label="label13"
					Value="value13" />
				<wijmo:C1ComboBoxItem Cells="cell140,cell141,cell142,cell143,cell144,cell145" Label="label14"
					Value="value14" />
				<wijmo:C1ComboBoxItem Cells="cell150,cell151,cell152,cell153,cell154,cell155" Label="label15"
					Value="value15" />
				<wijmo:C1ComboBoxItem Cells="cell160,cell161,cell162,cell163,cell164,cell165" Label="label16"
					Value="value16" />
				<wijmo:C1ComboBoxItem Cells="cell170,cell171,cell172,cell173,cell174,cell175" Label="label17"
					Value="value17" />
				<wijmo:C1ComboBoxItem Cells="cell180,cell181,cell182,cell183,cell184,cell185" Label="label18"
					Value="value18" />
				<wijmo:C1ComboBoxItem Cells="cell190,cell191,cell192,cell193,cell194,cell195" Label="label19"
					Value="value19" />
				<wijmo:C1ComboBoxItem Cells="cell200,cell201,cell202,cell203,cell204,cell205" Label="label20"
					Value="value20" />
				<wijmo:C1ComboBoxItem Cells="cell210,cell211,cell212,cell213,cell214,cell215" Label="label21"
					Value="value21" />
				<wijmo:C1ComboBoxItem Cells="cell220,cell221,cell222,cell223,cell224,cell225" Label="label22"
					Value="value22" />
				<wijmo:C1ComboBoxItem Cells="cell230,cell231,cell232,cell233,cell234,cell235" Label="label23"
					Value="value23" />
				<wijmo:C1ComboBoxItem Cells="cell240,cell241,cell242,cell243,cell244,cell245" Label="label24"
					Value="value24" />
				<wijmo:C1ComboBoxItem Cells="cell250,cell251,cell252,cell253,cell254,cell255" Label="label25"
					Value="value25" />
				<wijmo:C1ComboBoxItem Cells="cell260,cell261,cell262,cell263,cell264,cell265" Label="label26"
					Value="value26" />
				<wijmo:C1ComboBoxItem Cells="cell270,cell271,cell272,cell273,cell274,cell275" Label="label27"
					Value="value27" />
				<wijmo:C1ComboBoxItem Cells="cell280,cell281,cell282,cell283,cell284,cell285" Label="label28"
					Value="value28" />
				<wijmo:C1ComboBoxItem Cells="cell290,cell291,cell292,cell293,cell294,cell295" Label="label29"
					Value="value29" />
			</Items>
		</Data>
		<Columns>
			<wijmo:C1ComboBoxColumn Name="header1" />
			<wijmo:C1ComboBoxColumn Name="header2" />
			<wijmo:C1ComboBoxColumn Name="header3" />
			<wijmo:C1ComboBoxColumn Name="header4" />
			<wijmo:C1ComboBoxColumn Name="header5" />
			<wijmo:C1ComboBoxColumn Name="header6" />
		</Columns>
	</wijmo:C1ComboBoxExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	The C1ComboBoxExtender supports multiple columns setting in the C1Combobox.
   </p>
   <p>
	Multiple columns is allowed if the following properties are set to corresponding values: 
	</p>
	<ul>
	<li>Columns</li>
	<li>Cells in C1ComboBoxItem</li>
   </ul>
   	<p>"Columns" indicates the collection of columns in the C1ComboBoxExtender.</p>
   <p>
	The count of Columns must be equal as cell's count.
	</p>
</asp:Content>
