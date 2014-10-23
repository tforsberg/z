<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Maps.aspx.cs" Inherits="ControlExplorer.C1ToolTip.Maps" %>

<%@ Register Namespace="C1.Web.Wijmo.Controls.C1ToolTip" Assembly="C1.Web.Wijmo.Controls.3" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager2">
    </asp:ScriptManager>
    <div id="targetContainer">
        <img src="Images/maps.png" alt="c1address" width="628" height="342" usemap="#map" />
        <map id="map" name="map">
            <area shape="circle" alt="c1logo" title="c1logo" id="c1address" href="#" coords="314,124,38" />
        </map>
    </div>
    <wijmo:C1ToolTip runat="server" ID="Tooltip1" TargetSelector="#targetContainer #c1address" CloseBehavior="Sticky" MouseTrailing="True">
        <Template>
            <table cellpadding="0" cellspacing="0" border="0" style="width: 320px;">
                <tr>
                    <td class="maps">
                        <h3>
                            ComponentOne</h3>
                        <p>
                            <strong>USA-Corporate&nbsp;Headquarters</strong><br />
                            201&nbsp;S&nbsp;Highland&nbsp;Ave,3rd&nbsp;Floor<br />
                            Pittsburgh,PA&nbsp;15206&nbsp;USA
                        </p>
                        <p>
                            1.800.858.2739&nbsp;|&nbsp;1.412.681.4343 <br />
                                <a href="mailto:sales@componentone.com">sales@componentone.com</a>
                        </p>
                        <p>
                            Visit Website <br />
                                <a href="http://www.componentone.com">www.componentone.com</a>
                        </p>
                    </td>
                    <td style="width: 132px; height: 161px;">
                        <img src="Images/websitepreview.png" width="132" height="161" alt="website preview" />
                    </td>
                </tr>
            </table>
        </Template>
    </wijmo:C1ToolTip>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        Hover over the ComponentOne logo to display additional information.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
