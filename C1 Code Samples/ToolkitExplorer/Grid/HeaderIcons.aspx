<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="HeaderIcons.aspx.cs" Inherits="ControlExplorer.Grid.HeaderIcons" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>Using inline html:</p>
    <asp:GridView runat="server" ID="demo" DataSourceID="XmlDataSource1" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Number" HeaderText="<span class='ui-icon ui-icon-calculator' style='left:0;'></span> Number" HtmlEncode="false" />
            <asp:BoundField DataField="Nationality" HeaderText="<span class='ui-icon ui-icon-suitcase' style='left:0;'></span> Nationality" HtmlEncode="false" />
            <asp:BoundField DataField="Player" HeaderText="<span class='ui-icon ui-icon-person' style='left:0;'></span> Player" HtmlEncode="false" />
            <asp:BoundField DataField="Position" HeaderText="<span class='ui-icon ui-icon-clipboard' style='left:0;'></span> Position" HtmlEncode="false" />
            <asp:BoundField DataField="Handedness" HeaderText="<span class='ui-icon ui-icon-transferthick-e-w' style='left:0;'></span> Handedness" HtmlEncode="false" />
            <asp:BoundField DataField="Age" HeaderText="<span class='ui-icon ui-icon-info' style='left:0;'></span> Age" HtmlEncode="false" />
            <asp:BoundField DataField="Acquired" HeaderText="<span class='ui-icon ui-icon-calendar' style='left:0;'></span> Acquired" HtmlEncode="false" />
            <asp:BoundField DataField="Birthplace" HeaderText="<span class='ui-icon ui-icon-calendar' style='left:0;'></span> Birthplace" HtmlEncode="false" />
        </Columns>
    </asp:GridView>
  
    <wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" AllowPaging="true" PageSize="10"/>

    <p>Using the <b>headerText</b> option:</p>
    <asp:GridView runat="server" ID="demo1" DataSourceID="XmlDataSource1" ShowHeader="false" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="Number" />
            <asp:BoundField DataField="Nationality" />
            <asp:BoundField DataField="Player" />
            <asp:BoundField DataField="Age" />
            <asp:BoundField DataField="Birthplace" />
            <asp:BoundField DataField="Position" />
            <asp:BoundField DataField="Handedness" />
            <asp:BoundField DataField="Acquired" />
        </Columns>
    </asp:GridView>

    <wijmo:C1GridExtender runat="server" id="GridExtender2" TargetControlID="demo1" AllowPaging="true" PageSize="10">
        <Columns>
            <wijmo:C1Field HeaderText="<span class='ui-icon ui-icon-calculator' style='left:0;'></span> Number" />
            <wijmo:C1Band HeaderText="<span class='ui-icon ui-icon-info' style='left:0;'></span>Personal info">
                <Columns>
                    <wijmo:C1Field HeaderText="<span class='ui-icon ui-icon-suitcase' style='left:0;'></span> Nationality" />
                    <wijmo:C1Field HeaderText="<span class='ui-icon ui-icon-person' style='left:0;'></span> Player" />
                    <wijmo:C1Field HeaderText="<span class='ui-icon ui-icon-info' style='left:0;'></span> Age" />
                    <wijmo:C1Field HeaderText="<span class='ui-icon ui-icon-calendar' style='left:0;'></span> Birthplace" />
                </Columns>
            </wijmo:C1Band>
            <wijmo:C1Band HeaderText="<span class='ui-icon ui-icon-info' style='left:0;'></span>Team related info">
                <Columns>
                    <wijmo:C1Field HeaderText="<span class='ui-icon ui-icon-clipboard' style='left:0;'></span> Position" />
                    <wijmo:C1Field HeaderText="<span class='ui-icon ui-icon-transferthick-e-w' style='left:0;'></span> Handedness" />
                    <wijmo:C1Field HeaderText="<span class='ui-icon ui-icon-calendar' style='left:0;'></span> Acquired" />
                </Columns>
            </wijmo:C1Band>
        </Columns>
    </wijmo:C1GridExtender>

    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/Players.xml" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample shows how to customize column header.
    </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
