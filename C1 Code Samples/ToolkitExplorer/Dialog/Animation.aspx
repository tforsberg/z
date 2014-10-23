<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.Dialog.Animation" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Dialog"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="dialog" runat="server" Font-Overline="False">
        <h2>
            Dialog</h2>
        <br />
        <span>This is the default dialog which is useful for displaying information. The dialog
            window can be moved, resized and closed with the 'x' icon.</span>
    </asp:Panel>
    <wijmo:C1DialogExtender runat="server" ID="DialogExtender1" Show="blind" Hide="explode" Width="550" Height="240"
        Title="Animation" TargetControlID="dialog">
    </wijmo:C1DialogExtender>
    
     <script type="text/javascript">
         function dialogMethod(p) {
             $('#<%=dialog.ClientID%>').wijdialog(p);
         }
         $(document).ready(function () {

             $('#<%=expandEffectTypes.ClientID%>').change(function () {
                 var ee = $("#<%=expandEffectTypes.ClientID%> option:selected").val();
                 $("#<%=dialog.ClientID%>").wijdialog("option", "expandingAnimation", { animated: ee, duration: 500 });
             });

             $('#<%=collapseEffectTypes.ClientID%>').change(function () {
                 var ce = $("#<%=collapseEffectTypes.ClientID%> option:selected").val();
                 $("#<%=dialog.ClientID%>").wijdialog("option", "collapsingAnimation", { animated: ce, duration: 500 });
             })

             $('#<%=showEffectTypes.ClientID%>').change(function () {
                 var ee = $("#<%=showEffectTypes.ClientID%> option:selected").val();
                 $("#<%=dialog.ClientID%>").wijdialog("option", "show", ee);
             });

             $('#<%=hideEffectTypes.ClientID%>').change(function () {
                 var ce = $("#<%=hideEffectTypes.ClientID%> option:selected").val();
                 $("#<%=dialog.ClientID%>").wijdialog("option", "hide", ce);
             })
         });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how to set the animation for opening , closing, expanding,
        collapsing the C1DialogExtender.
    </p>
    Set following properties to support this feature;
    <ul>
        <li><b>ExpandingAnimation</b></li>
        <li><b>CollapsingAnimation</b></li>
        <li><b>Show</b></li>
        <li><b>Hide</b></li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<asp:Button ID="Button1" runat="server" Text="Show Dialog" OnClientClick="dialogMethod('open'); return false;" />
    <asp:Button ID="Button2" runat="server" Text="Hide Dialog" OnClientClick="dialogMethod('close'); return false;" />
    <div class="option-row">
        <label for="showingEffectTypes">
            Show Animation
        </label>
        <asp:DropDownList ID="showEffectTypes" runat="server">
            <asp:ListItem Value="blind" Selected="True">Blind</asp:ListItem>
            <asp:ListItem Value="bounce">Bounce</asp:ListItem>
            <asp:ListItem Value="clip">Clip</asp:ListItem>
            <asp:ListItem Value="drop">Drop</asp:ListItem>
            <asp:ListItem Value="explode">Explode</asp:ListItem>
            <asp:ListItem Value="fade">Fade</asp:ListItem>
            <asp:ListItem Value="fold">Fold</asp:ListItem>
            <asp:ListItem Value="highlight">Highlight</asp:ListItem>
            <asp:ListItem Value="puff">Puff</asp:ListItem>
            <asp:ListItem Value="pulsate">Pulsate</asp:ListItem>
            <asp:ListItem Value="scale">Scale</asp:ListItem>
            <asp:ListItem Value="size">Size</asp:ListItem>
            <asp:ListItem Value="slide">Slide</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="option-row">
        <label for="showingEffectTypes">
            Hide Animation
        </label>
        <asp:DropDownList ID="hideEffectTypes" runat="server" >
            <asp:ListItem Value="blind">Blind</asp:ListItem>
            <asp:ListItem Value="bounce">Bounce</asp:ListItem>
            <asp:ListItem Value="clip">Clip</asp:ListItem>
            <asp:ListItem Value="drop">Drop</asp:ListItem>
            <asp:ListItem Value="explode" Selected="True">Explode</asp:ListItem>
            <asp:ListItem Value="fade">Fade</asp:ListItem>
            <asp:ListItem Value="fold">Fold</asp:ListItem>
            <asp:ListItem Value="highlight">Highlight</asp:ListItem>
            <asp:ListItem Value="puff">Puff</asp:ListItem>
            <asp:ListItem Value="pulsate">Pulsate</asp:ListItem>
            <asp:ListItem Value="scale">Scale</asp:ListItem>
            <asp:ListItem Value="size">Size</asp:ListItem>
            <asp:ListItem Value="slide">Slide</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="option-row">
        <label for="showingEffectTypes">
            Expand Animation
        </label>
        <asp:DropDownList ID="expandEffectTypes" runat="server" >
            <asp:ListItem Value="blind">Blind</asp:ListItem>
            <asp:ListItem Value="bounce">Bounce</asp:ListItem>
            <asp:ListItem Value="clip">Clip</asp:ListItem>
            <asp:ListItem Value="drop">Drop</asp:ListItem>
            <asp:ListItem Value="explode">Explode</asp:ListItem>
            <asp:ListItem Value="fade">Fade</asp:ListItem>
            <asp:ListItem Value="fold">Fold</asp:ListItem>
            <asp:ListItem Value="highlight" Selected="True">Highlight</asp:ListItem>
            <asp:ListItem Value="puff">Puff</asp:ListItem>
            <asp:ListItem Value="pulsate">Pulsate</asp:ListItem>
            <asp:ListItem Value="scale">Scale</asp:ListItem>
            <asp:ListItem Value="size">Size</asp:ListItem>
            <asp:ListItem Value="slide">Slide</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="option-row">
        <label for="showingEffectTypes">
            Collapse Animation
        </label>
        <asp:DropDownList ID="collapseEffectTypes" runat="server" >
            <asp:ListItem Value="blind">Blind</asp:ListItem>
            <asp:ListItem Value="bounce">Bounce</asp:ListItem>
            <asp:ListItem Value="clip">Clip</asp:ListItem>
            <asp:ListItem Value="drop">Drop</asp:ListItem>
            <asp:ListItem Value="explode">Explode</asp:ListItem>
            <asp:ListItem Value="fade">Fade</asp:ListItem>
            <asp:ListItem Value="fold">Fold</asp:ListItem>
            <asp:ListItem Value="highlight">Highlight</asp:ListItem>
            <asp:ListItem Value="puff" Selected="True">Puff</asp:ListItem>
            <asp:ListItem Value="pulsate">Pulsate</asp:ListItem>
            <asp:ListItem Value="scale">Scale</asp:ListItem>
            <asp:ListItem Value="size">Size</asp:ListItem>
            <asp:ListItem Value="slide">Slide</asp:ListItem>
        </asp:DropDownList>
    </div>
</asp:Content>
