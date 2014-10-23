<%@ Page Language="C#" AutoEventWireup="true" Inherits="iTunes._Default" Codebehind="Default.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Tabs" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Menu" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Expander" TagPrefix="c1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.4" Namespace="C1.Web.Wijmo.Controls.C1Dialog" TagPrefix="c1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>iTunes</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link href="Styles/StyleBase.css" rel="stylesheet" type="text/css" />
    <link href="Styles/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link rel="Shortcut Icon" href="Images/favicon.ico" />
</head>
<body>
    <div id="doc3" class="yui-t2">
        <form id="form1" runat="server">
        <div id="hd">
        </div>
        <div id="bd">
            <div class="yui-b">
                <div class="sidebar">
                    <h3>
                        Library</h3>
                    <c1:C1Menu ID="MnuLibrary" runat="server" Orientation="Vertical" AutoPostBack="true">
                    </c1:C1Menu>
                    <div class="menublock">
                        <h3>
                            Playlists</h3>
                        <c1:C1Menu ID="MnuPlaylists" runat="server" Orientation="Vertical" AutoPostBack="true">
                        </c1:C1Menu>
                    </div>
                </div>
            </div>
            <div id="yui-main">
                <div id="Search" class="searchbox">
                    <div>
                        <asp:TextBox ID="txtSearchBox" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" ImageUrl="Images/search.png" />
                    </div>
                </div>
                <div class="yui-b">
                    <div class="content">
                        <c1:C1GridView ID="GrdMedia" runat="server" DataSourceId="DataTracks" PageSize="50" Height="660px" ScrollMode="Both" CallbackSettings-Action="All" AutogenerateColumns="false" AllowSorting="true" AllowPaging="true" AllowColSizing="true" AllowColMoving="true">
                            <PagerSettings Mode="NextPrevious" />
                            <EmptyDataTemplate>
                                <div class="empty">
                                    <h2>
                                        Playlist</h2>
                                    <p>
                                        This playlist does not contain any tracks!</p>
                                </div>
                            </EmptyDataTemplate>
                            <Columns>
                                <c1:C1TemplateField Width="40px">
                                            <ItemTemplate>
                                                <span class="dragger">
                                                    <img src="Images/track.png" alt="Track" />
                                                </span>
                                            </ItemTemplate>
                                        </c1:C1TemplateField>
                                        <c1:C1BoundField DataField="TrackId" SortExpression="TrackId" DataFormatString="d">
                                            <ItemStyle CssClass="val" />
                                        </c1:C1BoundField>
                                        <c1:C1BoundField DataField="Name" HeaderText="Name" SortExpression="Name" Width="360px">
                                        </c1:C1BoundField>
                                        <c1:C1TemplateField HeaderText="Artist" SortDirection="Ascending" SortExpression="Album.Artist.Name" Width="260px">
                                            <ItemTemplate>
                                                <asp:Label ID="LblAlbumArtistName" runat="server" Text='<%#Eval("Album.Artist.Name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </c1:C1TemplateField>
                                        <c1:C1TemplateField HeaderText="Album" Width="260px" SortExpression="Album.Title">
                                            <ItemTemplate>
                                                <asp:Label ID="LblAlbumTitle" runat="server" Text='<%#Eval("Album.Title")%>'></asp:Label>
                                            </ItemTemplate>
                                        </c1:C1TemplateField>
                                        <c1:C1BoundField DataField="Composer" HeaderText="Composer" Visible="false">
                                        </c1:C1BoundField>
                                        <c1:C1TemplateField HeaderText="Genre" SortExpression="Genre.Name">
                                            <ItemTemplate>
                                                <asp:Label ID="LblGenreName" runat="server" Text='<%#Eval("Genre.Name")%>'></asp:Label>
                                            </ItemTemplate>
                                        </c1:C1TemplateField>
                                        <c1:C1BoundField DataField="Milliseconds" HeaderText="Milliseconds" SortExpression="Milliseconds">
                                        </c1:C1BoundField>
                                        <c1:C1BoundField DataField="Bytes" HeaderText="Size" Visible="false">
                                        </c1:C1BoundField>
                                        <c1:C1BoundField DataField="UnitPrice" HeaderText="Price" SortExpression="UnitPrice">
                                        </c1:C1BoundField>
                            </Columns>
                        </c1:C1GridView>
                        <asp:ObjectDataSource ID="DataTracks" runat="server" SortParameterName="sortExpr" SelectMethod="SelectAllTracksByPlaylistId" TypeName="iTunes.ChinookMedia">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="PlaylistId" Type="Int32" />
                                <asp:ControlParameter ControlID="txtSearchBox" DbType="String" Name="srchExpr" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <c1:C1Dialog ID="PopInfo" runat="server" Width="500px" Height="400px" ShowOnLoad="False" CloseOnEscape="False" Show="blind" MaintainVisibilityOnPostback="False">
                            <Content>
                                <c1:C1Tabs ID="TabsInfo" runat="server" Height="350px">
                                    <Pages>
                                        <c1:C1TabPage Text="Summary" ID="ctl06">
                                            <img src="Images/album.png" alt="Album" />
                                            <hr />
                                            <ul>
                                                <li><strong>Track: </strong>
                                                    <asp:Label ID="LblName" runat="server"></asp:Label></li>
                                                <li><strong>Artist: </strong>
                                                    <asp:Label ID="LblAlbumArtistName" runat="server"></asp:Label></li>
                                                <li><strong>Album: </strong>
                                                    <asp:Label ID="LblAlbumTitle" runat="server"></asp:Label></li>
                                                <li><strong>Time: </strong>
                                                    <asp:Label ID="LblTime" runat="server"></asp:Label></li>
                                                <li><strong>Kind: </strong>
                                                    <asp:Label ID="LblMediaTypeName" runat="server"></asp:Label></li>
                                                <li><strong>Size: </strong>
                                                    <asp:Label ID="LblSize" runat="server"></asp:Label></li>
                                            </ul>
                                            <hr />
                                        </c1:C1TabPage>
                                        <c1:C1TabPage Text="Info" ID="ctl07">
                                            <div class="formitem">
                                                <asp:Label ID="LblInfoName" runat="server" AssociatedControlID="TxtInfoName" Text="Name"></asp:Label>
                                                <asp:TextBox ID="TxtInfoName" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="formitem">
                                                <asp:Label ID="LblInfoAlbumArtistName" runat="server" AssociatedControlID="TxtInfoAlbumArtistName" Text="Artist"></asp:Label>
                                                <asp:TextBox ID="TxtInfoAlbumArtistName" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="formitem">
                                                <asp:Label ID="LblInfoAlbumTitle" runat="server" AssociatedControlID="TxtInfoAlbumTitle" Text="Album"></asp:Label>
                                                <asp:TextBox ID="TxtInfoAlbumTitle" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="formitem">
                                                <asp:Label ID="LblInfoComposer" runat="server" AssociatedControlID="TxtInfoComposer" Text="Composer"></asp:Label>
                                                <asp:TextBox ID="TxtInfoComposer" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="formitem">
                                                <asp:Label ID="LblInfoGenre" runat="server" AssociatedControlID="CboInfoGenre" Text="Genre"></asp:Label>
                                                <asp:DropDownList ID="CboInfoGenre" runat="server" DataSourceID="DataGenres" DataTextField="Name" DataValueField="GenreId">
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="DataGenres" runat="server" SelectMethod="SelectAllGenres" TypeName="iTunes.ChinookMedia"></asp:ObjectDataSource>
                                            </div>
                                        </c1:C1TabPage>
                                    </Pages>
                                </c1:C1Tabs>
                                <div class="trackinfo">
                                </div>
                            </Content>
                            <CaptionButtons>
                                <Toggle Visible="false" />
                                <Close Visible="True" />
                                <Maximize Visible="False" />
                                <Minimize Visible="False" />
                                <Pin Visible="False" />
                                <Refresh Visible="False" />
                            </CaptionButtons>
                        </c1:C1Dialog>
                    </div>
                </div>
            </div>
        </div>
        <div id="ft">
        </div>
        </form>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#GrdMedia tbody .wijmo-wijgrid-row").draggable({
                cursor: 'move',
                cursorAt: { top: 64, left: 64 },
                helper: function (event) {
                    return $('<div class="album"><img src="Images/album.png" alt="Album" /></div>');
                }
            }).dblclick(function () {
                getTrack($(this).find(".val").text());
                return false;
            });

            $("#MnuPlaylists .wijmo-wijmenu-item").droppable({
                hoverClass: 'ui-state-hover',
                drop: function (event, ui) {
                    showToast("Added to playlist: " + $(this).text());
                }
            });
            
        });
        function getTrack(trackId) {
            $(".trackinfo").html("");

            $.ajax({
                type: "GET",
                url: "Chinook.svc/Tracks(" + trackId + ")?$expand=Genre,MediaType,Album,Album/Artist",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    displayTrack(data.d);
                },
                error: function (xhr) {
                    alert(xhr.responseText);
                }
            });

            return false;
        }
        function displayTrack(track) {

            $("#<%=LblName.ClientID %>").text(track.Name);
            $("#<%=LblAlbumArtistName.ClientID %>").text(track.Album.Artist.Name);
            $("#<%=LblAlbumTitle.ClientID %>").text(track.Album.Title);
            $("#<%=LblTime.ClientID %>").text(track.Milliseconds);
            $("#<%=LblSize.ClientID %>").text(track.Bytes);
            $("#<%=LblMediaTypeName.ClientID %>").text(track.MediaType.Name);

            $("#<%=TxtInfoName.ClientID %>").val(track.Name);
            $("#<%=TxtInfoAlbumArtistName.ClientID %>").val(track.Album.Artist.Name);
            $("#<%=TxtInfoAlbumTitle.ClientID %>").val(track.Album.Title);
            $("#<%=TxtInfoComposer.ClientID %>").val(track.Composer);
            $("#<%=CboInfoGenre.ClientID %>").val(track.Genre.GenreId);
            $("#<%=PopInfo.ClientID %>").c1dialog("open");
            $("#<%=TabsInfo.ClientID %>").removeClass("ui-helper-hidden-accessible");
        }

        function showToast(msg) {
            if ($("#toaster").length == 0) {
                $("<div id='toaster'></div>").appendTo("body");
            }
            var t = $("<div class='toast'><span></span></div>").find("span").html(msg).end().appendTo("#toaster").show("slide", { direction: "down", easing: "easeOutQuad" }).delay(4000).hide("slide", { direction: "down", easing: "easeOutQuad" });

        }
    </script>
</body>
</html>
