<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClientLogger.ascx.cs"
	Inherits="ControlExplorer.ClientLogger" %>

<b><asp:Label runat="server" ID="Label1" Text="Log"></asp:Label></b>
<div id="sampleLog">
</div>
<script type="text/javascript">
	function ClientLogger() {

	}
	ClientLogger.prototype = {
		message: function (msg) {
			$("#sampleLog").html("[" + new Date().toTimeString() + "] " + msg + "<br />" + $("#sampleLog").html());
		}	
	}
	window.log = new ClientLogger();

</script>
