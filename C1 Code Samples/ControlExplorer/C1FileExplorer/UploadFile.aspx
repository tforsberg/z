<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="UploadFile.aspx.cs" Inherits="ControlExplorer.C1FileExplorer.UploadFile" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1FileExplorer" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Upload" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .uploadbutton
        {
            width:22px;
            height: 16px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <wijmo:C1FileExplorer ID="C1FileExplorer1" runat="server" InitPath="~/C1FileExplorer/Example" SearchPatterns="*.jpg,*.png,*.jpeg,*.gif" AllowMultipleSelection="True">
    </wijmo:C1FileExplorer>

    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/UploadFile.png" OnClientClick="showDialog()"/>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div runat="server" id="dialog">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" EnableViewState="False" ChildrenAsTriggers="False">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ImageButton1" />
            </Triggers>
            <ContentTemplate>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <wijmo:C1Upload ID="c1Upload1" runat="server" Width="600px" ShowUploadedFiles="true" OnClientComplete="uploadComplete" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <script type="text/javascript">
        function uploadComplete()
        {
            $('#<%=dialog.ClientID%>').wijdialog("close");
            $("#<%=C1FileExplorer1.ClientID %>").c1fileexplorer("refresh");
        }

        function showDialog()
        {
            var currentFolder = $("#<%=C1FileExplorer1.ClientID %>").c1fileexplorer("option", "currentFolder");
            $('#<%=HiddenField1.ClientID%>').val(currentFolder);

            $('#<%=Label1.ClientID%>').text("Please wait...");
            $('#<%=c1Upload1.ClientID%>').hide();
            $('#<%=dialog.ClientID%>').wijdialog({ title: "Upload to: " + currentFolder }).wijdialog("open");
        }

        $(function () {
            $('#<%=dialog.ClientID%>').wijdialog({
                autoOpen: false,
                modal: true,
                resizable: true,
                width: 640,
                height: 400,
                buttons: {
                    Close: function () {
                        $(this).wijdialog("close");
                    }
                },
                captionButtons: {
                    pin: { visible: false },
                    refresh: { visible: false },
                    toggle: { visible: false },
                    minimize: { visible: false },
                    maximize: { visible: false }
                }
            });

            var uploadButtonPanel = $('<li title="Upload File" class="ui-state-default ui-corner-all uploadbutton"><a class="wijmo-wijfileexplorer-link" href="#"></a></li>');
            uploadButtonPanel.find("a.wijmo-wijfileexplorer-link").append($('#<%=ImageButton1.ClientID%>'));
            $("#<%=C1FileExplorer1.ClientID %>").find("ul.wijmo-wijfileexplorer-toolbar").append(uploadButtonPanel);
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1FileExplorer</strong> and <strong>C1Upload</strong> can be tacit cooperation, realize the file upload function. 
    </p>
</asp:Content>
