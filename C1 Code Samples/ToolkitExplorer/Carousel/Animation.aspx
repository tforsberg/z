<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="ToolkitExplorer.Carousel.Animation" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Carousel"
	TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script id="scriptInit" type="text/javascript">
		function changeProperties() {
			var animationOptions = {
				queue: $('#chkQueue').val(),
				easing: $('#selEasing').val()
			};
			$('#<%=carousel.ClientID%>').wijcarousel({
				animation: animationOptions
			});
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="carousel" runat="server" Font-Overline="False" Title="Overview" Width="750px"
		Height="300px">
		<ul>
			<li>
				<img alt="1" src="http://lorempixum.com/750/300/abstract/1" title="Word" /><span>Word Caption 1</span></li>
			<li>
				<img alt="2" src="http://lorempixum.com/750/300/abstract/2" title="Word2" /><span>Word Caption 2</span></li>
			<li>
				<img alt="3" src="http://lorempixum.com/750/300/abstract/3" title="Word3" /><span>Word Caption 3</span></li>
			<li>
				<img alt="4" src="http://lorempixum.com/750/300/abstract/4" title="Word4" /><span>Word Caption 4</span></li>
			<li>
				<img alt="5" src="http://lorempixum.com/750/300/abstract/5" title="Word5" /><span>Word Caption 5</span></li>
			<li>
				<img alt="1" src="http://lorempixum.com/750/300/abstract/6" title="Word" /><span>Word Caption 1</span></li>
			<li>
				<img alt="2" src="http://lorempixum.com/750/300/abstract/7" title="Word2" /><span>Word Caption 2</span></li>
			<li>
				<img alt="3" src="http://lorempixum.com/750/300/abstract/8" title="Word3" /><span>Word Caption 3</span></li>
			<li>
				<img alt="4" src="http://lorempixum.com/750/300/abstract/9" title="Word4" /><span>Word Caption 4</span></li>
			<li>
				<img alt="5" src="http://lorempixum.com/750/300/abstract/10" title="Word5" /><span>Word Caption 5</span></li>
		</ul>
	</asp:Panel>
	<wijmo:C1CarouselExtender runat="server" ID="CarouselExtender1" TargetControlID="carousel">
	</wijmo:C1CarouselExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<div>
		<label for="chkQueue">
			Animation Settings: Queue
		</label>
		<input id="chkQueue" type="checkbox" />
		<label for="selEasing">
			Easing
		</label>
		<select id="selEasing">
			<option value="easeInQuad">easeInQuad</option>
			<option value="easeOutQuad">easeOutQuad</option>
			<option value="easeInOutQuad">easeInOutQuad</option>
			<option value="easeInCubic">easeInCubic</option>
			<option value="easeOutCubic">easeOutCubic</option>
			<option value="easeInOutCubic">easeInOutCubic</option>
			<option value="easeInQuart">easeInQuart</option>
			<option value="easeOutQuart">easeOutQuart</option>
			<option value="easeInOutQuart">easeInOutQuart</option>
			<option value="easeInQuint">easeInQuint</option>
			<option value="easeOutQuint">easeOutQuint</option>
			<option value="easeInOutQuint">easeInOutQuint</option>
			<option value="easeInSine">easeInSine</option>
			<option value="easeOutSine">easeOutSine</option>
			<option value="easeInOutSine">easeInOutSine</option>
			<option value="easeInExpo">easeInExpo</option>
			<option value="easeOutExpo">easeOutExpo</option>
			<option value="easeInOutExpo">easeInOutExpo</option>
			<option value="easeInCirc">easeInCirc</option>
			<option value="easeOutCirc">easeOutCirc</option>
			<option value="easeInOutCirc">easeInOutCirc</option>
			<option value="easeInElastic">easeInElastic</option>
			<option value="easeOutElastic">easeOutElastic</option>
			<option value="easeInOutElastic">easeInOutElastic</option>
			<option value="easeInBack">easeInBack</option>
			<option value="easeOutBack">easeOutBack</option>
			<option value="easeInOutBack">easeInOutBack</option>
			<option value="easeInBounce">easeInBounce</option>
			<option value="easeOutBounce">easeOutBounce</option>
			<option value="easeInOutBounce">easeInOutBounce</option>
		</select>
		<input type="button" value="Apply" onclick="changeProperties()" />
	</div>
</asp:Content>
