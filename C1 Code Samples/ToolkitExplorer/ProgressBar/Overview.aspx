<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Overview.aspx.cs" Inherits="Progressbar_Overview" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1ProgressBar" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">    
     <div class="layout ui-helper-clearfix">
                <h3>
                    Horizontal</h3>
                 <wijmo:C1ProgressBarExtender runat = "server" ID="ProgressBarExtender1" Value="50"
        TargetControlID="hProBar" />
                <asp:Panel ID="hProBar" runat="server"></asp:Panel>
            </div>
            <div class="layout ui-helper-clearfix">
                <h3>
                    Vertical</h3>
                 <wijmo:C1ProgressBarExtender runat = "server" ID="ProgressBarExtender2" 
                    FillDirection="North" Value="50"
        TargetControlID="vProBar" />
                <asp:Panel ID="vProBar" runat="server"></asp:Panel>
            </div>
    
    
</asp:Content>
<asp:Content ContentPlaceHolderID="Description" ID="Content3" runat="server">
<p>Showing a fixed indication or a real-time indicator of progress is quick and easy for web developers with C1ProgressBarExtender. 
This sample represents the orientations of the progress bar.  By default, the progress bar is horizontal, but you can get a vertical one by setting the FillDirection property to North or South; in this sample, the FillDirection option is set to North.</p><br/>
<p>Vertical progress bar can be obtained if the FillDirection is set to South or North.</p>
</asp:Content>

