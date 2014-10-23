<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="Tabs_Animation" Codebehind="Animation.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Tabs" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:Panel ID="Panel1" runat="server">
        <ul>
			<li><a href="#tabs-1">Nunc tincidunt</a></li>
			<li><a href="#tabs-2">Proin dolor</a></li>
			<li><a href="#tabs-3">Aenean lacinia</a></li>
		</ul>
		<div id="tabs-1">
			<p>
				Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec
				arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante.
				Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper
				leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales
				tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel
				pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum.
				Nunc tristique tempus lectus.</p>
		</div>
		<div id="tabs-2">
			<p>
				Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra
				massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget
				luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean
				aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent
				in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat
				nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque
				convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod
				felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
		</div>
		<div id="tabs-3">
			<p>
				Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate,
				pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem.
				Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia
				nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo
				pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem
				enim, pretium nec, feugiat nec, luctus a, lacus.</p>
			<p>
				Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam
				ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing
				velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula
				faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero
				sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor
				ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas
				commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit
				hendrerit.</p>
		</div>
    </asp:Panel>

    <wijmo:C1TabsExtender ID="TabsExtender1" runat="server" TargetControlID="Panel1" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
C1TabsExtender supports animation when opening or hiding tab content.
</p>


<p>
Animation style when showing a tab's page is determined by the <b>ShowOption</b> property.
Animation style when hiding a tab's page is determined by the <b>HideOption</b> property.
</p>

<p>
To select or clear an animation, click the check box. To change the duration of the show option and hide option animations, click their respective Duration drop-down arrow and select a duration from the list.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="demo-options">
        <!-- Begin options markup -->
        <div>
            <h6>
                Show Option:</h6>
            <label>
                Blind</label><input id='showblind' type='checkbox' class='show' />
            <label>
                Fade</label><input id='showfade' type='checkbox' class='show' checked='true' />
            <label>
                Duration</label><select id="showduration" class='show'>
                    <option value="200" selected='true'>200</option>
                    <option value="400">400</option>
                    <option value="800">800</option>
                    <option value="1500">1500</option>
                </select>
        </div>
        <div>
            <h6>
                Hide Option:</h6>
            <label>
                Blind</label><input id='hideblind' type='checkbox' class='hide' />
            <label>
                Fade</label><input id='hidefade' type='checkbox' class='hide' checked='true' />
            <label>
                Duration</label><select id="hideduration" class='hide'>
                    <option value="200" selected='true'>200</option>
                    <option value="400">400</option>
                    <option value="800">800</option>
                    <option value="1500">1500</option>
                </select>
        </div>
        <!-- End options markup -->
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".show").change(function () {
                $('#<%=Panel1.ClientID %>').wijtabs({ showOption: {
                    blind: $("#showblind").attr("checked"),
                    fade: $("#showfade").attr("checked"),
                    duration: $("#showduration").val()
                }
                });
            });

            $(".hide").change(function () {
                $('#<%=Panel1.ClientID %>').wijtabs({ hideOption: {
                    blind: $("#hideblind").attr("checked"),
                    fade: $("#hidefade").attr("checked"),
                    duration: $("#hideduration").val()
                }
                });
            });
        });
    </script>
</asp:Content>
