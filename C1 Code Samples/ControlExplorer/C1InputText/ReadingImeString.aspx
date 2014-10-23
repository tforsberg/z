<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ReadingImeString.aspx.cs" Inherits="ControlExplorer.C1InputText.ReadingImeString" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">

        function OnReadingImeStringOutput(sender, data) {
            var output = $("#textbox2");
            $("#textbox2").val(output.val() + data.readingString);
        }

        $(function () {
            $("#textbox2").wijtextbox();
        }
        );

    </script>
    <p>Input the japanese character, then the reading ime string will output to the second input. </p>
    <br />
    <p>
        <wijmo:C1InputText ID="C1InputText1" runat="server" ImeMode="Active"  OnClientReadingImeStringOutput="OnReadingImeStringOutput"></wijmo:C1InputText>
    </p>
    <br />
    <input type="text" id="textbox2" readonly="true" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how you can get the reading Ime string using the <b>OnReadingImeStringOutput</b> event to output the reading ime string.
    </p>
</asp:Content>
