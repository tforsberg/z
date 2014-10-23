﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Bands.aspx.cs" Inherits="ControlExplorer.Grid.Bands" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView runat="server" ID="demo" DataSourceID="AccessDataSource1" ShowHeader="False" />

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/C1NWind.mdb" 
        SelectCommand="SELECT TOP 5 [CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [City], [Country], [PostalCode], [Phone], [Fax] FROM [Customers]">
    </asp:AccessDataSource>
  
    <wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo">
        <Columns>
            <wijmo:C1Field HeaderText="ID" />
            <wijmo:C1Field HeaderText="Company" />
            <wijmo:C1Band HeaderText="Additional information">
                <Columns>
                    <wijmo:C1Band HeaderText="Contact">
                        <Columns>
                            <wijmo:C1Field HeaderText="Name" />
                            <wijmo:C1Field HeaderText="Title" />
                        </Columns>
                    </wijmo:C1Band>
                    <wijmo:C1Band  HeaderText="Regional information">
                        <Columns>
                            <wijmo:C1Band  HeaderText="Address information">
                                <Columns>
                                    <wijmo:C1Field HeaderText="Address" />
                                    <wijmo:C1Field HeaderText="City" />
                                    <wijmo:C1Field HeaderText="Country" />
                                    <wijmo:C1Field HeaderText="PostalCode" />
                                </Columns>
                            </wijmo:C1Band>
                            <wijmo:C1Band  HeaderText="Communication">
                                <Columns>
                                    <wijmo:C1Field HeaderText="Phone" />
                                    <wijmo:C1Field HeaderText="Fax" />
                                </Columns>
                            </wijmo:C1Band>
                        </Columns>
                    </wijmo:C1Band>
                </Columns>
            </wijmo:C1Band>
        </Columns>
    </wijmo:C1GridExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
    This sample illustrates how to create bands to organize columns into hierarchical structure implementing
    multilevel column headers.
    </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
