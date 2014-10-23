<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Overview.aspx.cs" Inherits="FormDecorator_Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1FormDecorator"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<style type="text/css">
		 <style type="text/css">

		.formdecorator label
		{
			display: block;
		}       

		.formdecorator
		{
			list-style: none;
			margin: 0;
			padding: 0;
		}       

		.formdecorator li
		{
			clear: both;
			margin-bottom: 1em;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<ul class="formdecorator">
		<li>
			<h3>Input</h3>
			<asp:TextBox runat="server" ID="TextBox1"></asp:TextBox>
		</li>
		<li>
			<h3>TextArea</h3>
			<asp:TextBox runat="server" ID="TextBox3" TextMode="MultiLine"></asp:TextBox>
		</li>
		<li>
			<h3>Dropdown with Optgroups</h3>
			<select id="select1">
				<optgroup label="A-G">
					<option>A</option>
					<option selected="selected">B</option>
					<option>C</option>
					<option>D</option>
					<option>E</option>
					<option>F</option>
					<option>G</option>
				</optgroup>
				<optgroup label="H-M">
					<option>H</option>
					<option>I</option>
					<option>J</option>
					<option>K</option>
					<option>L</option>
					<option>M</option>
				</optgroup>
			</select>
		</li>
		<li>
			<h3>CheckBox</h3>
			<input id="checkbox1" type="checkbox" /><label for="checkbox1">checkbox1</label>
			<input id="checkbox2" type="checkbox" /><label for="checkbox2">checkbox2</label>
			<input id="checkbox3" type="checkbox" /><label for="checkbox3">checkbox3</label>
			<input id="checkbox4" type="checkbox" /><label for="checkbox4">checkbox4</label>
		</li>
		<li>
			<h3>Radio</h3>
			<input type="radio" name="radiobutton1" id="radio1" /><label for="radio1">radio1</label>
			<input type="radio" name="radiobutton1" id="radio2" /><label for="radio2">radio2</label>
			<input type="radio" name="radiobutton1" id="radio3" /><label for="radio3">radio3</label>
			<input type="radio" name="radiobutton1" id="radio4" /><label for="radio4">radio4</label>
		</li>
		<li>
			<h3>Button</h3>
			<input type="button" name="button1" value="Submit" />
		</li>
	</ul>
    <!-- This TargetSelector matches all textboxes (single and multiline)-->
	<wijmo:C1TextboxExtender ID="TooltipExtender1" runat="server" TargetSelector=":input[type='text'],textarea">
	</wijmo:C1TextboxExtender>
    
    <!-- This TargetSelector matches all textboxes (dropdownlists)-->
	<wijmo:C1DropdownExtender ID="DropdownExtender1" runat="server" TargetSelector="select" />
    
    <!-- This TargetSelector matches all textboxes (checkboxes)-->
	<wijmo:C1CheckboxExtender ID="CheckboxExtender1" runat="server" TargetSelector=":input[type='checkbox']" />

    <!-- This TargetSelector matches all textboxes (radiobuttons)-->
	<wijmo:C1RadioExtender ID="RadioExtender1" runat="server" TargetSelector=":input[type='radio']" />
    
    <!-- This TargetSelector matches all textboxes (buttons)-->
	<wijmo:C1ButtonExtender ID="ButtonExtender1" runat="server" TargetSelector=":button">
	</wijmo:C1ButtonExtender>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Description" ID="Content3">
	<p>
		The Wijmo Form Decorator widgets (wijradio, wijcheckbox, wijdropdown, wijtextbox)
		are used to decorate a standard HTML form elements. The Form Decorator widgets allow
		any form element to be styled uniformly in any browser. Form Decorators use a property called TargetSelector to turn all matched elements into decorated widgets. The TargetSelector property accepts a jQuery selector string which is similar to CSS.</p>
</asp:Content>
