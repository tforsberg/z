<%@ Page Language="C#"  MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="MinRange.aspx.cs" Inherits="ControlExplorer.C1Slider.MinRange" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Slider" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        #msg {
            padding:0;
            margin-top:40px;
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Slider ID="slider1" runat="server" Width="300" Orientation="Horizontal" Min="0" Range="true" DragFill="false" Max="500"
         Step="2" Values="100,400" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="update1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li><asp:Label runat="server" id="msg"></asp:Label></li>
                    </ul>
                </div>
                <div class="settingcontrol">
                    <asp:Button runat="server" id="btnGetValue" OnClick="btnGetValue_Click" Text="Min Range"></asp:Button>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        $(document).ready(function () {
            var $s = $('#<%=slider1.ClientID%>');
            $s.c1slider('option', 'minRange', 100);
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The min range option set the minimum value of range that the slider should have when it has two thumb buttons.
    </p>
</asp:Content>