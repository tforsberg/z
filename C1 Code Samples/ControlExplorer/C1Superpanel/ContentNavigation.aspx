<%@ Page Language="C#"  MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ContentNavigation.aspx.cs" Inherits="ControlExplorer.C1Superpanel.ContentNavigation" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1SuperPanel" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        a, a:link, a:active, a:visited {
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        li{
            padding-top:3px;
            padding-right:0;
        }
        ol{
            padding-left:20px;
            margin-right:0;
            padding-right:0;
        }
        p,h2{
            padding:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1SuperPanel</strong> is great for navigating large graphics, maps, charts, or even lengthy content. 
    </p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%">
        <tr>
            <td valign="top" style="padding-left:3px;">
                <h3>
                    Table of Contents</h3>
                <ol>
                    <li><a href="#A1" onclick="return navTo(this);">Lorem ipsum</a> </li>
                    <li><a  href="#A2" onclick="return navTo(this)">Nunc sit amet</a> </li>
                    <li><a href="#A3" onclick="return navTo(this)">Donec ante metus</a> </li>
                    <li><a href="#A4" onclick="return navTo(this)">Aenean vehicula</a> </li>
                    <li><a href="#A5" onclick="return navTo(this)">Fusce scelerisque</a> </li>
                </ol>
            </td>
            <td>
                <wijmo:C1SuperPanel ID="superPanel1" runat="server" Width="500" Height="300">
                    <ContentTemplate>
                            <h2 id="A1" style="color:#000;">
                                Lorem ipsum</h2>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet nulla neque. Nam eu ipsum sit amet sapien mollis aliquam ut non enim. Ut in eros tortor. Proin eu erat neque. Proin commodo euismod quam a consequat. Vestibulum tempor nunc at leo dapibus ullamcorper. Cras interdum malesuada consectetur. Morbi molestie risus at urna rhoncus ornare. Pellentesque fermentum, lacus vel venenatis consectetur, tortor sem interdum odio, vel dignissim odio nisi sit amet augue. Curabitur interdum nunc a lacus ullamcorper sit amet viverra tellus bibendum. Pellentesque non vestibulum purus.
                            </p>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet nulla neque. Nam eu ipsum sit amet sapien mollis aliquam ut non enim. Ut in eros tortor. Proin eu erat neque. Proin commodo euismod quam a consequat. Vestibulum tempor nunc at leo dapibus ullamcorper. Cras interdum malesuada consectetur. Morbi molestie risus at urna rhoncus ornare. Pellentesque fermentum, lacus vel venenatis consectetur, tortor sem interdum odio, vel dignissim odio nisi sit amet augue. Curabitur interdum nunc a lacus ullamcorper sit amet viverra tellus bibendum. Pellentesque non vestibulum purus.
                            </p>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet nulla neque. Nam eu ipsum sit amet sapien mollis aliquam ut non enim. Ut in eros tortor. Proin eu erat neque. Proin commodo euismod quam a consequat. Vestibulum tempor nunc at leo dapibus ullamcorper. Cras interdum malesuada consectetur. Morbi molestie risus at urna rhoncus ornare. Pellentesque fermentum, lacus vel venenatis consectetur, tortor sem interdum odio, vel dignissim odio nisi sit amet augue. Curabitur interdum nunc a lacus ullamcorper sit amet viverra tellus bibendum. Pellentesque non vestibulum purus.
                            </p>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet nulla neque. Nam eu ipsum sit amet sapien mollis aliquam ut non enim. Ut in eros tortor. Proin eu erat neque. Proin commodo euismod quam a consequat. Vestibulum tempor nunc at leo dapibus ullamcorper. Cras interdum malesuada consectetur. Morbi molestie risus at urna rhoncus ornare. Pellentesque fermentum, lacus vel venenatis consectetur, tortor sem interdum odio, vel dignissim odio nisi sit amet augue. Curabitur interdum nunc a lacus ullamcorper sit amet viverra tellus bibendum. Pellentesque non vestibulum purus.
                            </p>
                            <h2  id="A2" style="color:#000;">
                                Nunc sit amet</h2>
                            <p>
                                Nunc sit amet nisi velit. Sed ac libero ac erat placerat auctor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed porta leo id enim bibendum id accumsan neque eleifend. Curabitur lorem ipsum, pulvinar sed fermentum ac, commodo nec odio. In hac habitasse platea dictumst. Proin posuere, eros id interdum sagittis, lorem odio pharetra velit, vitae tempus ligula velit at neque. Curabitur arcu magna, elementum sit amet congue vel, imperdiet et felis. Donec rutrum porta justo, ut posuere ipsum laoreet ut. Vivamus fermentum sagittis vestibulum. Nam vel est mi, semper pharetra leo.
                            </p>
                            <p>
                                Nunc sit amet nisi velit. Sed ac libero ac erat placerat auctor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed porta leo id enim bibendum id accumsan neque eleifend. Curabitur lorem ipsum, pulvinar sed fermentum ac, commodo nec odio. In hac habitasse platea dictumst. Proin posuere, eros id interdum sagittis, lorem odio pharetra velit, vitae tempus ligula velit at neque. Curabitur arcu magna, elementum sit amet congue vel, imperdiet et felis. Donec rutrum porta justo, ut posuere ipsum laoreet ut. Vivamus fermentum sagittis vestibulum. Nam vel est mi, semper pharetra leo.
                            </p>
                            <p>
                                Nunc sit amet nisi velit. Sed ac libero ac erat placerat auctor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed porta leo id enim bibendum id accumsan neque eleifend. Curabitur lorem ipsum, pulvinar sed fermentum ac, commodo nec odio. In hac habitasse platea dictumst. Proin posuere, eros id interdum sagittis, lorem odio pharetra velit, vitae tempus ligula velit at neque. Curabitur arcu magna, elementum sit amet congue vel, imperdiet et felis. Donec rutrum porta justo, ut posuere ipsum laoreet ut. Vivamus fermentum sagittis vestibulum. Nam vel est mi, semper pharetra leo.
                            </p>
                            <h2 id="A3" style="color:#000;">
                                 Donec ante metus</h2>
                            <p>
                                Donec ante metus, facilisis vitae venenatis id, ultricies eu tortor. Nullam tincidunt rhoncus imperdiet. Maecenas elementum odio vel est ullamcorper sed semper tellus condimentum. Nam interdum laoreet dui. Nullam id felis at tortor lacinia condimentum. Sed sapien leo, interdum ac pulvinar sed, vehicula quis est. Duis eu leo quis nisl fermentum ultrices. Pellentesque venenatis nisl nec sem mollis iaculis nec et metus. Donec pulvinar pharetra metus eget sodales. Etiam nec nibh vitae quam blandit commodo vitae at lectus. Suspendisse at consectetur nisi. Nullam at libero tortor, eu auctor ipsum. Quisque tincidunt scelerisque nibh eu pulvinar. Nam mattis porta cursus.
                            </p>
                            <p>
                                Donec ante metus, facilisis vitae venenatis id, ultricies eu tortor. Nullam tincidunt rhoncus imperdiet. Maecenas elementum odio vel est ullamcorper sed semper tellus condimentum. Nam interdum laoreet dui. Nullam id felis at tortor lacinia condimentum. Sed sapien leo, interdum ac pulvinar sed, vehicula quis est. Duis eu leo quis nisl fermentum ultrices. Pellentesque venenatis nisl nec sem mollis iaculis nec et metus. Donec pulvinar pharetra metus eget sodales. Etiam nec nibh vitae quam blandit commodo vitae at lectus. Suspendisse at consectetur nisi. Nullam at libero tortor, eu auctor ipsum. Quisque tincidunt scelerisque nibh eu pulvinar. Nam mattis porta cursus.
                            </p>
                            <p>
                                Donec ante metus, facilisis vitae venenatis id, ultricies eu tortor. Nullam tincidunt rhoncus imperdiet. Maecenas elementum odio vel est ullamcorper sed semper tellus condimentum. Nam interdum laoreet dui. Nullam id felis at tortor lacinia condimentum. Sed sapien leo, interdum ac pulvinar sed, vehicula quis est. Duis eu leo quis nisl fermentum ultrices. Pellentesque venenatis nisl nec sem mollis iaculis nec et metus. Donec pulvinar pharetra metus eget sodales. Etiam nec nibh vitae quam blandit commodo vitae at lectus. Suspendisse at consectetur nisi. Nullam at libero tortor, eu auctor ipsum. Quisque tincidunt scelerisque nibh eu pulvinar. Nam mattis porta cursus.
                            </p>
                            <p>
                                Donec ante metus, facilisis vitae venenatis id, ultricies eu tortor. Nullam tincidunt rhoncus imperdiet. Maecenas elementum odio vel est ullamcorper sed semper tellus condimentum. Nam interdum laoreet dui. Nullam id felis at tortor lacinia condimentum. Sed sapien leo, interdum ac pulvinar sed, vehicula quis est. Duis eu leo quis nisl fermentum ultrices. Pellentesque venenatis nisl nec sem mollis iaculis nec et metus. Donec pulvinar pharetra metus eget sodales. Etiam nec nibh vitae quam blandit commodo vitae at lectus. Suspendisse at consectetur nisi. Nullam at libero tortor, eu auctor ipsum. Quisque tincidunt scelerisque nibh eu pulvinar. Nam mattis porta cursus.
                            </p>
                            <p>
                                Donec ante metus, facilisis vitae venenatis id, ultricies eu tortor. Nullam tincidunt rhoncus imperdiet. Maecenas elementum odio vel est ullamcorper sed semper tellus condimentum. Nam interdum laoreet dui. Nullam id felis at tortor lacinia condimentum. Sed sapien leo, interdum ac pulvinar sed, vehicula quis est. Duis eu leo quis nisl fermentum ultrices. Pellentesque venenatis nisl nec sem mollis iaculis nec et metus. Donec pulvinar pharetra metus eget sodales. Etiam nec nibh vitae quam blandit commodo vitae at lectus. Suspendisse at consectetur nisi. Nullam at libero tortor, eu auctor ipsum. Quisque tincidunt scelerisque nibh eu pulvinar. Nam mattis porta cursus.
                            </p>
                            <h2  id="A4" style="color:#000;">
                                Aenean vehicula</h2>
                            <p>
                                Aenean vehicula faucibus hendrerit. Donec bibendum orci ut sapien sodales porttitor. Phasellus consequat tristique orci, at semper metus rhoncus ut. Ut quis nibh ut dolor iaculis interdum. Donec et orci augue. Nam gravida augue vitae sem scelerisque nec lobortis sapien posuere. Nulla et nunc sed augue feugiat porta venenatis at quam. Proin tincidunt imperdiet felis vel commodo. Sed eu velit leo, nec rutrum lectus. Phasellus blandit eleifend aliquet. Vestibulum est nisl, congue nec placerat eu, varius eu ipsum. Maecenas leo augue, sodales sit amet tempus at, venenatis ac arcu. Phasellus in mauris orci, vel dignissim nibh.
                            </p>
                            <p>
                                Aenean vehicula faucibus hendrerit. Donec bibendum orci ut sapien sodales porttitor. Phasellus consequat tristique orci, at semper metus rhoncus ut. Ut quis nibh ut dolor iaculis interdum. Donec et orci augue. Nam gravida augue vitae sem scelerisque nec lobortis sapien posuere. Nulla et nunc sed augue feugiat porta venenatis at quam. Proin tincidunt imperdiet felis vel commodo. Sed eu velit leo, nec rutrum lectus. Phasellus blandit eleifend aliquet. Vestibulum est nisl, congue nec placerat eu, varius eu ipsum. Maecenas leo augue, sodales sit amet tempus at, venenatis ac arcu. Phasellus in mauris orci, vel dignissim nibh.
                            </p>
                            <p>
                                Aenean vehicula faucibus hendrerit. Donec bibendum orci ut sapien sodales porttitor. Phasellus consequat tristique orci, at semper metus rhoncus ut. Ut quis nibh ut dolor iaculis interdum. Donec et orci augue. Nam gravida augue vitae sem scelerisque nec lobortis sapien posuere. Nulla et nunc sed augue feugiat porta venenatis at quam. Proin tincidunt imperdiet felis vel commodo. Sed eu velit leo, nec rutrum lectus. Phasellus blandit eleifend aliquet. Vestibulum est nisl, congue nec placerat eu, varius eu ipsum. Maecenas leo augue, sodales sit amet tempus at, venenatis ac arcu. Phasellus in mauris orci, vel dignissim nibh.
                            </p>
                            <p>
                                Aenean vehicula faucibus hendrerit. Donec bibendum orci ut sapien sodales porttitor. Phasellus consequat tristique orci, at semper metus rhoncus ut. Ut quis nibh ut dolor iaculis interdum. Donec et orci augue. Nam gravida augue vitae sem scelerisque nec lobortis sapien posuere. Nulla et nunc sed augue feugiat porta venenatis at quam. Proin tincidunt imperdiet felis vel commodo. Sed eu velit leo, nec rutrum lectus. Phasellus blandit eleifend aliquet. Vestibulum est nisl, congue nec placerat eu, varius eu ipsum. Maecenas leo augue, sodales sit amet tempus at, venenatis ac arcu. Phasellus in mauris orci, vel dignissim nibh.
                            </p>
                            <p>
                                Aenean vehicula faucibus hendrerit. Donec bibendum orci ut sapien sodales porttitor. Phasellus consequat tristique orci, at semper metus rhoncus ut. Ut quis nibh ut dolor iaculis interdum. Donec et orci augue. Nam gravida augue vitae sem scelerisque nec lobortis sapien posuere. Nulla et nunc sed augue feugiat porta venenatis at quam. Proin tincidunt imperdiet felis vel commodo. Sed eu velit leo, nec rutrum lectus. Phasellus blandit eleifend aliquet. Vestibulum est nisl, congue nec placerat eu, varius eu ipsum. Maecenas leo augue, sodales sit amet tempus at, venenatis ac arcu. Phasellus in mauris orci, vel dignissim nibh.
                            </p>
                            <h2 id="A5" style="color:#000;">
                                Fusce scelerisque</h2>
                            <p>
                                Fusce scelerisque enim a eros imperdiet eu aliquet mauris ullamcorper. Phasellus pellentesque aliquam ipsum, ut feugiat ligula tristique quis. Etiam mollis venenatis pharetra. Donec nibh enim, varius consectetur vulputate ut, rutrum non ante. Ut ultrices augue et orci adipiscing congue. Nunc ligula quam, molestie at faucibus in, pulvinar consequat quam. Vivamus facilisis, ante sed tincidunt scelerisque, odio risus volutpat odio, ut interdum turpis ante sit amet erat. Morbi ut arcu a orci porta hendrerit id id nulla. Sed ac nunc justo. Vivamus et viverra elit. Aliquam non nisi purus, nec rutrum metus. Donec congue elementum dictum. Nullam sapien lectus, dignissim vitae commodo nec, aliquet nec tellus. In quam est, porttitor eu convallis et, scelerisque nec justo.
                            </p>
                            <p>
                                Fusce scelerisque enim a eros imperdiet eu aliquet mauris ullamcorper. Phasellus pellentesque aliquam ipsum, ut feugiat ligula tristique quis. Etiam mollis venenatis pharetra. Donec nibh enim, varius consectetur vulputate ut, rutrum non ante. Ut ultrices augue et orci adipiscing congue. Nunc ligula quam, molestie at faucibus in, pulvinar consequat quam. Vivamus facilisis, ante sed tincidunt scelerisque, odio risus volutpat odio, ut interdum turpis ante sit amet erat. Morbi ut arcu a orci porta hendrerit id id nulla. Sed ac nunc justo. Vivamus et viverra elit. Aliquam non nisi purus, nec rutrum metus. Donec congue elementum dictum. Nullam sapien lectus, dignissim vitae commodo nec, aliquet nec tellus. In quam est, porttitor eu convallis et, scelerisque nec justo.
                            </p>
                            <p>
                                Fusce scelerisque enim a eros imperdiet eu aliquet mauris ullamcorper. Phasellus pellentesque aliquam ipsum, ut feugiat ligula tristique quis. Etiam mollis venenatis pharetra. Donec nibh enim, varius consectetur vulputate ut, rutrum non ante. Ut ultrices augue et orci adipiscing congue. Nunc ligula quam, molestie at faucibus in, pulvinar consequat quam. Vivamus facilisis, ante sed tincidunt scelerisque, odio risus volutpat odio, ut interdum turpis ante sit amet erat. Morbi ut arcu a orci porta hendrerit id id nulla. Sed ac nunc justo. Vivamus et viverra elit. Aliquam non nisi purus, nec rutrum metus. Donec congue elementum dictum. Nullam sapien lectus, dignissim vitae commodo nec, aliquet nec tellus. In quam est, porttitor eu convallis et, scelerisque nec justo.
                            </p>
                            <p>
                                Fusce scelerisque enim a eros imperdiet eu aliquet mauris ullamcorper. Phasellus pellentesque aliquam ipsum, ut feugiat ligula tristique quis. Etiam mollis venenatis pharetra. Donec nibh enim, varius consectetur vulputate ut, rutrum non ante. Ut ultrices augue et orci adipiscing congue. Nunc ligula quam, molestie at faucibus in, pulvinar consequat quam. Vivamus facilisis, ante sed tincidunt scelerisque, odio risus volutpat odio, ut interdum turpis ante sit amet erat. Morbi ut arcu a orci porta hendrerit id id nulla. Sed ac nunc justo. Vivamus et viverra elit. Aliquam non nisi purus, nec rutrum metus. Donec congue elementum dictum. Nullam sapien lectus, dignissim vitae commodo nec, aliquet nec tellus. In quam est, porttitor eu convallis et, scelerisque nec justo.
                            </p>
                    </ContentTemplate>
                    <HScroller ScrollBarVisibility="Auto" ScrollValue="0">
                    </HScroller>
                    <VScroller ScrollBarVisibility="Visible" ScrollValue="0">
                    </VScroller>
                </wijmo:C1SuperPanel>
                </td>
            </tr>
        </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
     <script type="text/javascript">
         function navTo(dom) {
             var scroll = $('#<%=superPanel1.ClientID %>');
             var ident = $(dom).attr("href");
             var d = $(ident);
             scroll.c1superpanel('scrollChildIntoView',d);
            return false;
        }
    </script>
</asp:Content>

