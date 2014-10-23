<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomDataParsers.aspx.cs" Inherits="ControlExplorer.Grid.CustomDataParsers" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		var customBoolParser = {
			// string/ boolean -> boolean
			parse: function (value, culture, format, nullString) {
				if (typeof (value) === "boolean") {
					return value;
				}

				if (typeof (value) === "string") {
					value = $.trim(value);
				}

				if (!value || value === "&nbsp;" || value === nullString) {
					return null;
				}

				switch ($.trim(value.toLowerCase())) {
					case "off": return false;
					case "on": return true;
				}

				return NaN;
			},

			// boolan -> string
			toStr: function (value, culture, format, nullString) {
				return value ? "on" : "off";
			}
		};

		function customRomanParser() {
			// string/ number -> number
			this.parse = function (value, culture, format, nullString) {
				if (typeof (value) === "number" && (value === 0 || isNaN(value))) {
					return NaN;
				}

				if (!value || (value === "&nbsp;") || (value === nullString)) {
					return null;
				}

				if (!isNaN(value)) {
					return parseInt(value);
				}

				value = roman(value);
				return !value ? NaN : value;
			},

			// number -> string
			this.toStr = function (value, culture, format, nullString) {
				if (value === null) {
					return nullString;
				}

				return roman(value);
			};

			var arab_nums = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000];
			var roman_nums = ['I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC', 'C', 'CD', 'D', 'CM', 'M'];

			function roman(value) {
				if (typeof (value) === "number") {
					return (function (arab) {
						var roman = "";

						for (var i = 12; arab > 0; ) {
							if (arab >= arab_nums[i]) {
								roman += roman_nums[i];
								arab -= arab_nums[i];
							} else {
								i--;
							}
						}

						return roman;

					})(value);
				}
				else {
					return (function (roman) {
						roman = roman.toUpperCase();

						var arab = 0;
						for (var i = 12, pos = 0, len = roman.length; i >= 0 && pos < len; ) {
							if (roman.substr(pos, roman_nums[i].length) === roman_nums[i]) {
								arab += arab_nums[i];
								pos += roman_nums[i].length;
							}
							else {
								i--;
							}
						}

						return arab;
					})(value);
				}
			}
		}
	</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Table runat="server" ID="demo"></asp:Table>

	<wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" AllowSorting="true">
		<Columns>
			<wijmo:C1Field HeaderText="Boolean" />
			<wijmo:C1Field HeaderText="Boolean Parsed" DataType="Boolean" DataParser="customBoolParser" />
			<wijmo:C1Field HeaderText="Number" DataType="Number" DataFormatString="n0" />
			<wijmo:C1Field HeaderText="Number Parsed" DataType="Number" DataParser="customRomanParser" />
		</Columns>
	</wijmo:C1GridExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	This demo shows how to customize a data parser using the customBoolParser and customRomanParser functions.
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>